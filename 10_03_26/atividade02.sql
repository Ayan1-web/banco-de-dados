Create table Clientes(
id int primary key not null auto_increment,
nome varchar(30) not null,
email varchar(35) not null,
telefone char(14) not null
);

Create table Produtos(
id_produtos int primary key not null auto_increment,
nome_produto varchar(35) not null,
preco float not null,
qtde_estoque int
);

Create table Pedidos(
id_pedido int primary key not null auto_increment,
data_pedido date not null,
id int,
foreign key (id)
references cliente(id)
);

Create table Item_pedidos(
id_pedido int,
id_produto int,
qtde_compras int not null,

primary key(id_pedido, id_produto),
foreign key(id_pedido)
references Pedidos(id_pedido),
foreign key (id_produto)
references Produtos(id_produto)
);
