DROP DATABASE IF EXISTS `e-chiguna`;
CREATE DATABASE `e-chiguna`;
USE `e-chiguna`;

CREATE TABLE `User` (
  `username` varchar(255) PRIMARY KEY,
  `password` varchar(255),
  `email` varchar(255),
  `is_manager` bit DEFAULT 0,
  `score` integer DEFAULT 0,
  `balance` integer DEFAULT 0
);

CREATE TABLE `Store` (
  `id` integer PRIMARY KEY,
  `name` varchar(255),
  `address` varchar(255),
  `longtitude` float,
  `latitude` float
);

CREATE TABLE `Discount` (
  `id` integer PRIMARY KEY,
  `username` varchar(255),
  `product` integer,
  `price` float,
  `date` date
);

CREATE TABLE `Reaction` (
  `username` varchar(255) PRIMARY KEY,
  `discount` integer,
  `liked` bit DEFAULT 0,
  `disliked` bit DEFAULT 0,
  `date` date
);

CREATE TABLE `Product` (
  `id` integer PRIMARY KEY,
  `name` varchar(255),
  `category` varchar(255),
  `subcategory` varchar(255)
);

CREATE TABLE `Products_in_Store` (
  `store_id` integer,
  `product_id` integer,
  `availability` integer,
  PRIMARY KEY (`store_id`, `product_id`)
);

CREATE TABLE `Price` (
  `product_id` integer,
  `store_id` integer,
  `date` date,
  `price` integer,
  PRIMARY KEY (`product_id`, `store_id`, `date`)
);

CREATE TABLE `Score_History` (
  `id` integer PRIMARY KEY,
  `username` varchar(255),
  `current_score` integer COMMENT 'This is the score of the month stated in the field "date".',
  `total_score` integer COMMENT 'This is the sum of the score of all of the previous months, before the month stated at the field "date".',
  `date` date
);

CREATE TABLE `Token_History` (
  `id` integer PRIMARY KEY,
  `username` varchar(255),
  `tokens_given` integer COMMENT 'These are the tokens given to the user (stated in "username") for the month stated in the field "date".',
  `total_tokens` integer COMMENT 'This is the token total of the user (stated in "username") up to the previous month of the one stated in the field "date".',
  `date` date
);

ALTER TABLE `User` COMMENT = 'The table where user information and their role is stored.';

ALTER TABLE `Store` COMMENT = 'every entry in this table represents a Store.';

ALTER TABLE `Discount` COMMENT = 'Here we store the discounts that the users submit to e-chiguna.';

ALTER TABLE `Reaction` COMMENT = 'Here we store the reaction of the users to a specific discount.';

ALTER TABLE `Product` COMMENT = 'Here we store all the products that we know. For products of a single store, check the table "Products_in_Store".';

ALTER TABLE `Products_in_Store` COMMENT = 'This table contains the products available in each store.';

ALTER TABLE `Price` COMMENT = 'This table contains the prices that are submitted from the administrator.';

ALTER TABLE `Score_History` COMMENT = 'This table keeps a record of the score of each user.';

ALTER TABLE `Token_History` COMMENT = 'This table keeps a record of the tokens of each user.';

ALTER TABLE `Discount` ADD FOREIGN KEY (`username`) REFERENCES `User` (`username`);

ALTER TABLE `Discount` ADD FOREIGN KEY (`product`) REFERENCES `Product` (`id`);

ALTER TABLE `Reaction` ADD FOREIGN KEY (`username`) REFERENCES `User` (`username`);

ALTER TABLE `Reaction` ADD FOREIGN KEY (`discount`) REFERENCES `Discount` (`id`);

ALTER TABLE `Products_in_Store` ADD FOREIGN KEY (`store_id`) REFERENCES `Store` (`id`);

ALTER TABLE `Products_in_Store` ADD FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`);

ALTER TABLE `Price` ADD FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`);

ALTER TABLE `Price` ADD FOREIGN KEY (`store_id`) REFERENCES `Store` (`id`);

ALTER TABLE `Score_History` ADD FOREIGN KEY (`username`) REFERENCES `User` (`username`);

ALTER TABLE `Token_History` ADD FOREIGN KEY (`username`) REFERENCES `User` (`username`);
