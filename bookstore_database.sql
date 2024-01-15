create schema Bookstore;

CREATE TABLE STUDENTS(
Student_ID int NOT NULL,
Student_Email varchar(35) NOT NULL UNIQUE,
First_Name char(35) NOT NULL,
Last_Name char(35) NOT NULL,
Phone_Number char(40) NOT NULL,
CONSTRAINT STUDENTS_PK PRIMARY KEY(Student_ID)
);

CREATE TABLE ORDERS(
Order_ID int NOT NULL,
Student_ID int NOT NULL,
Book_ISBN_1 char(40) NOT NULL,
Book_ISBN_2 char(40) NOT NULL,
Book_ISBN_3 char(40) NOT NULL,
Book_ISBN_4 char(40) NOT NULL,
Total int NOT NULL,
Order_Date char(30) NOT NULL,
CONSTRAINT ORDERS_PK PRIMARY KEY(Order_ID)
);

CREATE TABLE COURSES(
Course_ID int,
Professor_ID int NOT NULL,
Book_ISBN char(40) NOT NULL,
Course_Name char(100) NOT NULL,
CONSTRAINT COURSES_PK PRIMARY KEY(Course_ID)
);

CREATE TABLE BOOK(
Book_ISBN char(40) NOT NULL,
Course_ID int,
Book_Title char(40) NOT NULL,
Price int NOT NULL,
Publication_Date char(30) NOT NULL,
Quantity_Available int NOT NULL,
CONSTRAINT BOOK_PK PRIMARY KEY(Book_ISBN)
);

CREATE TABLE PROFESSORS(
Professor_ID int NOT NULL,
Course_ID int,
Professor_Name char(40) NOT NULL,
Professor_Email varchar(50) NOT NULL UNIQUE,
CONSTRAINT PROFESSORS_PK PRIMARY KEY(Professor_ID)
);

CREATE TABLE ORDER_INVOICE(
Invoice_ID int NOT NULL UNIQUE,
Order_ID int NOT NULL,
Order_Filled char(10) NOT NULL,
Status_Date char(30) NOT NULL,
CONSTRAINT ORDER_INVOICE_PK PRIMARY KEY(Invoice_ID)
);

CREATE TABLE REGISTRATION(
Schedule_ID int NOT NULL UNIQUE,
Student_ID int NOT NULL,
Course_1 int,
Course_2 int NOT NULL,
Course_3 int NOT NULL,
Course_4 int NOT NULL,
CONSTRAINT REGISTRATION_PK PRIMARY KEY(Schedule_ID)
);

ALTER TABLE COURSES
ADD CONSTRAINT Professor_Course
FOREIGN KEY (Professor_ID) REFERENCES PROFESSORS (Professor_ID);

ALTER TABLE COURSES
ADD CONSTRAINT Course_Book
FOREIGN KEY (Book_ISBN) REFERENCES BOOK (Book_ISBN);

ALTER TABLE ORDERS
ADD CONSTRAINT Student_ID_Order
FOREIGN KEY (Student_ID) REFERENCES STUDENTS (Student_ID);

ALTER TABLE ORDERS
ADD CONSTRAINT Order_ISBN1
FOREIGN KEY (Book_ISBN_1) REFERENCES BOOK (Book_ISBN);

ALTER TABLE ORDERS
ADD CONSTRAINT Order_ISBN2
FOREIGN KEY (Book_ISBN_2) REFERENCES BOOK (Book_ISBN);

ALTER TABLE ORDERS
ADD CONSTRAINT Order_ISBN3
FOREIGN KEY (Book_ISBN_3) REFERENCES BOOK (Book_ISBN);

ALTER TABLE ORDERS
ADD CONSTRAINT Order_ISBN4
FOREIGN KEY (Book_ISBN_4) REFERENCES BOOK (Book_ISBN);

ALTER TABLE ORDER_INVOICE
ADD CONSTRAINT Invoice_Order_ID
FOREIGN KEY (Order_ID) REFERENCES ORDERS (Order_ID);

ALTER TABLE BOOK
ADD CONSTRAINT ISBN_COURSE
FOREIGN KEY (Course_ID) REFERENCES COURSES (Course_ID);

ALTER TABLE PROFESSORS
ADD CONSTRAINT Course_Professor
FOREIGN KEY (Course_ID) REFERENCES COURSES (Course_ID);

ALTER TABLE REGISTRATION
ADD CONSTRAINT FK_Student_Registration
FOREIGN KEY (STUDENT_ID) REFERENCES STUDENTS (STUDENT_ID);

ALTER TABLE REGISTRATION
ADD CONSTRAINT FK_Course1
FOREIGN KEY (Course_1) REFERENCES COURSES (Course_ID);

ALTER TABLE REGISTRATION
ADD CONSTRAINT FK_Course_2
FOREIGN KEY (Course_2) REFERENCES COURSES (Course_ID);

ALTER TABLE REGISTRATION
ADD CONSTRAINT FK_Course_3
FOREIGN KEY (Course_3) REFERENCES COURSES (Course_ID);

ALTER TABLE REGISTRATION
ADD CONSTRAINT FK_Course_4
FOREIGN KEY (Course_4) REFERENCES COURSES (Course_ID);


--BELOW ARE ALL INSERTION LINES

INSERT INTO STUDENTS (Student_Id, Student_Email, First_Name, Last_Name, Phone_Number)
VALUES (‘006211344’, “‘006211344@coyote.csusb.edu’”, ‘Maria’, ‘Maria’, ‘9095643425’);
INSERT INTO STUDENTS (Student_Id, Student_Email, First_Name, Last_Name, Phone_Number)
VALUES (‘006827984’, “‘006827984@coyote.csusb.edu’”, ‘Nathaniel’, ‘Kuo’, ‘9095689243’);
INSERT INTO STUDENTS (Student_Id, Student_Email, First_Name, Last_Name, Phone_Number)
VALUES (‘006933167’, “‘006933167@coyote.csusb.edu’”, ‘Mikensi’, ‘Fulks’, ‘9095738910’);
INSERT INTO STUDENTS (Student_Id, Student_Email, First_Name, Last_Name, Phone_Number)
VALUES (‘007041821’, “‘007041821@coyote.csusb.edu’”, ‘Aurek’, ‘Boutte’, ‘9095623425’);
INSERT INTO STUDENTS (Student_Id, Student_Email, First_Name, Last_Name, Phone_Number)
VALUES (‘007565110’, “‘007565110@coyote.csusb.edu’”, ‘Christian’, ‘Willis’, ‘9095633425’);
INSERT INTO STUDENTS (Student_Id, Student_Email, First_Name, Last_Name, Phone_Number)
VALUES (‘007646672’, “‘007646672@coyote.csusb.edu’”, ‘Nathan’, ‘Jaskiewicz’, ‘9095653425’);

INSERT INTO ORDERS (Order_ID, Book_ISBN_1, Book_ISBN_2, Book_ISBN_3, Book_ISBN_4, Total)
VALUES (‘11001’, ‘9780201702255’, ‘9781119790020’, ‘9781119739951’, ‘9781337627900’, ‘319.01’);
INSERT INTO ORDERS (Order_ID, Book_ISBN_1, Book_ISBN_2, Book_ISBN_3, Book_ISBN_4, Total)
VALUES (‘11002’, ‘9781305968479’, ‘9781119369097’, ‘9781620975459’, ‘9781337627900’, ‘209.89;);
INSERT INTO ORDERS (Order_ID, Book_ISBN_1, Book_ISBN_2, Book_ISBN_3, Book_ISBN_4, Total)
VALUES (‘11003’, ‘9781138590564’, ‘9781620975459’, ‘9781319056322’, ‘9781119369097’, ‘186.71’);
INSERT INTO ORDERS (Order_ID, Book_ISBN_1, Book_ISBN_2, Book_ISBN_3, Book_ISBN_4, Total)
VALUES (‘11004’, ‘9781620975459’, ‘9781119790020’, ‘9781305968479’, ‘9781138590564’, ‘222.12’);
INSERT INTO ORDERS (Order_ID, Book_ISBN_1, Book_ISBN_2, Book_ISBN_3, Book_ISBN_4, Total)
VALUES (‘11005’, ‘9781337627900’, ‘9781138590564’, ‘9781119739951’, ‘9781620975459’, ‘303.36’);
INSERT INTO ORDERS (Order_ID, Book_ISBN_1, Book_ISBN_2, Book_ISBN_3, Book_ISBN_4, Total)
VALUES (‘11006’, ‘9781138590564’, ‘9781119790020’, ‘9780136090199’, ‘9781119739951’, ‘358.84’);



INSERT INTO COURSES (Course_ID, Professor_ID, Book_ISBN, Course_Name)
VALUES ('3420', ‘1’, ‘9780201702255’, 'System Analysis and Design');
INSERT INTO COURSES (Course_ID, Professor_ID, Book_ISBN, Course_Name)
VALUES ('3051', ‘2’, ‘9781138590564’, 'Health and Human Ecology');
INSERT INTO COURSES (Course_ID, Professor_ID, Book_ISBN, Course_Name)
VALUES ('4610', ‘3’, ‘9781119790020’, 'Cybersecurity Management');
INSERT INTO COURSES (Course_ID, Professor_ID, Book_ISBN, Course_Name)
VALUES ('3020', ‘4’, ‘9780136090199’, 'Organization Behavior');
INSERT INTO COURSES (Course_ID, Professor_ID, Book_ISBN, Course_Name)
VALUES ('2310', ‘5’, ‘9781119739951’,  'Application Development');
INSERT INTO COURSES (Course_ID, Professor_ID, Book_ISBN, Course_Name)
VALUES ('3060', ‘6’, ‘9781319056322’, 'Writing as Academic Inquiry');
INSERT INTO COURSES (Course_ID, Professor_ID, Book_ISBN, Course_Name)
VALUES ('4410', ‘7’, ‘9781337627900’, 'Advanced Database Management');
INSERT INTO COURSES (Course_ID, Professor_ID, Book_ISBN, Course_Name)
VALUES ('5150', ‘8’, ‘9781119369097’, 'Project Management');
INSERT INTO COURSES (Course_ID, Professor_ID, Book_ISBN, Course_Name)
VALUES ('3160', ‘9’, ‘9781620975459’, 'Race and Racism');
INSERT INTO COURSES (Course_ID, Professor_ID, Book_ISBN, Course_Name)
VALUES ('1115', ‘10’, ‘9781305968479’, 'Personal Adjustment and Growth');

INSERT INTO BOOK (Book_ISBN, Course_ID, Book_Title, Price, Publication_Date, Quantity_Available)
VALUES ('9780136090199', ‘3020’, 'Behavior in Organizations', '88.75', '7/21/2010', '50');
INSERT INTO BOOK (Book_ISBN, Course_ID, Book_Title, Price, Publication_Date, Quantity_Available)
VALUES ('9780201702255', ‘3420’, 'Writing Effective Use Cases', '48.80', '10/5/2000', '98');
INSERT INTO BOOK (Book_ISBN, Course_ID, Book_Title, Price, Publication_Date, Quantity_Available)
VALUES ('9781119369097', ‘5150’, 'Project Management: A Strategic Managerial Approach', '49.64', '11/9/2017', '100');
INSERT INTO BOOK (Book_ISBN, Course_ID, Book_Title, Price, Publication_Date, Quantity_Available)
VALUES ('9781119739951', ‘2310’, 'Python For Everyone 3rd Edition', '129.75', '8/18/2020', '30');
INSERT INTO BOOK (Book_ISBN, Course_ID, Book_Title, Price, Publication_Date, Quantity_Available)
VALUES ('9781119790020', ‘4610’, '(ISC)2 CISSP Official Study Guide', '61.99', '7/7/2021', '30');
INSERT INTO BOOK (Book_ISBN, Course_ID, Book_Title, Price, Publication_Date, Quantity_Available)
VALUES ('9781138590564', ‘3051’, 'Living with the Earth, Fourth Edition', '78.35', '10/25/2018', '200');
INSERT INTO BOOK (Book_ISBN, Course_ID, Book_Title, Price, Publication_Date, Quantity_Available)
VALUES ('9781305968479', ‘1115’, 'Psychology Applied to Modern Life', '64.99', '1/1/2017', '100');
INSERT INTO BOOK (Book_ISBN, Course_ID, Book_Title, Price, Publication_Date, Quantity_Available)
VALUES ('9781319056322', ‘3060’, 'Pursuing Happiness', '41.93', '11/1/2019', '50');
INSERT INTO BOOK (Book_ISBN, Course_ID, Book_Title, Price, Publication_Date, Quantity_Available)
VALUES ('9781337627900', ‘4410’, 'Database Systems', '78.47', '1/1/2018', '65');
INSERT INTO BOOK (Book_ISBN, Course_ID, Book_Title, Price, Publication_Date, Quantity_Available)
VALUES ('9781620975459', ‘3160’, 'The New Jim Crow: Mass Incarceration', '16.79', '1/20/2020', '89');

INSERT INTO PROFESSORS (Professor_ID, Course_ID, Professor_Name, Professor_Email)
VALUES ('1', ‘3420’, 'Elnoshokaty','AElnoshokaty@csusb.edu');
INSERT INTO PROFESSORS (Professor_ID, Course_ID, Professor_Name, Professor_Email)
VALUES ('2', ‘3051’, 'Rose', 'Srose@csusb.edu');
INSERT INTO PROFESSORS (Professor_ID, Course_ID, Professor_Name, Professor_Email)
VALUES ('3', ‘4610’, 'Adams', 'Kadams@csusb.edu’);
INSERT INTO PROFESSORS (Professor_ID, Course_ID, Professor_Name, Professor_Email)
VALUES ('4', ‘3020’, 'Segovia', 'Jsegovia@csusb.edu');
INSERT INTO PROFESSORS (Professor_ID, Course_ID, Professor_Name, Professor_Email)
VALUES ('5', ‘2310’, 'Kinsey', 'Dkinsey@csusb.edu');
INSERT INTO PROFESSORS (Professor_ID, Course_ID, Professor_Name, Professor_Email)
VALUES ('6', ‘3060’, 'Ragio', 'Cragio@csusb.edu');
INSERT INTO PROFESSORS (Professor_ID, Course_ID, Professor_Name, Professor_Email)
VALUES ('7', ‘4410’, 'Brown', 'Sbrown.csusb.edu’);
INSERT INTO PROFESSORS (Professor_ID, Course_ID, Professor_Name, Professor_Email)
VALUES ('8', ‘5150’, 'Winters', 'Mwinters@csusb.edu');
INSERT INTO PROFESSORS (Professor_ID, Course_ID, Professor_Name, Professor_Email))
VALUES ('9', ‘3160’, 'Texeira', 'Mtexeira@csusb.edu');
INSERT INTO PROFESSORS (Professor_ID, Course_ID, Professor_Name, Professor_Email)
VALUES ('10', ‘1115’, 'Maharjan', 'Smaharjan@csusb.edu');

INSERT INTO ORDER_INVOICE (Invoice_ID, Order_ID, Order_Filled, Status_Date)
VALUES ('1', ‘11001’, 'YES', '4/17/2023');
INSERT INTO ORDER_INVOICE (Invoice_ID, Order_ID, Order_Filled, Status_Date)
VALUES ('2', ‘11002’, 'NO', '4/17/2023');
INSERT INTO ORDER_INVOICE (Invoice_ID, Order_ID, Order_Filled, Status_Date)
VALUES ('3', ‘11003’, 'YES', '4/17/2023');
INSERT INTO ORDER_INVOICE (Invoice_ID, Order_ID, Order_Filled, Status_Date)
VALUES ('4', ‘11004’, 'YES', '4/17/2023');
INSERT INTO ORDER_INVOICE (Invoice_ID, Order_ID, Order_Filled, Status_Date)
VALUES ('5',‘11005’, 'NO', '4/17/2023');
INSERT INTO ORDER_INVOICE (Invoice_ID, Order_ID, Order_Filled, Status_Date)
VALUES ('6',‘11006’, 'YES', '4/17/2023');

INSERT INTO REGISTRATION (Schedule_ID, Student_ID, Course_1, Course_2, Course_3, Course_4)
VALUES (‘001’, ‘006211344’, ‘3420’, ‘4610’, ‘2310’, ‘4410’);
INSERT INTO REGISTRATION (Schedule_ID, Student_ID, Course_1, Course_2, Course_3, Course_4)
VALUES (‘002’, ‘006827984’, ‘1115’, ‘5150’, ‘3160’, ‘4410’);
INSERT INTO REGISTRATION (Schedule_ID, Student_ID, Course_1, Course_2, Course_3, Course_4)
VALUES (‘003’, ‘006933167’, ‘3051’, ‘3160’, ‘3060’, ‘5150’);
INSERT INTO REGISTRATION (Schedule_ID, Student_ID, Course_1, Course_2, Course_3, Course_4)
VALUES (‘004’, ‘007041821’, ‘3160’, ‘4610’, ‘1115’, ‘3051’);
INSERT INTO REGISTRATION (Schedule_ID, Student_ID, Course_1, Course_2, Course_3, Course_4)
VALUES (‘005’, ‘007565110’, ‘4410’, ‘3051’, ‘2310’, ‘3160’);
INSERT INTO REGISTRATION (Schedule_ID, Student_ID, Course_1, Course_2, Course_3, Course_4)
VALUES (‘006’, ‘007646672’, ‘3051’, ‘4610’, ‘3020’, ‘2310’);

