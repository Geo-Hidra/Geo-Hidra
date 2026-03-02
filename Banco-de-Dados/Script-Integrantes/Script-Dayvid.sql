CREATE DATABASE projetopi;
USE projetopi;

CREATE TABLE obra(
    idObra INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(60) NOT NULL,
    dataInicio DATE NOT NULL,
    dataFimPrevisto DATE,
    statusObra VARCHAR(30) NOT NULL,
    CHECK (statusObra IN ('planejamento', 'em_andamento', 'concluida', 'suspensa'))
);

CREATE TABLE sensor(
    idSensor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    codigoIdentificacao VARCHAR(50) NOT NULL,
    profundidadeInstalacao DECIMAL(5,2),
    dataInstalacao DATE,
    statusSensor VARCHAR(20) NOT NULL,
    CHECK (statusSensor IN ('ativo', 'inativo', 'manutencao'))
);

CREATE TABLE usuario(
    idUsuario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL,
    perfil VARCHAR(20) NOT NULL,
    CHECK (perfil IN ('administrador', 'engenheiro', 'gestor'))
);

CREATE TABLE leitura(
    idLeitura INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    valorUmidade DECIMAL(5,2) NOT NULL,
    dataHora DATETIME NOT NULL,
    nivelAlerta VARCHAR(20) NOT NULL,
    CHECK (valorUmidade >= 0 AND valorUmidade <= 100),
    CHECK (nivelAlerta IN ('normal', 'atencao', 'critico'))
);

CREATE TABLE alerta(
    idAlerta INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL,
    nivel VARCHAR(20) NOT NULL,
    dataHora DATETIME NOT NULL,
    resolvido BOOLEAN NOT NULL,
    CHECK (nivel IN ('baixo', 'medio', 'alto', 'critico'))
);