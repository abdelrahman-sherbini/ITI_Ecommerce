USE shop;

-- Insert Users
INSERT INTO `user` (`name`, `email`, `password`, `phone`, `gender`, `job`, `default_address`) VALUES
('Alice Johnson', 'alice@example.com', 'hashedpassword', '1234567890', 'Female', 'Engineer', NULL),
('Bob Smith', 'bob@example.com', 'hashedpassword', '9876543210', 'Male', 'Teacher', NULL);

-- Insert Admins
INSERT INTO `admin` (`name`, `email`, `password`, `phone`) VALUES
('Admin User', 'admin@example.com', 'adminpassword', '1122334455');

-- Insert Categories
INSERT INTO `category` (`name`, `image`) VALUES
('Electronics', 'electronics.jpg'),
('Books', 'books.jpg');

-- Insert Products
INSERT INTO `product` (`name`, `description`, `price`, `quantity`, `discount`, `image`, `category_id`) VALUES
('Smartphone', 'Latest model smartphone with high-end specs.', 599.99, 50, 10, 'smartphone.jpg', 1),
('Laptop', 'Powerful laptop for professionals.', 1099.99, 30, 5, 'laptop.jpg', 1),
('Science Fiction Book', 'A popular science fiction novel.', 19.99, 100, 0, 'scifi.jpg', 2);

-- Insert User Addresses
INSERT INTO `user_address` (`user_id`, `address`, `city`, `country`, `type`, `pin_code`) VALUES
(1, '123 Elm Street', 'Cairo', 1, 'Home', '12345'),
(2, '456 Maple Avenue', 'Alexandria', 1, 'Office', '54321');

-- Insert Payments
INSERT INTO `payment` (`user_id`, `method`, `ammount`, `status`) VALUES
(1, 'Credit Card', 599.99, 'Completed'),
(2, 'PayPal', 19.99, 'Pending');

-- Insert Orders
INSERT INTO `order` (`payment_id`, `user_id`, `address`, `city`, `country`, `status`) VALUES
(1, 1, '123 Elm Street', 'Cairo', 1, 'Shipped'),
(2, 2, '456 Maple Avenue', 'Alexandria', 1, 'Processing');

-- Insert Ordered Products
INSERT INTO `ordered_product` (`product_id`, `price`, `quantity`, `order_id`) VALUES
(1, 599.99, 1, 1),
(3, 19.99, 2, 2);

-- Insert Wishlist Items
INSERT INTO `wishlist` (`user_id`, `product_id`) VALUES
(1, 2),
(2, 1);

-- Insert Cart Items
INSERT INTO `cart` (`user_id`, `product_id`, `quantity`) VALUES
(1, 3, 1),
(2, 2, 2);

