create table clientes(
id INTEGER PRIMARY key,
cpf char(14) not null,
nome varchar(254) not null,
email varchar(254) not null
);

insert into clientes values(01,'075483218954','Ayan','ayan@gmail.com');
insert into clientes values(02,'985762510764','Thiago','thiago@gmail.com');
insert into clientes values(03,'906748361808','Douglas','douglas@gmail.com');
insert into clientes values(04,'987616359857','Breno','breno@gmail.com');
insert into clientes values(05,'9647145278960','Bruno','bruno@gmail.com');
insert into clientes values(06,'875614256016','Caio','caio@gmail.com');
insert into clientes values(07,'142658970365','Diogo','diogo@gmail.com');
insert into clientes values(08,'547896132547','Paulo','paulo@gmail.com');

select * from clientes;

create table carros(
id INTEGER PRIMARY key,
modelo char(3) not null,
cor char(14) not null,
preco varchar(254) not null
);

insert into carros values(01,'YZE','verde','14400');
insert into carros values(02,'KZI','amarelo','36888');
insert into carros values(03,'TUE','verde','79999');
insert into carros values(04,'OPA','vermelho','65873');
insert into carros values(05,'TMM','preto','27771');
insert into carros values(06,'IZN','azul','657882');
insert into carros values(07,'EWQ','verde','867301');
insert into carros values(08,'RUY','branco','76945');
insert into carros values(09,'WWC','cinza','746452');

select * from carros;

create table vendas(
id INTEGER PRIMARY key,
clientes char(14) not null,
valor char(14) not null,
forma_pagamento char(14) not null,
status char(14) not null,
data_compra date not null
);

insert into vendas values(01,'Ayan','36888','debito','Pago','2022-06-08');
insert into vendas values(02,'Thiago','79999','debito','Pago','2024-02-10');
insert into vendas values(03,'Ayan','27771','credito','Em andamento','2026-01-22');
insert into vendas values(04,'Caio','76945','debito','Pago','2020-09-19');
insert into vendas values(05,'Paulo','657882','credito','Em andamento','2024-11-12');
insert into vendas values(06,'Diogo','657882','debito','Pago','2018-09-29');

select * from vendas






