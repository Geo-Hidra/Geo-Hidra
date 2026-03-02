CREATE DATABASE projeto_pi;
USE projeto_pi;

CREATE TABLE obra (
    idObra INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    localizacao VARCHAR(80) NOT NULL,
    construtora VARCHAR(60) NOT NULL,
    dataInicio DATE NOT NULL,
    previsaoTermino DATE,
    situacao VARCHAR(20) NOT NULL,
    CONSTRAINT chObra CHECK (situacao IN ('planejamento', 'execucao', 'finalizada', 'paralisada'))
);

CREATE TABLE ambiente_monitorado (
    idAmbiente INT PRIMARY KEY AUTO_INCREMENT,
    idObra INT NOT NULL,
    descricao VARCHAR(50) NOT NULL,
    umidadeMin DECIMAL(5,2),
    umidadeMax DECIMAL(5,2)
);

CREATE TABLE equipamento_sensor (
    idEquipamento INT PRIMARY KEY AUTO_INCREMENT,
    idAmbiente INT NOT NULL,
    tipo VARCHAR(40),
    dataAtivacao DATE,
    situacaoEquip VARCHAR(20) NOT NULL,
    CONSTRAINT chEquipamento CHECK (situacaoEquip IN ('funcionando', 'desligado', 'manutencao'))
);

CREATE TABLE registro_umidade (
    idRegistro INT PRIMARY KEY AUTO_INCREMENT,
    idEquipamento INT NOT NULL,
    momento DATETIME NOT NULL,
    percentual DECIMAL(5,2) NOT NULL,
    CONSTRAINT chRegistro CHECK (percentual >= 0 AND percentual <= 100)
);

CREATE TABLE ocorrencia (
    idOcorrencia INT PRIMARY KEY AUTO_INCREMENT,
    idEquipamento INT NOT NULL,
    momento DATETIME NOT NULL,
    gravidade VARCHAR(20) NOT NULL,
    detalhe VARCHAR(100),
    estado VARCHAR(20) NOT NULL,
    CONSTRAINT chOcorrenciaGrav CHECK (gravidade IN ('baixo', 'moderado', 'alto', 'urgente')),
    CONSTRAINT chOcorrenciaEstado CHECK (estado IN ('aberto', 'andamento', 'encerrado'))
);

CREATE TABLE responsavel_sistema (
    idResponsavel INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    loginEmail VARCHAR(60) NOT NULL,
    senha VARCHAR(60) NOT NULL,
    funcao VARCHAR(20) NOT NULL,
    CONSTRAINT chResponsavel CHECK (funcao IN ('admin', 'engenharia', 'operacao', 'consulta'))
);