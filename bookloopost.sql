-- Eliminar tablas si existen (para pruebas)
DROP TABLE IF EXISTS wishlist CASCADE;
DROP TABLE IF EXISTS reviews CASCADE;
DROP TABLE IF EXISTS transactions CASCADE;
DROP TABLE IF EXISTS profiles CASCADE;
DROP TABLE IF EXISTS images CASCADE;
DROP TABLE IF EXISTS books CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS roles CASCADE;
DROP TABLE IF EXISTS categories CASCADE;

-- Tabla roles
CREATE TABLE roles (
  role_id SERIAL PRIMARY KEY,
  role_name VARCHAR(255) NOT NULL
);

-- Tabla users
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(255) NOT NULL UNIQUE,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  role VARCHAR(30) CHECK (role IN ('user','admin')) DEFAULT 'user',
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  activo BOOLEAN DEFAULT TRUE,
  createdAt TIMESTAMP NOT NULL,
  updatedAt TIMESTAMP NOT NULL,
  role_id INTEGER,
  
  CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES roles(role_id) ON UPDATE CASCADE ON DELETE SET NULL
);

-- Tabla categories
CREATE TABLE categories (
  category_id SERIAL PRIMARY KEY,
  category_name VARCHAR(255) NOT NULL
);

-- Tabla books
CREATE TABLE books (
  book_id SERIAL PRIMARY KEY,
  seller_id INTEGER NOT NULL,
  category_id INTEGER,
  images_id INTEGER,
  isbn_code VARCHAR(255),
  condition VARCHAR(255),
  publication_date VARCHAR(255),
  googleBooksId VARCHAR(255),
  title VARCHAR(255) NOT NULL,
  authors JSON,
  description TEXT,
  publishedDate VARCHAR(255),
  isbn VARCHAR(255),
  pageCount INTEGER,
  imageUrl VARCHAR(1000),
  coverImageUrl VARCHAR(1000),
  categories JSON,
  language VARCHAR(255),
  averageRating DOUBLE PRECISION,
  quantity INTEGER DEFAULT 1,
  available BOOLEAN DEFAULT TRUE,
  price DECIMAL(10,2) NOT NULL DEFAULT 99.99,
  createdAt TIMESTAMP NOT NULL,
  updatedAt TIMESTAMP NOT NULL,
  publisher VARCHAR(255),
  
  CONSTRAINT fk_seller FOREIGN KEY (seller_id) REFERENCES users(id) ON UPDATE CASCADE,
  CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES categories(category_id) ON UPDATE CASCADE ON DELETE SET NULL
);

-- Tabla images
CREATE TABLE images (
  image_id SERIAL PRIMARY KEY,
  book_id INTEGER NOT NULL,
  image_url TEXT NOT NULL,
  
  CONSTRAINT fk_book FOREIGN KEY (book_id) REFERENCES books(book_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabla profiles
CREATE TABLE profiles (
  id SERIAL PRIMARY KEY,
  direccion VARCHAR(255),
  telefono VARCHAR(255),
  ciudad VARCHAR(255),
  pais VARCHAR(255),
  codigoPostal VARCHAR(255),
  UserId INTEGER NOT NULL,
  createdAt TIMESTAMP NOT NULL,
  updatedAt TIMESTAMP NOT NULL,
  
  CONSTRAINT fk_user FOREIGN KEY (UserId) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabla transactions
CREATE TABLE transactions (
  transaction_id SERIAL PRIMARY KEY,
  seller_id INTEGER NOT NULL,
  buyer_id INTEGER NOT NULL,
  book_id INTEGER NOT NULL,
  transaction_date TIMESTAMP NOT NULL,
  message TEXT,
  
  CONSTRAINT fk_seller_transaction FOREIGN KEY (seller_id) REFERENCES users(id) ON UPDATE CASCADE,
  CONSTRAINT fk_buyer_transaction FOREIGN KEY (buyer_id) REFERENCES users(id) ON UPDATE CASCADE,
  CONSTRAINT fk_book_transaction FOREIGN KEY (book_id) REFERENCES books(book_id) ON UPDATE CASCADE
);

-- Tabla reviews
CREATE TABLE reviews (
  review_id SERIAL PRIMARY KEY,
  transaction_id INTEGER NOT NULL,
  buyer_id INTEGER NOT NULL,
  book_id INTEGER NOT NULL,
  experience_rate INTEGER NOT NULL,
  book_rate INTEGER NOT NULL,
  seller_rate INTEGER NOT NULL,
  comment TEXT,
  review_date TIMESTAMP NOT NULL,
  
  CONSTRAINT fk_transaction FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id) ON UPDATE CASCADE,
  CONSTRAINT fk_buyer FOREIGN KEY (buyer_id) REFERENCES users(id) ON UPDATE CASCADE,
  CONSTRAINT fk_book_review FOREIGN KEY (book_id) REFERENCES books(book_id) ON UPDATE CASCADE
);

-- Tabla wishlist
CREATE TABLE wishlist (
  wishlist_id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  book_id INTEGER NOT NULL,
  created_at TIMESTAMP,
  
  CONSTRAINT fk_user_wishlist FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE,
  CONSTRAINT fk_book_wishlist FOREIGN KEY (book_id) REFERENCES books(book_id) ON UPDATE CASCADE
);

-- Insertar datos básicos
INSERT INTO roles (role_name) VALUES 
('user'), ('admin');

-- Insertar usuarios
INSERT INTO users (username, email, password, role, nombre, apellido, activo, createdAt, updatedAt, role_id) VALUES
('katiadle', 'katiadle@gmail.com', '$2a$10$YxDsk63QzQKz5hc9CcT7OupujBwUZ5k/FV8/8o2xOQS9UeSYtaX22', 'user', 'Katja', 'Adle', TRUE, '2025-05-24 17:47:32', '2025-05-24 21:26:39', 1),
('valentinaadle', 'valentinaadle1@gmail.com', '$2a$10$uIV2s1t9OzC7x2e2yReBGuiA5f7k60gD.RAIPBh1b7.ahJXO8TXwS', 'user', 'Valentina', 'Adle', TRUE, '2025-05-27 02:06:02', '2025-05-27 02:06:02', 1),
('andresbleck', 'andres.bleckwedel2@gmail.com', '$2a$10$TyRmyHm8WaVGXzaD1eOq6uctr/x44/oXaTI1RBwf.AmPW5JFsRkDO', 'user', 'andres', 'bleck', TRUE, '2025-05-27 20:42:32', '2025-05-27 20:42:32', 1),
('adminbl', 'itsbookloop@gmail.com', '$2a$10$9.v5Pn/qnJC3WyhcdMR5Q.NlnTRRbJKk/eU3xQL3x8fIva7l9upom', 'admin', 'Admin', 'BookLoop', TRUE, '2025-06-12 20:17:24', '2025-06-12 20:17:24', 2),
('katiadle1', 'katiadle1@gmail.com', '$2a$10$TyujLnrALVX4XIKF/gJNOeY.KC/Anbw6ml76FXkmVFzfBkLv8reVi', 'user', 'Kati', 'Adle', TRUE, '2025-06-13 04:50:45', '2025-06-13 04:50:45', 1);

-- Insertar categorías
INSERT INTO categories (category_name) VALUES
('Novela'), ('Cuento'), ('Poesía'), ('Drama'), ('Ciencia ficción'),
('Fantasía'), ('Misterio'), ('Terror'), ('Romance'), ('Deportes'),
('Realistas'), ('Salud'), ('Tecnología'), ('Ciencias'), ('Escolar'),
('Filosofía');

-- Insertar libros
INSERT INTO books (book_id, seller_id, category_id, isbn_code, condition, publication_date, title, authors, description, pageCount, imageUrl, coverImageUrl, language, quantity, available, price, createdAt, updatedAt, publisher) VALUES
(16, 4, 6, '9780307474278', 'Nuevo', '2009-03-31', 'The Da Vinci Code', '["Dan Brown"]', '#1 WORLDWIDE BESTSELLER • While in Paris, Harvard symbologist Robert Langdon is awakened by a phone call in the dead of the night. The elderly curator of the Louvre has been murdered inside the museum, his body covered in baffling symbols. "Blockbuster perfection.... A gleefully erudite suspense novel." —The New York Times "A pulse-quickening, brain-teasing adventure." —People As Langdon and gifted French cryptologist Sophie Neveu sort through the bizarre riddles, they are stunned to discover a trail of clues hidden in the works of Leonardo da Vinci—clues visible for all to see and yet ingeniously disguised by the painter. Even more startling, the late curator was involved in the Priory of Sion—a secret society whose members included Sir Isaac Newton, Victor Hugo, and Da Vinci—and he guarded a breathtaking historical secret. Unless Langdon and Neveu can decipher the labyrinthine puzzle—while avoiding the faceless adversary who shadows their every move—the explosive, ancient truth will be lost forever.', 610, '/uploads/1749785064216-991042173.jpg', NULL, 'en', 1, TRUE, 3000.00, '2025-05-27 02:17:03', '2025-06-13 03:35:53', 'Planeta'),
(17, 4, 5, '9780544003415', 'Bueno', '2025-06-11', 'The Lord of the Rings', '["J. R. R. Tolkien"]', 'Presents the epic depicting the Great War of the Ring, a struggle between good and evil in Middle-earth, following the odyssey of Frodo the hobbit and his companions on a quest to destroy the Ring of Power.', 1178, '/uploads/1748312375028-452432862.png', '/uploads/1748312375028-452432862.png', 'en', 1, TRUE, 44444.00, '2025-05-27 02:19:35', '2025-06-13 04:46:24', 'Penguin'),
(20, 5, 9, '9780140283334', 'Aceptable', '1999-10-01', 'Lord of the Flies', '["William Golding"]', 'Lord of the Flies remains as provocative today as when it was first published in 1954, igniting passionate debate with its startling, brutal portrait of human nature. Though critically acclaimed, it was largely ignored upon its initial publication. Yet soon it became a cult favorite among both students and literary critics who compared it to J.D. Salinger''s The Catcher in the Rye in its influence on modern thought and literature. William Golding''s compelling story about a group of very ordinary small boys marooned on a coral island has become a modern classic. At first it seems as though it is all going to be great fun; but the fun before long becomes furious and life on the island turns into a nightmare of panic and death. As ordinary standards of behaviour collapse, the whole world the boys know collapses with them—the world of cricket and homework and adventure stories—and another world is revealed beneath, primitive and terrible. Labeled a parable, an allegory, a myth, a morality tale, a parody, a political treatise, even a vision of the apocalypse, Lord of the Flies has established itself as a true classic. "Lord of the Flies is one of my favorite books. That was a big influence on me as a teenager, I still read it every couple of years." —Suzanne Collins, author of The Hunger Games "As exciting, relevant, and thought-provoking now as it was when Golding published it in 1954." —Stephen King', 1200, '/uploads/1748378760773-817602128.jpg', NULL, 'en', 1, TRUE, 7500.00, '2025-05-27 20:46:00', '2025-06-13 03:29:18', 'Cafe'),
(21, 4, 5, '9780061122415', 'Como nuevo', '2006', 'To Kill a Mockingbird', '["Harper Lee"]', '...resumen...', 336, '/uploads/1749784002862-464954884.jpg', NULL, 'en', 1, TRUE, 6000.00, '2025-05-27 02:17:03', '2025-06-13 03:06:42', 'Harper Perennial Modern Classics'),
(23, 4, 3, '9780140449266', 'Como nuevo', '2025-06-10', 'The Odyssey', '["Homer"]', '...resumen...', 560, '/uploads/1748312375028-452432862.png', NULL, 'en', 1, TRUE, 7000.00, '2025-05-27 02:17:03', '2025-06-13 04:31:49', 'Penguin Classics'),
(29, 4, 5, '9780451524935', 'Como nuevo', '1950', '1984', '["George Orwell"]', '...resumen...', 328, '/uploads/1749784981768-750340431.jpg', '/uploads/1749784981768-750340431.jpg', 'en', 1, TRUE, 8000.00, '2025-05-27 02:17:03', '2025-06-13 04:49:10', 'Signet Classics'),
(33, 4, 5, '9780142437230', 'Aceptable', '2002', 'Moby-Dick', '["Herman Melville"]', '...resumen...', 720, '/uploads/1749785279483-551536488.webp', NULL, 'en', 1, TRUE, 8800.00, '2025-05-27 02:17:03', '2025-06-13 03:34:21', 'Penguin Classics'),
(34, 4, 7, '9780140449136', 'Aceptable', '2007', 'Crime and Punishment', '["Fyodor Dostoevsky"]', '...resumen...', 720, '/uploads/1749785171068-85007806.jpg', NULL, 'en', 1, TRUE, 7700.00, '2025-05-27 02:17:03', '2025-06-13 04:21:48', 'Penguin Classics'),
(36, 4, 9, '9780679783275', 'Como nuevo', '1999', 'Pride and Prejudice', '["Jane Austen"]', '...resumen...', 480, '/uploads/1749783334074-378473697.jpg', NULL, 'en', 1, TRUE, 6600.00, '2025-05-27 02:17:03', '2025-06-13 04:29:34', 'Vintage');

-- Insertar imágenes
INSERT INTO images (image_id, book_id, image_url) VALUES
(10, 17, '/uploads/1748312375028-452432862.png'),
(11, 17, '/uploads/1748312375046-579867956.jpg'),
(16, 20, '/uploads/1748378760745-386470253.png'),
(17, 20, '/uploads/1748378760773-817602128.jpg'),
(18, 20, '/uploads/1748378760745-386470253.png'),
(19, 23, '/uploads/1748312375028-452432862.png'),
(21, 23, '/uploads/1749784797833-437540278.jpg'),
(23, 29, '/uploads/1749784981768-750340431.jpg'),
(24, 16, '/uploads/1749785064216-991042173.jpg'),
(26, 34, '/uploads/1749785171068-85007806.jpg'),
(28, 33, '/uploads/1749785279483-551536488.webp'),
(29, 20, '/uploads/1749783380647-331037118.jpg'),
(30, 36, '/uploads/1749783334074-378473697.jpg'),
(33, 29, '/uploads/1749790143096-942280971.jpg');

-- Insertar perfiles
INSERT INTO profiles (id, UserId, createdAt, updatedAt) VALUES
(1, 2, '2025-05-24 17:47:32', '2025-05-24 17:47:32'),
(3, 4, '2025-05-27 02:06:03', '2025-05-27 02:06:03'),
(4, 5, '2025-05-27 20:42:33', '2025-05-27 20:42:33');

-- Insertar wishlist
INSERT INTO wishlist (wishlist_id, user_id, book_id, created_at) VALUES
(5, 4, 20, '2025-06-13 03:15:04'),
(6, 4, 36, '2025-06-13 03:35:16'),
(8, 4, 20, '2025-06-13 04:51:07');

-- Reiniciar las secuencias para que los nuevos inserts tengan IDs correctos
SELECT setval('categories_category_id_seq', (SELECT MAX(category_id) FROM categories));
SELECT setval('books_book_id_seq', (SELECT MAX(book_id) FROM books));
SELECT setval('images_image_id_seq', (SELECT MAX(image_id) FROM images));
SELECT setval('profiles_id_seq', (SELECT MAX(id) FROM profiles));
SELECT setval('roles_role_id_seq', (SELECT MAX(role_id) FROM roles));
SELECT setval('users_id_seq', (SELECT MAX(id) FROM users));
SELECT setval('wishlist_wishlist_id_seq', (SELECT MAX(wishlist_id) FROM wishlist));