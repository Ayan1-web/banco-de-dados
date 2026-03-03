create table jogador(
id int not null auto_increment primary key unique,
nome varchar(200) not null,
numero_camisa int not null unique
);

describe jogador;

alter table jogador add altura int;
alter table jogador add data_nasc date;

drop table jogador;
show tables;

insert into jogador(nome,numero_camisa,altura,data_nasc) values(
"Ayan",8,171,"2007-07-22");

insert into jogador(nome,numero_camisa,altura,data_nasc) values(
"Angelo", 17,167,"2012-11-08");

insert into jogador(nome,numero_camisa,altura,data_nasc) values(
"David",11,168,"2009-08-17");

insert into jogador(nome,numero_camisa,altura,data_nasc) values(
"Suzart",9,170,"2008-04-23");

insert into jogador(nome,numero_camisa,altura,data_nasc) values(
"João",6,171,"2011-04-04");

insert into jogador(nome,numero_camisa,altura,data_nasc) values(
"Junior",5,173,"2011-03-29");

insert into jogador(nome,numero_camisa,altura,data_nasc) values(
"Isaque",4,178,"2010-12-14");

insert into jogador(nome,numero_camisa,altura,data_nasc) values(
"Lopes",3,174,"2011-09-16");

insert into jogador(nome,numero_camisa,altura,data_nasc) values(
"Gabriel",2,177,"2011-11-27");

insert into jogador(nome,numero_camisa,altura,data_nasc) values(
"Theo",1,173,"2008-08-14");

insert into jogador(nome,numero_camisa,altura,data_nasc) values(
"Raul",10,162,"2013-12-26");

truncate table jogador;

select * from jogador;

alter table jogador modify numero_camisa varchar(3);
alter table jogador change data_nasc data_nsc date;

alter table jogador add column id_time int not null;
alter table jogador
add constraint fk_jogador_time
foreign key (id_time) references times(id_time)
on delete cascade;

alter table jogador
add constraint unique_numero_time
unique (id_time, numero_camisa);
