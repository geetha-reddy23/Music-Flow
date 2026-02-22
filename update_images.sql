-- SQL Script to update song card images with user-provided URLs

USE music_flow;

UPDATE songs SET image_url = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_jPXpPp9TaSRxxr1XDNZ80_XN80zKB_k9qA&s' WHERE title = 'Butta Bomma';
UPDATE songs SET image_url = 'https://upload.wikimedia.org/wikipedia/en/9/90/Samajavaragamana.jpg' WHERE title = 'Samajavaragamana';
UPDATE songs SET image_url = 'https://upload.wikimedia.org/wikipedia/en/0/0f/Ramuloo_Ramulaa.jpeg' WHERE title = 'Ramulo Ramulaa';
UPDATE songs SET image_url = 'https://c.saavncdn.com/000/Pushpa-The-Rise-Telugu-2023-20230403210942-500x500.jpg' WHERE title = 'Oo Antava';
UPDATE songs SET image_url = 'https://a10.gaanacdn.com/gn_img/song/koMWQ7BKqL/MWQBR7EEbq/size_m_1531202221.jpg' WHERE title = 'Inkem Inkem';
UPDATE songs SET image_url = 'https://a10.gaanacdn.com/gn_img/song/w4MKPgOboj/MKPJBjn4Wo/size_m_1639157515.webp' WHERE title = 'Srivalli';
UPDATE songs SET image_url = 'https://a10.gaanacdn.com/gn_img/song/jBr3gLyWR1/r3gN2oaQKR/size_l_1583219687.webp' WHERE title = 'Nee Kannu Neeli Samudram';
UPDATE songs SET image_url = 'https://i.ytimg.com/vi/VsXdJed-3iI/sddefault.jpg' WHERE title = 'Mind Block';
UPDATE songs SET image_url = 'https://c-cdnet.cdn.smule.com/rs-s-sf-2/arr/b3/0b/fb47a242-ed32-4f17-9fd4-05658d79ffad.jpg' WHERE title = 'Daang Daang';
UPDATE songs SET image_url = 'https://upload.wikimedia.org/wikipedia/en/2/2e/Naatu_Naatu.jpg' WHERE title = 'Naatu Naatu';

-- Batch 2: English & Tamil
UPDATE songs SET image_url = 'https://upload.wikimedia.org/wikipedia/en/b/b4/Shape_Of_You_%28Official_Single_Cover%29_by_Ed_Sheeran.png' WHERE title = 'Shape of You';
UPDATE songs SET image_url = 'https://c.saavncdn.com/077/After-Hours-English-2020-20240207070330-500x500.jpg' WHERE title = 'Blinding Lights';
UPDATE songs SET image_url = 'https://c.saavncdn.com/286/WMG_190295851286-English-2017-500x500.jpg' WHERE title = 'Perfect';
UPDATE songs SET image_url = 'https://i1.sndcdn.com/artworks-5VCxiNQdKysNTV2y-Qu5QwQ-t500x500.jpg' WHERE title = 'Someone You Loved';
UPDATE songs SET image_url = 'https://i.scdn.co/image/ab67616d0000b2732f2623c93d48a736c6f23cef' WHERE title = 'Believer';
UPDATE songs SET image_url = 'https://i.scdn.co/image/ab67616d0000b273ab9d1ae18b640b7b0ce390d4' WHERE title = 'Heat Waves';
UPDATE songs SET image_url = 'https://i1.sndcdn.com/artworks-000563277579-usllsc-t500x500.jpg' WHERE title = 'Senorita';
UPDATE songs SET image_url = 'https://source.boomplaymusic.com/group10/M00/06/08/44adb2bf7f584739b97b1a2d747c0433_464_464.jpg' WHERE title = 'Levitating';
UPDATE songs SET image_url = 'https://i.ytimg.com/vi/4Afc3DyirHM/maxresdefault.jpg' WHERE title = 'Counting Stars';
UPDATE songs SET image_url = 'https://i1.sndcdn.com/artworks-iz6agJOar8J3Zz6t-fjRRdg-t1080x1080.jpg' WHERE title = 'Calm Down';
UPDATE songs SET image_url = 'https://maktoobmedia.com/wp-content/uploads/2020/11/961259-rowdybaby.jpg' WHERE title = 'Rowdy Baby';
UPDATE songs SET image_url = 'https://c.saavncdn.com/629/Arabic-Kuthu-Halamithi-Habibo-From-Beast--Tamil-2022-20220223183836-500x500.jpg' WHERE title = 'Arabic Kuthu';
UPDATE songs SET image_url = 'https://upload.wikimedia.org/wikipedia/en/1/1c/Vaathi_Coming.jpg' WHERE title = 'Vaathi Coming';
UPDATE songs SET image_url = 'https://m.media-amazon.com/images/M/MV5BMjhhM2Q4NmItNWY2Yi00NjJmLTliZWItMWRjYjQ4Y2JjMjQ2XkEyXkFqcGc@._V1_QL75_UX190_CR0,24,190,190_.jpg' WHERE title = 'Enjoy Enjaami';
UPDATE songs SET image_url = 'https://c.saavncdn.com/352/Kaattu-Payale-From-Soorarai-Pottru--Tamil-2020-20200723030248-500x500.jpg' WHERE title = 'Kaattu Payale';

-- Batch 3: Hindi
UPDATE songs SET image_url = 'https://c.saavncdn.com/191/Kesariya-From-Brahmastra-Hindi-2022-20220717092820-500x500.jpg' WHERE title = 'Kesariya';
UPDATE songs SET image_url = 'https://upload.wikimedia.org/wikipedia/en/f/ff/Tum_Hi_Ho_cover.jpeg' WHERE title = 'Tum Hi Ho';
UPDATE songs SET image_url = 'https://c.saavncdn.com/222/Raataan-Lambiyan-From-Shershaah--Hindi-2021-20210729181107-500x500.jpg' WHERE title = 'Raataan Lambiyan';
UPDATE songs SET image_url = 'https://c.saavncdn.com/815/Bhediya-Hindi-2023-20230927155213-500x500.jpg' WHERE title = 'Apna Bana Le';
UPDATE songs SET image_url = 'https://c.saavncdn.com/172/Shayad-Film-Version-From-Love-Aaj-Kal--Hindi-2021-20210325204139-500x500.jpg' WHERE title = 'Shayad';
UPDATE songs SET image_url = 'https://a10.gaanacdn.com/gn_img/song/0wrb4N3Lg7/rb4ed0PNKL/size_m_1567659563.webp' WHERE title = 'Ghungroo';
UPDATE songs SET image_url = 'https://a10.gaanacdn.com/gn_img/albums/P7m3GvNKqx/7m3G0pzRWq/size_m_1584109422.jpg' WHERE title = 'Malang';
UPDATE songs SET image_url = 'https://i.scdn.co/image/ab67616d0000b273846863bbeafbd0c6411b38ca' WHERE title = 'Zinda';
UPDATE songs SET image_url = 'https://i.ytimg.com/vi/6w67NOaRe-w/maxresdefault.jpg' WHERE title = 'Ilahi';
UPDATE songs SET image_url = 'https://c.saavncdn.com/215/Tera-Ban-Jaunga-Remix--Hindi-2020-20200407012836-500x500.jpg' WHERE title = 'Tera Ban Jaunga';

SELECT title, image_url FROM songs WHERE title IN ('Kesariya', 'Tum Hi Ho', 'Raataan Lambiyan', 'Apna Bana Le', 'Shayad', 'Ghungroo', 'Malang', 'Zinda', 'Ilahi', 'Tera Ban Jaunga');
