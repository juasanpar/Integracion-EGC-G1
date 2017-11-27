drop table if exists censo;
drop table if exists cookie;
drop table if exists gestion_reg;
drop table if exists respuestas;
drop table if exists preguntasCabina;
drop table if exists poll;
drop table if exists preguntas;
drop table if exists recuento_votos;
drop table if exists resultado;
drop table if exists usuario;
drop table if exists usuarioLogin;
drop table if exists usuarioPoll;
drop table if exists visualizacionPrograma;
drop table if exists votaciones;
drop table if exists vote;


#Usuario genérico ¿Quizás del blog? ¿Al final era el mismo?
create table if not exists usuario (
id int not null auto_increment,
nombre varchar(100) not null,
apellidos varchar(200) not null,
email varchar(100) not null,
genero enum("M","H","I") not null,
direccion varchar(200) not null,
comunidad_autonoma varchar(100) not null,
edad int not null,
dni varchar(9) not null,
username varchar(50) not null,
pass varchar(50) not null,
primary key(id)
);

#Censo de población
create table if not exists censo(
id int not null auto_increment,
titulo varchar(100),
fecha_in date,
fecha_fin date,
codigo_postal int,
comunidad_autonoma varchar(100),
primary key (id)
);

#Gestión de los registros
create table if not exists gestion_reg(
id int not null auto_increment,
user_reference int not null,
afiliación varchar(100),
#¿Bool?
pertenece_censo bool,
primary key(id),
foreign key(user_reference) references usuario(id) on update no action on delete cascade
);

#Recuento de votos
create table if not exists recuento_votos(
id int not null auto_increment,
fecha_comienzo date not null,
fecha_fin date not null,
tipo_recuento varchar(100),
#datos_estadisticos varchar(100)
id_pregunta int not null,
valor_respuesta int,
#id_respuesta int
primary key(id)
);

#Logeo de usuario
create table if not exists usuarioLogin(
id int not null auto_increment,
username varchar(50) not null,
contraseña varchar(50) not null,
mail varchar(50) not null,
rol char not null,
primary key(id)
);

#Cookies
create table if not exists cookie(
id int not null auto_increment,
usuarioLogin int not null,
primary key(id),
foreign key(usuarioLogin) references usuarioLogin(id) on update no action on delete cascade
);

#Encuesta
create table if not exists poll(
id int not null auto_increment,
title varchar(50) not null,
description varchar(150),
fechaInicio date not null,
fechaFin date not null,
primary key(id)
);

#Preguntas de las votaciones.
#Hay que tener mínimo 2 opciones. Posibilidad de más.
create table if not exists preguntas(
id int not null auto_increment,
enunciado varchar(300) not null,
descripcion varchar(400),
#Debería ser quizás un varchar
opcion varchar(150) not null,
opcion2 varchar(150) not null,
primary key(id)
);

#Preguntas formuladas por los usuarios.
create table if not exists preguntasCabina(
id int not null auto_increment,
texto varchar(150) not null,
pollReference int not null,
primary key (id),
foreign key(pollReference) references poll(id) on update no action on delete cascade
);

#Respuestas a las preguntas de cabina
create table if not exists respuestas(
id int not null auto_increment,
texto varchar(150) not null,
questionReference int not null,
primary key (id),
foreign key(questionReference) references preguntasCabina(id) on update no action on delete cascade
);

#Resultado de las votaciones
create table if not exists resultado(
id int not null auto_increment,
recuento int not null,
tema varchar(50) not null,
fecha date not null,
#¿Realmente necesitamos esto?
#En ese caso debería ser tal vez un enum, ¿No?
tipoCabina enum('Telegram','Slack') not null,
primary key(id)
);

#Usuario de las encuestas
create table if not exists usuarioPoll(
id int not null auto_increment,
usuarioP varchar(50) not null,
contraseña varchar(50) not null,
genero enum("M","H","I"),
comunidadAutónoma varchar(80) not null,
edad int not null,
primary key(id)
);

#Programa
create table if not exists visualizacionPrograma(
id int not null auto_increment,
dia date not null,
hueco timestamp,
conferencia varchar(100) not null,
charla varchar(100),
pausa timestamp,
primary key(id)
);

#Votaciones
create table if not exists votaciones(
id int not null auto_increment,
titulo varchar(50) not null,
descripcion varchar(200) not null,
preguntass varchar(200) not null,
fechaInicio timestamp not null,
fechaFin timestamp not null,
primary key(id)
);

#Voto 
#¿¿¿¿¿¿¿Lo queremos??????????
create table if not exists vote(
id int not null auto_increment,
token varchar(50) not null,
voto varchar(50) not null,
primary key(id)
);

