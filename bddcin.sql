-- CREATION DE LA BASE DE DONNEES cinéma --

CREATE DATABASE IF NOT EXISTS cinema;

----------------------------------------------------------------------------------------------------

-- CREATION DES TABLES DANS LA BASE DE DONNEES -- 

-- Création de la table réservation --

CREATE TABLE reservation (
  id_reservation INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
  date DATETIME
) engine=INNODB;

-- Création de la table session --
CREATE TABLE session (
  id_session INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
  date DATETIME,
  place INT
) engine=INNODB;

-- Création de la table cinéma --
CREATE TABLE cinema (
  id_cinema INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
  name VARCHAR (30),
  address VARCHAR (75),
  city VARCHAR (30),
  id_session INT NULL,
  FOREIGN KEY (id_session) REFERENCES session(id_session)
) engine=INNODB;

-- Création de la table moovie --
CREATE TABLE moovie (
  id_moovie INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
  title VARCHAR (30),
  genre VARCHAR (30),
  id_session INT NULL,
  FOREIGN KEY (id_session) REFERENCES session(id_session)
) engine=INNODB;

-- Création de la table price --
CREATE TABLE price (
  id_price INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
  price FLOAT NOT NULL CHECK (price >= 0),
  description VARCHAR (75),
  numero_ticket INT UNIQUE,
  spot_paiement BOOLEAN,
  online_paiement BOOLEAN
) engine=INNODB;

-- Création de la table admin --
CREATE TABLE admin (
  id_admin INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
  name VARCHAR (30),
  id_price INT NULL,
  FOREIGN KEY (id_price) REFERENCES price(id_price)
) engine=INNODB;

-- Création de la table user --
CREATE TABLE user (
  id_user INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
  first_name VARCHAR (30),
  last_name VARCHAR (30),
  role VARCHAR (30),
  email VARCHAR (75),
  password VARCHAR (75),
  phone VARCHAR (10),
  id_admin INT NOT NULL
) engine=INNODB;

-- Création de la table associative ajouter --
CREATE TABLE ajouter (
  id_reservation INT NOT NULL,
  id_user INT NOT NULL,
  PRIMARY KEY (id_reservation, id_user),
  FOREIGN KEY (id_reservation) REFERENCES reservation(id_reservation),
  FOREIGN KEY (id_user) REFERENCES user(id_user)
) engine=INNODB;

-- Création de la table associative correspondant --
CREATE TABLE correspondant (
  id_reservation INT NOT NULL,
  id_session INT NOT NULL,
  PRIMARY KEY (id_reservation, id_session),
  FOREIGN KEY (id_reservation) REFERENCES reservation(id_reservation),
  FOREIGN KEY (id_session) REFERENCES session(id_session)
) engine=INNODB;

-- Création de la table associative appartient --
CREATE TABLE appartient (
  id_moovie INT NOT NULL,
  id_price INT NOT NULL,
  PRIMARY KEY (id_moovie, id_price),
  FOREIGN KEY (id_moovie) REFERENCES moovie(id_moovie),
  FOREIGN KEY (id_price) REFERENCES price(id_price)
) engine=INNODB;

-- Création de la table associative régir --
CREATE TABLE régir (
  id_session INT NOT NULL,
  id_admin INT NOT NULL,
  PRIMARY KEY (id_session, id_admin),
  FOREIGN KEY (id_session) REFERENCES session(id_session),
  FOREIGN KEY (id_admin) REFERENCES admin(id_admin)
) engine=INNODB;

-- Création de la table associative gérer --
CREATE TABLE gérer (
  id_cinema INT NOT NULL,
  id_admin INT NOT NULL,
  PRIMARY KEY (id_cinema, id_admin),
  FOREIGN KEY (id_cinema) REFERENCES cinema(id_cinema),
  FOREIGN KEY (id_admin) REFERENCES admin(id_admin)
) engine=INNODB;

-- FIN DE LA CREATION DES TABLES --

-- 

-- Ajout de la contrainte unique pour le ticket  --
ALTER TABLE price MODIFY numero_ticket INT UNIQUE;

-- Nombre de place par séance entre 1 et 60 maximum --
ALTER TABLE session MODIFY place INT CHECK (1>place<60)

----------------------------------------------------------------------------------------------------

-- ALIMENTATION DES DONNEES DANS LES TABLES --

-- Scripts d'alimentation factice dans la base de données via Mockaroo--

-- Alimentation de la table "moovie" -- 

INSERT INTO moovie (id_moovie,title,genre,id_session)
VALUES
(1,'The Land Unknown','Fantasy',1),
(2,'Octagon','Action',2),
(3,'Outsiders','Drama',3),
(4,'Elephant Boy','Drama'),
(5,'Cigarette Girl of Mosselprom','Comedy'),
(6,'Blood and Roses','Horror'),
(7,'Kill List','Thriller'),
(8,'Genesis','Horror'),
(9,'Saturn','Thriller'),
(10,'Shrink','Drama');

-- Alimentation de la table "cinema" --

INSERT INTO cinema (id_cinema,name,address,city)
VALUES
(1,'Polygoneciné','508 avenue Mariline','Strasbourg'),
(2,'Cinéplus','102 avenue Foch','Nimes'),
(3,'Cinédrama','212 avenue Bulbi','Lavandou');

-- Alimentation de la table "user" --
-- Utilisation de bcrypt pour hasher le mot de passe --

INSERT INTO user (id_user,first_name,last_name,role,email,password,phone,id_admin)
VALUES
(1,'Maisie','Demkowicz','customer','mdemkowicz0@twitpic.com','$2y$10$AQXldLbuI1/USj8IFYQg8OpH8Y7p0procnP8G6x0H1ftA8Xe5UiU2',6026995093),
(2,'Ruben','Jacombs','customer', 'Foreman,rjacombs1@hostgator.com','$2y$10$E0LIWpA8wGGdfkRmrSQ6sO4GLCoOwFAQc3v18lQWmq7Sbbzgt8VDG',1132211904),
(3,'Glenden','Simonitto','customer','gsimonitto2@dailymotion.com','$2y$10$KITCknBJwucshLzX8hfVXeCiv4xjZdJFCr8ZXEbF0yH0JCFV4Nu8a',5253450400),
(4,'Agneta','Tocknell','Admin','atocknell3@a8.net','$2y$10$rQT8JMFYY6OtZnr3D0tG2.QBEWCxc4YUXbkMvehaO0DDpi.7Zr8Vy',3108133180),
(5,'Byram','Chellam','Admin','bchellam4@huffingtonpost.com','$2y$10$nydsEdZmCwx65eQ5Ytz7g.bZZxJl24o6GzKvLUxC.OsfjHENYihe6',6679607207),
(6,'Hemi','Chatsou','Admin','bcchatsou84@hello.com','$2y$10$nydsEdZmCwx65eQ5Ytz7g.bZZxJl24o6GzKvLUxC.OsfjHENYihe6',6679607210,1),
(7,'Leoni','Marron','Admin','bouotcheyeu@hello.com','$2y$10$nydsEdZmCwx65eQ5Ytz7g.bZZxJl24o6GzKvLUxC.OsfjHENYihe6',6679607280,1),
(8,'Hagzen','Dasz','Admin','bccsasjuesou84@hello.com','$2y$10$nydsEdZmCwx65eQ5Ytz7g.bZZxJl24o6GzKvLUxC.OsfjHENYihe6',6679707210,1);

-- Alimentation de la table "admin" --

INSERT INTO admin (id_admin,name)
VALUES
(1,'Agneta'),
(2,'Byram'),
(3,'Hemi'),
(4,'Leoni'),
(5,'Hagzen'),
(6,'Byram');

-- Alimentation de la table "price" --

INSERT INTO price (id_price,price,description,numero_ticket,spot_paiement,online_paiement)
VALUES
(1,'5.90','moins de 14 ans',1,TRUE,TRUE),
(2,'7.60', 'etudiant',2,TRUE,TRUE),
(3,'9.20', 'plein tarif',3,TRUE,TRUE);


-- Alimentation de la table reservation --

INSERT INTO reservation (id_reservation,date)
VALUES
(1,'2022/12/10'),
(2,'2022/12/12'),
(3,'2022/12/14');

-- Alimentation de la table session --

INSERT INTO session (id_session,date,place)
VALUES
(1,'2022/12/10',1),
(2,'2022/12/10',2),
(3,'2022/12/14',1);


-- Alimentation de la table "ajouter" ( table associative entre user et réservation ) --

INSERT INTO ajouter (id_reservation, id_user) 
VALUES 
('1', '1'),
('1', '2'),
('3', '3');

-- Alimentation de la table "correspondant" ( table associative entre réservation et session ) --

INSERT INTO correspondant (id_reservation, id_session)
VALUES
('1', '1'),
('1', '2'),
('3', '3');

-- Alimentation de la table "régir" ( table associative entre admin et session ) --

INSERT INTO régir (id_session, id_admin)
VALUES
('1', '1'),
('1', '2'),
('2', '3'),
('2', '4'),
('3', '5'),
('3', '6');

-- Alimentation de la table "gérer" ( table associative entre admin et cinema ) --

INSERT INTO gérer (id_cinema, id_admin)
VALUES
('1', '1'),
('1', '2'),
('2', '3'),
('2', '4'),
('3', '5'),
('3', '6');

-- Alimentation de la table "appartient" ( table associative entre moovie et price ) --

INSERT INTO appartient (id_moovie, id_price)
SELECT id_moovie,id_price
FROM moovie,price;

----------------------------------------------------------------------------------------------------

-- UTLISATION DE GRANT PRIVILEGE POUR LES USERS --

-- Accès pour les clients du site à la table réservation --
-- Client numéro 1 --

CREATE USER `mdemkowicz0@twitpic.com` IDENTIFIED BY PASSWORD '*7FF14B291E7224C1C21E1Y134DC665BA02732C2A';
GRANT SELECT
  ON cinema.reservation
  TO `mdemkowicz0@twitpic.com`;

  -- Client numéro 2 --

CREATE USER `Foreman,rjacombs1@hostgator.com` IDENTIFIED BY PASSWORD '*6EE14F171E7334C1C21E1D134DC665BA02632B1D';
GRANT SELECT
  ON cinema.reservation
  TO `Foreman,rjacombs1@hostgator.com`;

  -- Client numéro 3 --

CREATE USER `gsimonitto2@dailymotion.com` IDENTIFIED BY PASSWORD '*7FF14B291E7224C1D38A5Y134DC775BA02732C2A';
GRANT SELECT
  ON cinema.reservation
  TO `Foreman,rjacombs1@hostgator.com`;


-- Accès complet à la base de données pour les admin, exemple pour l'admin 1 -- 

GRANT USAGE ON *.* TO `atocknell3@a8.net` IDENTIFIED BY PASSWORD '*8FF14F171E7334C1C21E1D134DC665BA02632B1D';

GRANT ALL PRIVILEGES ON `cinema`.* TO `atocknell3@a8.net`;
