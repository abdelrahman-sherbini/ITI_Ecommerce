CREATE DATABASE shop;
USE shop;

CREATE TABLE `wishlist`(
    `wishlist_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `product_id` BIGINT UNSIGNED NOT NULL
);
ALTER TABLE
    `wishlist` ADD INDEX `wishlist_user_id_index`(`user_id`);
CREATE TABLE `order`(
    `order_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `payment_id` BIGINT UNSIGNED NOT NULL,
    `user_id` BIGINT UNSIGNED NULL,
	`address` VARCHAR(255) NOT NULL,
    `city` VARCHAR(255) NOT NULL,
    `country` BIGINT NOT NULL,
    `status` VARCHAR(100) NOT NULL,
    `date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP());
ALTER TABLE
    `order` ADD INDEX `order_user_id_index`(`user_id`);
ALTER TABLE
    `order` ADD INDEX `order_status_index`(`status`);
CREATE TABLE `ordered_product`(
    `order_product_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `product_id` BIGINT UNSIGNED NOT NULL,
    `price` BIGINT UNSIGNED NOT NULL,
    `quantity` INT UNSIGNED NOT NULL,
    `order_id` BIGINT UNSIGNED NOT NULL
);
ALTER TABLE
    `ordered_product` ADD INDEX `ordered_product_order_id_index`(`order_id`);
CREATE TABLE `cart`(
    `cart_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT UNSIGNED NULL,
    `product_id` BIGINT UNSIGNED NULL,
    `quantity` INT UNSIGNED NULL
);
ALTER TABLE
    `cart` ADD INDEX `cart_user_id_index`(`user_id`);
CREATE TABLE `category`(
    `category_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `image` VARCHAR(100) NULL
);
CREATE TABLE `product`(
    `product_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(250) NOT NULL,
    `description` VARCHAR(500) NULL,
    `price` FLOAT(53) NOT NULL,
    `quantity` INT UNSIGNED NOT NULL DEFAULT '0',
    `discount` INT NOT NULL DEFAULT '0',
    `image` VARCHAR(100) NULL,
    `category_id` BIGINT UNSIGNED NULL
);
ALTER TABLE
    `product` ADD INDEX `product_category_id_index`(`category_id`);
CREATE TABLE `payment`(
    `payment_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `method` VARCHAR(255) NOT NULL,
    `amount` FLOAT(53) NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `payment` ADD INDEX `payment_user_id_index`(`user_id`);
CREATE TABLE `user_address`(
    `address_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT UNSIGNED NOT NULL,
	`address` VARCHAR(255) NOT NULL,
    `governorate` VARCHAR(255) NOT NULL,
    `city` VARCHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `pin_code` VARCHAR(255) NULL
);
ALTER TABLE
    `user_address` ADD INDEX `user_address_user_id_index`(`user_id`);
CREATE TABLE `user`(
    `user_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(100) NOT NULL,
    `last_name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(45) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(20) NOT NULL,
    `gender` VARCHAR(255) NULL,
    `register_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `job` VARCHAR(100) NULL,
    `credit` FLOAT(53) NOT NULL,
    `default_address` BIGINT UNSIGNED  NULL,
    `dob` DATE NULL
    );
ALTER TABLE
    `user` ADD INDEX `user_email_index`(`email`);
ALTER TABLE
    `user` ADD INDEX `user_phone_index`(`phone`);
ALTER TABLE
    `user` ADD UNIQUE `user_email_unique`(`email`);
ALTER TABLE
    `user` ADD UNIQUE `user_phone_unique`(`phone`);
CREATE TABLE `admin`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `password` VARCHAR(50) NOT NULL,
    `phone` VARCHAR(20) NULL
);
ALTER TABLE
    `admin` ADD INDEX `admin_email_index`(`email`);
ALTER TABLE
    `admin` ADD UNIQUE `admin_email_unique`(`email`);
ALTER TABLE
    `ordered_product` ADD CONSTRAINT `ordered_product_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `product`(`product_id`)  ;
ALTER TABLE
    `wishlist` ADD CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `product`(`product_id`)  ON DELETE CASCADE;
ALTER TABLE
    `cart` ADD CONSTRAINT `cart_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `product`(`product_id`)  ON DELETE CASCADE;
ALTER TABLE
    `order` ADD CONSTRAINT `order_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`user_id`);
ALTER TABLE
    `ordered_product` ADD CONSTRAINT `ordered_product_order_id_foreign` FOREIGN KEY(`order_id`) REFERENCES `order`(`order_id`);
ALTER TABLE
    `wishlist` ADD CONSTRAINT `wishlist_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`user_id`);
ALTER TABLE
    `order` ADD CONSTRAINT `order_payment_id_foreign` FOREIGN KEY(`payment_id`) REFERENCES `payment`(`payment_id`);
ALTER TABLE
    `user_address` ADD CONSTRAINT `user_address_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`user_id`) ON DELETE CASCADE;
ALTER TABLE
    `cart` ADD CONSTRAINT `cart_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`user_id`);
ALTER TABLE
    `product` ADD CONSTRAINT `product_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `category`(`category_id`);
ALTER TABLE
    `payment` ADD CONSTRAINT `payment_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`user_id`);
ALTER TABLE `user` 
ADD CONSTRAINT `user_default_address_fk` 
FOREIGN KEY (`default_address`) REFERENCES `user_address`(`address_id`) 
ON DELETE SET NULL;