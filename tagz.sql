-- Creating Database
Create Database ticket;
Use ticket;

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
    ticket_type VARCHAR(255) NOT NULL,
    ticket_quantity int,
    ticket_price DECIMAL(10,2) NOT NULL,
    foreign key (user_id) references users(user_id),
    foreign key (payment_status_id) references payment_status(payment_status_id)
);

-- Creating Payment Status Table
Create Table payment_status(
    payment_status_id int Primary Key UNIQUE AUTO_INCREMENT,
    status_name VARCHAR(100)
    );

-- Creating ticket Table
Create Table ticket(
    ticket_code int primary key UNIQUE AUTO_INCREMENT,
    ticket_name VARCHAR(100) NOT NULL,
    ticket_type VARCHAR(255) NOT NULL,
    ticket_price DECIMAL(10,2) NOT NULL,
    ticket_quantity int NOT NULL NOT > 1
);

-- Creating ticket Order Table
Create Table ticket_order(
    ticket_order_id int primary key UNIQUE AUTO_INCREMENT,
    order_id int,
    ticket_code int,
    user_id int,
    ticket_quantity int,
    order_date datetime,
    payment_status_id int,
    foreign key (user_id) references users(user_id),
    foreign key (payment_status_id) references payment_status(payment_status_id),
    foreign key (order_id) references orders(order_id),
    foreign key (ticket_code) references ticket(ticket_code)
);


-- Creating ticket Upgrade Table
Create Table ticket_upgrade(
    ticket_upgrade_id int primary key UNIQUE AUTO_INCREMENT,
    ticket_code int UNIQUE NOT NULL,
    ticket_type VARCHAR(255) NOT NULL,
    upgrade_price DECIMAL(10,2) NOT NULL,
    upgraded_ticket_name VARCHAR(100) NOT NULL,
    foreign key (ticket_type) references ticket(ticket_type),
    foreign key (ticket_code) references ticket(ticket_code)
);

-- Creating ticket Upgrade Order Table
Create Table ticket_upgrade_order(
    ticket_upgrade_order_id int primary key UNIQUE AUTO_INCREMENT,
    ticket_order_id int,
    ticket_upgrade_id int,
    foreign key (ticket_order_id) references ticket_order(ticket_order_id),
    foreign key (ticket_upgrade_id) references ticket_upgrade(ticket_upgrade_id)
);

-- Creating ticket Order Status Table
Create Table ticket_order_status(
    ticket_order_status_id int primary key UNIQUE AUTO_INCREMENT,
    ticket_order_id int,
    status_name VARCHAR(100) NOT NULL,
    foreign key (ticket_order_id) references ticket_order(ticket_order_id)
);

-- Creating ticket Order History Table
Create Table ticket_order_history(
    ticket_order_history_id int primary key UNIQUE AUTO_INCREMENT,
    ticket_order_id int,    
    status_name VARCHAR(100),
    order_date datetime, 
    foreign key (ticket_order_id) references ticket_order(ticket_order_id), 
    foreign key (status_name) references ticket_order_status(status_name)
);