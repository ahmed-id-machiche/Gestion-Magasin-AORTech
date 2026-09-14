CREATE DATABASE IF NOT EXISTS magasin_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE magasin_db;

CREATE TABLE IF NOT EXISTS categories (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL UNIQUE,
  description VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS suppliers (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(120) NOT NULL,
  phone VARCHAR(30),
  email VARCHAR(120),
  address VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS customers (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  firstName VARCHAR(80) NOT NULL,
  lastName VARCHAR(80) NOT NULL,
  phone VARCHAR(30),
  email VARCHAR(120) NOT NULL,
  password VARCHAR(255),
  address VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS users (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  fullname VARCHAR(120) NOT NULL,
  role VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS products (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(150) NOT NULL,
  reference VARCHAR(80) NOT NULL UNIQUE,
  description VARCHAR(500),
  imageUrl VARCHAR(500),
  purchasePrice DECIMAL(12,2) NOT NULL,
  salePrice DECIMAL(12,2) NOT NULL,
  quantity INT NOT NULL,
  minStock INT NOT NULL,
  createdAt DATETIME NOT NULL,
  category_id BIGINT NOT NULL,
  supplier_id BIGINT NOT NULL,
  FOREIGN KEY (category_id) REFERENCES categories(id),
  FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);

CREATE TABLE IF NOT EXISTS sales (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  saleDate DATETIME NOT NULL,
  totalAmount DECIMAL(12,2) NOT NULL,
  customer_id BIGINT NULL,
  user_id BIGINT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS sale_items (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  quantity INT NOT NULL,
  unitPrice DECIMAL(12,2) NOT NULL,
  subtotal DECIMAL(12,2) NOT NULL,
  sale_id BIGINT NOT NULL,
  product_id BIGINT NOT NULL,
  FOREIGN KEY (sale_id) REFERENCES sales(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE IF NOT EXISTS stock_movements (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  type VARCHAR(20) NOT NULL,
  quantity INT NOT NULL,
  movementDate DATETIME NOT NULL,
  product_id BIGINT NOT NULL,
  note VARCHAR(255),
  FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE IF NOT EXISTS support_messages (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  fullName VARCHAR(120) NOT NULL,
  email VARCHAR(120) NOT NULL,
  message VARCHAR(1000) NOT NULL,
  createdAt DATETIME NOT NULL
);

CREATE TABLE IF NOT EXISTS offers (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(150) NOT NULL,
  description VARCHAR(500),
  discountPercent DECIMAL(5,2),
  imageUrl VARCHAR(500),
  startDate DATE NULL,
  endDate DATE NULL,
  active BIT NOT NULL DEFAULT 1
);

INSERT INTO categories(name, description) VALUES
('Informatique', 'Produits informatiques'),
('Bureautique', 'Fournitures de bureau'),
('PC Portable', 'Ordinateurs portables et accessoires'),
('PC Bureau', 'Unites centrales et ecrans'),
('Telephone', 'Smartphones et telephones'),
('Television', 'TV LED, OLED et Smart TV'),
('Tablette', 'Tablettes Android et iOS'),
('Gaming', 'Consoles, manettes et jeux'),
('Audio', 'Casques, ecouteurs, enceintes'),
('Electromenager', 'Produits menagers et cuisine'),
('Maison Connectee', 'Objets connectes et domotique'),
('Camera', 'Cameras de securite et photo')
ON DUPLICATE KEY UPDATE name = VALUES(name);

INSERT INTO suppliers(name, phone, email, address) VALUES
('Tech Supplier', '0600000001', 'tech@supplier.com', 'Paris'),
('Office Pro', '0600000002', 'office@supplier.com', 'Lyon');

INSERT INTO customers(firstName, lastName, phone, email, address) VALUES
('Ali', 'Benali', '0611111111', 'ali@email.com', 'Casablanca'),
('Sara', 'Amrani', '0622222222', 'sara@email.com', 'Rabat')
ON DUPLICATE KEY UPDATE firstName = VALUES(firstName), lastName = VALUES(lastName), phone = VALUES(phone), address = VALUES(address);

INSERT INTO users(username, password, fullname, role)
VALUES ('admin', SHA2('admin123', 256), 'Administrateur', 'ADMIN')
ON DUPLICATE KEY UPDATE username = VALUES(username);

INSERT INTO products(name, reference, description, imageUrl, purchasePrice, salePrice, quantity, minStock, createdAt, category_id, supplier_id)
VALUES
('Souris USB', 'PRD-001', 'Souris optique ergonomique', 'https://images.unsplash.com/photo-1615663245857-ac93bb7c39e7?auto=format&fit=crop&w=800&q=80', 40.00, 70.00, 50, 10, NOW(), 1, 1),
('Clavier', 'PRD-002', 'Clavier AZERTY Mecanique RGB', 'https://images.unsplash.com/photo-1587829741301-dc798b83add3?auto=format&fit=crop&w=800&q=80', 80.00, 120.00, 30, 8, NOW(), 1, 1)
ON DUPLICATE KEY UPDATE name = VALUES(name), imageUrl = VALUES(imageUrl);

INSERT INTO products(name, reference, description, imageUrl, purchasePrice, salePrice, quantity, minStock, createdAt, category_id, supplier_id)
SELECT 'Smart TV 55\"', 'TV-001', 'Television 4K Smart', 'https://images.unsplash.com/photo-1593784991095-a205069470b6?auto=format&fit=crop&w=800&q=80', 3200.00, 3999.00, 20, 3, NOW(), c.id, 1
FROM categories c WHERE c.name = 'Television'
ON DUPLICATE KEY UPDATE name = VALUES(name), category_id = VALUES(category_id), imageUrl = VALUES(imageUrl);

INSERT INTO products(name, reference, description, imageUrl, purchasePrice, salePrice, quantity, minStock, createdAt, category_id, supplier_id)
SELECT 'iPhone 15', 'TEL-001', 'Telephone haut de gamme', 'https://images.unsplash.com/photo-1695048133142-1a20484d2569?auto=format&fit=crop&w=800&q=80', 8200.00, 9499.00, 15, 3, NOW(), c.id, 1
FROM categories c WHERE c.name = 'Telephone'
ON DUPLICATE KEY UPDATE name = VALUES(name), category_id = VALUES(category_id), imageUrl = VALUES(imageUrl);

INSERT INTO products(name, reference, description, imageUrl, purchasePrice, salePrice, quantity, minStock, createdAt, category_id, supplier_id)
SELECT 'PC Portable Pro', 'PCP-001', 'Laptop i7 16Go RAM', 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=800&q=80', 6800.00, 7999.00, 18, 4, NOW(), c.id, 1
FROM categories c WHERE c.name = 'PC Portable'
ON DUPLICATE KEY UPDATE name = VALUES(name), category_id = VALUES(category_id), imageUrl = VALUES(imageUrl);

INSERT INTO products(name, reference, description, imageUrl, purchasePrice, salePrice, quantity, minStock, createdAt, category_id, supplier_id)
SELECT 'PlayStation 5', 'GAM-001', 'Console nouvelle generation', 'https://images.unsplash.com/photo-1606813907291-d86efa9b94db?auto=format&fit=crop&w=800&q=80', 5100.00, 5999.00, 12, 3, NOW(), c.id, 1
FROM categories c WHERE c.name = 'Gaming'
ON DUPLICATE KEY UPDATE name = VALUES(name), category_id = VALUES(category_id), imageUrl = VALUES(imageUrl);

INSERT INTO offers(title, description, discountPercent, imageUrl, startDate, endDate, active) VALUES
('Offre PC Gamer', 'Reduction exceptionnelle sur les PC gamer', 25.00, 'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?auto=format&fit=crop&w=800&q=80', CURDATE(), DATE_ADD(CURDATE(), INTERVAL 20 DAY), 1),
('Promo Smartphones', 'Jusqu a -30% sur une selection de telephones', 30.00, 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?auto=format&fit=crop&w=800&q=80', CURDATE(), DATE_ADD(CURDATE(), INTERVAL 15 DAY), 1),
('Mega Deal TV', 'Offres folles sur les televisions 4K', 18.00, 'https://images.unsplash.com/photo-1593784991095-a205069470b6?auto=format&fit=crop&w=800&q=80', CURDATE(), DATE_ADD(CURDATE(), INTERVAL 10 DAY), 1);

