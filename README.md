# AI-Driven Music Streaming and Playlist Recommendation System

A simple, beginner-friendly web application built with Python Flask, MySQL, and HTML/CSS.

## Project Structure
```
Music-Flow/
  ├── app.py              # Main Flask Backend
  ├── database.sql        # SQL Database Setup Script
  ├── update_images.sql   # SQL Script to update song cover images
  ├── templates/          # HTML Templates
  │   ├── index.html
  │   ├── register.html
  │   ├── login.html
  │   └── dashboard.html
  ├── static/             # Static Assets
  │   ├── style.css       # CSS Styling
  │   └── songs/          # Folder for Audio (.mp3) Files
  ├── documentation/      # Project Documentation
  │   ├── er_diagram.html           # Database Entity-Relationship Diagram
  │   └── SEMINAR_PRESENTATION.md   # Presentation content for the project
  └── README.md           # Setup Instructions
```

## Setup Instructions

### 1. Install Requirements
Open your terminal and install the necessary Python libraries:
```bash
pip install flask mysql-connector-python
```

### 2. Create Database in MySQL
You can run the provided `database.sql` script in your MySQL Command Line or terminal using this command:

```bash
cd Music-Flow
```

```bash
/usr/local/mysql/bin/mysql -u root -p < database.sql
```

(Replace `root` with your username if it's different. You will be prompted for your password.)

Alternatively, you can run the following commands manually in your MySQL Workbench or Shell from database.sql file.

*Optional: To update your database with cover images for the songs, you can also run the `update_images.sql` script.*

### 3. Prepare Audio Files
1.  Go to the `static/songs/` folder.
2.  Add some `.mp3` files matching the `file_path` you inserted in the database (e.g., `samajavaragamana.mp3`, `buttabomma.mp3`, `ramuloo.mp3`).

### 4. Configure Database Connection
Open `app.py` and update your MySQL credentials:
```python
def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",        
        password="your_password",  # Your MySQL password
        database="music_flow"
    )
```

### 5. Run the Application
In your terminal, run:
```bash
python app.py
```
Open your browser and visit: `http://127.0.0.1:5000`

## Deployment (Render + Aiven)

This project is configured for easy deployment on **Render** (Frontend/Backend) and **Aiven** (MySQL Database).

### 1. Database Setup (Aiven)
1. Sign up for a free MySQL service at [aiven.io](https://aiven.io/).
2. Copy the connection details (Host, Port, User, Password).
3. Use the provided `init_remote_db.py` script to initialize your cloud database:
   - Edit `init_remote_db.py` and enter your Aiven password.
   - Run `python init_remote_db.py` to upload the schema and songs.

### 2. Live Hosting (Render)
1. Create a new "Web Service" on **Render** and connect your GitHub repository.
2. Set the **Start Command** to `gunicorn app:app`.
3. Add the following **Environment Variables** in the Render Dashboard:
   - `DB_HOST`: Your Aiven host.
   - `DB_PORT`: `10192` (or your Aiven port).
   - `DB_USER`: `avnadmin`.
   - `DB_PASSWORD`: Your Aiven password.
   - `DB_NAME`: `defaultdb`.
   - `SECRET_KEY`: A random string for session security.

## Features Explained
- **Midnight Serenity Theme:** A premium, calm, and production-level UI featuring matte slate and navy aesthetics.
- **Dynamic Background:** High-quality background dots (particles) that move at a lively pace, adding a sense of depth and life.
- **Modern UI:** Clean card layout with glassmorphism effects, minimalist matte buttons, and subtle sky-blue accents.
- **Intelligent Recommendations:** An AI-driven system that analyzes your listening history to provide tailored song suggestions.
- **Advanced Search & Filtering:** Quick search and multi-dimensional filters for Genre and Mood.
- **Interactive Feedback:** Animated equalizer bars that appear on song cards during playback.
- **Seamless Playback:** A persistent, premium sticky player bar for uninterrupted listening.
- **Responsive Design:** Optimized for all screen sizes, with a fluid grid system that handles up to 4 cards per row.
- **Language Catalog:** Handpicked collection of tracks across multiple languages including Telugu, Hindi,Tamil and English.
