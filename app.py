from flask import Flask, render_template, request, redirect, url_for, session, flash
import mysql.connector
import os

app = Flask(__name__)
app.secret_key = 'supersecretkey'  # Change this for production

# --- DATABASE CONNECTION ---
def get_db_connection():
    return mysql.connector.connect(
        host=os.getenv("DB_HOST", "localhost"),
        user=os.getenv("DB_USER", "root"),
        password=os.getenv("DB_PASSWORD", "bavi1501"),
        database=os.getenv("DB_NAME", "music_flow")
    )

# --- ROUTES ---

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = request.form['password']
        
        db = get_db_connection()
        cursor = db.cursor()
        
        # Simple SQL query to insert a new user
        query = "INSERT INTO users (username, email, password) VALUES (%s, %s, %s)"
        cursor.execute(query, (username, email, password))
        db.commit()
        
        cursor.close()
        db.close()
        
        flash("Registration successful! Please login.")
        return redirect(url_for('login'))
        
    return render_template('register.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        
        db = get_db_connection()
        cursor = db.cursor(dictionary=True) # dictionary=True makes results easier to handle
        
        # Check if user exists with matching email and password
        query = "SELECT * FROM users WHERE email = %s AND password = %s"
        cursor.execute(query, (email, password))
        user = cursor.fetchone()
        
        cursor.close()
        db.close()
        
        if user:
            session['user_id'] = user['user_id']
            session['username'] = user['username']
            return redirect(url_for('dashboard'))
        else:
            flash("Invalid email or password.")
            
    return render_template('login.html')

@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('index'))

@app.route('/dashboard')
def dashboard():
    if 'user_id' not in session:
        return redirect(url_for('login'))
    
    user_id = session['user_id']
    username = session['username']
    
    # Get filter parameters from URL
    search_query = request.args.get('search', '')
    selected_genre = request.args.get('genre', 'All')
    selected_mood = request.args.get('mood', 'All')
    
    db = get_db_connection()
    cursor = db.cursor(dictionary=True)
    
    # --- 1. Fetch Music Catalog with Filters ---
    query = "SELECT * FROM songs WHERE 1=1"
    params = []
    
    if search_query:
        query += " AND (title LIKE %s OR artist LIKE %s)"
        params.extend([f"%{search_query}%", f"%{search_query}%"])
    
    if selected_genre != 'All':
        query += " AND genre = %s"
        params.append(selected_genre)
        
    if selected_mood != 'All':
        query += " AND mood = %s"
        params.append(selected_mood)
        
    cursor.execute(query, tuple(params))
    all_songs = cursor.fetchall()
    
    # --- 2. Fetch Recently Played (Unique Songs) ---
    history_query = """
        SELECT s.*, MAX(lh.played_at) as last_played 
        FROM listening_history lh 
        JOIN songs s ON lh.song_id = s.song_id 
        WHERE lh.user_id = %s 
        GROUP BY s.song_id 
        ORDER BY last_played DESC 
        LIMIT 6
    """
    cursor.execute(history_query, (user_id,))
    recent_history = cursor.fetchall()
    
    # --- 3. SMART RECOMMENDATION LOGIC ---
    recommendations = []
    
    # 3.1 Find user's top genres (up to 2)
    cursor.execute("""
        SELECT s.genre, COUNT(lh.history_id) as count 
        FROM listening_history lh 
        JOIN songs s ON lh.song_id = s.song_id 
        WHERE lh.user_id = %s 
        GROUP BY s.genre 
        ORDER BY count DESC 
        LIMIT 2
    """, (user_id,))
    top_genres = cursor.fetchall()
    
    # 3.2 Find user's top mood (1)
    cursor.execute("""
        SELECT s.mood, COUNT(lh.history_id) as count 
        FROM listening_history lh 
        JOIN songs s ON lh.song_id = s.song_id 
        WHERE lh.user_id = %s 
        GROUP BY s.mood 
        ORDER BY count DESC 
        LIMIT 1
    """, (user_id,))
    top_mood = cursor.fetchone()

    # 3.3 Collect candidate recommendations
    seen_song_ids = set()
    
    # Add songs from top genres
    for g_data in top_genres:
        cursor.execute("SELECT * FROM songs WHERE genre = %s ORDER BY RAND() LIMIT 2", (g_data['genre'],))
        for s in cursor.fetchall():
            if s['song_id'] not in seen_song_ids:
                recommendations.append(s)
                seen_song_ids.add(s['song_id'])
                
    # Add songs from top mood
    if top_mood:
        cursor.execute("SELECT * FROM songs WHERE mood = %s ORDER BY RAND() LIMIT 2", (top_mood['mood'],))
        for s in cursor.fetchall():
            if s['song_id'] not in seen_song_ids:
                recommendations.append(s)
                seen_song_ids.add(s['song_id'])

    # 3.4 Fallback/Padding: Ensure we have at least 6 diverse recommendations
    while len(recommendations) < 6:
        cursor.execute("SELECT * FROM songs ORDER BY RAND() LIMIT 1")
        s = cursor.fetchone()
        if s and s['song_id'] not in seen_song_ids:
            recommendations.append(s)
            seen_song_ids.add(s['song_id'])
        elif not s: # Should not happen if DB has songs
            break
            
    # Shuffle finally for a fresh feel
    import random
    random.shuffle(recommendations)
    recommendations = recommendations[:6]

    cursor.close()
    db.close()
    
    # List of genres and moods for the dropdowns
    genres = ['Pop', 'Melody', 'Folk', 'Romantic', 'Dance', 'Rock', 'Motivational', 'Sad', 'Chill', 'Item', 'Mass', 'Action', 'Electronic', 'Synthpop', 'Indie', 'Afrobeat']
    moods = ['Cheerful', 'Romantic', 'Energetic', 'Bold', 'Emotional', 'Calm', 'Powerful', 'Sad', 'Soft', 'Happy', 'Focus', 'Relaxed', 'Chill']
    
    return render_template('dashboard.html', 
                           username=username, 
                           songs=all_songs, 
                           recent=recent_history, 
                           recommendations=recommendations,
                           genres=sorted(list(set(genres))),
                           moods=sorted(list(set(moods))),
                           selected_genre=selected_genre,
                           selected_mood=selected_mood,
                           search_query=search_query)

@app.route('/play/<int:song_id>')
def play_track(song_id):
    if 'user_id' not in session:
        return redirect(url_for('login'))
        
    user_id = session['user_id']
    
    db = get_db_connection()
    cursor = db.cursor()
    
    # Record that the user played this song
    query = "INSERT INTO listening_history (user_id, song_id) VALUES (%s, %s)"
    cursor.execute(query, (user_id, song_id))
    db.commit()
    
    cursor.close()
    db.close()
    
    # Return JSON instead of redirecting (for AJAX support)
    return {"status": "success", "message": "Song logged in history"}, 200

if __name__ == '__main__':
    app.run(debug=True)
