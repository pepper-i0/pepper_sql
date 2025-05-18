-- Creating Database
Create Database tagz;
Use tagz;

-- Creating User Table
Create Table users (
    user_id INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_No VARCHAR(20) NOT NULL
);

-- Creating Order Table
Create Table orders(
    order_id int Primaty key UNIQUE AUTO_INCREMENT,
    user_id int,
    payment_status_id int,
    order_date datetime,
    tagz_type VARCHAR(255) NOT NULL,
    tagz_quantity int,
    tagz_price DECIMAL(10,2) NOT NULL,
    foreign key (user_id) references users(user_id),
    foreign key (payment_status_id) references payment_status(payment_status_id)
);

-- Creating Payment Status Table
Create Table payment_status(
    payment_status_id int Primary Key UNIQUE AUTO_INCREMENT,
    status_name VARCHAR(100)
    );

-- Creating Tagz Table
Create Table tagz(
    tagz_code int primary key UNIQUE AUTO_INCREMENT,
    tagz_name VARCHAR(100) NOT NULL,
    tagz_type VARCHAR(255) NOT NULL,
    tagz_price DECIMAL(10,2) NOT NULL,
    tagz_quantity int NOT NULL NOT > 1
);

-- Creating tagz Order Table
Create Table tagz_order(
    tagz_order_id int primary key UNIQUE AUTO_INCREMENT,
    order_id int,
    tagz_code int,
    user_id int,
    tagz_quantity int,
    order_date datetime,
    payment_status_id int,
    foreign key (user_id) references users(user_id),
    foreign key (payment_status_id) references payment_status(payment_status_id),
    foreign key (order_id) references orders(order_id),
    foreign key (tagz_code) references tagz(tagz_code)
);


-- Creating tagz Upgrade Table
Create Table tagz_upgrade(
    tagz_upgrade_id int primary key UNIQUE AUTO_INCREMENT,
    tagz_code int UNIQUE NOT NULL,
    tagz_type VARCHAR(255) NOT NULL,
    upgrade_price DECIMAL(10,2) NOT NULL,
    upgraded_tagz_name VARCHAR(100) NOT NULL,
    foreign key (tagz_type) references tagz(tagz_type),
    foreign key (tagz_code) references tagz(tagz_code)
);

-- Creating tagz Upgrade Order Table
Create Table tagz_upgrade_order(
    tagz_upgrade_order_id int primary key UNIQUE AUTO_INCREMENT,
    tagz_order_id int,
    tagz_upgrade_id int,
    foreign key (tagz_order_id) references tagz_order(tagz_order_id),
    foreign key (tagz_upgrade_id) references tagz_upgrade(tagz_upgrade_id)
);

-- Creating tagz Order Status Table
Create Table tagz_order_status(
    tagz_order_status_id int primary key UNIQUE AUTO_INCREMENT,
    tagz_order_id int,
    status_name VARCHAR(100) NOT NULL,
    foreign key (tagz_order_id) references tagz_order(tagz_order_id)
);

-- Creating tagz Order History Table
Create Table tagz_order_history(
    tagz_order_history_id int primary key UNIQUE AUTO_INCREMENT,
    tagz_order_id int,    
    status_name VARCHAR(100),
    order_date datetime, 
    foreign key (tagz_order_id) references tagz_order(tagz_order_id), 
    foreign key (status_name) references tagz_order_status(status_name)
);