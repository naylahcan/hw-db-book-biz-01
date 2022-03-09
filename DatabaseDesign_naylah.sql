/* Entities & Properties
Entity1: Book
Entity2: Author
Entity3: Editor
Entity4: Order
Entity5: Customer
Property1: number of books (written/ published/ edited/ ordered/ in a genre)
Property2: royalties
Property3: number of authors
Property4: Publisher
Property5: number of orders
Property6: genre
Property7: number of editors
Property8: name
*/

/* Primary Keys
PK1: Book
*/
USE bookindustry;

SET NAMES UTF8MB4;
SET character_set_client = UTF8MB4;

DROP TABLE bookdetails;
DROP TABLE orderdetails;
DROP TABLE authordetails;
DROP TABLE editordetails;
DROP TABLE customerdetails;

CREATE TABLE `bookdetails` (
`book_name` varchar (20) NOT NULL,
#enum('cat story', 'dog story', 'biography', 'odyssey', 'novella', 'manga', 'bird story') NOT NULL,
`publisher` enum('penguin', 'harper', 'simon') NOT NULL,
`author1` enum('Jane Doe', 'John Williams', 'Lily Curr', 'Dave Lee', 'Joe Mann', 'Ava Brown') NOT NULL,
`author2` enum('Jane Doe', 'John Williams', 'Lily Curr', 'Dave Lee', 'Joe Mann', 'Ava Brown') NULL,
`rpa1` enum('10', '15', '20') NOT NULL,
`rpa2` enum('10', '15', '20') NULL,
`editor1` enum('R. Kim', 'J. Mark', 'C. White', 'S. Penn') NOT NULL,
`editor2` enum('R. Kim', 'J. Mark', 'C. White', 'S. Penn') NULL,
`genre` enum('mystery', 'horror', 'fiction', 'nonfiction') NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orderdetails` (
`order_id` int (2) NOT NULL,
`book1o` enum('cat story', 'dog story', 'biography', 'odyssey', 'novella', 'manga', 'bird story') NOT NULL,
`book2o` enum('cat story', 'dog story', 'biography', 'odyssey', 'novella', 'manga', 'bird story') NULL,
`book3o` enum('cat story', 'dog story', 'biography', 'odyssey', 'novella', 'manga', 'bird story') NULL,
PRIMARY KEY (`order_id`),
INDEX `order_id` (`order_id` ASC)
);

CREATE TABLE `authordetails` (
`author_name` enum('Jane Doe', 'John Williams', 'Lily Curr', 'Dave Lee', 'Joe Mann', 'Ava Brown') NOT NULL,
`book1a` enum('cat story', 'dog story', 'biography', 'odyssey', 'novella', 'manga', 'bird story') NULL,
`book2a` enum('cat story', 'dog story', 'biography', 'odyssey', 'novella', 'manga', 'bird story') NULL,
PRIMARY KEY (`author_name`),
INDEX `author_name` (`author_name` ASC)
);

CREATE TABLE `editordetails` (
`editor_name` enum('R. Kim', 'J. Mark', 'C. White', 'S. Penn') NOT NULL,
`book1e` enum('cat story', 'dog story', 'biography', 'odyssey', 'novella', 'manga', 'bird story') NOT NULL,
`book2e` enum('cat story', 'dog story', 'biography', 'odyssey', 'novella', 'manga', 'bird story') NULL,
PRIMARY KEY (`editor_name`),
INDEX `editor_name` (`editor_name` ASC)
);

CREATE TABLE  `customerdetails` (
`cust_id` int (2) NOT NULL,
`order1` int (2) NOT NULL,
`order2` int (2) NULL,
`order3` int (2) NULL,
PRIMARY KEY (`cust_id`),
INDEX `cust_id` (`cust_id` ASC)
);

/**************************************************************/
/*
Inserting Values below...
*/

#for book details
INSERT INTO bookdetails (book_name, publisher, author1, author2, rpa1, rpa2, editor1, editor2, genre) 
VALUES ('cat story', 'penguin', 'Jane Doe', 'Dave Lee', '15', '15', 'R. Kim', NULL, 'mystery'),
('dog story', 'harper', 'John Williams', NULL, '10', NULL, 'J. Mark', NULL, 'horror'),
('biography', 'simon', 'Lily Curr', 'Dave Lee', '10', '20', 'J. Mark', NULL, 'nonfiction'),
('odyssey', 'simon', 'Joe Mann', 'John Williams', '15', '10', 'C. White', NULL, 'mystery'),
('novella', 'harper', 'Ava Brown', NULL, '15', NULL, 'S. Penn', NULL, 'horror'),
('manga', 'penguin', 'Jane Doe', 'Ava Brown', '15', '20', 'R. Kim', NULL, 'fiction'),
('bird story', 'simon', 'Joe Mann', NULL, '20', NULL, 'S. Penn', 'C. White', 'mystery');

#for order details
INSERT INTO orderdetails (order_id, book1o, book2o, book3o)
VALUES (1, 'cat story', 'manga', NULL),
(2, 'odyssey', 'novella', 'manga'),
(3, 'cat story', 'biography', NULL),
(4, 'manga', NULL, NULL),
(5, 'novella', 'biography', NULL),
(6, 'bird story', 'biography', NULL),
(7, 'manga', 'dog story', 'odyssey'),
(8, 'dog story', NULL, NULL);

#for author details
INSERT INTO authordetails (author_name, book1a, book2a)
VALUES ('Jane Doe', 'cat story', 'manga'),
('John Williams', 'dog story', 'odyssey'),
('Lily Curr', 'biography', NULL),
('Dave Lee', 'cat story', 'biography'),
('Joe Mann', 'odyssey', 'bird story'),
('Ava Brown', 'novella', 'manga');

#for editor details
INSERT INTO editordetails (editor_name, book1e, book2e)
VALUES ('R. Kim', 'cat story', 'manga'),
('J. Mark', 'dog story', 'biography'),
('C. White', 'odyssey', 'bird story'),
('S. Penn', 'novella', 'bird story');

#for customer details
INSERT INTO customerdetails (cust_id, order1, order2, order3)
VALUES (1, 1, NULL, NULL),
(2, 2, 5, NULL),
(3, 4, NULL, NULL),
(4, 3, 6, 8),
(5, 7, NULL, NULL);


/**************************************************************/
/* ANSWERING QUESTIONS USING MY SAMPLE DATA AND DATABASE */
/*uncomment or uncomment sections to run each query.*/

#7.1 Books per author
SELECT author_name, book1a, book2a FROM authordetails;

#7.2 Authors per book
SELECT book_name, author1, author2 FROM bookdetails;

#7.3 Author Royalties on a book
SELECT book_name, rpa1, rpa2, author1, author2 FROM bookdetails;
#rpa1 corresponds with the percentage royalties that author 1 receives.

#7.4 Book royalties per author
SELECT book_name, rpa1, rpa2, author1, author2 FROM bookdetails;
#rpa1 corresponds with the percentage royalties that author 1 receives.

#7.5 Books in a genre
SELECT book_name, genre FROM bookdetails;

#7.6 Books published by a publisher
SELECT book_name, publisher FROM bookdetails;

#7.7 Editors per book
SELECT book_name, editor1, editor2 FROM bookdetails;

#7.8 Books per editor
SELECT editor_name, book1e, book2e FROM editordetails;

#7.9 Books in an order
SELECT order_id, book1o, book2o, book3o FROM orderdetails;
#each order contails up to 3 books.

#7.10 Orders for a book
SELECT order_id FROM orderdetails WHERE book1o = 'cat story' OR book2o = 'cat story' or book3o = 'cat story';
#orders for a specific book can be checked by replacing 'cat story' with the other available books. 

#7.11 Customer orders
SELECT cust_id, order1, order2, order3 FROM customerdetails;

#7.12 Orders per customer
SELECT order1, order2, order3 FROM customerdetails WHERE cust_id = 2;
#orders by a specific customer can be checked by replacing 2 with the other customer id numbers.