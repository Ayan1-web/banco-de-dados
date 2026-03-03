create table usuario(
  empID INTEGER PRIMARY KEY,
  name Varchar(254) not null,
  cpf char(14) not null,
  data_nasc date not null,
  email varchar(254) not null
);
  
  Insert into usuario values(1,'Ayan','875901532987','2007/07/22','ayancesar@gmal.com');
  Insert into usuario values(2,'Caio','138576038217','2006/09/04','caio@gmail.com');
  Insert into usuario values(3,'Daniel','873498276453','2000/10/03','daniel@gmail.com');
  Insert into usuario values(4,'Douglas','978564726354','2003/11/23','douglas@gmail.com');
  Insert into usuario values(5,'Bruno','906874759836','2006/02/27','bruno@gmail.com');
  Insert into usuario values(6,'Alberto','9783540178693','2009/05/13','alberto@gmail.com');
  Insert into usuario values(7,'João','768594817659','2008/07/08','joao@gmail.com');
  
  select * from usuario

  create table endereco(
  empID INTEGER PRIMARY KEY,
  user_id INT,
  cep char(14) not null,
  cidade varchar(254) not null,
  estado varchar(254) not null,
  foreign KEY (user_id) references usuario(empID)
  );
  
  insert into endereco values (01,01,'4769842','Salvador','Bahia');
  insert into endereco values (02,02,'9781430','Ilheus','Bahia');
  insert into endereco values(03,03,'5468973','Porto Seguro','Bahia');
  insert into endereco values(04,04,'7685942','Alagoinhas','Bahia');
  
  select * from endereco where estado= ('Bahia')
