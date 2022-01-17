create table customers (
	ID int(11) not null auto_increment,
	first_name varchar(20) not null,
	last_name varchar(20) not null,
	street varchar(25),
	state char(2) not null,
	zip char(5),
	city varchar(20),
	primary key(ID)
);

create table phonenumbers (
	ID int(11) not null auto_increment,
	customer_ID int(11) not null,
	phone_number varchar(10) not null,
	primary key(ID),
	foreign key(customer_ID) references customers(ID)
);

create table orders (
	ID int(11) not null auto_increment,
	customer_ID int(11) not null,
	date_ordered datetime default current_timestamp,
	total decimal(7, 2),
	primary key(ID),
	foreign key(customer_ID) references customer(ID)
);

create table products (
	ID int(11) not null auto_increment,
	name varchar(50) not null,
	description varchar(255),
	price decimal(5, 2),
	qty int(10) not null,
	primary key(ID)
);

create table product_orders (
	product_ID int(11) not null,
	order_ID int(11) not null,
	qty int(10) not null,
	primary key (product_ID, order_ID),
	foreign key (product_ID) references products(ID),
	foreign key (order_ID) references orders(ID)
);


