-- create database library;
use library;
-- create table books(
-- 	book_id int auto_increment primary key,
--     title varchar(250) not null,
--     author varchar(250) not null,
--     genre varchar(100),
--     published_year year,
--     available boolean default true
-- );
-- create table library_members(
-- 	member_id int not null auto_increment primary key,
--     name varchar(250) not null,
--     email varchar(250),
--     phone_number varchar(15),
--     join_date date default (current_date)
-- );	
-- create table librarians(
-- 	librarian_id int not null auto_increment primary key,
--     name varchar(250) not null,
--     email varchar(250),
--     phone_number varchar(15),
--     hire_date date default (current_date)
-- );
-- create table loans(
-- 	loan_id int not null auto_increment primary key,
--     book_id int,
--     member_id int,
--     borrow_date date default (current_date),
--     return_date date,
--     librarian_id int,
--     foreign key(book_id) references books(book_id),
--     foreign key(member_id) references library_members(member_id),
--     foreign key(librarian_id) references librarians(librarian_id)
-- );
-- insert into books (title, author, genre, published_year) values
-- 	('THE GREAT GATSBY', 'F. SCOTT FITZGERALD', 'FICTION', 1925),
--     ('1984', 'GEORGE ORWELL', 'DYSTOPEAN', 1949),
--     ('TO KILL A MOCKINGBIRD', 'HARPER LEE', 'CLASSIC', 1960);
-- insert into LIBRARY_MEMBERS(NAME, EMAIL, PHONE_NUMBER) VALUES
-- 	('ALLAN KINGSTON', 'KINGSTON@GMAIL.COM', '8041234567'),
--     ('ALICIA HAUS', 'ALICIAHAUS@YAHOO.COM', '8042345671');
-- INSERT INTO LIBRARIANS(NAME,EMAIL,PHONE_NUMBER) VALUES
-- 	('BRENDA HUGHS', 'BHUGHS76@GMAIL.COM', '1234567890'),
--     ('BENJAMIN MCGRAW', 'BENMCGRAW996@GMAIL.COM', '1239087654');
 --    INSERT INTO LOANS(BOOK_ID, MEMBER_ID, LIBRARIAN_ID, BORROW_DATE) VALUES
-- 		(1,1,1, CURRENT_DATE);
-- 	SELECT* FROM LOANS
-- update BOOKS SET AVAILABLE=FALSE where BOOK_ID=1;
-- SELECT* FROM BOOKS
UPDATE LOANS SET RETURN_DATE=current_date WHERE LOAN_ID=1;
UPDATE BOOKS SET AVAILABLE=TRUE WHERE BOOK_ID=1;
SELECT* FROM BOOKS WHERE AVAILABLE=TRUE;
select m.name, b.title, l.borrow_date, l.return_date from loans l
	join library_members m on l.member_id=m.member_id
	join books b on l.book_id=b.book_id
where m.member_id=1;
select m.name, b.title, l.borrow_date
	from loans l
	join library_members m on l.member_id=m.member_id
	join books b on l.book_id=b.book_id
where l.return_date is null;
select title, author, published_year
	from books
	where published_year>1950;
and l.borrow_date<current_date-interval 14 day;
select title, genre, published_year
	from books
where author='George Orwell';
select title, author, published_year
from books
where published_year>1950;
select count(*) as total_books
from books;
select m.name, l.borrow_date, l.return_date
	from loans l
	join library_members m on l.member_id=m.member_id
	join books b on l.book_id=b.book_id
where b.title='1984';
select b.title, l.borrow_date, l.return_date
	from loans l
	join books b on l.book_id=b.book_id
where l.member_id=1;
select title, author, published_year
	from books
	where genre='fiction'
and available=true;
select m.name,count(l.loan_id) as total_books_borrowed
	from Loans l
	join library_members m on l.member_id=m.member_id
group by m.name;
select m.name, b.title, l.borrow_date
	from loans l
	join library_members m on l.member_id=m.member_id
	join books b on l.book_id=b.book_id
	where l.return_date is null
and l.borrow_date<current_date-interval 30 day;
