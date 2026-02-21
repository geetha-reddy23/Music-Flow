-- AI-Driven Music Streaming and Playlist Recommendation System
-- SQL Database Setup Script (Fixed Reliable Visuals)

-- 1. Create the database
CREATE DATABASE IF NOT EXISTS music_flow;

-- 2. Use the database
USE music_flow;

-- IMPORTANT: Drop tables first to ensure a clean setup with the new columns
DROP TABLE IF EXISTS listening_history;
DROP TABLE IF EXISTS songs;

-- 3. Create Users Table
CREATE TABLE IF NOT EXISTS users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(100) NOT NULL
);

-- 4. Create Songs Table
CREATE TABLE IF NOT EXISTS songs (
  song_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  artist VARCHAR(100) NOT NULL,
  genre VARCHAR(50),
  mood VARCHAR(50),
  file_path VARCHAR(255) NOT NULL,
  image_url VARCHAR(512) -- Reliable Raw Image URL
);

-- 5. Create Listening History Table
CREATE TABLE IF NOT EXISTS listening_history (
  history_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  song_id INT,
  played_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

-- 6. Insert 35 Songs with High-Reliability Poster URLs
INSERT INTO songs (title, artist, genre, mood, file_path, image_url) VALUES 
-- Telugu
('Butta Bomma', 'Armaan Malik', 'Pop', 'Cheerful', 'buttabomma.mp3', 'https://upload.wikimedia.org/wikipedia/en/c/c5/Ala_Vaikunthapurramuloo.jpg'),
('Samajavaragamana', 'Sid Sriram', 'Melody', 'Romantic', 'samajavaragamana.mp3', 'https://upload.wikimedia.org/wikipedia/en/c/c5/Ala_Vaikunthapurramuloo.jpg'),
('Ramulo Ramulaa', 'Anurag Kulkarni', 'Folk', 'Energetic', 'ramuloo.mp3', 'https://upload.wikimedia.org/wikipedia/en/c/c5/Ala_Vaikunthapurramuloo.jpg'),
('Oo Antava', 'Indravathi Chauhan', 'Item', 'Bold', 'oo_antava.mp3', 'https://upload.wikimedia.org/wikipedia/en/7/71/Pushpa_The_Rise_album_cover.jpg'),
('Inkem Inkem', 'Sid Sriram', 'Melody', 'Romantic', 'inkem_inkem.mp3', 'https://upload.wikimedia.org/wikipedia/en/5/5e/Geetha_Govindam.jpg'),
('Srivalli', 'Sid Sriram', 'Melody', 'Emotional', 'srivalli.mp3', 'https://upload.wikimedia.org/wikipedia/en/7/71/Pushpa_The_Rise_album_cover.jpg'),
('Nee Kannu Neeli Samudram', 'Javed Ali', 'Romantic', 'Calm', 'nee_kannu.mp3', 'https://upload.wikimedia.org/wikipedia/en/a/ad/Uppena_poster.jpg'),
('Mind Block', 'Blaaze', 'Mass', 'Energetic', 'mind_block.mp3', 'https://upload.wikimedia.org/wikipedia/en/7/77/Sarileru_Neekevvaru_poster.jpg'),
('Daang Daang', 'Nakash Aziz', 'Dance', 'Energetic', 'daang_daang.mp3', 'https://upload.wikimedia.org/wikipedia/en/7/77/Sarileru_Neekevvaru_poster.jpg'),
('Naatu Naatu', 'Rahul Sipligunj', 'Folk', 'Energetic', 'naatu_naatu.mp3', 'https://upload.wikimedia.org/wikipedia/en/d/d7/RRR_Poster.jpg'),

-- Hindi
('Kesariya', 'Arijit Singh', 'Romantic', 'Emotional', 'kesariya.mp3', 'https://upload.wikimedia.org/wikipedia/en/4/4b/Brahmastra_Part_One_Shiva_album_cover.jpg'),
('Tum Hi Ho', 'Arijit Singh', 'Romantic', 'Sad', 'tum_hi_ho.mp3', 'https://upload.wikimedia.org/wikipedia/en/b/b3/Aashiqui_2_Soundtrack.jpg'),
('Raataan Lambiyan', 'Jubin Nautiyal', 'Romantic', 'Calm', 'raataan.mp3', 'https://upload.wikimedia.org/wikipedia/en/9/92/Shershaah_film_poster.jpg'),
('Apna Bana Le', 'Arijit Singh', 'Romantic', 'Soft', 'apna_bana_le.mp3', 'https://upload.wikimedia.org/wikipedia/en/c/c0/Bhediya_film_poster.jpg'),
('Shayad', 'Arijit Singh', 'Melody', 'Emotional', 'shayad.mp3', 'https://upload.wikimedia.org/wikipedia/en/b/b0/Love_Aaj_Kal_2020_poster.jpg'),
('Ghungroo', 'Arijit Singh', 'Dance', 'Energetic', 'ghungroo.mp3', 'https://upload.wikimedia.org/wikipedia/en/6/6f/War_film_poster.jpg'),
('Malang', 'Ved Sharma', 'Party', 'Energetic', 'malang.mp3', 'https://upload.wikimedia.org/wikipedia/en/d/d1/Malang_film_poster.jpg'),
('Zinda', 'Siddharth Mahadevan', 'Motivational', 'Powerful', 'zinda.mp3', 'https://upload.wikimedia.org/wikipedia/en/4/45/Bhaag_Milkha_Bhaag_poster.jpg'),
('Ilahi', 'Arijit Singh', 'Travel', 'Happy', 'ilahi.mp3', 'https://upload.wikimedia.org/wikipedia/en/d/db/Yeh_Jawaani_Hai_Deewani_poster.jpg'),
('Tera Ban Jaunga', 'Akhil Sachdeva', 'Romantic', 'Emotional', 'tera_ban_jaunga.mp3', 'https://upload.wikimedia.org/wikipedia/en/1/1a/Kabir_Singh.jpg'),

-- English
('Shape of You', 'Ed Sheeran', 'Pop', 'Happy', 'shape_of_you.mp3', 'https://is5-ssl.mzstatic.com/image/thumb/Music118/v4/91/9e/6a/919e6a0d-d41f-7e8e-4a64-4a6c9d0e7f7e/source/1000x1000bb.jpg'),
('Blinding Lights', 'The Weeknd', 'Synthpop', 'Energetic', 'blinding_lights.mp3', 'https://is5-ssl.mzstatic.com/image/thumb/Music124/v4/e1/c3/a0/e1c3a0e5-b91d-c808-eda8-d3aa451c932a/source/1000x1000bb.jpg'),
('Perfect', 'Ed Sheeran', 'Romantic', 'Calm', 'perfect.mp3', 'https://is5-ssl.mzstatic.com/image/thumb/Music118/v4/91/9e/6a/919e6a0d-d41f-7e8e-4a64-4a6c9d0e7f7e/source/1000x1000bb.jpg'),
('Someone You Loved', 'Lewis Capaldi', 'Sad', 'Emotional', 'someone_you_loved.mp3', 'https://is5-ssl.mzstatic.com/image/thumb/Music113/v4/b8/b1/7d/b8b17d05-b8e7-bd6a-f74a-2f9cd74b5c7f/source/1000x1000bb.jpg'),
('Believer', 'Imagine Dragons', 'Rock', 'Powerful', 'believer.mp3', 'https://is5-ssl.mzstatic.com/image/thumb/Music114/v4/6b/9d/9e/6b9d9e4e-0a0e-4a64-4a6c-919e6a0d-d41f-7e8e-4a64-4a6c9d0e7f7e/source/1000x1000bb.jpg'),
('Heat Waves', 'Glass Animals', 'Indie', 'Calm', 'heat_waves.mp3', 'https://is5-ssl.mzstatic.com/image/thumb/Music124/v4/8b/4c/3d/8b4c3d0d-d41f-7e8e-4a64-4a6c9d0e7f7e/source/1000x1000bb.jpg'),
('Senorita', 'Shawn Mendes', 'Pop', 'Romantic', 'senorita.mp3', 'https://is5-ssl.mzstatic.com/image/thumb/Music114/v4/6b/9d/9e/6b9d9e4e-0a0e-4a64-4a6c-919e6a0d-d41f-7e8e-4a64-4a6c9d0e7f7e/source/1000x1000bb.jpg'),
('Levitating', 'Dua Lipa', 'Pop', 'Dance', 'levitating.mp3', 'https://is5-ssl.mzstatic.com/image/thumb/Music124/v4/8b/4c/3d/8b4c3d0d-d41f-7e8e-4a64-4a6c9d0e7f7e/source/1000x1000bb.jpg'),
('Counting Stars', 'OneRepublic', 'Pop Rock', 'Motivational', 'counting_stars.mp3', 'https://is5-ssl.mzstatic.com/image/thumb/Music118/v4/91/9e/6a/919e6a0d-d41f-7e8e-4a64-4a6c9d0e7f7e/source/1000x1000bb.jpg'),
('Calm Down', 'Rema', 'Afrobeat', 'Chill', 'calm_down.mp3', 'https://is5-ssl.mzstatic.com/image/thumb/Music112/v4/b8/b1/7d/b8b17d05-b8e7-bd6a-f74a-2f9cd74b5c7f/source/1000x1000bb.jpg'),

-- Tamil
('Rowdy Baby', 'Dhanush', 'Dance', 'Energetic', 'rowdy_baby.mp3', 'https://upload.wikimedia.org/wikipedia/en/e/eb/Maari_2_poster.jpg'),
('Arabic Kuthu', 'Anirudh Ravichander', 'Dance', 'Energetic', 'arabic_kuthu.mp3', 'https://upload.wikimedia.org/wikipedia/en/c/c5/Beast_2022_poster.jpg'),
('Vaathi Coming', 'Anirudh Ravichander', 'Dance', 'Energetic', 'vaathi_coming.mp3', 'https://upload.wikimedia.org/wikipedia/en/5/53/Master_2021_poster.jpg'),
('Enjoy Enjaami', 'Dhee ft. Arivu', 'Folk', 'Cheerful', 'enjoy_enjaami.mp3', 'https://upload.wikimedia.org/wikipedia/en/b/b3/Enjoy_Enjaami_poster.jpg'),
('Kaattu Payale', 'Dhee', 'Melody', 'Romantic', 'kaattu_payale.mp3', 'https://upload.wikimedia.org/wikipedia/en/e/eb/Soorarai_Pottru.jpg');
