CREATE table ALUNO(
matricula int primary key not null,
nome varchar(40)not null,
curso varchar(30)not null,
email varchar(35) unique not null
);

CREATE table PROFESSOR(
id_professor int primary key not null,
nome_professor  varchar(100)not null,
area varchar(100) not null
);

CREATE table DISCIPLINA(
codigo_disciplina int primary key not null,
nome_disciplina varchar(100),
carga_horaria int
);

CREATE table MATRICULAS(
Matricula_aluno int,
codigo_disciplina int,
semestre varchar(10),

primary key(matricula_aluno, codigo_disciplina),
foreign key(matricula_aluno)
references aluno(Matricula),
foreign key(codigo_disciplina)
references disciplina(codigo_disciplina)
);
