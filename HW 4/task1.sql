DROP DATABASE IF EXISTS pet_database;
CREATE DATABASE pet_database;
USE pet_database;

DROP TABLE IF EXISTS petPet, petEvent;

CREATE TABLE petPet (
  petname VARCHAR(20) PRIMARY KEY,
  owner VARCHAR(45),
  species VARCHAR(45),
  gender CHAR(1) NOT NULL CHECK (VALUE IN ('M', 'F')),
  birth INT(6),
  death INT(6)
);
CREATE TABLE petEvent (
  petname VARCHAR(20),
  eventdate INT(6) PRIMARY KEY,
  eventtype VARCHAR(15),
  remark VARCHAR(255),
  FOREIGN KEY (petname) REFERENCES petPet(petname)
);