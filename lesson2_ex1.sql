CREATE DATABASE test1;

USE test1; 

CREATE TABLE addresses (

	id INT,
    house_number INT,
	city VARCHAR(20),
    postcode VARCHAR(7)
);

CREATE TABLE people (

	id INT,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    address_id INT
); 

CREATE TABLE pets (

	id INT,
    name VARCHAR(20),
    species VARCHAR(20), 
    owner_id INT
); 

SHOW TABLES;

alter table pets
add primary key (id);

alter table people
add primary key (id);

alter table pets
add constraint fk_owner
foreign key (owner_id) references people(id);

alter table people
add column email varchar(30);

alter table people
add unique (email);

alter table pets change `name` `first_name` nvarchar(20);

alter table addresses modify postcode CHAR(7);

