drop table if exists program;
drop table if exists daay;
drop table if exists slot;
drop table if exists talk_group;
drop table if exists talk;

create table program(
id int not null auto_increment,
version int not null,
selected_version int not null,
state enum('draft','final') not null,
primary key(id)
);


create table daay(
id int not null auto_increment,
dayDetails varchar(50) not null,
isPre bool not null,
programRef int not null,
primary key(id),
foreign key(programRef) references program(id) on update no action on delete cascade
);

create table slot(
id int not null auto_increment,
time_start date not null,
time_end date not null,
dayRef int not null,
primary key(id),
foreign key(dayRef) references daay(id) on update no action on delete cascade
);

create table talk_group(
id int not null auto_increment,
title varchar(50) not null,
chair varchar(50) not null,
url varchar(150),
room varchar(50),
slotReference int not null,
primary key(id),
foreign key(slotReference) references slot(id) on update no action on delete cascade
);

create table talk(
id int not null auto_increment,
timeEnd date not null,
title varchar(50) not null,
eventt varchar(150) not null,
code varchar(50) not null,
authors varchar(200) not null,
talkGReference int not null,
primary key(id),
foreign key(talkGReference) references talk_group(id) on update no action on delete cascade
);