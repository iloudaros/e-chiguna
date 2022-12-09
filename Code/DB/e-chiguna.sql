CREATE TABLE `User` (
  `username` varchar(255) PRIMARY KEY,
  `password` varchar(255),
  `email` varchar(255),
  `is_manager` bit DEFAULT 0,
  `score` integer DEFAULT 0,
  `balance` integer DEFAULT 0
);

CREATE TABLE `Store` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
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
  `availability` integer
);

CREATE TABLE `Price` (
  `product_id` integer,
  `store_id` integer,
  `date` date,
  `price` integer
);

CREATE TABLE `Cart` (
  `username` varchar(255) PRIMARY KEY,
  `product_id` integer,
  `quantity` integer
);

CREATE TABLE `Score_History` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(255),
  `current_score` integer,
  `total_score` integer,
  `date` date
);

CREATE TABLE `Token_History` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(255),
  `tokens_given` integer,
  `total_tokens` integer,
  `date` date
);

ALTER TABLE `User` COMMENT = 'The table where user information and their role is stored';

ALTER TABLE `Discount` ADD FOREIGN KEY (`username`) REFERENCES `User` (`username`);

ALTER TABLE `Discount` ADD FOREIGN KEY (`product`) REFERENCES `Product` (`id`);

ALTER TABLE `Reaction` ADD FOREIGN KEY (`username`) REFERENCES `User` (`username`);

ALTER TABLE `Reaction` ADD FOREIGN KEY (`discount`) REFERENCES `Discount` (`id`);

ALTER TABLE `Products_in_Store` ADD FOREIGN KEY (`store_id`) REFERENCES `Store` (`id`);

ALTER TABLE `Products_in_Store` ADD FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`);

ALTER TABLE `Price` ADD FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`);

ALTER TABLE `Price` ADD FOREIGN KEY (`store_id`) REFERENCES `Store` (`id`);

ALTER TABLE `Cart` ADD FOREIGN KEY (`username`) REFERENCES `User` (`username`);

ALTER TABLE `Cart` ADD FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`);

ALTER TABLE `Score_History` ADD FOREIGN KEY (`username`) REFERENCES `User` (`username`);

ALTER TABLE `Token_History` ADD FOREIGN KEY (`username`) REFERENCES `User` (`username`);
