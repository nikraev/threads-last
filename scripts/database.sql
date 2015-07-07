drop database myapp;

CREATE DATABASE IF NOT EXISTS myapp CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL PRIVILEGES ON myapp.* TO nkraev@localhost IDENTIFIED BY 'nkraev';

USE myapp;

CREATE TABLE IF NOT EXISTS users(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name CHAR(10) NULL,
description CHAR(10) NULL,
email CHAR(30) NULL,
phone char(10) null,
address char(10) null
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS tweets(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
forum CHAR(40) NULL,
message CHAR(40) NULL,
userid INT NOT NULL,
FOREIGN KEY(userid) REFERENCES users(id) ON DELETE CASCADE
)ENGINE=InnoDB;

