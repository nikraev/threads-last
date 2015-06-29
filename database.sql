CREATE DATABASE IF NOT EXISTS myapp CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL PRIVILEGES ON myapp.* TO nkraev@localhost IDENTIFIED BY 'nkraev';

USE myapp;

CREATE TABLE users(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name CHAR(10) NULL,
description CHAR(10) NULL,
email CHAR(30) NULL 
)ENGINE=InnoDB;

ALTER TABLE users ADD COLUMN phone int null;
ALTER TABLE users ADD COLUMN address char(100) null;

