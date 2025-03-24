CREATE DATABASE shop;
USE shop;

-- Admin Table
CREATE TABLE admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(50),
    phone VARCHAR(20)
);

-- Category Table
CREATE TABLE category (
    cid INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    image VARCHAR(100)
);

-- User Table
CREATE TABLE user (
    userid INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(45) UNIQUE,
    password VARCHAR(45),
    phone VARCHAR(20),
    gender VARCHAR(20),
    registerdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    address VARCHAR(250),
    city VARCHAR(100),
    pincode VARCHAR(10),
    state VARCHAR(100)
);

-- Product Table
CREATE TABLE product (
    pid INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(250),
    description VARCHAR(500),
    price VARCHAR(20),
    quantity INT,
    discount INT,
    image VARCHAR(100),
    cid INT,
    FOREIGN KEY (cid) REFERENCES category(cid) ON DELETE CASCADE
);

-- Cart Table
CREATE TABLE cart (
    id INT AUTO_INCREMENT PRIMARY KEY,
    uid INT,
    pid INT,
    quantity INT,
    FOREIGN KEY (uid) REFERENCES user(userid) ON DELETE CASCADE,
    FOREIGN KEY (pid) REFERENCES product(pid) ON DELETE CASCADE
);

-- Wishlist Table
CREATE TABLE wishlist (
    idwishlist INT AUTO_INCREMENT PRIMARY KEY,
    iduser INT,
    idproduct INT,
    FOREIGN KEY (iduser) REFERENCES user(userid) ON DELETE CASCADE,
    FOREIGN KEY (idproduct) REFERENCES product(pid) ON DELETE CASCADE
);

-- Order Table
CREATE TABLE `order` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    orderid VARCHAR(100) UNIQUE,
    status VARCHAR(100),
    paymentType VARCHAR(100),
    userId INT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userId) REFERENCES user(userid) ON DELETE CASCADE
);

-- Ordered Product Table
CREATE TABLE ordered_product (
    oid INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    quantity INT,
    price VARCHAR(45),
    image VARCHAR(100),
    orderid INT,
    FOREIGN KEY (orderid) REFERENCES `order`(id) ON DELETE CASCADE
);
