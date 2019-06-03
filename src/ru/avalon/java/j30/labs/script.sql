/*
 * TODO(Студент): Опишите процесс создания базы данных
 * 1. Создайте все таблицы, согласно предложенной диаграмме.
 * 2. Опишите все необходимые отношения между таблицами.
 * 3. Добавьте в каждую таблицу минимум три записи.
 */
 
 create table USERINFO(
    USERID integer primary key,
    USERNAME varchar (255) not  null,
    USERSURNAME varchar (255) not null
);

insert into USERINFO(USERID, USERNAME, USERSURNAME) 
values (1, 'Ivan', 'Ivanov'),
       (2, 'Petr', 'Petrov'),
       (3, 'Vasily', 'Vasilyev');

create table ROLES(
    ROLESID integer unique,
    ROLESNAME varchar (255) primary key
);

insert into ROLES(ROLESID, ROLESNAME)
values
    (1, 'admin'),
    (2, 'driver'),
    (3, 'user');

create table USERS(
    USERSID integer not null unique,
    USERSEMAIL varchar (255),
    USERSPASSWORD varchar (255),
    USERSINFO integer references USERINFO(USERID) unique,
    USERSROLE integer references ROLES(ROLESID)
);

insert into USERS(USERSID, USERSEMAIL, USERSPASSWORD)
values
    (1, 'ivan@mail.ru', '12345'),
    (2, 'petr@mail.ru', 'qwerty'),
    (3, 'vasily@mail.ru', 'asdfg');

create table ORDERS(
    ORDERSID integer not null primary key, 
    ORDERSUSER integer references USERS(USERSID),
    ORDERSCREATED timestamp
);

insert into ORDERS(ORDERSID, ORDERSCREATED)
values
    (1, '2019-05-05 09:00:00'),
    (2, '2019-04-04 10:00:00'),
    (3, '2019-03-03 11:00:00');

create table SUPPLIER(
    SUPPLIERID integer not null unique,
    SUPPLIERNAME varchar(255) primary key,
    SUPPLIERADDRESS varchar(255) not null,
    SUPPLIERPHONE varchar(255),
    SUPPLIERREPRESENTATIVE varchar(255) not null
);

insert into SUPPLIER(SUPPLIERID, SUPPLIERNAME, SUPPLIERADDRESS, SUPPLIERPHONE, SUPPLIERREPRESENTATIVE)
values
    (1, 'name1', 'Saint-Petersburg', '9991234567', 'Ivan'),
    (2, 'name2', 'Moskow', '9997654321', 'Petr'),
    (3, 'name3', 'Vladivostok', '9993217654', 'Vasiliy');

create table PRODUCT(
    PRODUCTID integer not null unique,
    PRODUCTCODE varchar(255) primary key,
    PRODUCTTITLE varchar(255),
    PRODUCTSUPPLIER integer references SUPPLIER(SUPPLIERID),
    PRODUCTINITIALPRICE double,
    PRODUCTRETAILVALUE double
);

insert into PRODUCT(PRODUCTID, PRODUCTCODE, PRODUCTTITLE, PRODUCTINITIALPRICE, PRODUCTRETAILVALUE)
values
    (1, 'code1', 'product1', 100, 50),
    (2, 'code2', 'product2', 200, 100),
    (3, 'code3', 'product3', 400, 200);

create table ORDER2PRODUCT(
    ORDERS integer references ORDERS(ORDERSID),
    PRODUCTS integer references PRODUCT(PRODUCTID)
);

insert into ORDER2PRODUCT(ORDERS, PRODUCTS)
values
    (1, 1),
    (2, 2),
    (3, 3);
