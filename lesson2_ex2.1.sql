CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DOUBLE NOT NULL,
    quantity INT NOT NULL
);

INSERT INTO Product (product_name, price, quantity)
VALUES
    ('Product A', 50.0, 10),
    ('Product B', 60.0, 15),
    ('Product C', 70.0, 20),
    ('Product D', 80.0, 25),
    ('Product E', 90.0, 30),
    ('Product F', 100.0, 35),
    ('Product G', 110.0, 40),
    ('Product H', 120.0, 45),
    ('Product I', 130.0, 50),
    ('Product J', 140.0, 55);

alter table Product
ADD description VARCHAR(255);

update Product
set price = 99
where product_id = 1;

update Product
set price = price * 1.1
where product_id = 2;

update Product
set product_name = 'Jonh Doe'
where product_id = 10;



