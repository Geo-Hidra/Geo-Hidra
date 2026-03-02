CREATE DATABASE Projeto_PI_Sprint1;

USE Projeto_PI_Sprint1;

CREATE TABLE Obra (
idObra INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
Nome_Empresa VARCHAR (50) NOT NULL,
Endereço VARCHAR (60) NOT NULL,
Data_Início DATE NOT NULL,
Data_Finalização DATE NOT NULL,
Situação_Obra VARCHAR (40) NOT NULL,
CHECK (Situação_Obra IN ('Estruturação', 'Em execução', 'Paralisada', 'Finalizada'))
);

CREATE TABLE Usuários (
idUsuario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
Nome VARCHAR (50) NOT NULL,
Email VARCHAR (60) NOT NULL,
Senha VARCHAR (60) NOT NULL,
Função VARCHAR (50) NOT NULL,
Nível_de_Acesso VARCHAR (20),
CHECK (Nível_de_Acesso IN ('Administrador', 'Operador Técnico', 'Visualizador'))
);

CREATE TABLE Sensor (
idSensor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
Serial_Code_Sensor VARCHAR (50) NOT NULL,
Modelo VARCHAR (50) NOT NULL,
Data_de_Instalação DATETIME,
Setor_Obra VARCHAR (50) NOT NULL,
CHECK (Setor_Obra IN ('Norte', 'Sul', 'Leste', 'Oeste')),
Status_Sensor VARCHAR (50),
CHECK (Status_Sensor IN ('Ativo', 'Inativo', 'Manutenção'))
);

CREATE TABLE Leituras (
idLeitura INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
Data_Leitura DATETIME NOT NULL,
Valores_Umidade DECIMAL (4,2) NOT NULL,
Alertas VARCHAR (25) NOT NULL,
CHECK (Valores_Umidade >= 0 AND Valores_Umidade <=100),
CHECK (Alertas IN ('Ótimo', 'Normal', 'Atenção', 'Crítico'))
);

CREATE TABLE Alertas (
idAlertas INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
idSensor INT NOT NULL,
Data_Hora DATETIME NOT NULL,
Valor_Umidade DECIMAL (4,2) NOT NULL,
Setor_Obra VARCHAR (50) NOT NULL,
CHECK (Setor_Obra IN ('Norte', 'Sul', 'Leste', 'Oeste')),
Alertas VARCHAR (25) NOT NULL,
CHECK (Alertas IN ('Ótimo', 'Normal', 'Atenção', 'Crítico'))
);


