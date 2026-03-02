CREATE DATABASE monitoramento_solo;
USE monitoramento_solo;

CREATE TABLE usuario(
id INT PRIMARY KEY auto_increment,
nome VARCHAR(50),
email VARCHAR(55) UNIQUE NOT NULL,
senha VARCHAR(30),
perfil VARCHAR(40),
CHECK (perfil IN ('cliente','equipe')),
data_criacao DATE);

CREATE TABLE obra (
id INT PRIMARY KEY AUTO_INCREMENT, 
nome VARCHAR(40),
endereco VARCHAR(70),
status_obra VARCHAR(20),
CHECK (status_obra IN ('planejando','realizando','concluida')),
data_inicio DATE,
data_prevista DATE
);

CREATE TABLE microcontroladores (
id INT PRIMARY KEY AUTO_INCREMENT,
modelo VARCHAR(45),
identificacao VARCHAR(45),
nome_obra VARCHAR(40),
status_atividade VARCHAR(30),
CHECK (status_atividade IN ('ativo', 'deligado'))
);

CREATE TABLE sensores (
id INT PRIMARY KEY AUTO_INCREMENT,
identificacao VARCHAR(40),
nome_obra VARCHAR(40),
profundidade VARCHAR(40),
identificacao_microcontrolador VARCHAR(45)
);

CREATE TABLE leitura (
id INT PRIMARY KEY AUTO_INCREMENT,
nome_obra VARCHAR (40),
umidade DECIMAL(5.2),
identificacao_sensor VARCHAR(40),
data_hora DATETIME);

CREATE TABLE alertas (
id INT PRIMARY KEY AUTO_INCREMENT,
identificacao_sensor VARCHAR(40),
dados_leitura VARCHAR(40),
tipo_umidade VARCHAR(40),
CHECK (tipo_umidade IN ('alta', 'baixa', 'estavel')),
valor_detectado DECIMAL(5.2),
limite_umidade DECIMAL (5.2),
data_hora DATETIME);


