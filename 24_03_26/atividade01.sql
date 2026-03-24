create table funcionario(
id int auto_increment primary key unique,
nome varchar(60) not null,
salario float not null,
departamento varchar(80) not null,
create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO funcionario (nome, salario, departamento) VALUES
('Carlos', 3000, 'TI'),
('Maria', 4500, 'RH'),
('João', 5000, 'TI'),
('Ana', 3500, 'Financeiro'),
('Pedro', 2800, 'RH');

select * from funcionarios;

select nome from funcionario;
select count(*) from funcionario;
select nome from funcionario where departamento='TI';
select count(*) from funcionario where departamento='TI';
select * from funcionario where salario>4000;
select count(*) from funcionario where salario>4000;

insert into funcionario(nome,salario,departamento)
values('Juliana',4200,'TI');

update funcionario set salario = 3500 where id = 1;
update funcionario set salario = 4950 where id = 2;
update funcionario set salario = 3080 where id = 5;

delete from funcionario where id = 5;

select * from funcionario
order by salario desc;

select AVG(salario) from funcionario;
select max(salario) from funcionario;
select min(salario) from funcionario;

update funcionario set salario = 3675 where id = 1;
