import mysql.connector
import os
import sys

# --- CONFIGURATION (GET THESE FROM AIVEN AND ENTER THEM HERE) ---
DB_CONFIG = {
    "host": "mysql-34f6ff18-bavithareddy08-e2e7.j.aivencloud.com",
    "port": 10192,
    "user": "avnadmin",
    "password": "YOUR_AIVEN_PASSWORD_HERE", # CHANGE THIS
    "database": "defaultdb"
}

def init_db():
    try:
        print(f"Connecting to {DB_CONFIG['host']}...")
        db = mysql.connector.connect(**DB_CONFIG)
        cursor = db.cursor()

        print("Reading database.sql...")
        with open("database.sql", "r") as f:
            sql_script = f.read()

        # Split multiple SQL commands (basic splitter, handles semicolons)
        commands = sql_script.split(";")
        
        print("Executing commands...")
        for command in commands:
            cmd = command.strip()
            if cmd:
                try:
                    # Filter out 'CREATE DATABASE' and 'USE' as Aiven handles this differently
                    if cmd.upper().startswith("CREATE DATABASE") or cmd.upper().startswith("USE "):
                        continue
                    cursor.execute(cmd)
                except Exception as e:
                    print(f"Skipping command error: {e}")

        db.commit()
        print("✅ Database initialized successfully on Aiven!")
        
        cursor.close()
        db.close()

    except Exception as e:
        print(f"❌ ERROR: {e}")
        sys.exit(1)

if __name__ == "__main__":
    if DB_CONFIG["password"] == "YOUR_AIVEN_PASSWORD_HERE":
        print("❌ Error: You must enter your Aiven password in init_remote_db.py first!")
    else:
        init_db()
