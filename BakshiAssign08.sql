drop table lease_holder_table;
drop table apartment_table;
drop table lease_table;
drop table building_table;
drop table rent_table;
drop table date_table;


CREATE TABLE  building_table(
building_id NUMBER NOT NULL, 
building_name VARCHAR2(4000), 
building_location VARCHAR2(4000), 
CONSTRAINT building_pk PRIMARY KEY (building_id)
);
   
CREATE TABLE  rent_table(
rent_id NUMBER NOT NULL,
rent_amount NUMBER(6,2), 
rent_increment NUMBER(5,2), 
rent_decrement NUMBER(5,2), 
total_bill NUMBER(7,2), 
CONSTRAINT rent_pk PRIMARY KEY (rent_id)
);

CREATE TABLE  date_table(
date_id NUMBER NOT NULL, 
start_date DATE, 
end_date DATE, 
CONSTRAINT date_pk PRIMARY KEY (date_id)
);

CREATE TABLE lease_table(
lease_id NUMBER NOT NULL,
number_of_lease_holders NUMBER,
lease_period NUMBER,
lease_amount NUMBER(7, 2), 
rent_id NUMBER,
building_id NUMBER, 
CONSTRAINT lease_pk PRIMARY KEY (lease_id) ENABLE,
CONSTRAINT fk_rentLease_table FOREIGN KEY (rent_id) REFERENCES  rent_table (rent_id),
CONSTRAINT fk_buildingLease_table FOREIGN KEY (building_id) REFERENCES  building_table (building_id)
);

CREATE TABLE apartment_table(
apt_id NUMBER NOT NULL, 
apt_no NUMBER, 
no_of_rooms NUMBER, 
room_availability NUMBER,
rent_id NUMBER,
building_id NUMBER,
lease_id NUMBER,
CONSTRAINT apartment_pk PRIMARY KEY (apt_id),
CONSTRAINT fk_rentApt_table FOREIGN KEY (rent_id) REFERENCES rent_table (rent_id),
CONSTRAINT fk_buildingApt_table FOREIGN KEY (building_id) REFERENCES building_table (building_id),
CONSTRAINT fk_leaseApt_table FOREIGN KEY (lease_id) REFERENCES lease_table (lease_id)
);
   
   
CREATE TABLE lease_holder_table(
lease_holder_id NUMBER NOT NULL, 
lease_holder_name VARCHAR2(4000), 
lease_id_proof VARCHAR2(4000), 
lease_id_proof_number VARCHAR2(4000),
contact_number NUMBER,
apt_id NUMBER,
date_id NUMBER,
CONSTRAINT lease_holder_pk PRIMARY KEY (lease_holder_id),
CONSTRAINT fk_AptLeaseHolder_table FOREIGN KEY (apt_id) REFERENCES apartment_table (apt_id),
CONSTRAINT fk_DateLeaseHolder_table FOREIGN KEY (date_id) REFERENCES date_table (date_id)
);

-- inserting rows into building_table
insert into building_table values(100, 'Horizon West Apartments', '1121 North College Drive, Maryville');
insert into building_table values(101, 'Forest Village Apartments', '917 Centennial Dr, Maryville');
insert into building_table values(102, 'Northridge Apartments', '1145 N College Dr, Maryville');
insert into building_table values(103, 'Enclave-2', 'Layout, Vizag');

-- inserting rows into rent_table
insert into rent_table values( 1001, 500.5, 10, 0,510.5 );
insert into rent_table values( 1002, 600.75, 50, 0,700.75 );
insert into rent_table values( 1003, 750.25, 0, 50, 700.25);
insert into rent_table values( 1004, 850.5, 50, 0, 900.5);
insert into rent_table values( 1005, 900.75, 100, 0, 1000.75);
insert into rent_table values( 1006, 902.15, 100, 0, 900.75);

-- inserting rows into date_table
insert into date_table values(10, '28-Oct-15', '28-Oct-16');
insert into date_table values(11, '9-Sep-15', '9-Sep-16');
insert into date_table values(12, '15-Aug-15', '15-Aug-17');
insert into date_table values(13, '18-Jul-15', '18-Jul-18');
insert into date_table values(14, '8-Jun-15', '8-Jun-19');
insert into date_table values(15, '11-Dec-15', '24-Nov-18');

-- inserting rows into lease_table
insert into lease_table values(2000, 2, 1, 500.5, 1001, 100);
insert into lease_table values(2001, 1, 2, 1000.5, 1002, 101);
insert into lease_table values(2002, 3, 3, 700.75, 1004, 102);
insert into lease_table values(2003, 1, 2, 700.25, 1005, 101);
insert into lease_table values(2004, 1, 2, 600.45, 1003, 102);
insert into lease_table values(2005, 1, 2, 650.5, 1004, 100);
insert into lease_table values(2006, 1, 3, 600.75, 1004, 101);
insert into lease_table values(2007, 3, 3, 750.8, 1002, 101);
insert into lease_table values(2008, 3, 3, 800.87, 1003, 102);
insert into lease_table values(2009, 3, 3, 850.34, 1002, 102);
insert into lease_table values(2010, 2, 1, 900.5, 1005, 102);
insert into lease_table values(2011, 2, 1, 550.25, 1001, 100);
insert into lease_table values(2012, 2, 1, 570.25, 1004, 100);

-- inserting rows into apartment_table
insert into apartment_table values(5000, 70, 4, 1, 1001, 100, 2000);
insert into apartment_table values(5001, 82, 3, 0, 1002, 101, 2001);
insert into apartment_table values(5002, 85, 2, 0, 1004, 102, 2002);
insert into apartment_table values(5003, 50, 2, 0, 1005, 101, 2003);
insert into apartment_table values(5004,  1, 1, 0, 1003, 102, 2004);
insert into apartment_table values(5005, 39, 2, 1, 1004, 100, 2005);
insert into apartment_table values(5006,  2, 4, 0, 1004, 101, 2006);
insert into apartment_table values(5007,  3, 3, 0, 1002, 101, 2007);
insert into apartment_table values(5008,  1, 2, 0, 1003, 102, 2008);
insert into apartment_table values(5009, 12, 3, 1, 1002, 102, 2009);
insert into apartment_table values(5010, 20, 1, 0, 1005, 102, 2010);
insert into apartment_table values(5011, 21, 4, 0, 1001, 100, 2011);
insert into apartment_table values(5012, 25, 2, 0, 1001, 100, 2012);

-- inserting rows into lease_holder_table
insert into lease_holder_table values(9001, 'John Smith', 'Drivers License', 'DO67898612', 6605621212, 5000, 10);
insert into lease_holder_table values(9002, 'Micheal Bevan', 'Passport', 'P8986129', 6605825674, 5001, 11);
insert into lease_holder_table values(9003, 'Micheal Scofield', 'Social Security Card', '678986123', 6605562789, 5002, 12);
insert into lease_holder_table values(9004, 'Sara Tancredi', 'Drivers License', 'D347898612', 6602349057, 5003, 13);
insert into lease_holder_table values(9005, 'Gretchen Morgan', 'Drivers License', 'DO67898612', 6601257638, 5004, 14);
insert into lease_holder_table values(9006, 'Lincol Burrows', 'Passport', 'DO67898612', 6605928888, 5005, 10);
insert into lease_holder_table values(9007, 'Alexander Mahone', 'Passport', 'DO67898612', 6603570030, 5006, 11);
insert into lease_holder_table values(9008, 'Fernando Sucre', 'Passport', 'DO67898612', 6605322367, 5007, 12);
insert into lease_holder_table values(9009, 'Walter White', 'Social Security Card', 'DO67898612', 6605629876, 5008, 13);
insert into lease_holder_table values(9010, 'Skyler White', 'Social Security Card', 'DO67898612', 6605623654, 5009, 14);
insert into lease_holder_table values(9011, 'Marie Schrader', 'Passport', 'DO67898612', 6605929898, 5010, 10);
insert into lease_holder_table values(9012, 'Robert Evans', 'Drivers License', 'DO67898612', 6603573030, 5011, 10);


--4)	Write a single SQL statement that will calculate and display the amount generated from the lease rentals of all the buildings.

select sum(lease_amount)
from lease_table;

--5)	Write a Single SQL statement that gives the number of apartments given on lease in one Building.
--( Choose any one building from the records available in BUILDING_TABLE)

select distinct count(apt_id) 
from apartment_table 
where building_id = 100;

--6)	Write a query to display the Cartesian product of LEASE_TABLE and APARTMENT_TABLE.

select * 
from LEASE_TABLE, APARTMENT_TABLE;

--7)	Write a query to join LEASE_TABLE and APARTMENT_TABLE based on LEASE_ID. Observe the number of rows from 6 and 7.

select * 
from LEASE_TABLE l
join APARTMENT_TABLE a
on l.lease_id = a.lease_id;

--8)	Write a query to display unique building ids from the APARTMENT_TABLE.

select distinct building_id
from APARTMENT_TABLE;

--9)	Write a query to update the LEASE_HOLDER_NAME of any one lease holder in the LEASE_HOLDER_TABLE.

update LEASE_HOLDER_TABLE
set LEASE_HOLDER_NAME = 'Virendra Sehwag'
where LEASE_HOLDER_ID = 9004;

--10)	Write a query to delete any one lease holder based on LEASE_HOLDER_ID.

delete from LEASE_HOLDER_TABLE
where lease_holder_id = 9004;

--11)	Write a SQL statement that displays LEASE_HOLDER_NAME, CONTACT_NUMBER of lease holders whose agreements
--were made between 09 JUNE, 2015 and 17 SEPTEMBER, 2015.

select LEASE_HOLDER_NAME, CONTACT_NUMBER 
from LEASE_HOLDER_TABLE l
join date_table d
on l.date_id = d.date_id
where start_date > '9-Jun-15'
and start_date < '17-Sep-15';

--12)	Write a SQL statement to display LEASE_HOLDER_NAME, LEASE_ID_PROOF, LEASE_ID_PROOF_NUMBER, BUILDING_NAME, and BUILDING_LOCATION
--of the lease holders in any one building.

select LEASE_HOLDER_NAME, LEASE_ID_PROOF, LEASE_ID_PROOF_NUMBER, BUILDING_NAME, BUILDING_LOCATION
from lease_holder_table lht
join apartment_table apt
on lht.apt_id = apt.apt_id
join building_table bt
on apt.building_id = bt.building_id
where bt.building_id = 100;