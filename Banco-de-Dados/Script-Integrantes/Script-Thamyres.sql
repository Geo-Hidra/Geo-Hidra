CREATE DATABASE projeto_pi_solo;
USE projeto_pi_solo;

CREATE TABLE obra (
    idObra INT PRIMARY KEY AUTO_INCREMENT,
    contrutora VARCHAR(60) NOT NULL,
    nomeProjeto VARCHAR(80) NOT NULL,
    inicio DATE NOT NULL,
    termino DATE,
    statusObra VARCHAR(20) NOT NULL
    );
    
CREATE TABLE regiao(
	idRegiao INT PRIMARY KEY AUTO_INCREMENT,
    endereco VARCHAR(100) NOT NULL,
    mediaChuvas DECIMAL (5,2),
    Falhas VARCHAR(40),
    Risco VARCHAR(10)
);

CREATE TABLE sensor(
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    profundidade DECIMAL(3,2),
    statusSensor VARCHAR(10),
    dataInstalacao DATE
);

CREATE TABLE constução(
	idConstucao INT PRIMARY KEY AUTO_INCREMENT,
    tipoDeSolo VARCHAR(10),
    limiteUmidade DECIMAL (5,2),
    risco VARCHAR(10)
);

CREATE TABLE equipe(
	idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    cargo VARCHAR(20),
    telefone CHAR(11),
    turnoTrabalho VARCHAR(5)
);

CREATE TABLE etapas(
	idEtapas INT PRIMARY KEY AUTO_INCREMENT,
    faseObra VARCHAR(20) NOT NULL,
    inicioObra DATE NOT NULL,
    previsaoObra DATE
);
