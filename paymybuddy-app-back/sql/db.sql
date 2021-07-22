DROP DATABASE IF EXISTS payBuddy;
CREATE DATABASE payBuddy;

USE payBuddy;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL UNIQUE,  
  `password` varchar(95) NOT NULL,
  `name` varchar(100) NOT NULL,
 `username` varchar(100) NOT NULL,
 `telephone` varchar(100) NOT NUll,
  PRIMARY KEY(`id`)
) ENGINE = InnoDB AUTO_INCREMENT= 1 DEFAULT CHARSET = utf8mb4;


CREATE TABLE `login` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `login_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `success` BOOLEAN DEFAULT TRUE,
   PRIMARY KEY(`id`),
 CONSTRAINT FK_LoginUser FOREIGN KEY (user_id)
    REFERENCES users(id)
) ENGINE = InnoDB AUTO_INCREMENT= 1 DEFAULT CHARSET = utf8mb4;

CREATE TABLE `account` (
     `id` int NOT NULL AUTO_INCREMENT,
     `user_id` int NOT NULL,
     `balance` DOUBLE NOT NULL,
     `bank name` varchar(100) NOT NULL,
     `back_account_number` varchar(100) NOT NULL,
      PRIMARY KEY(`id`),
 CONSTRAINT FK_UserAccount FOREIGN KEY (user_id)
    REFERENCES users(id)
)ENGINE = InnoDB AUTO_INCREMENT= 1 DEFAULT CHARSET = utf8mb4;

CREATE TABLE `transcations` (
     `id` int NOT NULL AUTO_INCREMENT,
     `amount` DOUBLE NOT NULL,
     `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
     `description` varchar(100) NOT NULL,
     `fee` DOUBLE NOT NULL,
     `receiver_user_id` int NOT NULL,
     `receiver_account_id` int NOT NULL,
     `sender_user_id` int NOT NULL,
     `sender_account_id` int NOT NULL,
     PRIMARY KEY(`id`),
    CONSTRAINT FK_UserReciever FOREIGN KEY (receiver_user_id)
    REFERENCES users(id),
    CONSTRAINT FK_UserSender FOREIGN KEY (sender_user_id)
    REFERENCES users(id),
    CONSTRAINT FK_ReceiverAccount FOREIGN KEY (receiver_account_id)
    REFERENCES account(id),
    CONSTRAINT FK_SenderAccount FOREIGN KEY (sender_account_id)
    REFERENCES account(id)
)ENGINE = InnoDB AUTO_INCREMENT= 1 DEFAULT CHARSET = utf8mb4;

CREATE TABLE `contacts` (
   `id` int NOT NULL AUTO_INCREMENT,
    `connected_user_id` int NOT NULL,
    `connectTo_user_id` int NOT NULL,
    PRIMARY KEY(`id`),
    CONSTRAINT FK_ConnectedUser FOREIGN KEY (connected_user_id)
    REFERENCES users(id),
    CONSTRAINT FK_UserToConnectTo FOREIGN KEY (connectTo_user_id)
    REFERENCES users(id)
)ENGINE = InnoDB AUTO_INCREMENT= 1 DEFAULT CHARSET = utf8mb4;