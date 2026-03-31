create table cursos(
 id_cursos int auto_increment unique not null,
 nome varchar(60) not null,
 carga_horaria int not null,
 professor varchar(35) not null,
 disciplinas int not null
 );

create table alunos(
id_aluno int primary key auto_increment unique not null,
nome varchar(35) not null,
cpf char(14) unique not null,
telefone char(14) unique not null,
idade int not null,
id_cursos int,
foreign key (id_cursos) references cursos(id_cursos)
);

insert into cursos(nome,carga_horaria,professor,disciplinas) values('POO','90','Jeovane','4');
 insert into cursos(nome,carga_horaria,professor,disciplinas) values('Python','190','Jeovane','2');
 insert into cursos(nome,carga_horaria,professor,disciplinas) values('Banco de dados','70','Gustavo','3');
 insert into cursos(nome,carga_horaria,professor,disciplinas) values('TI','280','Pablo','5');
 
 insert into alunos(nome,cpf,telefone,idade,id_cursos) values('Ayan','000000000001','988477894','22','01');
 insert into alunos(nome,cpf,telefone,idade,id_cursos) values('Diogo','000000000002','975648769','34','02');
 insert into alunos(nome,cpf,telefone,idade,id_cursos) values('Daniel','000000000003','9678465825','23','03');
  insert into alunos(nome,cpf,telefone,idade,id_cursos) values('Paulo','000000000004','9867465142','21','03');
  insert into alunos(nome,cpf,telefone,idade) values('Caio','000000000005','987658465','19');
  insert into alunos(nome,cpf,telefone,idade,id_cursos) values('Eduardo','000000000006','986745365','28','04');
  
  select alunos.nome, cursos.nome
 from alunos
 inner join cursos
 on cursos.id_cursos = alunos.id_cursos;
 
 select alunos.nome, cursos.nome as cursos
from alunos
left join cursos
on cursos.id_cursos = alunos.id_cursos;

select cursos.nome, count(*) as total_alunos
from alunos
inner join cursos
on alunos.id_cursos = cursos.id_cursos
group by cursos.id_cursos;

select id_cursos ,count(*) as total from alunos group by id_cursos HAVING COUNT(*) > 1;

select alunos.nome, alunos.id_cursos
from alunos
left join cursos
on alunos.id_cursos = cursos.id_cursos
where cursos.id_cursos is null;

select cursos.nome, avg(alunos.idade) as media_idade
from alunos
inner join cursos
on alunos.id_cursos = cursos.id_cursos
group by cursos.nome;

select alunos.nome as aluno, cursos.nome as curso
from alunos
inner join cursos
on alunos.id_cursos = cursos.id_cursos
order by alunos.nome, cursos.nome;

select cursos.nome, count(alunos.id_cursos) as total_alunos
from alunos
inner join cursos
on alunos.id_cursos = cursos.id_cursos
group by cursos.nome;

select cursos.nome, count(alunos.id_cursos) as total_alunos
from cursos
left join alunos
on alunos.id_cursos = cursos.id_cursos
group by cursos.nome
having count(alunos.id_cursos) < 3;

select cursos.nome, max(alunos.idade) as maior_idade
from alunos
inner join cursos
on alunos.id_cursos = cursos.id_cursos
group by cursos.nome;

select cursos.nome, min(alunos.idade) as menor_idade
from alunos
inner join cursos
on alunos.id_cursos = cursos.id_cursos
group by cursos.nome;

select alunos.nome
from alunos
inner join cursos
on alunos.id_cursos = cursos.id_cursos
where cursos.nome = 'TI';

select cursos.nome, count(alunos.id_cursos) as total_alunos
from cursos
left join alunos
on alunos.id_cursos = cursos.id_cursos
group by cursos.nome
order by total_alunos desc;

select cursos.nome, sum(alunos.idade) as soma_idades
from alunos
inner join cursos
on alunos.id_cursos = cursos.id_cursos
group by cursos.nome;

select cursos.nome, avg(alunos.idade) as media_idade
from alunos
inner join cursos
on alunos.id_cursos = cursos.id_cursos
group by cursos.nome
having avg(alunos.idade) > 20;

select alunos.nome, cursos.nome as curso
from alunos
left join cursos
on alunos.id_cursos = cursos.id_cursos;

select count(*) as total_cursos
from cursos;

select a.nome as aluno, c.nome as curso
from alunos as a
inner join cursos as c
on a.id_cursos = c.id_cursos;

select c.nome, count(a.id_cursos) as total_alunos
from cursos c
left join alunos a
on a.id_cursos = c.id_cursos
group by c.nome;

drop table cursos;
drop table alunos;
