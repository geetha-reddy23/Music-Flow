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
('Butta Bomma', 'Armaan Malik', 'Pop', 'Cheerful', 'buttabomma.mp3', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_jPXpPp9TaSRxxr1XDNZ80_XN80zKB_k9qA&s'),
('Samajavaragamana', 'Sid Sriram', 'Melody', 'Romantic', 'samajavaragamana.mp3', 'https://upload.wikimedia.org/wikipedia/en/9/90/Samajavaragamana.jpg'),
('Ramulo Ramulaa', 'Anurag Kulkarni', 'Folk', 'Energetic', 'ramuloo.mp3', 'https://upload.wikimedia.org/wikipedia/en/0/0f/Ramuloo_Ramulaa.jpeg'),
('Oo Antava', 'Indravathi Chauhan', 'Item', 'Bold', 'oo_antava.mp3', 'https://c.saavncdn.com/000/Pushpa-The-Rise-Telugu-2023-20230403210942-500x500.jpg'),
('Inkem Inkem', 'Sid Sriram', 'Melody', 'Romantic', 'inkem_inkem.mp3', 'https://a10.gaanacdn.com/gn_img/song/koMWQ7BKqL/MWQBR7EEbq/size_m_1531202221.jpg'),
('Srivalli', 'Sid Sriram', 'Melody', 'Emotional', 'srivalli.mp3', 'https://a10.gaanacdn.com/gn_img/song/w4MKPgOboj/MKPJBjn4Wo/size_m_1639157515.webp'),
('Nee Kannu Neeli Samudram', 'Javed Ali', 'Romantic', 'Calm', 'nee_kannu.mp3', 'https://a10.gaanacdn.com/gn_img/song/jBr3gLyWR1/r3gN2oaQKR/size_l_1583219687.webp'),
('Mind Block', 'Blaaze', 'Mass', 'Energetic', 'mind_block.mp3', 'https://i.ytimg.com/vi/VsXdJed-3iI/sddefault.jpg'),
('Daang Daang', 'Nakash Aziz', 'Dance', 'Energetic', 'daang_daang.mp3', 'https://c-cdnet.cdn.smule.com/rs-s-sf-2/arr/b3/0b/fb47a242-ed32-4f17-9fd4-05658d79ffad.jpg'),
('Naatu Naatu', 'Rahul Sipligunj', 'Folk', 'Energetic', 'naatu_naatu.mp3', 'https://upload.wikimedia.org/wikipedia/en/2/2e/Naatu_Naatu.jpg'),

-- Hindi
('Kesariya', 'Arijit Singh', 'Romantic', 'Emotional', 'kesariya.mp3', 'https://c.saavncdn.com/191/Kesariya-From-Brahmastra-Hindi-2022-20220717092820-500x500.jpg'),
('Tum Hi Ho', 'Arijit Singh', 'Romantic', 'Sad', 'tum_hi_ho.mp3', 'https://upload.wikimedia.org/wikipedia/en/f/ff/Tum_Hi_Ho_cover.jpeg'),
('Raataan Lambiyan', 'Jubin Nautiyal', 'Romantic', 'Calm', 'raataan.mp3', 'https://c.saavncdn.com/222/Raataan-Lambiyan-From-Shershaah--Hindi-2021-20210729181107-500x500.jpg'),
('Apna Bana Le', 'Arijit Singh', 'Romantic', 'Soft', 'apna_bana_le.mp3', 'https://c.saavncdn.com/815/Bhediya-Hindi-2023-20230927155213-500x500.jpg'),
('Shayad', 'Arijit Singh', 'Melody', 'Emotional', 'shayad.mp3', 'https://c.saavncdn.com/172/Shayad-Film-Version-From-Love-Aaj-Kal--Hindi-2021-20210325204139-500x500.jpg'),
('Ghungroo', 'Arijit Singh', 'Dance', 'Energetic', 'ghungroo.mp3', 'https://a10.gaanacdn.com/gn_img/song/0wrb4N3Lg7/rb4ed0PNKL/size_m_1567659563.webp'),
('Malang', 'Ved Sharma', 'Party', 'Energetic', 'malang.mp3', 'https://a10.gaanacdn.com/gn_img/albums/P7m3GvNKqx/7m3G0pzRWq/size_m_1584109422.jpg'),
('Zinda', 'Siddharth Mahadevan', 'Motivational', 'Powerful', 'zinda.mp3', 'https://i.scdn.co/image/ab67616d0000b273846863bbeafbd0c6411b38ca'),
('Ilahi', 'Arijit Singh', 'Travel', 'Happy', 'ilahi.mp3', 'https://i.ytimg.com/vi/6w67NOaRe-w/maxresdefault.jpg'),
('Tera Ban Jaunga', 'Akhil Sachdeva', 'Romantic', 'Emotional', 'tera_ban_jaunga.mp3', 'https://c.saavncdn.com/215/Tera-Ban-Jaunga-Remix--Hindi-2020-20200407012836-500x500.jpg'),

-- English
('Shape of You', 'Ed Sheeran', 'Pop', 'Happy', 'shape_of_you.mp3', 'https://upload.wikimedia.org/wikipedia/en/b/b4/Shape_Of_You_%28Official_Single_Cover%29_by_Ed_Sheeran.png'),
('Blinding Lights', 'The Weeknd', 'Synthpop', 'Energetic', 'blinding_lights.mp3', 'https://c.saavncdn.com/077/After-Hours-English-2020-20240207070330-500x500.jpg'),
('Perfect', 'Ed Sheeran', 'Romantic', 'Calm', 'perfect.mp3', 'https://c.saavncdn.com/286/WMG_190295851286-English-2017-500x500.jpg'),
('Someone You Loved', 'Lewis Capaldi', 'Sad', 'Emotional', 'someone_you_loved.mp3', 'https://i1.sndcdn.com/artworks-5VCxiNQdKysNTV2y-Qu5QwQ-t500x500.jpg'),
('Believer', 'Imagine Dragons', 'Rock', 'Powerful', 'believer.mp3', 'https://i.scdn.co/image/ab67616d0000b2732f2623c93d48a736c6f23cef'),
('Heat Waves', 'Glass Animals', 'Indie', 'Calm', 'heat_waves.mp3', 'https://i.scdn.co/image/ab67616d0000b273ab9d1ae18b640b7b0ce390d4'),
('Senorita', 'Shawn Mendes', 'Pop', 'Romantic', 'senorita.mp3', 'https://i1.sndcdn.com/artworks-000563277579-usllsc-t500x500.jpg'),
('Levitating', 'Dua Lipa', 'Pop', 'Dance', 'levitating.mp3', 'https://source.boomplaymusic.com/group10/M00/06/08/44adb2bf7f584739b97b1a2d747c0433_464_464.jpg'),
('Counting Stars', 'OneRepublic', 'Pop Rock', 'Motivational', 'counting_stars.mp3', 'https://i.ytimg.com/vi/4Afc3DyirHM/maxresdefault.jpg'),
('Calm Down', 'Rema', 'Afrobeat', 'Chill', 'calm_down.mp3', 'https://i1.sndcdn.com/artworks-iz6agJOar8J3Zz6t-fjRRdg-t1080x1080.jpg'),

-- Tamil
('Rowdy Baby', 'Dhanush', 'Dance', 'Energetic', 'rowdy_baby.mp3', 'https://maktoobmedia.com/wp-content/uploads/2020/11/961259-rowdybaby.jpg'),
('Arabic Kuthu', 'Anirudh Ravichander', 'Dance', 'Energetic', 'arabic_kuthu.mp3', 'https://c.saavncdn.com/629/Arabic-Kuthu-Halamithi-Habibo-From-Beast--Tamil-2022-20220223183836-500x500.jpg'),
('Vaathi Coming', 'Anirudh Ravichander', 'Dance', 'Energetic', 'vaathi_coming.mp3', 'https://upload.wikimedia.org/wikipedia/en/1/1c/Vaathi_Coming.jpg'),
('Enjoy Enjaami', 'Dhee ft. Arivu', 'Folk', 'Cheerful', 'enjoy_enjaami.mp3', 'https://m.media-amazon.com/images/M/MV5BMjhhM2Q4NmItNWY2Yi00NjJmLTliZWItMWRjYjQ4Y2JjMjQ2XkEyXkFqcGc@._V1_QL75_UX190_CR0,24,190,190_.jpg'),
('Kaattu Payale', 'Dhee', 'Melody', 'Romantic', 'kaattu_payale.mp3', 'https://c.saavncdn.com/352/Kaattu-Payale-From-Soorarai-Pottru--Tamil-2020-20200723030248-500x500.jpg');
