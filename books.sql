CREATE DATABASE Librarys;
USE Librarys;

CREATE TABLE Books (
   Books_Id INT PRIMARY KEY,
   Name VARCHAR(255) NOT NULL,
   Author VARCHAR(255) NOT NULL,
   PublishYear INT,
   Category VARCHAR(255) NOT NULL
);

CREATE TABLE Students (
   Students_Id INT PRIMARY KEY,
   Name VARCHAR(255) NOT NULL
);

CREATE TABLE Borrowing (
   Borrow_Id INT PRIMARY KEY,
   Borrow_Date DATE, 
   Return_Date DATE NULL,
   StudentsId INT,
   BookId INT,
   FOREIGN KEY (StudentsId) REFERENCES Students(Students_Id),
   FOREIGN KEY (BookId) REFERENCES Books(Books_Id)
);

INSERT INTO Books (Books_Id, Name, Author, PublishYear, Category) VALUES
(1, 'Artificial Intelligence: A Guide for Thinking Humans', 'Melanie Mitchell', 2021, 'Bilgisayar Bilimleri'),
(2, 'Deep Learning for Coders with Fastai and PyTorch', 'Jeremy Howard, Sylvain Gugger', 2020, 'Bilgisayar Bilimleri'),
(3, 'The Age of AI: And Our Human Future', 'Henry Kissinger, Eric Schmidt, Daniel Huttenlocher', 2021, 'Bilgisayar Bilimleri'),
(4, 'Machine Learning Design Patterns', 'Valliappa Lakshmanan, Sara Robinson, Michael Munn', 2020, 'Bilgisayar Bilimleri'),
(5, 'Programming Rust', 'Jim Blandy, Jason Orendorff, Leonora F.S. Tindall', 2021, 'Bilgisayar Bilimleri'),
(6, 'Pattern Recognition and Machine Learning', 'Christopher M. Bishop', 2006, 'Makine Bilimleri'),
(7, 'Introduction to the Theory of Computation', 'Michael Sipser', 2010, 'Yazýlým Bilimleri'),
(8, 'The Pragmatic Programmer: Your Journey to Mastery', 'Andrew Hunt, David Thomas', 2019, 'Bilgisayar Bilimleri'),
(9, 'Algorithms', 'Robert Sedgewick, Kevin Wayne', 2020, 'Derin Öðrenme'),
(10, 'Hands-On Machine Learning with Scikit-Learn, Keras, and TensorFlow', 'Aurélien Géron', 2023, 'Bilgisayar Bilimleri');

INSERT INTO Students (Students_Id, Name) VALUES
(1, 'Helin Zengin'),
(2, 'Sueda Özkiliç'),
(3, 'Kadriye Baylav');

INSERT INTO Borrowing (Borrow_Id, BookId, StudentsId, Borrow_Date, Return_Date) VALUES
(1, 1, 1, '2025-03-15', '2025-06-01'),
(2, 3, 3, '2025-12-05', '2026-01-05'),
(3, 6, 2, '2025-05-20', NULL);

SELECT * FROM Books;

SELECT * FROM Books WHERE Category = 'Bilgisayar Bilimleri';

SELECT * FROM Books WHERE PublishYear >= 2020;

SELECT Name, Category FROM Books;

SELECT Name, Author, PublishYear FROM Books;

SELECT s.Name AS Student_Name, b.Name AS Book_Name 
FROM Borrowing br
JOIN Students s ON br.StudentsId = s.Students_Id
JOIN Books b ON br.BookId = b.Books_Id;

SELECT s.Name AS Student_Name, b.Name AS Book_Name, br.Borrow_Date 
FROM Borrowing br
JOIN Students s ON br.StudentsId = s.Students_Id
JOIN Books b ON br.BookId = b.Books_Id;

SELECT s.Name AS Student_Name, b.Name AS Book_Name, br.Borrow_Date 
FROM Borrowing br
JOIN Students s ON br.StudentsId = s.Students_Id
JOIN Books b ON br.BookId = b.Books_Id
WHERE br.Return_Date IS NULL;

SELECT Category, COUNT(*) AS Kitap_Sayisi
FROM Books
GROUP BY Category;

SELECT s.Name AS Student_Name, COUNT(br.Borrow_Id) AS Borrow_Count
FROM Borrowing br
JOIN Students s ON br.StudentsId = s.Students_Id
GROUP BY s.Name
ORDER BY Borrow_Count DESC;
