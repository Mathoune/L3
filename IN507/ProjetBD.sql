
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- TABLE  UTILISATEUR 
-- -----------------------------------------------------
create table  utilisateur (
   iduser  int not null,
   nom  varchar(15) not null,
   prenom  varchar(15) not null,
   pseudo  varchar(15) not null,
   passsword  varchar(45) not null,
  primary key ( iduser ));

insert into utilisateur values
	(0,'BECHET', 'Mathilde', 'Mathoune','pass');

-- -----------------------------------------------------
-- TABLE  FILM 
-- -----------------------------------------------------
create table  film  (
   idfilm  int(3) not null,
   titre  varchar(40) not null,
   realisateur  varchar(40) not null,
   duree  int(3) not null,
   dateSortie  int(4) not null,
   genre enum ('COMEDIE', 'ROMANCE', 'THRILLER', 'HORREUR', 'DIVERS', 'DRAME', 'ACTION') not null default 'DIVERS',
  primary key ( idfilm ));

insert into film (idfilm,titre,realisateur,duree,dateSortie, genre) values 

	(0,'Identité Secrète','John Singleton',106,2011,'ACTION'),
	(1,'Tron : l'' héritage','Joseph Kosinski',125,2010,'ACTION'),
	(2,'Robocop','José Padilha',113,2014, 'ACTION'),
	(3,'The Tourist', 'Florian Henckel von Donnersmark', 103,2010, 'ACTION'),
	(4,'Remenber me','Allen Coulter', 107, 2010,'DRAME'),
	(5,'August Rush', 'Kirsten Sheridan', 113, 2007,'DRAME'),
	(6, 'Brain on fire', 'Gerard Barrett', 89,2016, 'DRAME'),
	(7,'Vipere au poing','Philippe de Broca', 96,2004,'DRAME'),
	(8,'Un choix','Ross Katz', 111, 2016,'ROMANCE'),
	(9,'A tous les garçons que j''ai aimé', 'Susan Johnson', 99, 2018, 'ROMANCE'),
	(10,'Ibiza', 'Alex Richanbanch', 94, 2018, 'ROMANCE'),
	(11,'World War Z','Marc Foster', 116, 2013,'HORREUR');
	



-- -----------------------------------------------------
-- TABLE  SERIE 
-- -----------------------------------------------------
create table   serie  (
   idserie  int not null,
   titre  varchar(20) null,
   nombre_episodes int null,
   nombre_saisons  int null,
   dateSortie int not null,
   genre enum ('COMEDIE', 'ROMANCE', 'THRILLER', 'HORREUR', 'DIVERS', 'DRAME', 'ACTION') not null default 'DIVERS',
  primary key ( idserie ));

insert into serie (idserie,titre,nombre_episodes,nombre_saisons,dateSortie, genre) values 
	(100,'elite',8,1,2018,'THRILLER'),
	(101,'Altered Carbon',10,1,2018,'ACTION'),
	(102,'Freres d''armes',10,1,2001,'ACTION'),
	(103,'Mildred Pierce', 5, 1, 2011,'DRAME');

-- -----------------------------------------------------
-- TABLE  EPISODE 
-- -----------------------------------------------------
create table    episode  (
   idepisode  int not null,
   titre  varchar(30) null,
   idserie  int null,
  primary key ( idepisode ),
    foreign key ( idserie )
    references  serie  ( idserie )
    on delete cascade
    on update cascade);

insert into episode (idepisode, titre, idserie) values
	(500,'Episode 1',100),
	(501,'Episode 2',100),
	(502,'Episode 3',100),
	(503,'Episode 4',100),
	(504,'Episode 5',100),
	(505,'Episode 6',100),
	(506,'Episode 7',100),
	(507,'Episode 8',100),
	(508,'La griffe du passé',101),
	(509,'Crime Passionnel',101),
	(510,'Le violent',101),
	(511,'L''enfer de la corruption',101),
	(512,'Le faux coupable',101),
	(513,'Man with my face',101),
	(514,'Chien enragé',101),
	(515,'Le démon s''eveille la nuit',101),
	(516,'La proie du mort',101),
	(517,'Les tueurs',101),
	(518,'Currahee',102),
	(519,'Jour J',102),
	(520,'Carentan',102),
	(521,'Les remplaçants',102),
	(522,'La croisée des chemins',102),
	(523,'Bastogne',102),
	(524,'Point de rupture',102),
	(525,'La derniere patrouille',102),
	(526,'Pourquoi nous combattons',102),
	(527,'Des hommes avant tout',102),
	(528,'Episode 1',103),
	(529,'Episode 2',103),
	(530,'Episode 3',103),
	(531,'Episode 4',103),
	(532,'Episode 5',103);

-- -----------------------------------------------------
-- TABLE  COMPOSE
-- -----------------------------------------------------
create table compose (
	foreign key ( idserie )
    references  serie  ( idserie )
    on delete cascade
    on update cascade,
foreign key ( idepisode )
    references  episode  ( idepisode)
    on delete cascade
    on update cascade);


-- -----------------------------------------------------
-- TABLE  ACTEUR 
-- -----------------------------------------------------
create table    acteur  (
   idacteur  int not null,
   nom  varchar(15) null,
   prenom  varchar(15) null,
   age  int null,
  primary key ( idacteur ));


-- -----------------------------------------------------
-- TABLE  NOTE_EPISODE 
-- -----------------------------------------------------
create table    note_episode  (
   iduser  int not null,
   idepisode  int not null,
   dejavu  tinyint null,
   note  int null,
   commentaire  varchar(60) null,	
  primary key ( iduser ,  idepisode ),
    foreign key ( iduser )
    references  utilisateur  ( iduser )
    on delete cascade
    on update cascade,
    foreign key ( idepisode )
    references  episode  ( idepisode )
    on delete cascade
    on update cascade);


-- -----------------------------------------------------
-- TABLE  NOTE_FILM 
-- -----------------------------------------------------
create table    note_film  (
   iduser  int not null,
   idfilm  int not null,
   dejavu  tinyint null,
   note  int null,
   commentaire  varchar(60) null,
    foreign key ( idfilm )
    references  film  ( idfilm )
    on delete cascade
    on update cascade,
    foreign key ( iduser )
    references  utilisateur  ( iduser )
    on delete cascade
    on update cascade);


-- -----------------------------------------------------
-- TABLE  NOTE_SERIE 
-- -----------------------------------------------------
create table    note_serie  (
   iduser  int not null,
   idserie  int not null,
   dejavu  tinyint null,
   note  int null,
    foreign key ( iduser )
    references  utilisateur  ( iduser )
    on delete cascade
    on update cascade,
    foreign key ( idserie )
    references  serie  ( idserie )
    on delete cascade
    on update cascade);


-- -----------------------------------------------------
-- TABLE  PARTICIPE_FILM 
-- -----------------------------------------------------
create table    participe_film  (
   idfilm  int not null,
   idacteur  int not null,
    foreign key ( idacteur )
    references  acteur  ( idacteur )
    on delete cascade
    on update cascade,
    foreign key ( idfilm )
    references  film  ( idfilm )
    on delete cascade
    on update cascade);


-- -----------------------------------------------------
-- TABLE  PARTICIPE_EP 
-- -----------------------------------------------------
create table    participe_ep  (
   idserie  int not null,
   idacteur  int not null,
    foreign key ( idserie )
    references  serie  ( idserie )
    on delete cascade
    on update cascade,
    foreign key ( idacteur )
    references  acteur  ( idacteur )
    on delete cascade
    on update cascade);

--------------------------------------------------------
-- VIEW
--------------------------------------------------------

CREATE VIEW [Romance] AS
SELECT S.titre, F.titre
FROM SERIE S, FILM F,
WHERE S.genre='ROMANCE';
	  F.genre='ROMANCE';

-- Vues : Liste de episode par serie ?
-- FILM + SERIE par genre ?

set sql_mode=@old_sql_mode;
set foreign_key_checks=@old_foreign_key_checks;
set unique_checks=@old_unique_checks;
