create database MyBankDB;
use MyBankDB;
grant all on MyBankDB.* to 'root'@'localhost' identified by 'admin';

CREATE TABLE MyBankDB.`clients` (
`clientid` int(11) NOT NULL AUTO_INCREMENT,
`firstname` varchar(45) NOT NULL DEFAULT NULL,
`lastname` varchar(45) NOT NULL DEFAULT NULL,
`birthday_date` date NOT NULL DEFAULT NULL,
`gender` varchar(45) NOT NULL DEFAULT NULL,
`passport_series` varchar(45) NOT NULL DEFAULT NULL,
`passport_number` varchar(45) NOT NULL DEFAULT NULL,
`authority` varchar(45) NOT NULL DEFAULT NULL,
`issue_date` varchar(45) NOT NULL DEFAULT NULL,
`identification_number` varchar(45) NOT NULL DEFAULT NULL,
`birthday_place` varchar(45) NOT NULL DEFAULT NULL,
`actual_residense_city` varchar(45) NOT NULL DEFAULT NULL,
`address` varchar(45) NOT NULL DEFAULT NULL,
`home_number` varchar(45) DEFAULT NULL,
`cellular_number` varchar(45) DEFAULT NULL,
`email` varchar(100) DEFAULT NULL,
`place_of_work` varchar(45) DEFAULT NULL,
`job_title` varchar(45) DEFAULT NULL,
`job_title` varchar(45) DEFAULT NULL,
PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8
