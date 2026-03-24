create table pacientes(
cpf char(14) not null primary key,
nome varchar(30) not null,
data_nasc date not null,
telefone char(14) not null
);

create table medicos(
id_medico int not null primary key auto_increment,
nome_medico varchar(30) not null,
Especialidade varchar(35) not null
);

create table consultas(
data_consulta date not null,
cpf char(14),
id_medico int,

primary key(cpf,id_medico),

foreign key(cpf)
references pacientes(cpf),

foreign key(id_medico)
references medicos(id_medico)
);
