DROP DATABASE PERFUMARIA;

CREATE DATABASE PERFUMARIA;

CREATE TABLE PERFUMARIA.PRODUTO (
  ID           BIGINT        NOT NULL AUTO_INCREMENT,
  NOME         VARCHAR(100)  NOT NULL,
  MARCA        VARCHAR(100)  NOT NULL,
  DESCRICAO    VARCHAR(1000) NULL,
  PRECO_COMPRA DECIMAL(9,2)  NOT NULL,
  PRECO_VENDA  DECIMAL(9,2)  NOT NULL,
  QUANTIDADE   INT           NOT NULL DEFAULT 0,
  DT_CADASTRO  TIMESTAMP     NOT NULL,
  CONSTRAINT PK_PRODUTO PRIMARY KEY (ID)
);

CREATE TABLE PERFUMARIA.CATEGORIA (
  ID   INT          NOT NULL AUTO_INCREMENT,
  NOME VARCHAR(100) NOT NULL,
  CONSTRAINT PK_CATEGORIA PRIMARY KEY (ID),
  CONSTRAINT UC_NOME UNIQUE (NOME)
);

CREATE TABLE PERFUMARIA.PRODUTO_CATEGORIA (
    ID_PRODUTO   BIGINT NOT NULL,
    ID_CATEGORIA INT    NOT NULL,
    CONSTRAINT FK_PRODUTO FOREIGN KEY (ID_PRODUTO) REFERENCES PERFUMARIA.PRODUTO(ID),
    CONSTRAINT FK_CATEGORIA FOREIGN KEY (ID_CATEGORIA) REFERENCES PERFUMARIA.CATEGORIA(ID)
);

CREATE TABLE PERFUMARIA.CLIENTE (
  ID BIGINT NOT NULL AUTO_INCREMENT,
  NOME VARCHAR(100) NOT NULL,
  ENDERECO VARCHAR(80),
  BAIRRO VARCHAR(80),
  CIDADE VARCHAR(80),
  ESTADO VARCHAR(2),
  CEP VARCHAR(9),
  SEXO VARCHAR(1),
  TELEFONE VARCHAR(14),
  CELULAR VARCHAR(14),
  CADASTRO TIMESTAMP NOT NULL,  
  ATIVO VARCHAR(1),  
  CONSTRAINT PK_CLIENTE PRIMARY KEY (ID)
);

CREATE TABLE PERFUMARIA.FUNCIONARIO (
  ID BIGINT  NOT NULL AUTO_INCREMENT,
  NOME VARCHAR(100) NOT NULL, 
  CARGO VARCHAR(80) NOT NULL,
  ENDERECO VARCHAR(80),
  BAIRRO VARCHAR(80),
  CIDADE VARCHAR(80),
  ESTADO VARCHAR(2),
  CEP VARCHAR(9),
  SEXO VARCHAR(1),
  TELEFONE VARCHAR(14),
  CELULAR VARCHAR(14),
  CADASTRO TIMESTAMP NOT NULL,
  ATIVO VARCHAR(14),  
  CONSTRAINT PK_VENDEDOR PRIMARY KEY (ID)
);

CREATE TABLE PERFUMARIA.USUARIOS (
	ID BIGINT  NOT NULL AUTO_INCREMENT,
    CONSTRAINT PK_USUARIO PRIMARY KEY (ID),
    LOGIN VARCHAR(20) NOT NULL,
    NOME VARCHAR(50) NOT NULL,
    SENHA VARCHAR(10) NOT NULL,
    ATIVO VARCHAR(1)
);

CREATE TABLE PERFUMARIA.FUNCIONARIO_USUARIOS (
    ID_FUNCIONARIO   BIGINT NOT NULL,
    ID_USUARIOS BIGINT NOT NULL,
    CONSTRAINT FK_FUNCIONARIO FOREIGN KEY (ID_FUNCIONARIO) REFERENCES PERFUMARIA.FUNCIONARIO(ID),
    CONSTRAINT FK_USUARIOS FOREIGN KEY (ID_USUARIOS) REFERENCES PERFUMARIA.USUARIOS(ID)
);

CREATE TABLE PERFUMARIA.VENDA (
  ID BIGINT  NOT NULL AUTO_INCREMENT,
  CONSTRAINT PK_VENDA PRIMARY KEY (ID),
  ID_CLIENTE BIGINT NOT NULL,
  ID_FUNCIONARIO BIGINT NOT NULL,
  ID_PRODUTO BIGINT NOT NULL,
  QUANTIDADE INT NOT NULL,
  DT_VENDA TIMESTAMP NOT NULL,
  CONSTRAINT FK_VENDA_ID_CLIENTE FOREIGN KEY (ID_CLIENTE) REFERENCES PERFUMARIA.CLIENTE(ID),
  CONSTRAINT FK_VENDA_ID_FUNCIONARIO FOREIGN KEY (ID_FUNCIONARIO) REFERENCES PERFUMARIA.FUNCIONARIO(ID),
  CONSTRAINT FK_VENDA_ID_PRODUTO FOREIGN KEY (ID_PRODUTO) REFERENCES PERFUMARIA.PRODUTO(ID)
);
INSERT INTO PERFUMARIA.USUARIOS(LOGIN,NOME,SENHA,ATIVO) VALUES ("admin","Administrador","1234","S");
INSERT INTO PERFUMARIA.CATEGORIA(NOME) VALUES ("Unisex");
INSERT INTO PERFUMARIA.CATEGORIA(NOME) VALUES ("Masculina");
INSERT INTO PERFUMARIA.CATEGORIA(NOME) VALUES ("Feminina");
INSERT INTO PERFUMARIA.CATEGORIA(NOME) VALUES ("Infantil");

INSERT INTO PERFUMARIA.FUNCIONARIO(NOME, CARGO, ENDERECO, BAIRRO, CIDADE, ESTADO, CEP, SEXO, TELEFONE, CELULAR, FILIAL, ATIVO) VALUES ('Isabel Tatiane Esther Campos', 'Supervisora', 'Avenida Tabajara, 344', 'Santo Amaro', 'São Paulo', 'SP', '06452798', 'F', '1144845123', '11998563214', '1','S');
INSERT INTO PERFUMARIA.FUNCIONARIO(NOME, CARGO, ENDERECO, BAIRRO, CIDADE, ESTADO, CEP, SEXO, TELEFONE, CELULAR, FILIAL, ATIVO) VALUES ('Paulo Bernardo Marcos Vinicius', 'Atendente', 'Travessa Bom Jesus da Lapa, 32', 'Vila Mazzei', 'São Paulo', 'SP', '02311070', 'M', '1144115523', '11964528489', '2', 'S');
INSERT INTO PERFUMARIA.FUNCIONARIO(NOME, CARGO, ENDERECO, BAIRRO, CIDADE, ESTADO, CEP, SEXO, TELEFONE, CELULAR, FILIAL, ATIVO) VALUES ('Emanuel Davi Cauê Melo', 'Gerente', 'Rua Florêncio de Abreu, 157', 'Centro', 'São Paulo', 'SP', '01029901', 'M', '1156457898', '11982589669', '1','S');
INSERT INTO PERFUMARIA.FUNCIONARIO(NOME, CARGO, ENDERECO, BAIRRO, CIDADE, ESTADO, CEP, SEXO, TELEFONE, CELULAR, FILIAL, ATIVO) VALUES ('Carolina Menezes', 'Atendente', 'Avenida Inajar de Souza, 114', 'Vila Mariana', 'São Paulo', 'SP', '08452799', 'F', '1154252711', '11966477795', '1','S');

INSERT INTO PERFUMARIA.CLIENTE(NOME, ENDERECO, BAIRRO, CIDADE, ESTADO, CEP, SEXO, TELEFONE, CELULAR, ATIVO) VALUES ('Paulo Rafael Assis', 'Rua Pingo de Ouro, 32', 'Parque das Flores', 'São Paulo', 'SP', '08391572', 'M', '1155293935', '11988997766','S');
INSERT INTO PERFUMARIA.CLIENTE(NOME, ENDERECO, BAIRRO, CIDADE, ESTADO, CEP, SEXO, TELEFONE, CELULAR, ATIVO) VALUES ('Arthur Augusto Vicente da Cruz', 'Rua Serra da Sentinela, 128', 'Vila Nova Savoia', 'São Paulo', 'SP', '03531050', 'M', '1154833935', '11971742124','S');
INSERT INTO PERFUMARIA.CLIENTE(NOME, ENDERECO, BAIRRO, CIDADE, ESTADO, CEP, SEXO, TELEFONE, CELULAR, ATIVO) VALUES ('Mirella Sandra Fernandes', 'Rua Sinhazinha, 201', 'Americanópolis', 'São Paulo', 'SP', '04335140', 'F', '1154362625', '11987275455','S');
INSERT INTO PERFUMARIA.CLIENTE(NOME, ENDERECO, BAIRRO, CIDADE, ESTADO, CEP, SEXO, TELEFONE, CELULAR, ATIVO) VALUES ('Patrícia Luana Elza Ramos', 'Av. Travessa Alamanda-Cheirosa, 23', 'Vila Lourdes', 'São Paulo', 'SP', '08452710', 'F', '1154256644', '11966472217','S');

INSERT INTO PERFUMARIA.PRODUTO(NOME, MARCA, DESCRICAO, PRECO_COMPRA, PRECO_VENDA, QUANTIDADE) VALUES ('Colônia Kaiak', 'Kaiak', 'Colônia Kaiak Masculino Edição Limitada - 100ml', '60.90', '119.99', '50');
INSERT INTO PERFUMARIA.PRODUTO_CATEGORIA(ID_PRODUTO, ID_CATEGORIA) VALUES (1,2);
INSERT INTO PERFUMARIA.PRODUTO(NOME, MARCA, DESCRICAO, PRECO_COMPRA, PRECO_VENDA, QUANTIDADE) VALUES ('Desodorante Colônia', 'Luna', 'Desodorante Colônia Luna Feminino - 75ml', '79.80', '129.99', '40');
INSERT INTO PERFUMARIA.PRODUTO_CATEGORIA(ID_PRODUTO, ID_CATEGORIA) VALUES (2,3);
INSERT INTO PERFUMARIA.PRODUTO(NOME, MARCA, DESCRICAO, PRECO_COMPRA, PRECO_VENDA, QUANTIDADE) VALUES ('Deo Parfum', 'Essencial', 'Deo Parfum Essencial Exclusivo Feminino - 100ml', '99.90', '199.99', '45');
INSERT INTO PERFUMARIA.PRODUTO_CATEGORIA(ID_PRODUTO, ID_CATEGORIA) VALUES (3,3);
INSERT INTO PERFUMARIA.PRODUTO(NOME, MARCA, DESCRICAO, PRECO_COMPRA, PRECO_VENDA, QUANTIDADE) VALUES ('Água de Colônia', 'Mamãe e Bebê', 'Água de Colônia Sem Álcool Mamãe e Bebê - 100ml', '30.80', '69.99', '50');
INSERT INTO PERFUMARIA.PRODUTO_CATEGORIA(ID_PRODUTO, ID_CATEGORIA) VALUES (4,4);
INSERT INTO PERFUMARIA.PRODUTO(NOME, MARCA, DESCRICAO, PRECO_COMPRA, PRECO_VENDA, QUANTIDADE) VALUES ('Deo Parfum', 'Natura', 'Deo Parfum Natura Homem Essence - 120ml', '92.80', '140.25', '40');
INSERT INTO PERFUMARIA.PRODUTO_CATEGORIA(ID_PRODUTO, ID_CATEGORIA) VALUES (5,2);


