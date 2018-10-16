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

INSERT INTO PERFUMARIA.CATEGORIA(NOME) VALUES ("Unisex");
INSERT INTO PERFUMARIA.CATEGORIA(NOME) VALUES ("Masculina");
INSERT INTO PERFUMARIA.CATEGORIA(NOME) VALUES ("Feminina");
INSERT INTO PERFUMARIA.CATEGORIA(NOME) VALUES ("Infantil");
