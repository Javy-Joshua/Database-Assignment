create database inventory_db
use inventory_db

CREATE TABLE user ( 
    id int NOT NULL,
    name varchar(255),
    password varchar(255),
    email varchar(255),
    information varchar(255),
    gender enum ('male', 'female'),
    phone_number varchar(255),
    address varchar(255),
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
)

CREATE TABLE supplier (
    id int NOT NULL,
    name varchar(255),
    email varchar(255),
    information varchar(255),
    address varchar(255),
    phone_number varchar(255),
    gender enum ('male', 'female'),
    active boolean DEFAULT true,
    date_supplied datetime DEFAULT CURRENT_TIMESTAMP
    user_id int,
    FOREIGN KEY (user_id) REFERENCES user(id),
    PRIMARY KEY (id)
) 

CREATE TABLE employee (
    id int NOT NULL,
    name varchar(255),
    email varchar(255),
    information varchar(255),
    departmrnt char(255),
    phone_number varchar(255),
    address varchar(255),
    gender enum ('male', 'female'),
    user_id int,
    FOREIGN KEY (user_id) REFERENCES user(id),
    PRIMARY KEY (id)
)

CREATE TABLE admin (
    id int NOT NULL,
    name varchar(255),
    role char(255),
    user_id int,
    FOREIGN KEY (user_id) REFERENCES user(id),
    PRIMARY KEY (id)
)

CREATE TABLE category (
    id NOT NULL,
    name varchar(255),
    PRIMARY KEY (id)
)

CREATE TABLE item (
    id NOT NULL,
    description varchar(255),
    size enum ('small', 's', 'meduim','m', 'large', 'l'),
    price decimal,
    Qty_in_stock int,
    category_id int,
    supplier_id int,
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id),
    PRIMARY KEY (id)
)

create table order (
    id int NOT NULL,
    quantity int NOT NULL,
    total_cost decimal,
    status enum('paid', 'Not_paid'),
    item_id int,
    user_id int,
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (item_id) REFERENCES item(id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    PRIMARY KEY (id)
)

insert into user 
(id, name, password, email, information, gender,phone_number, address)
values(1, 'Javy', 'STFU123#', 'jojo@gmail.com', 'male', '+1 426 323 6865', 'N0 9 Peace street Ontario')

insert into supplier
(id, name, email, information, address, phone_number, gender, date_supplied, user_id)
values (1, 'Henny', 'Henny@gmail.com', 'Black and Proud', 'Ontario', '+1 647 555 0179', 'male', '17-09-2023 7:42pm', 1 )

insert into admin
(id, name, role, user_id)
values(1, 'Javy', 'IDAN', 1)

insert into category 
(id, name)
values(1, 'Jordans')

update admin 
set name = 'OG IDAN'
where id = 1

update user 
set information = "I'M TIRED"
where id = 1

select * from user
where id = 1 

select id, name, email, phone_number from supplier
where active = true or id = 1

delete from category
where id = 1

delete from supplier
where id = 1