create database manegement;
use manegement;
create table Customer(
	customerId int primary key,
    cus_name varchar(30),
    age int 
);
create table orders(
	orderId int primary key,
    customerId int,
    foreign key(customerId) references Customer(customerId),
    orderDate date,
    orderTotal float
);
CREATE TABLE products (
    productId INT PRIMARY KEY,
    productName VARCHAR(50),
    productPrice float
);
CREATE TABLE orderDetails (
    orderId INT,
    productId INT,
    quantity INT,
    PRIMARY KEY (orderId, productId),
    FOREIGN KEY (orderId) REFERENCES orders(orderId),
    FOREIGN KEY (productId) REFERENCES products(productId)
);
INSERT INTO customer (customerId, cus_name, age) VALUES
(1, 'Minh Quân', 18),
(2, 'Ngọc Danh', 28),
(3, 'Hồng Hà', 50);
INSERT INTO Orders (OrderId, CustomerId, OrderDate, OrderTotal) VALUES
(1, 1, '2006-08-21', NULL),
(2, 2, '2006-08-23', NULL),
(3, 3, '2023-09-16', NULL);
update orders set customerId = 1 where orderId=3;
INSERT INTO Products (ProductId, ProductName, ProductPrice) VALUES
(1, 'Máy giặt', 3),
(2, 'Tủ lạnh', 5),
(3, 'Điều hòa', 7),
(4, 'Quạt', 1),
(5, 'Bếp điện', 2);
INSERT INTO OrderDetails (OrderId, ProductId, Quantity) VALUES
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);
select c.cus_name, p.productName, od.quantity
from customer c join orders o on c.customerId = o.customerId
				join orderdetails od on o.orderId = od.orderId
				join products p on od.productId = p.productId;
select c.cus_name
from customer c left join orders o on c.customerId = o.customerId
where o.orderId is null;
select o.orderId, o.orderDate, sum(od.quantity*p.productPrice)
from customer c join orders o on c.customerId = o.customerId
				join orderdetails od on o.orderId = od.orderId
				join products p on od.productId = p.productId
                group by c.cus_name, o.orderDate;