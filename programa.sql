create table program(
id int not null auto_increment,
version int not null,
selected_version int not null,
state enum('draft','final') not null,
primary key(id)
);


create table day(
id int not null auto_increment,
dayDetails varchar(50) not null,
isPre bool not null,
primary key(id)
);

create table slot(
id int not null auto_increment,
time_start date not null,
time_end date not null,
primary key(id)
);

create table talk_group(
id int not null auto_increment,
title varchar(50) not null,
chair varchar(50) not null,
url varchar(150),
room varchar(50),
primary key(id)
);

create table talk(
id int not null auto_increment,
timeEnd date not null,
title varchar(50) not null,
eventt varchar(150) not null,
code varchar(50) not null,
authors varchar(200) not null,
primary key(id)
);