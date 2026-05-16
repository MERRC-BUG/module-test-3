

-- Tạo database
CREATE DATABASE IF NOT EXISTS ProductDB;
USE ProductDB;

-- bảng danh mục sản phẩm
CREATE TABLE Category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- bảng sản phẩm
CREATE TABLE Product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    price BIGINT NOT NULL CHECK (price > 10000000),
    quantity INT NOT NULL CHECK (quantity > 0),
    color VARCHAR(50) NOT NULL,
    description TEXT,
    category_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES Category(id) ON DELETE CASCADE
);



-- Thêm danh mục
INSERT INTO Category (name) VALUES 
('Điện thoại'),
('Laptop'),
('Tablet'),
('Phụ kiện');

-- Thêm sản phẩm
INSERT INTO Product (name, price, quantity, color, description, category_id) VALUES
('iPhone 15 Pro', 25000000, 10, 'Đen', 'Smartphone flagship Apple', 1),
('Samsung Galaxy S24', 20000000, 15, 'Xanh', 'Điện thoại Android cao cấp', 1),
('MacBook Pro M3', 45000000, 5, 'Bạc', 'Laptop chuyên dụng cho thiết kế', 2),
('iPad Air', 18000000, 8, 'Hồng', 'Máy tính bảng Apple', 3);


-- tạo index để tăng hiệu suất truy vấn

CREATE INDEX idx_product_name ON Product(name);
CREATE INDEX idx_product_category_id ON Product(category_id);
CREATE INDEX idx_product_price ON Product(price);