import mysql.connector
import os
import sys
import re

# --- CONFIGURATION (GET THESE FROM AIVEN) ---
DB_CONFIG = {
    "host": "mysql-34f6ff18-bavithareddy08-e2e7.j.aivencloud.com",
    "port": 10192,
    "user": "avnadmin",
    "password": "YOUR_AIVEN_PASSWORD_HERE", # <--- ENTER PASSWORD HERE
    "database": "defaultdb",
    "ssl_disabled": False
}

def init_db():
    try:
        print(f"Connecting to {DB_CONFIG['host']}...")
        db = mysql.connector.connect(**DB_CONFIG)
        cursor = db.cursor()

        print("Reading database.sql...")
        with open("database.sql", "r") as f:
            full_sql = f.read()

        # Remove SQL comments safely
        # Only match -- if it is at the start of a line or preceded by spaces
        # This prevents matching '--' inside URLs like 'Shershaah--Hindi'
        sql_clean = re.sub(r'^\s*--.*?\n', '', full_sql, flags=re.MULTILINE)
        sql_clean = re.sub(r'/\*.*?\*/', '', sql_clean, flags=re.DOTALL)
        
        # Split by semicolon
        commands = sql_clean.split(";")
        
        print("Executing commands...")
        executed_count = 0
        error_count = 0
        
        for command in commands:
            cmd = command.strip()
            if not cmd:
                continue
                
            # Skip database creation/switching commands as Aiven uses 'defaultdb'
            if any(cmd.upper().startswith(x) for x in ["CREATE DATABASE", "USE ", "DROP DATABASE"]):
                continue
                
            try:
                cursor.execute(cmd)
                executed_count += 1
            except mysql.connector.Error as err:
                print(f"⚠️ Warning: Failed to execute command: {cmd[:50]}...")
                print(f"   Error: {err}")
                error_count += 1

        db.commit()
        print(f"\n✅ Initialization Finished!")
        print(f"   - Successfully ran: {executed_count} commands")
        print(f"   - Errors/Steps skipped: {error_count}")
        print("\nNow your 'users', 'songs', and 'listening_history' tables should be ready.")
        
        cursor.close()
        db.close()

    except Exception as e:
        print(f"❌ FATAL ERROR: {e}")
        sys.exit(1)

if __name__ == "__main__":
    if DB_CONFIG["password"] == "YOUR_AIVEN_PASSWORD_HERE":
        print("❌ Error: You must enter your Aiven password in init_remote_db.py first!")
    else:
        # One last safety check: ensure the password doesn't contain the 'avnadmin:' prefix if copied wrong
        if DB_CONFIG["password"].startswith("avnadmin:"):
             DB_CONFIG["password"] = DB_CONFIG["password"].split(":", 1)[1]
        init_db()
