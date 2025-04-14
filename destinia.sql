CREATE TABLE province(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name   varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lista de Provincias';

INSERT INTO province(id, name)
VALUES
	(8, 'Barcelona'),
	(28,  'Madrid'),
	(46,  'Valencia/València');

CREATE TABLE city (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name   varchar(80) DEFAULT NULL,
    province_id INT NOT NULL,
    FOREIGN KEY (province_id) REFERENCES province(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lista de CITY';


INSERT INTO city (id, name, province_id) VALUES
(1, 'Barcelona', 8),
(2, 'Hospitalet de Llobregat', 8),
(3, 'Badalona', 8),
(4, 'Sabadell', 8),
(5, 'Terrassa', 8),
(6, 'Madrid', 28),
(7, 'Alcalá de Henares', 28),
(8, 'Getafe', 28),
(9, 'Móstoles', 28),
(10, 'Leganés', 28),
(11, 'Valencia', 46),
(12, 'Gandía', 46),
(13, 'Torrent', 46),
(14, 'Paterna', 46),
(15, 'Sagunto', 46);


CREATE TABLE hospedaje (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(250) NOT NULL,
    image VARCHAR(250),
    type ENUM('hotel', 'apartment') NOT NULL,
    city_id INT NOT NULL,
    description TEXT NOT NULL,
    FOREIGN KEY (city_id) REFERENCES city(id)
);

CREATE TABLE room_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL
);


INSERT INTO room_type (id, name) VALUES
(1, 'Junior Suite'),
(3, 'Superior'),
(4, 'Deluxe'),
(5, 'Family Room'),
(6, 'Triple Room'),
(7, 'Double Room'),
(8, 'Single Room');

CREATE TABLE hotel (
    hospedaje_id INT PRIMARY KEY,
    stars TINYINT NOT NULL,
    room_type_id INT NOT NULL,
    FOREIGN KEY (hospedaje_id) REFERENCES hospedaje(id) ON DELETE CASCADE,
    FOREIGN KEY (room_type_id) REFERENCES room_type(id)
);

CREATE TABLE apartment (
    hospedaje_id INT PRIMARY KEY,
    total_apartments INT NOT NULL,
    max_adults INT NOT NULL,
    FOREIGN KEY (hospedaje_id) REFERENCES hospedaje(id) ON DELETE CASCADE
);

CREATE TABLE translations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    table_name VARCHAR(50) NOT NULL,
    column_name VARCHAR(50) NOT NULL,
    row_id INT NOT NULL,
    language_code VARCHAR(10) NOT NULL,
    translated_text TEXT NOT NULL,
    UNIQUE (table_name, column_name, row_id, language_code)
);



INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (1, 'Hotel Barcelona 1', 'hotel_barcelona_1.jpg', 'hotel', 1, 'Un hermoso hotel en Barcelona.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (2, 'Apartamentos Barcelona 2', 'apartamentos_barcelona_2.jpg', 'apartment', 1, 'Un hermoso apartamento en Barcelona.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (3, 'Hotel Barcelona 3', 'hotel_barcelona_3.jpg', 'hotel', 1, 'Un hermoso hotel en Barcelona.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (4, 'Hotel Hospitalet de Llobregat 1', 'hotel_hospitalet_de_llobregat_1.jpg', 'hotel', 2, 'Un hermoso hotel en Hospitalet de Llobregat.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (5, 'Apartamentos Hospitalet de Llobregat 2', 'apartamentos_hospitalet_de_llobregat_2.jpg', 'apartment', 2, 'Un hermoso apartamento en Hospitalet de Llobregat.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (6, 'Hotel Hospitalet de Llobregat 3', 'hotel_hospitalet_de_llobregat_3.jpg', 'hotel', 2, 'Un hermoso hotel en Hospitalet de Llobregat.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (7, 'Hotel Badalona 1', 'hotel_badalona_1.jpg', 'hotel', 3, 'Un hermoso hotel en Badalona.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (8, 'Apartamentos Badalona 2', 'apartamentos_badalona_2.jpg', 'apartment', 3, 'Un hermoso apartamento en Badalona.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (9, 'Hotel Badalona 3', 'hotel_badalona_3.jpg', 'hotel', 3, 'Un hermoso hotel en Badalona.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (10, 'Hotel Sabadell 1', 'hotel_sabadell_1.jpg', 'hotel', 4, 'Un hermoso hotel en Sabadell.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (11, 'Apartamentos Sabadell 2', 'apartamentos_sabadell_2.jpg', 'apartment', 4, 'Un hermoso apartamento en Sabadell.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (12, 'Hotel Sabadell 3', 'hotel_sabadell_3.jpg', 'hotel', 4, 'Un hermoso hotel en Sabadell.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (13, 'Hotel Terrassa 1', 'hotel_terrassa_1.jpg', 'hotel', 5, 'Un hermoso hotel en Terrassa.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (14, 'Apartamentos Terrassa 2', 'apartamentos_terrassa_2.jpg', 'apartment', 5, 'Un hermoso apartamento en Terrassa.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (15, 'Hotel Terrassa 3', 'hotel_terrassa_3.jpg', 'hotel', 5, 'Un hermoso hotel en Terrassa.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (16, 'Hotel Madrid 1', 'hotel_madrid_1.jpg', 'hotel', 6, 'Un hermoso hotel en Madrid.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (17, 'Apartamentos Madrid 2', 'apartamentos_madrid_2.jpg', 'apartment', 6, 'Un hermoso apartamento en Madrid.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (18, 'Hotel Madrid 3', 'hotel_madrid_3.jpg', 'hotel', 6, 'Un hermoso hotel en Madrid.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (19, 'Hotel Alcalá de Henares 1', 'hotel_alcalá_de_henares_1.jpg', 'hotel', 7, 'Un hermoso hotel en Alcalá de Henares.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (20, 'Apartamentos Alcalá de Henares 2', 'apartamentos_alcalá_de_henares_2.jpg', 'apartment', 7, 'Un hermoso apartamento en Alcalá de Henares.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (21, 'Hotel Alcalá de Henares 3', 'hotel_alcalá_de_henares_3.jpg', 'hotel', 7, 'Un hermoso hotel en Alcalá de Henares.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (22, 'Hotel Getafe 1', 'hotel_getafe_1.jpg', 'hotel', 8, 'Un hermoso hotel en Getafe.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (23, 'Apartamentos Getafe 2', 'apartamentos_getafe_2.jpg', 'apartment', 8, 'Un hermoso apartamento en Getafe.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (24, 'Hotel Getafe 3', 'hotel_getafe_3.jpg', 'hotel', 8, 'Un hermoso hotel en Getafe.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (25, 'Hotel Móstoles 1', 'hotel_móstoles_1.jpg', 'hotel', 9, 'Un hermoso hotel en Móstoles.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (26, 'Apartamentos Móstoles 2', 'apartamentos_móstoles_2.jpg', 'apartment', 9, 'Un hermoso apartamento en Móstoles.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (27, 'Hotel Móstoles 3', 'hotel_móstoles_3.jpg', 'hotel', 9, 'Un hermoso hotel en Móstoles.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (28, 'Hotel Leganés 1', 'hotel_leganés_1.jpg', 'hotel', 10, 'Un hermoso hotel en Leganés.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (29, 'Apartamentos Leganés 2', 'apartamentos_leganés_2.jpg', 'apartment', 10, 'Un hermoso apartamento en Leganés.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (30, 'Hotel Leganés 3', 'hotel_leganés_3.jpg', 'hotel', 10, 'Un hermoso hotel en Leganés.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (31, 'Hotel Valencia 1', 'hotel_valencia_1.jpg', 'hotel', 11, 'Un hermoso hotel en Valencia.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (32, 'Apartamentos Valencia 2', 'apartamentos_valencia_2.jpg', 'apartment', 11, 'Un hermoso apartamento en Valencia.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (33, 'Hotel Valencia 3', 'hotel_valencia_3.jpg', 'hotel', 11, 'Un hermoso hotel en Valencia.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (34, 'Hotel Gandía 1', 'hotel_gandía_1.jpg', 'hotel', 12, 'Un hermoso hotel en Gandía.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (35, 'Apartamentos Gandía 2', 'apartamentos_gandía_2.jpg', 'apartment', 12, 'Un hermoso apartamento en Gandía.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (36, 'Hotel Gandía 3', 'hotel_gandía_3.jpg', 'hotel', 12, 'Un hermoso hotel en Gandía.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (37, 'Hotel Torrent 1', 'hotel_torrent_1.jpg', 'hotel', 13, 'Un hermoso hotel en Torrent.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (38, 'Apartamentos Torrent 2', 'apartamentos_torrent_2.jpg', 'apartment', 13, 'Un hermoso apartamento en Torrent.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (39, 'Hotel Torrent 3', 'hotel_torrent_3.jpg', 'hotel', 13, 'Un hermoso hotel en Torrent.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (40, 'Hotel Paterna 1', 'hotel_paterna_1.jpg', 'hotel', 14, 'Un hermoso hotel en Paterna.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (41, 'Apartamentos Paterna 2', 'apartamentos_paterna_2.jpg', 'apartment', 14, 'Un hermoso apartamento en Paterna.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (42, 'Hotel Paterna 3', 'hotel_paterna_3.jpg', 'hotel', 14, 'Un hermoso hotel en Paterna.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (43, 'Hotel Sagunto 1', 'hotel_sagunto_1.jpg', 'hotel', 15, 'Un hermoso hotel en Sagunto.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (44, 'Apartamentos Sagunto 2', 'apartamentos_sagunto_2.jpg', 'apartment', 15, 'Un hermoso apartamento en Sagunto.');
INSERT INTO hospedaje (id, name, image, type, city_id, description) VALUES (45, 'Hotel Sagunto 3', 'hotel_sagunto_3.jpg', 'hotel', 15, 'Un hermoso hotel en Sagunto.');
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 1, 4, 3);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 3, 3, 5);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 4, 4, 6);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 6, 3, 8);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 7, 4, 1);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 9, 3, 4);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 10, 4, 5);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 12, 3, 7);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 13, 4, 8);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 15, 3, 3);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 16, 4, 4);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 18, 3, 6);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 19, 4, 7);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 21, 3, 1);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 22, 4, 3);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 24, 3, 5);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 25, 4, 6);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 27, 3, 8);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 28, 4, 1);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 30, 3, 4);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 31, 4, 5);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 33, 3, 7);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 34, 4, 8);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 36, 3, 3);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 37, 4, 4);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 39, 3, 6);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 40, 4, 7);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 42, 3, 1);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 43, 4, 3);
INSERT INTO hotel (hospedaje_id, stars, room_type_id) VALUES ( 45, 3, 5);
INSERT INTO apartment (hospedaje_id, total_apartments, max_adults) VALUES ( 2, 12, 3);
INSERT INTO apartment (hospedaje_id, total_apartments, max_adults) VALUES ( 5, 15, 3);
INSERT INTO apartment (hospedaje_id, total_apartments, max_adults) VALUES ( 8, 18, 2);
INSERT INTO apartment (hospedaje_id, total_apartments, max_adults) VALUES ( 11, 11, 5);
INSERT INTO apartment (hospedaje_id, total_apartments, max_adults) VALUES ( 14, 14, 4);
INSERT INTO apartment (hospedaje_id, total_apartments, max_adults) VALUES ( 17, 17, 3);
INSERT INTO apartment (hospedaje_id, total_apartments, max_adults) VALUES ( 20, 10, 2);
INSERT INTO apartment (hospedaje_id, total_apartments, max_adults) VALUES ( 23, 13, 5);
INSERT INTO apartment (hospedaje_id, total_apartments, max_adults) VALUES ( 26, 16, 4);
INSERT INTO apartment (hospedaje_id, total_apartments, max_adults) VALUES ( 29, 19, 3);
INSERT INTO apartment (hospedaje_id, total_apartments, max_adults) VALUES ( 32, 12, 2);
INSERT INTO apartment (hospedaje_id, total_apartments, max_adults) VALUES ( 35, 15, 5);
INSERT INTO apartment (hospedaje_id, total_apartments, max_adults) VALUES ( 38, 18, 4);
INSERT INTO apartment (hospedaje_id, total_apartments, max_adults) VALUES ( 41, 11, 3);
INSERT INTO apartment (hospedaje_id, total_apartments, max_adults) VALUES ( 44, 14, 2);




INSERT INTO translations (table_name, column_name, row_id, language_code, translated_text) VALUES
('hospedaje', 'name', 1, 'en', 'Hotel Barcelona 1'),
('hospedaje', 'name', 1, 'fr', 'Hôtel Barcelone 1'),
('hospedaje', 'name', 2, 'en', 'Apartments Barcelona 2'),
('hospedaje', 'name', 2, 'fr', 'Appartements Barcelone 2'),
('hospedaje', 'name', 3, 'en', 'Hotel Barcelona 3'),
('hospedaje', 'name', 3, 'fr', 'Hôtel Barcelone 3'),
('hospedaje', 'name', 4, 'en', 'Hotel Hospitalet de Llobregat 1'),
('hospedaje', 'name', 4, 'fr', 'Hôtel Hospitalet de Llobregat 1'),
('hospedaje', 'name', 5, 'en', 'Apartments Hospitalet de Llobregat 2'),
('hospedaje', 'name', 5, 'fr', 'Appartements Hospitalet de Llobregat 2'),
('hospedaje', 'name', 6, 'en', 'Hotel Hospitalet de Llobregat 3'),
('hospedaje', 'name', 6, 'fr', 'Hôtel Hospitalet de Llobregat 3'),
('hospedaje', 'name', 7, 'en', 'Hotel Badalona 1'),
('hospedaje', 'name', 7, 'fr', 'Hôtel Badalona 1'),
('hospedaje', 'name', 8, 'en', 'Apartments Badalona 2'),
('hospedaje', 'name', 8, 'fr', 'Appartements Badalona 2'),
('hospedaje', 'name', 9, 'en', 'Hotel Badalona 3'),
('hospedaje', 'name', 9, 'fr', 'Hôtel Badalona 3'),
('hospedaje', 'name', 10, 'en', 'Hotel Sabadell 1'),
('hospedaje', 'name', 10, 'fr', 'Hôtel Sabadell 1'),
('hospedaje', 'name', 11, 'en', 'Apartments Sabadell 2'),
('hospedaje', 'name', 11, 'fr', 'Appartements Sabadell 2'),
('hospedaje', 'name', 12, 'en', 'Hotel Sabadell 3'),
('hospedaje', 'name', 12, 'fr', 'Hôtel Sabadell 3'),
('hospedaje', 'name', 13, 'en', 'Hotel Terrassa 1'),
('hospedaje', 'name', 13, 'fr', 'Hôtel Terrassa 1'),
('hospedaje', 'name', 14, 'en', 'Apartments Terrassa 2'),
('hospedaje', 'name', 14, 'fr', 'Appartements Terrassa 2'),
('hospedaje', 'name', 15, 'en', 'Hotel Terrassa 3'),
('hospedaje', 'name', 15, 'fr', 'Hôtel Terrassa 3'),
('hospedaje', 'name', 16, 'en', 'Hotel Madrid 1'),
('hospedaje', 'name', 16, 'fr', 'Hôtel Madrid 1'),
('hospedaje', 'name', 17, 'en', 'Apartments Madrid 2'),
('hospedaje', 'name', 17, 'fr', 'Appartements Madrid 2'),
('hospedaje', 'name', 18, 'en', 'Hotel Madrid 3'),
('hospedaje', 'name', 18, 'fr', 'Hôtel Madrid 3'),
('hospedaje', 'name', 19, 'en', 'Hotel Alcalá de Henares 1'),
('hospedaje', 'name', 19, 'fr', 'Hôtel Alcalá de Henares 1'),
('hospedaje', 'name', 20, 'en', 'Apartments Alcalá de Henares 2'),
('hospedaje', 'name', 20, 'fr', 'Appartements Alcalá de Henares 2'),
('hospedaje', 'name', 21, 'en', 'Hotel Alcalá de Henares 3'),
('hospedaje', 'name', 21, 'fr', 'Hôtel Alcalá de Henares 3'),
('hospedaje', 'name', 22, 'en', 'Hotel Getafe 1'),
('hospedaje', 'name', 22, 'fr', 'Hôtel Getafe 1'),
('hospedaje', 'name', 23, 'en', 'Apartments Getafe 2'),
('hospedaje', 'name', 23, 'fr', 'Appartements Getafe 2'),
('hospedaje', 'name', 24, 'en', 'Hotel Getafe 3'),
('hospedaje', 'name', 24, 'fr', 'Hôtel Getafe 3'),
('hospedaje', 'name', 25, 'en', 'Hotel Móstoles 1'),
('hospedaje', 'name', 25, 'fr', 'Hôtel Móstoles 1'),
('hospedaje', 'name', 26, 'en', 'Apartments Móstoles 2'),
('hospedaje', 'name', 26, 'fr', 'Appartements Móstoles 2'),
('hospedaje', 'name', 27, 'en', 'Hotel Móstoles 3'),
('hospedaje', 'name', 27, 'fr', 'Hôtel Móstoles 3'),
('hospedaje', 'name', 28, 'en', 'Hotel Leganés 1'),
('hospedaje', 'name', 28, 'fr', 'Hôtel Leganés 1'),
('hospedaje', 'name', 29, 'en', 'Apartments Leganés 2'),
('hospedaje', 'name', 29, 'fr', 'Appartements Leganés 2'),
('hospedaje', 'name', 30, 'en', 'Hotel Leganés 3'),
('hospedaje', 'name', 30, 'fr', 'Hôtel Leganés 3'),
('hospedaje', 'name', 31, 'en', 'Hotel Valencia 1'),
('hospedaje', 'name', 31, 'fr', 'Hôtel Valence 1'),
('hospedaje', 'name', 32, 'en', 'Apartments Valencia 2'),
('hospedaje', 'name', 32, 'fr', 'Appartements Valence 2'),
('hospedaje', 'name', 33, 'en', 'Hotel Valencia 3'),
('hospedaje', 'name', 33, 'fr', 'Hôtel Valence 3'),
('hospedaje', 'name', 34, 'en', 'Hotel Gandía 1'),
('hospedaje', 'name', 34, 'fr', 'Hôtel Gandía 1'),
('hospedaje', 'name', 35, 'en', 'Apartments Gandía 2'),
('hospedaje', 'name', 35, 'fr', 'Appartements Gandía 2'),
('hospedaje', 'name', 36, 'en', 'Hotel Gandía 3'),
('hospedaje', 'name', 36, 'fr', 'Hôtel Gandía 3'),
('hospedaje', 'name', 37, 'en', 'Hotel Torrent 1'),
('hospedaje', 'name', 37, 'fr', 'Hôtel Torrent 1'),
('hospedaje', 'name', 38, 'en', 'Apartments Torrent 2'),
('hospedaje', 'name', 38, 'fr', 'Appartements Torrent 2'),
('hospedaje', 'name', 39, 'en', 'Hotel Torrent 3'),
('hospedaje', 'name', 39, 'fr', 'Hôtel Torrent 3'),
('hospedaje', 'name', 40, 'en', 'Hotel Paterna 1'),
('hospedaje', 'name', 40, 'fr', 'Hôtel Paterna 1'),
('hospedaje', 'name', 41, 'en', 'Apartments Paterna 2'),
('hospedaje', 'name', 41, 'fr', 'Appartements Paterna 2'),
('hospedaje', 'name', 42, 'en', 'Hotel Paterna 3'),
('hospedaje', 'name', 42, 'fr', 'Hôtel Paterna 3'),
('hospedaje', 'name', 43, 'en', 'Hotel Sagunto 1'),
('hospedaje', 'name', 43, 'fr', 'Hôtel Sagunto 1'),
('hospedaje', 'name', 44, 'en', 'Apartments Sagunto 2'),
('hospedaje', 'name', 44, 'fr', 'Appartements Sagunto 2'),
('hospedaje', 'name', 45, 'en', 'Hotel Sagunto 3'),
('hospedaje', 'name', 45, 'fr', 'Hôtel Sagunto 3');


INSERT INTO translations (table_name, column_name, row_id, language_code, translated_text) VALUES
('hospedaje', 'name', 1, 'zh', '巴塞罗那酒店1'),
('hospedaje', 'name', 1, 'ar', 'فندق برشلونة 1'),
('hospedaje', 'name', 2, 'zh', '巴塞罗那公寓2'),
('hospedaje', 'name', 2, 'ar', 'شقق برشلونة 2'),
('hospedaje', 'name', 3, 'zh', '巴塞罗那酒店3'),
('hospedaje', 'name', 3, 'ar', 'فندق برشلونة 3'),
('hospedaje', 'name', 4, 'zh', '奥斯皮塔莱特-德略夫雷加特酒店1'),
('hospedaje', 'name', 4, 'ar', 'فندق أوسبيتاليت دي يوبريغات 1'),
('hospedaje', 'name', 5, 'zh', '奥斯皮塔莱特-德略夫雷加特公寓2'),
('hospedaje', 'name', 5, 'ar', 'شقق أوسبيتاليت دي يوبريغات 2'),
('hospedaje', 'name', 6, 'zh', '奥斯皮塔莱特-德略夫雷加特酒店3'),
('hospedaje', 'name', 6, 'ar', 'فندق أوسبيتاليت دي يوبريغات 3'),
('hospedaje', 'name', 7, 'zh', '巴达洛纳酒店1'),
('hospedaje', 'name', 7, 'ar', 'فندق بادالونا 1'),
('hospedaje', 'name', 8, 'zh', '巴达洛纳公寓2'),
('hospedaje', 'name', 8, 'ar', 'شقق بادالونا 2'),
('hospedaje', 'name', 9, 'zh', '巴达洛纳酒店3'),
('hospedaje', 'name', 9, 'ar', 'فندق بادالونا 3'),
('hospedaje', 'name', 10, 'zh', '萨瓦德尔酒店1'),
('hospedaje', 'name', 10, 'ar', 'فندق ساباديل 1'),
('hospedaje', 'name', 11, 'zh', '萨瓦德尔公寓2'),
('hospedaje', 'name', 11, 'ar', 'شقق ساباديل 2'),
('hospedaje', 'name', 12, 'zh', '萨瓦德尔酒店3'),
('hospedaje', 'name', 12, 'ar', 'فندق ساباديل 3'),
('hospedaje', 'name', 13, 'zh', '特拉萨酒店1'),
('hospedaje', 'name', 13, 'ar', 'فندق تيراسا 1'),
('hospedaje', 'name', 14, 'zh', '特拉萨公寓2'),
('hospedaje', 'name', 14, 'ar', 'شقق تيراسا 2'),
('hospedaje', 'name', 15, 'zh', '特拉萨酒店3'),
('hospedaje', 'name', 15, 'ar', 'فندق تيراسا 3'),
('hospedaje', 'name', 16, 'zh', '马德里酒店1'),
('hospedaje', 'name', 16, 'ar', 'فندق مدريد 1'),
('hospedaje', 'name', 17, 'zh', '马德里公寓2'),
('hospedaje', 'name', 17, 'ar', 'شقق مدريد 2'),
('hospedaje', 'name', 18, 'zh', '马德里酒店3'),
('hospedaje', 'name', 18, 'ar', 'فندق مدريد 3'),
('hospedaje', 'name', 19, 'zh', '阿尔卡拉-德埃纳雷斯酒店1'),
('hospedaje', 'name', 19, 'ar', 'فندق ألكالا دي إيناريس 1'),
('hospedaje', 'name', 20, 'zh', '阿尔卡拉-德埃纳雷斯公寓2'),
('hospedaje', 'name', 20, 'ar', 'شقق ألكالا دي إيناريس 2'),
('hospedaje', 'name', 21, 'zh', '阿尔卡拉-德埃纳雷斯酒店3'),
('hospedaje', 'name', 21, 'ar', 'فندق ألكالا دي إيناريس 3'),
('hospedaje', 'name', 22, 'zh', '赫塔菲酒店1'),
('hospedaje', 'name', 22, 'ar', 'فندق خيتافي 1'),
('hospedaje', 'name', 23, 'zh', '赫塔菲公寓2'),
('hospedaje', 'name', 23, 'ar', 'شقق خيتافي 2'),
('hospedaje', 'name', 24, 'zh', '赫塔菲酒店3'),
('hospedaje', 'name', 24, 'ar', 'فندق خيتافي 3'),
('hospedaje', 'name', 25, 'zh', '莫斯托莱斯酒店1'),
('hospedaje', 'name', 25, 'ar', 'فندق موستوليس 1'),
('hospedaje', 'name', 26, 'zh', '莫斯托莱斯公寓2'),
('hospedaje', 'name', 26, 'ar', 'شقق موستوليس 2'),
('hospedaje', 'name', 27, 'zh', '莫斯托莱斯酒店3'),
('hospedaje', 'name', 27, 'ar', 'فندق موستوليس 3'),
('hospedaje', 'name', 28, 'zh', '莱加内斯酒店1'),
('hospedaje', 'name', 28, 'ar', 'فندق ليجانيس 1'),
('hospedaje', 'name', 29, 'zh', '莱加内斯公寓2'),
('hospedaje', 'name', 29, 'ar', 'شقق ليجانيس 2'),
('hospedaje', 'name', 30, 'zh', '莱加内斯酒店3'),
('hospedaje', 'name', 30, 'ar', 'فندق ليجانيس 3'),
('hospedaje', 'name', 31, 'zh', '瓦伦西亚酒店1'),
('hospedaje', 'name', 31, 'ar', 'فندق فالنسيا 1'),
('hospedaje', 'name', 32, 'zh', '瓦伦西亚公寓2'),
('hospedaje', 'name', 32, 'ar', 'شقق فالنسيا 2'),
('hospedaje', 'name', 33, 'zh', '瓦伦西亚酒店3'),
('hospedaje', 'name', 33, 'ar', 'فندق فالنسيا 3'),
('hospedaje', 'name', 34, 'zh', '甘迪亚酒店1'),
('hospedaje', 'name', 34, 'ar', 'فندق غانديا 1'),
('hospedaje', 'name', 35, 'zh', '甘迪亚公寓2'),
('hospedaje', 'name', 35, 'ar', 'شقق غانديا 2'),
('hospedaje', 'name', 36, 'zh', '甘迪亚酒店3'),
('hospedaje', 'name', 36, 'ar', 'فندق غانديا 3'),
('hospedaje', 'name', 37, 'zh', '托伦特酒店1'),
('hospedaje', 'name', 37, 'ar', 'فندق تورنت 1'),
('hospedaje', 'name', 38, 'zh', '托伦特公寓2'),
('hospedaje', 'name', 38, 'ar', 'شقق تورنت 2'),
('hospedaje', 'name', 39, 'zh', '托伦特酒店3'),
('hospedaje', 'name', 39, 'ar', 'فندق تورنت 3'),
('hospedaje', 'name', 40, 'zh', '帕特纳酒店1'),
('hospedaje', 'name', 40, 'ar', 'فندق باتيرنا 1'),
('hospedaje', 'name', 41, 'zh', '帕特纳公寓2'),
('hospedaje', 'name', 41, 'ar', 'شقق باتيرنا 2'),
('hospedaje', 'name', 42, 'zh', '帕特纳酒店3'),
('hospedaje', 'name', 42, 'ar', 'فندق باتيرنا 3'),
('hospedaje', 'name', 43, 'zh', '萨贡托酒店1'),
('hospedaje', 'name', 43, 'ar', 'فندق ساجونتو 1'),
('hospedaje', 'name', 44, 'zh', '萨贡托公寓2'),
('hospedaje', 'name', 44, 'ar', 'شقق ساجونتو 2'),
('hospedaje', 'name', 45, 'zh', '萨贡托酒店3'),
('hospedaje', 'name', 45, 'ar', 'فندق ساجونتو 3');



-- Tabla province
INSERT INTO translations (table_name, column_name, row_id, language_code, translated_text) VALUES
('province', 'name', 8, 'es', 'Barcelona'),
('province', 'name', 8, 'en', 'Barcelona'),
('province', 'name', 8, 'fr', 'Barcelone'),
('province', 'name', 8, 'zh', '巴塞罗那'),
('province', 'name', 8, 'ar', 'برشلونة'),
('province', 'name', 28, 'es', 'Madrid'),
('province', 'name', 28, 'en', 'Madrid'),
('province', 'name', 28, 'fr', 'Madrid'),
('province', 'name', 28, 'zh', '马德里'),
('province', 'name', 28, 'ar', 'مدريد'),
('province', 'name', 46, 'es', 'Valencia/València'),
('province', 'name', 46, 'en', 'Valencia/València'),
('province', 'name', 46, 'fr', 'Valence/València'),
('province', 'name', 46, 'zh', '瓦伦西亚'),
('province', 'name', 46, 'ar', 'فالنسيا');

-- Tabla city
INSERT INTO translations (table_name, column_name, row_id, language_code, translated_text) VALUES
('city', 'name', 1, 'es', 'Barcelona'),
('city', 'name', 1, 'en', 'Barcelona'),
('city', 'name', 1, 'fr', 'Barcelone'),
('city', 'name', 1, 'zh', '巴塞罗那'),
('city', 'name', 1, 'ar', 'برشلونة'),
('city', 'name', 2, 'es', 'Hospitalet de Llobregat'),
('city', 'name', 2, 'en', 'Hospitalet de Llobregat'),
('city', 'name', 2, 'fr', 'Hospitalet de Llobregat'),
('city', 'name', 2, 'zh', '奥斯皮塔莱特-德略夫雷加特'),
('city', 'name', 2, 'ar', 'أوسبيتاليت دي يوبريغات'),
('city', 'name', 3, 'es', 'Badalona'),
('city', 'name', 3, 'en', 'Badalona'),
('city', 'name', 3, 'fr', 'Badalona'),
('city', 'name', 3, 'zh', '巴达洛纳'),
('city', 'name', 3, 'ar', 'بادالونا'),
('city', 'name', 4, 'es', 'Sabadell'),
('city', 'name', 4, 'en', 'Sabadell'),
('city', 'name', 4, 'fr', 'Sabadell'),
('city', 'name', 4, 'zh', '萨瓦德尔'),
('city', 'name', 4, 'ar', 'ساباديل'),
('city', 'name', 5, 'es', 'Terrassa'),
('city', 'name', 5, 'en', 'Terrassa'),
('city', 'name', 5, 'fr', 'Terrassa'),
('city', 'name', 5, 'zh', '特拉萨'),
('city', 'name', 5, 'ar', 'تيراسا'),
('city', 'name', 6, 'es', 'Madrid'),
('city', 'name', 6, 'en', 'Madrid'),
('city', 'name', 6, 'fr', 'Madrid'),
('city', 'name', 6, 'zh', '马德里'),
('city', 'name', 6, 'ar', 'مدريد'),
('city', 'name', 7, 'es', 'Alcalá de Henares'),
('city', 'name', 7, 'en', 'Alcalá de Henares'),
('city', 'name', 7, 'fr', 'Alcalá de Henares'),
('city', 'name', 7, 'zh', '阿尔卡拉-德埃纳雷斯'),
('city', 'name', 7, 'ar', 'ألكالا دي إيناريس'),
('city', 'name', 8, 'es', 'Getafe'),
('city', 'name', 8, 'en', 'Getafe'),
('city', 'name', 8, 'fr', 'Getafe'),
('city', 'name', 8, 'zh', '赫塔菲'),
('city', 'name', 8, 'ar', 'خيتافي'),
('city', 'name', 9, 'es', 'Móstoles'),
('city', 'name', 9, 'en', 'Móstoles'),
('city', 'name', 9, 'fr', 'Móstoles'),
('city', 'name', 9, 'zh', '莫斯托莱斯'),
('city', 'name', 9, 'ar', 'موستوليس'),
('city', 'name', 10, 'es', 'Leganés'),
('city', 'name', 10, 'en', 'Leganés'),
('city', 'name', 10, 'fr', 'Leganés'),
('city', 'name', 10, 'zh', '莱加内斯'),
('city', 'name', 10, 'ar', 'ليجانيس'),
('city', 'name', 11, 'es', 'Valencia'),
('city', 'name', 11, 'en', 'Valencia'),
('city', 'name', 11, 'fr', 'Valence'),
('city', 'name', 11, 'zh', '瓦伦西亚'),
('city', 'name', 11, 'ar', 'فالنسيا'),
('city', 'name', 12, 'es', 'Gandía'),
('city', 'name', 12, 'en', 'Gandía'),
('city', 'name', 12, 'fr', 'Gandía'),
('city', 'name', 12, 'zh', '甘迪亚'),
('city', 'name', 12, 'ar', 'غانديا'),
('city', 'name', 13, 'es', 'Torrent'),
('city', 'name', 13, 'en', 'Torrent'),
('city', 'name', 13, 'fr', 'Torrent'),
('city', 'name', 13, 'zh', '托伦特'),
('city', 'name', 13, 'ar', 'تورنت'),
('city', 'name', 14, 'es', 'Paterna'),
('city', 'name', 14, 'en', 'Paterna'),
('city', 'name', 14, 'fr', 'Paterna'),
('city', 'name', 14, 'zh', '帕特纳'),
('city', 'name', 14, 'ar', 'باتيرنا'),
('city', 'name', 15, 'es', 'Sagunto'),
('city', 'name', 15, 'en', 'Sagunto'),
('city', 'name', 15, 'fr', 'Sagunto'),
('city', 'name', 15, 'zh', '萨贡托'),
('city', 'name', 15, 'ar', 'ساجونتو');

-- Tabla room_type
INSERT INTO translations (table_name, column_name, row_id, language_code, translated_text) VALUES
('room_type', 'name', 1, 'es', 'Junior Suite'),
('room_type', 'name', 1, 'en', 'Junior Suite'),
('room_type', 'name', 1, 'fr', 'Suite Junior'),
('room_type', 'name', 1, 'zh', '小型套房'),
('room_type', 'name', 1, 'ar', 'جناح صغير'),
('room_type', 'name', 3, 'es', 'Superior'),
('room_type', 'name', 3, 'en', 'Superior'),
('room_type', 'name', 3, 'fr', 'Supérieure'),
('room_type', 'name', 3, 'zh', '高级房'),
('room_type', 'name', 3, 'ar', 'ممتازة'),
('room_type', 'name', 4, 'es', 'Deluxe'),
('room_type', 'name', 4, 'en', 'Deluxe'),
('room_type', 'name', 4, 'fr', 'Deluxe'),
('room_type', 'name', 4, 'zh', '豪华房'),
('room_type', 'name', 4, 'ar', 'فاخرة'),
('room_type', 'name', 5, 'es', 'Family Room'),
('room_type', 'name', 5, 'en', 'Family Room'),
('room_type', 'name', 5, 'fr', 'Chambre Familiale'),
('room_type', 'name', 5, 'zh', '家庭房'),
('room_type', 'name', 5, 'ar', 'غرفة عائلية'),
('room_type', 'name', 6, 'es', 'Triple Room'),
('room_type', 'name', 6, 'en', 'Triple Room'),
('room_type', 'name', 6, 'fr', 'Chambre Triple'),
('room_type', 'name', 6, 'zh', '三人房'),
('room_type', 'name', 6, 'ar', 'غرفة ثلاثية'),
('room_type', 'name', 7, 'es', 'Double Room'),
('room_type', 'name', 7, 'en', 'Double Room'),
('room_type', 'name', 7, 'fr', 'Chambre Double'),
('room_type', 'name', 7, 'zh', '双人房'),
('room_type', 'name', 7, 'ar', 'غرفة مزدوجة'),
('room_type', 'name', 8, 'es', 'Single Room'),
('room_type', 'name', 8, 'en', 'Single Room'),
('room_type', 'name', 8, 'fr', 'Chambre Simple'),
('room_type', 'name', 8, 'zh', '单人房'),
('room_type', 'name', 8, 'ar', 'غرفة فردية');