CREATE DATABASE e_games; 
USE e_games; 

CREATE TABLE Cliente(
idCliente INT NOT NULL PRIMARY KEY,
nmCliente VARCHAR(50) NOT NULL,
telefone DECIMAL (11) NOT NULL,
email CHAR(50) NOT NULL,
cpf CHAR (11)NOT NULL,
dtNasc DATE NOT NULL
);

CREATE TABLE Pedido(
idPedido INT NOT NULL PRIMARY KEY,
dtPedido DATE NOT NULL,
idCliente INT NOT NULL,
valorTotalPd DECIMAL (6,2) NOT NULL,
metodoPag CHAR (7) NOT NULL,
FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente)
);

CREATE TABLE Item_pedido(
idItemPedido INT NOT NULL PRIMARY KEY,
Qntd DECIMAL (5) NOT NULL,
preçoUnid DECIMAL (5,2) NOT NULL,
preçoTotalItem DECIMAL (6,2) NOT NULL,
idPedido INT NOT NULL,
idProduto INT NOT NULL,
FOREIGN KEY (idPedido) REFERENCES Pedido (idPedido),
FOREIGN KEY (idProduto) REFERENCES Produto (idProduto)
);

SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE Produto(
idProduto INT NOT NULL PRIMARY KEY,
nmdoJogo VARCHAR(50) NOT NULL,
sinopse VARCHAR(700) NOT NULL,
preco DECIMAL(5,2) NOT NULL,
qntdEstoque DECIMAL(3,0) NOT NULL,
idCategoria INT NOT NULL,
FOREIGN KEY (idCategoria) REFERENCES Categoria (idCategoria)
);

CREATE TABLE Categoria(
idCategoria INT NOT NULL PRIMARY KEY,
nmCategoria VARCHAR(60) NOT NULL,
descricao VARCHAR(500) NOT NULL
);

CREATE TABLE CategoriaProduto(
idCategoria INT NOT NULL,
idProduto INT NOT NULL,
FOREIGN KEY (idCategoria) REFERENCES Categoria (idCategoria),
FOREIGN KEY (idProduto) REFERENCES Produto (idProduto)
);

CREATE TABLE Fornecedor (
idFornecedor INT NOT NULL PRIMARY KEY,
nmFornecedor VARCHAR(50) NOT NULL,
CNPJ NUMERIC(14,0) NOT NULL,
telefone NUMERIC(11,0) NOT NULL,
email CHAR(50) NULL
);

CREATE TABLE FornProduto(
precoUnit DECIMAL(5,2) NOT NULL,
prazoEntrega DATE NOT NULL,
idFornecedor INT NOT NULL,
idProduto INT NOT NULL,
FOREIGN KEY(idFornecedor) REFERENCES Fornecedor (idFornecedor),
FOREIGN KEY(idProduto) REFERENCES Produto (idProduto)
);

CREATE TABLE Nuvem (
idNuvem INT NOT NULL PRIMARY KEY,
capacidade DECIMAL(4,0) NOT NULL 
);

CREATE TABLE TipoPagamento (
idTipoPag INT NOT NULL PRIMARY KEY,
Metodo CHAR (7) NOT NULL,
BandeiraCartao CHAR (50) NULL,
NumeroCartao DECIMAL(25,0) NULL,
CVV DECIMAL(3,0) NULL,
NomeCartao VARCHAR(50) NULL,
cpf CHAR (11)NOT NULL,
dtValidade DATE NULL,
chavePix CHAR(50) NULL
);

CREATE TABLE Pagamento(
idPagamento INT NOT NULL,
idPedido INT NOT NULL,
dtPagamento DATE NOT NULL,
MetodoPag CHAR (7) NOT NULL,
ValorPag DECIMAL(6,2) NOT NULL,
StatusPag BOOLEAN NOT NULL,
FOREIGN KEY (idPedido) REFERENCES Pedido (idPedido)
);

CREATE TABLE NotaFiscal(
idNotaFiscal INT NOT NULL,
idPedido INT NOT NULL,
dtEmissao DATE NOT NULL,
ValorTotal DECIMAL (6,2) NOT NULL,
FOREIGN KEY (idPedido) REFERENCES Pedido (idPedido)
);

CREATE TABLE Locacao(
idLocacao INT NOT NULL PRIMARY KEY,
idNuvem INT NOT NULL,
idPedido INT NOT NULL,
dtEntrada DATE NOT NULL,
dtSaida DATE NOT NULL,
FOREIGN KEY (idNuvem) REFERENCES Nuvem (idNuvem),
FOREIGN KEY (idPedido) REFERENCES Pedido (idPedido)
);

