create table Person (
	id INT,
	fullname VARCHAR(50),
	country VARCHAR(50),
	job VARCHAR(14),
	birthday DATE,
	gender VARCHAR(50),
	salary INT,
	hobbies VARCHAR(27)
);
insert into Person (id, fullname, country, job, birthday, gender, salary, hobbies) values (1, 'Carmella Phebey', 'Czech Republic', 'Architect', '1982-03-16', 'M', 4192, 'Dancing');
insert into Person (id, fullname, country, job, birthday, gender, salary, hobbies) values (2, 'Cindy O''Neill', 'Ukraine', 'Scientist', '1972-09-10', 'F', 3912, 'Woodworking');
insert into Person (id, fullname, country, job, birthday, gender, salary, hobbies) values (3, 'Dani Hillyatt', 'Czech Republic', 'Athlete', '1974-02-16', 'M', 5095, 'Reading');
insert into Person (id, fullname, country, job, birthday, gender, salary, hobbies) values (4, 'Laurel Sebrens', 'Indonesia', 'Firefighter', '1950-09-23', 'F', 4769, 'Woodworking');
insert into Person (id, fullname, country, job, birthday, gender, salary, hobbies) values (5, 'Adelbert Bosanko', 'Jamaica', 'Programmer', '2000-05-22', 'M', 3950, 'Playing video games');
insert into Person (id, fullname, country, job, birthday, gender, salary, hobbies) values (6, 'Hillary Hinckley', 'Indonesia', 'Doctor', '1963-07-05', 'F', 3267, 'Singing');
insert into Person (id, fullname, country, job, birthday, gender, salary, hobbies) values (7, 'Stacee Reah', 'Finland', 'Photographer', '1963-03-08', 'F', 9099, 'Cooking');
insert into Person (id, fullname, country, job, birthday, gender, salary, hobbies) values (8, 'Georas Jiran', 'Poland', 'Designer', '1970-05-03', 'M', 9783, 'Gardening');
insert into Person (id, fullname, country, job, birthday, gender, salary, hobbies) values (9, 'Lydon Seals', 'China', 'Carpenter', '1961-02-11', 'F', 6979, 'Playing board games');
insert into Person (id, fullname, country, job, birthday, gender, salary, hobbies) values (10, 'Maurine Dougan', 'Czech Republic', 'Pilot', '1967-01-07', 'M', 3777, 'Hiking');
insert into Person (id, fullname, country, job, birthday, gender, salary, hobbies) values (11, 'Shelley Egar', 'Iran', 'Doctor', '1982-08-04', 'F', 1480, 'Photography');


UPDATE Person
SET country = 'Canada'
WHERE id = 3;
UPDATE Person
SET salary = salary * 1.10
WHERE id = 11;
UPDATE Person
SET birthday = '1990-05-15', country = 'Việt Nam'
WHERE id = 7;
UPDATE Person
SET salary = salary * 0.85
WHERE salary > 6000;
