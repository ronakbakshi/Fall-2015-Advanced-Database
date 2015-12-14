-- Droping Tables
DROP TABLE Author_Title
/
DROP TABLE Book
/
DROP TABLE Title
/
DROP TABLE Publisher
/
DROP TABLE ZIP_Codes
/
DROP TABLE Author
/


-- Creating TABLES
CREATE TABLE Author(
	Author_Number number,
	First_Name varchar2(20),
    Last_Name varchar2(20),
	AddressLine1 varchar2(15),
	AddressLine2 varchar2(15),
	City Varchar2(15),
	State Char(2),
	Country Varchar2(15),
	Contact_Number NUMBER,
	Email_ID varchar2(30),
	CONSTRAINT Author_PK PRIMARY KEY(Author_Number)
  );
  
  CREATE TABLE ZIP_Codes(
	ZIP_Code NUMBER,
	City Varchar2(15),
	State Char(2),
	Country Varchar2(15),
	CONSTRAINT ZIPcd_PK PRIMARY KEY(ZIP_Code)
);


CREATE TABLE Publisher(
	Publisher_ID NUMBER,
	Publisher_Name Varchar2(30),
	Address_Line1 Varchar2(50),
	Address_Line2 Varchar2(50),
	City Varchar2(15),
  STATE char(2),
  Country Varchar(15),
	ZIP_Code Number,
	Contact_No Number,
	Email_ID Varchar2(50),
	CONSTRAINT Publisher_PK PRIMARY KEY(Publisher_ID),
	CONSTRAINT Pub_FK FOREIGN KEY (ZIP_Code) 
	REFERENCES ZIP_Codes(ZIP_Code)
  );
  
  CREATE Table Title(
	Title_no number,
	Title_Name varchar2(50),
	Published_Date date,
	Published_Year number,
	ISBN_No varchar2(20),
	Publisher_ID number,
	CONSTRAINT Title_PK PRIMARY KEY(Title_No),
	CONSTRAINT Title_FK FOREIGN KEY (Publisher_ID) 
	REFERENCES Publisher(Publisher_ID)
);

CREATE TABLE Book(
	Book_Number NUMBER,
	Book_Name VARCHAR2(50),
	Book_Title_ID number,
	Number_Of_Pages number,
	IS_Color varchar2(1),
	No_Of_Copies number,
	Price number(9,2),
  Publisher_ID NUMBER,
	CONSTRAINT Book_PK PRIMARY KEY(Book_Number),
	CONSTRAINT Book_FK FOREIGN KEY (Book_Title_ID)
	REFERENCES Title(Title_No),
  CONSTRAINT PUBLISH_FK FOREIGN KEY (PUBLISHER_ID) 
	REFERENCES Publisher(Publisher_ID)
  );
  
  CREATE TABLE Author_Title(
	Author_ID number,
	Title_Number number,
	CONSTRAINT Author_Title_PK PRIMARY KEY(Author_ID,Title_Number),
	CONSTRAINT Atthtit_FK FOREIGN KEY (Author_ID) 
	REFERENCES Author(Author_Number),
	CONSTRAINT Authtit_FK FOREIGN KEY (Title_Number) 
	REFERENCES Title(Title_no)
  );
REM ===============================================================  
  
--Inserting Values into the Tables  
  
INSERT INTO "AUTHOR" (AUTHOR_NUMBER, FIRST_NAME, LAST_NAME, AddressLine1, AddressLine2, City, State, Country, CONTACT_NUMBER, EMAIL_ID) 
VALUES ('1234', 'Dimpu', 'Reddy', '511 West Third','Apt 3', 'Maryville','MO', 'USA', '9434567219', 'dimpu@gmail.com')
/
  INSERT INTO "AUTHOR" (AUTHOR_NUMBER, FIRST_NAME, LAST_NAME, AddressLine1, AddressLine2, City, State, Country, CONTACT_NUMBER, EMAIL_ID) 
VALUES ('2345', 'Navya', 'Gandikota', '111 W Thomson', 'N College Drive', 'Cleveland', 'OH', 'USA', '7432568943', 'navya@gmail.com')
/
INSERT INTO "AUTHOR" (AUTHOR_NUMBER, FIRST_NAME, LAST_NAME, AddressLine1, AddressLine2, City, State, Country, CONTACT_NUMBER, EMAIL_ID) 
VALUES ('3456', 'Abhishek', 'Purella', '911 Oak Park','Street','Detroit', 'MI', 'USA', '9427525742', 'abhishel@gmail.com')
/
INSERT INTO "AUTHOR" (AUTHOR_NUMBER, FIRST_NAME, LAST_NAME, AddressLine1, AddressLine2, City, State, Country, CONTACT_NUMBER, EMAIL_ID) 
VALUES ('4567', 'Naveen', 'Kumar', '1182 Arbor St','Opp KC Mart', 'KANSAS','MO', 'USA', '6269427942', 'naveen@gmail.com')
/
INSERT INTO "AUTHOR" (AUTHOR_NUMBER, FIRST_NAME, LAST_NAME, AddressLine1, AddressLine2, City, State, Country, CONTACT_NUMBER, EMAIL_ID) 
VALUES ('5678', 'Sindhu', 'Tirumalasetty', '611 East Bay','Ontario','Geneva','NY', 'USA', '9425664825', 'sindhu@gmail.com')
/
INSERT INTO "AUTHOR" (AUTHOR_NUMBER, FIRST_NAME, LAST_NAME, AddressLine1, AddressLine2, City, State, Country, CONTACT_NUMBER, EMAIL_ID) 
VALUES ('6789', 'Sruthi', 'Uppalapati', '315 Windsor', 'Hudson','Jersey City','NJ', 'USA', '9426586379', 'sruthi@gmail.com')
/

REM ===============================================================
  
  INSERT INTO "ZIP_CODES" (ZIP_CODE, CITY, STATE, COUNTRY) 
VALUES ('12345', 'DETROIT', 'MI', 'USA')
 /
 INSERT INTO "ZIP_CODES" (ZIP_CODE, CITY, STATE, COUNTRY) 
VALUES ('23456', 'MARYVILLE', 'MO', 'USA')
/
INSERT INTO "ZIP_CODES" (ZIP_CODE, CITY, STATE, COUNTRY) 
VALUES ('34567', 'CALIFORNIA', 'OH', 'USA')
/
INSERT INTO "ZIP_CODES" (ZIP_CODE, CITY, STATE, COUNTRY) 
VALUES ('45678', 'GENEVA', 'NY', 'USA')
/
INSERT INTO "ZIP_CODES" (ZIP_CODE, CITY, STATE, COUNTRY) 
VALUES ('56789', 'CALIFORNIA', 'CA', 'USA')
/
INSERT INTO "ZIP_CODES" (ZIP_CODE, CITY, STATE, COUNTRY) 
VALUES ('67890', 'DALLAS', 'TX', 'USA')
/
INSERT INTO "ZIP_CODES" (ZIP_CODE, CITY, STATE, COUNTRY) 
VALUES ('78909', 'KANSAS', 'MO', 'USA')
/
  
 REM ===============================================================
 
INSERT INTO "PUBLISHER" (PUBLISHER_ID, PUBLISHER_NAME, ADDRESS_LINE1, ADDRESS_LINE2, CITY, STATE, Country, ZIP_CODE, CONTACT_NO, EMAIL_ID) 
VALUES ('9876', 'DWARAKA PUBLICATIONS', '1115 College N',' Wabash Apartments', 'IRVINE','CA', 'USA', '12345', '1111111111', 'QQWER@GMAIL.COM')
/
INSERT INTO "PUBLISHER" (PUBLISHER_ID, PUBLISHER_NAME, ADDRESS_LINE1, ADDRESS_LINE2, CITY, STATE, Country, ZIP_CODE, CONTACT_NO, EMAIL_ID) 
VALUES ('8765', 'RAJA PUBLICATIONS', '140 N Nevada','ONTARIO','GENEVA','NY', 'USA', '23456', '2222222222', 'DFH@GMAIL.COM')
/
INSERT INTO "PUBLISHER" (PUBLISHER_ID, PUBLISHER_NAME, ADDRESS_LINE1, ADDRESS_LINE2, CITY, STATE, Country, ZIP_CODE, CONTACT_NO, EMAIL_ID) 
VALUES ('7654', 'CHANDU PUBLICATIONS', 'E Burlington St','Opp I-79', 'Jersey City','NJ', 'USA', '45678', '3333333333', 'TYMTH@GMAIL.COM')
/
INSERT INTO "PUBLISHER" (PUBLISHER_ID, PUBLISHER_NAME, ADDRESS_LINE1, ADDRESS_LINE2, CITY, STATE, Country, ZIP_CODE, CONTACT_NO, EMAIL_ID) 
VALUES ('6000', 'ANVI PUBLICATIONS', '111 West Harbor','STREET', 'KANSAS', 'KS','USA', '56789', '4444444444', 'RTHRMN@GMAIL.COM')
/
INSERT INTO "PUBLISHER" (PUBLISHER_ID, PUBLISHER_NAME, ADDRESS_LINE1, ADDRESS_LINE2, CITY, STATE, Country, ZIP_CODE, CONTACT_NO, EMAIL_ID) 
VALUES ('5432', 'AVIKA PUBLICATIONS', '743 Prather Ave','Apt B', 'MARYVILLE', 'MO','USA', '67890', '5555555555', 'RHYXB@GMAIL.COM')
/ 

REM ===============================================================
INSERT INTO "TITLE" (TITLE_NO, TITLE_NAME, PUBLISHED_DATE, PUBLISHED_YEAR, ISBN_NO, PUBLISHER_ID) 
VALUES ('1', 'WINGS OF FIRE', TO_DATE('1999-08-23 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1999', '12', '9876')
/

INSERT INTO "TITLE" (TITLE_NO, TITLE_NAME, PUBLISHED_DATE, PUBLISHED_YEAR, ISBN_NO, PUBLISHER_ID) 
VALUES ('2', 'LET US C', TO_DATE('2000-01-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '2000', '23', '6000')
/
INSERT INTO "TITLE" (TITLE_NO, TITLE_NAME, PUBLISHED_DATE, PUBLISHED_YEAR, ISBN_NO, PUBLISHER_ID) 
VALUES ('3', 'OOPS', TO_DATE('2010-07-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '2010', '34', '7654')
/
INSERT INTO "TITLE" (TITLE_NO, TITLE_NAME, PUBLISHED_DATE, PUBLISHED_YEAR, ISBN_NO, PUBLISHER_ID) 
VALUES ('4', 'DATA ANALYTICS', TO_DATE('2001-03-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '2001', '45', '6000')
/
INSERT INTO "TITLE" (TITLE_NO, TITLE_NAME, PUBLISHED_DATE, PUBLISHED_YEAR, ISBN_NO, PUBLISHER_ID) 
VALUES ('5', 'SWIFT PROG.', TO_DATE('2014-02-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '2014', '56', '6000')
/
  
REM ===============================================================
INSERT INTO "BOOK" (BOOK_NUMBER, BOOK_NAME, BOOK_TITLE_ID, NUMBER_OF_PAGES, IS_COLOR, NO_OF_COPIES, PRICE, PUBLISHER_ID) 
VALUES ('1123', 'OOPS', '1', '12', '1', '1324', '435','9876')
/
INSERT INTO "BOOK" (BOOK_NUMBER, BOOK_NAME, BOOK_TITLE_ID, NUMBER_OF_PAGES, IS_COLOR, NO_OF_COPIES, PRICE, PUBLISHER_ID) 
VALUES ('1234', 'WEB', '2', '442', '1', '55534', '734','8765')
/
INSERT INTO "BOOK" (BOOK_NUMBER, BOOK_NAME, BOOK_TITLE_ID, NUMBER_OF_PAGES, IS_COLOR, NO_OF_COPIES, PRICE, PUBLISHER_ID) 
VALUES ('3453', 'C', '3', '53', '0', '234', '54323','7654')
/
INSERT INTO "BOOK" (BOOK_NUMBER, BOOK_NAME, BOOK_TITLE_ID, NUMBER_OF_PAGES, IS_COLOR, NO_OF_COPIES, PRICE, PUBLISHER_ID) 
VALUES ('3354', 'C++', '4', '24', '1', '66', '334','6000')
/
INSERT INTO "BOOK" (BOOK_NUMBER, BOOK_NAME, BOOK_TITLE_ID, NUMBER_OF_PAGES, IS_COLOR, NO_OF_COPIES, PRICE, PUBLISHER_ID) 
VALUES ('4434', 'IOS', '5', '666', '0', '2345', '234','5432')
/

REM ===============================================================
INSERT INTO "AUTHOR_TITLE" (AUTHOR_ID, TITLE_NUMBER) 
VALUES ('1234', '1')
/
INSERT INTO "AUTHOR_TITLE" (AUTHOR_ID, TITLE_NUMBER)  
VALUES ('2345', '2')
/
INSERT INTO "AUTHOR_TITLE" (AUTHOR_ID, TITLE_NUMBER) 
VALUES ('3456', '3')
/
INSERT INTO "AUTHOR_TITLE" (AUTHOR_ID, TITLE_NUMBER) 
VALUES ('4567', '4')
/
INSERT INTO "AUTHOR_TITLE" (AUTHOR_ID, TITLE_NUMBER) 
VALUES ('5678', '5')
/
REM ===============================================================
COMMIT;
/*
1)	In PL/SQL, you can print to the console using dbms_output.put_line.  
For the output to appear, execute the SQL statement set serveroutput on prior to running the PL/SQL procedure.
*/

set serveroutput on;

/*
2)	Anonymous PL/SQL blocks.  You can use an anonymous PL/SQL block if you have 
some code you only need to execute one time. Write an anonymous PL/SQL block that
inserts a record into the Author table and then prints a message saying that, a 
record has been added to the Author table.
*/
begin
INSERT INTO "AUTHOR" (AUTHOR_NUMBER, FIRST_NAME, LAST_NAME, AddressLine1, AddressLine2, City, State, Country, CONTACT_NUMBER, EMAIL_ID) 
VALUES ('1243', 'Ritika', 'Yadav', '539 Drive','Apt 64', 'Maryville','MO', 'USA', '2234567219', 'ritika@gmail.com');
dbms_output.put_line('A record has been added to the Author table.');
end;
/

/*
3)	Write an anonymous PL/SQL block based on the data provided below to insert a 
record into the Author table:  Once the record is inserted into the table, just 
print a message saying that ‘An Author has been successfully added to the Author table’.
*/
begin
  INSERT INTO "AUTHOR" (AUTHOR_NUMBER, FIRST_NAME, LAST_NAME, AddressLine1, City, State, Country, CONTACT_NUMBER, EMAIL_ID) 
VALUES ('12525', 'Rogers', 'Michael', 'S Main Apt#242', 'Maryville', 'MO', 'USA', '1234567890', 'rogers@gmail.com');
  dbms_output.put_line(' An Author has been successfully added to the Author table ');
end;
/

/*
4)	Stored Procedure:  Create an Anonymous block to insert data into ZIP_Codes table and 
use the same to create a stored procedure named ‘procZIP_Insert’
Parameters:
•	ZIP_Code ? NUMBER
•	City ?Varchar2
•	State ? Char
•	Country ? Varchar2
Finally it should print a message saying that A new ZIP has been added with the ZIP_Code of “XXXXX” and the city is “XXXXX”. 
*/
create or replace procedure procZIP_Insert(
ZIP_Code in Number,
City in Varchar2,
State in Char,
Country in Varchar2)
as
begin
INSERT INTO "ZIP_CODES" values (ZIP_CODE, CITY, STATE, COUNTRY);
dbms_output.put_line('A new ZIP has been added with the ZIP_Code of ' || ZIP_Code ||' and the city is ' || City);
end;
/

execute procZIP_Insert (60016, 'Des Plaines', 'IL', 'USA');
/*
5)	Write a stored procedure named procAuth_Title_Delete with two input parameters 
of Number type with the names auth_ID and title_Nos. This procedure should delete the 
records in author_Title table for the given parameter values. Both values should be in 
the same record. Also delete the same Ids from Author and Title tables as well.

•	If there is no data with the same values which you are passing as parameters in 
the procedure, just print the message saying that No records have been deleted as 
there are no matching records for the provided values auth_ID: “XXX” and title_Nos: “XXX”.

•	If there are records for the given parameter values which you are passing as 
parameters in the procedure, print the message as all records have been deleted 
with the values auth_ID: “XXX” and title_Nos: “XXX”. 
Also provide one execute statement for each of the above two cases. I.e. one statement 
for not deleting records and one for deleting records.
*/

create or replace procedure procAuth_Title_Delete(
auth_ID in number,
title_Nos in number)
as
temp_Count Number;
begin
select count(AUTHOR_ID) into temp_Count from author_Title
where AUTHOR_ID = auth_ID and TITLE_NUMBER = title_Nos;
if temp_Count > 0 then
delete from author_Title
where AUTHOR_ID = auth_ID and TITLE_NUMBER = title_Nos;
delete from Author
where AUTHOR_NUMBER = auth_ID;
delete from Book
where BOOK_TITLE_ID = title_Nos;
delete from Title
where TITLE_NO = title_Nos;
dbms_output.put_line('All records have been deleted with the values auth_ID: ' ||auth_ID || ' and title_Nos: ' ||title_Nos );
else
dbms_output.put_line('No records have been deleted as there are no matching records for the provided values auth_ID: ' ||auth_ID || ' and title_Nos: ' ||title_Nos );
end if;
end;
/

execute procAuth_Title_Delete (2345, 2);
execute procAuth_Title_Delete (2345, 1);

/*
6)	What is the greatest number of records we can delete from Author_Title, if we execute the above stored procedure once? Why?
A) The greatest number of records we can delete from Author_Title is 1, if we execute the above stored procedure once. This is because
AUTHOR_ID and TITLE_NUMBER together constitute the primary key in Author_Title Table so it contains only one unique pair in the table.
*/

/*
7)	Modify the above stored procedure to add the validations below. 
a)	The stored procedure should accept only positive numbers as values for input parameters. 
b)	If the user enters negative values for any of the parameter, it should return the message ‘There should be no negative values in Author_Title’. Please try with positive numbers.
c)	The procedure should work as earlier if the user enters positive values for both of the parameters.
*/

create or replace procedure procAuth_Title_Delete(
auth_ID in number,
title_Nos in number)
as
temp_Count Number;
begin
select count(AUTHOR_ID) into temp_Count from author_Title
where AUTHOR_ID = auth_ID and TITLE_NUMBER = title_Nos;
if auth_ID > 0 and title_Nos > 0 then
  if temp_Count > 0 then
    delete from author_Title
      where AUTHOR_ID = auth_ID and TITLE_NUMBER = title_Nos;
    delete from Author
      where AUTHOR_NUMBER = auth_ID;
    delete from Book
      where BOOK_TITLE_ID = title_Nos;
    delete from Title
      where TITLE_NO = title_Nos;
    dbms_output.put_line('All records have been deleted with the values auth_ID: ' ||auth_ID || ' and title_Nos: ' ||title_Nos );
  else
    dbms_output.put_line('No records have been deleted as there are no matching records for the provided values auth_ID: ' ||auth_ID || ' and title_Nos: ' ||title_Nos );
  end if;
else
  if auth_ID < 0 or title_Nos < 0 then 
    dbms_output.put_line('There should be no negative values in Author_Title');
    dbms_output.put_line('Please try with positive numbers.');
  end if;
end if;
end;
/
execute procAuth_Title_Delete (-2345, 2);
execute procAuth_Title_Delete (-2345, -1);
execute procAuth_Title_Delete (2345, -1);
execute procAuth_Title_Delete (2345, 1);
execute procAuth_Title_Delete (-2345, -1);
execute procAuth_Title_Delete (2345, 2);

/*
8)	Create a stored procedure named procPublisher to return the publisher_id, publisher_Name, zip_code and email_id with the below criteria. 
You should be able to display only the records which satisfy ALL the criteria below for each record.
•	Publisher names of  'DWARAKA PUBLICATIONS' and 'RAJA PUBLICATIONS'
•	City name IRVINE
•	state name CA

Output:
Publisher_ID is "9876" , Publisher_Name is "DWARAKA PUBLICATIONS" ,Zip_Code is "12345", Email is "QQWER@GMAIL.COM"
*/

create or replace procedure procPublisher
as 
temp_pubID Number;
temp_pubName varchar2(100);
temp_ZIP number;
temp_email varchar2(100);
begin
select publisher_id, publisher_Name,zip_code,email_id  into temp_pubID,temp_pubName,temp_ZIP,temp_email
from PUBLISHER
where Publisher_Name in ('DWARAKA PUBLICATIONS', 'RAJA PUBLICATIONS') and City = 'IRVINE' and state = 'CA';
dbms_output.put_line('Publisher_ID is "'|| temp_pubID||'" , Publisher_Name is "'||temp_pubName||'" ,Zip_Code is "'||temp_ZIP||'", Email is "'||temp_email||'"');
end;
/

execute PROCPUBLISHER;
/*9)	Create a stored procedure named procBookDetails which displays ISBN number, book number, book name and Published year for the ISBN Number 12;
Note: You must avoid Cartesian product between all the records. Also do not use cursors to fetch the data. It must fetch only one record.

Output:
ISBN Number is "12", Book Number is "1123", Book Name is "OOPS", Published Year is "1999".
*/

create or replace procedure procBookDetails
as
temp_ISBN_No number;
temp_Book_Number number;
temp_Book_Name varchar2(100);
temp_Published_Year number;
begin
select t.ISBN_No, b.Book_Number, b.Book_Name, t.Published_Year into temp_ISBN_No, temp_Book_Number, temp_Book_Name, temp_Published_Year
from Title t join  book b
on t.title_No = b.book_Title_ID
where ISBN_No = 12;
dbms_output.put_line('ISBN Number is "'||temp_ISBN_No||'", Book Number is "'||temp_Book_Number||'", Book Name is "'||temp_Book_Name||'", Published Year is "'||temp_Published_Year||'"');
end;
/

execute procBookDetails;
/*
10)	Using cursors: If your PL/SQL code returns more than one value, you must use 
a cursor.  (PL/SQL uses a cursor even when only one value is returned, but in that case, 
an implicit cursor is automatically created by PL/SQL.  When more than one value is returned, 
you must create an explicit cursor.)  The procedure below uses a cursor to display the records
in the course table.  See next page.
*/

--QUESTION 10
--EXAMPLE CURSOR IMPLEMENTATION

/*
11)	Create and execute a stored procedure named prcBook_Publishers that displays
the PublisherID, Publisher Name, Contact number, Book Name and Number of copies 
printed for all publishers whose PublisherIDs are more than 6000.
*/
create or replace procedure prcBook_Publishers
as
pubID publisher.Publisher_ID%type;
pubName publisher.Publisher_Name%type;
conNum publisher.Contact_no%type;
bName book.Book_Name%type;
noOfCopies book.no_of_Copies%type;
cursor priceCursor is
select p.Publisher_ID, p.Publisher_Name, p.Contact_no, b.Book_Name, b.no_of_Copies
from publisher p join book b
on p.publisher_ID = b.publisher_ID
where p.publisher_ID > 6000;
begin
  dbms_output.put_line('Retrieving Publisher Details');
  dbms_output.put_line('================================================================================================================================');
  open priceCursor;
loop
  fetch priceCursor into pubID, pubName, conNum, bName, noOfCopies;
  exit when priceCursor%notfound;
  dbms_output.put_line('Publisher ID: "' || pubID ||'",Publisher Name: "'|| pubName ||'", Contact Number: "'||conNum ||'",Book Name: "'||bName||'",Number Of copies printed: "'||noOfCopies||'".');
end loop;
  dbms_output.put_line('================================================================================================================================');
  dbms_output.put_line('Total Number of Publishers Count is: '||priceCursor%rowcount);
  close priceCursor;
end;
/
exec prcBook_Publishers;

/*
12)	Create and execute a stored procedure named procNoOfCopiesPrinted which prints
the total number of copies sold for each Book title Name in descending order. 
Also, print the number of records returned by your query. Your code must work for any valid data.
*/
create or replace procedure procNoOfCopiesPrinted
as
titleName title.title_name%type;
noofCopies book.no_of_Copies%type;
cursor CopiesCursor is
select title_name, no_of_Copies
from book join title 
on book_title_ID = title_No
order by no_of_Copies desc;
begin
  dbms_output.put_line('Details of the Book and Number of Copies Printed ');
  dbms_output.put_line('================================================================');
  open CopiesCursor;
  loop
    fetch CopiesCursor into titleName, noofCopies;
    exit when CopiesCursor%notfound;
    dbms_output.put_line('Title: "'||titleName|| '",Total Number Of Copies: "'||noofCopies || '".');
  end loop;
  dbms_output.put_line('================================================================');
  dbms_output.put_line(CopiesCursor%rowcount || ' records are found and there number of copies printed are displayed.');
  close CopiesCursor;
end;
/  
exec PROCNOOFCOPIESPRINTED;

/*
Answering the below question is optional and if you are able to answer this, you will receive 1 bonus point. Try it..!!!

Based the relationships given in the ER diagram, Create a stored procedure name procPublisherDetails to display the PublisherIds by joining the tables which are displayed in the below picture and retrieve the records that are presented in the Green shaded part.
Note: Don’t use Cursors. Just create a simple stored procedure. ?

Output:

Publisher ID is "8765".
*/
CREATE OR REPLACE PROCEDURE procPublisherDetails
IS
temp_PUBLISHER_ID NUMBER;
BEGIN
SELECT * INTO temp_PUBLISHER_ID
FROM
(select book.publisher_id from Book 
intersect
select publisher.publisher_id from publisher 
union
(select publisher.publisher_id from publisher
intersect
select title.publisher_id from title)
union
(select book.publisher_id from Book
intersect
select title.publisher_id from title)
minus
(select book.publisher_id from Book
intersect
select publisher.publisher_id from publisher
intersect
select title.publisher_id from title));
  DBMS_OUTPUT.PUT_LINE('Publisher ID is "'|| temp_PUBLISHER_ID || '".');
END;
/

execute procPublisherDetails;
