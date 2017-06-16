CREATE DATABASE `moviedb` /*!40100 DEFAULT CHARACTER SET utf8 */;

use moviedb;

CREATE TABLE `movie` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Duration` int(10) NOT NULL,
  `Release_day` int(10) NOT NULL,
  `Release_month` int(10) NOT NULL,
  `Release_year` int(10) NOT NULL,
  `Rating` float NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Poster` varchar(255) DEFAULT NULL,
  `Genre` varchar(255) DEFAULT NULL,
  `Synopsys` varchar(255) DEFAULT NULL,
  `Box_office` float NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `staff` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Role` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Bio` varchar(255) DEFAULT NULL,
  `Picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Username` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Avatar` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `review` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `MovieId` int(10) NOT NULL,
  `UserId` int(10) NOT NULL,
  `Review` varchar(255) DEFAULT NULL,
  `Sound_grade` int(10) NOT NULL,
  `Story_grade` int(10) NOT NULL,
  `Direction_grade` int(10) NOT NULL,
  `Enjoyment_grade` int(10) NOT NULL,
  `Overall_grade` int(10) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `reviews` (`UserId`),
  KEY `has` (`MovieId`),
  CONSTRAINT `has` FOREIGN KEY (`MovieId`) REFERENCES `movie` (`Id`),
  CONSTRAINT `reviews` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `movie_staff` (
  `MovieId` int(10) NOT NULL,
  `StaffId` int(10) NOT NULL,
  PRIMARY KEY (`MovieId`,`StaffId`),
  KEY `works` (`MovieId`),
  KEY `works2` (`StaffId`),
  CONSTRAINT `works` FOREIGN KEY (`MovieId`) REFERENCES `movie` (`Id`),
  CONSTRAINT `works2` FOREIGN KEY (`StaffId`) REFERENCES `staff` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_movie` (
  `UserId` int(10) NOT NULL,
  `MovieId` int(10) NOT NULL,
  PRIMARY KEY (`UserId`,`MovieId`),
  KEY `seen` (`UserId`),
  KEY `seen2` (`MovieId`),
  CONSTRAINT `seen` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`),
  CONSTRAINT `seen2` FOREIGN KEY (`MovieId`) REFERENCES `movie` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_movie2` (
  `UserId` int(10) NOT NULL,
  `MovieId` int(10) NOT NULL,
  PRIMARY KEY (`UserId`,`MovieId`),
  KEY `plan_to_watch` (`UserId`),
  KEY `plan_to_watch2` (`MovieId`),
  CONSTRAINT `plan_to_watch` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`),
  CONSTRAINT `plan_to_watch2` FOREIGN KEY (`MovieId`) REFERENCES `movie` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_movie3` (
  `UserId` int(10) NOT NULL,
  `MovieId` int(10) NOT NULL,
  PRIMARY KEY (`UserId`,`MovieId`),
  KEY `evaluates` (`UserId`),
  KEY `evaluates2` (`MovieId`),
  CONSTRAINT `evaluates` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`),
  CONSTRAINT `evaluates2` FOREIGN KEY (`MovieId`) REFERENCES `movie` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;