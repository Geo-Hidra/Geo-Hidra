CREATE DATABASE projetoPI;

USE projetoPI;

CREATE TABLE obra(
idObra INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nomeDoProjeto VARCHAR(60) NOT NULL,
construtora VARCHAR (50) NOT NULL,
inicioDaObra DATE,
terminoDaObra DATE,
statusDaObra VARCHAR(20)
);


CREATE TABLE regiaoObra(
idRegiao INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
endereco VARCHAR(40),
mediaChuvas DECIMAL (5,2),
frequenciaFalhas VARCHAR(40),
risco VARCHAR (10)
);

CREATE TABLE sensor(
idSensor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
profundidade DECIMAL(3,2),
dataInstalacao DATE,
statusDoSensor VARCHAR(10)
);

CREATE TABLE construcao(
idTipodeSolo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
tipoDeSolo VARCHAR (10),
fundacao VARCHAR (15),
limiteUmidade DECIMAL (3,2),
riscoSolo VARCHAR (20)
);

CREATE TABLE equipe(
idProfissional INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR (30),
cargo VARCHAR (20),
telefone CHAR(14),
turno VARCHAR(10)
);

CREATE TABLE etapas(
idEtapa INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
fase VARCHAR(20),
dataInicio DATETIME,
condicaoNecessaria VARCHAR (20),
statusEtapa VARCHAR (20)
);