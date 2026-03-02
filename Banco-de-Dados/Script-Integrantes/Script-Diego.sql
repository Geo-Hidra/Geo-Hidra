CREATE DATABASE projetoSprint1;
USE projetoSprint1;

CREATE TABLE obra(
    idObra INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    empresa VARCHAR(50) NOT NULL,
    endereco VARCHAR(60) NOT NULL,
    dataInicio DATE NOT NULL,
    statusObra VARCHAR(30) NOT NULL,
    CHECK (statusObra IN ('planejamento', 'em_andamento', 'concluida'))
    );
    
    CREATE TABLE zonaObra(
    idZona INT PRIMARY KEY AUTO_INCREMENT,
    nomeZona VARCHAR (15) NOT NULL CONSTRAINT chZona check (nomeZona IN ('zona sul', 'zona norte', 'zona oeste', 'zona leste')),
    limiteUmidade VARCHAR (4)
    );
    
    CREATE TABLE sensor(
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR (45),
    stats VARCHAR (10) CONSTRAINT chStats CHECK (stats IN ('Ativo', 'Offline', 'Manutenção')),
    dataInstalacao DATETIME
    );
    
    CREATE TABLE dados(
    idDados INT PRIMARY KEY AUTO_INCREMENT,
    tempo DATETIME,
    nivelUmidade DECIMAL (4,2) CONSTRAINT chNivel CHECK (nivelUmidade >= 0 AND nivelUmidade <= 100)
    );
    
    CREATE TABLE avisos(
    idAlerta INT PRIMARY KEY AUTO_INCREMENT,
    horaAlerta DATETIME,
    nivelUrgencia VARCHAR (25) CONSTRAINT chUrgencia CHECK (nivelUrgencia IN ('Leve', 'Moderado', 'Severo')),
    statusAviso VARCHAR (25) CONSTRAINT chAviso CHECK (statusAviso IN ('Emitido', 'Andamento', 'Resolvido'))
    );
    
    CREATE TABLE usuario(
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (45),
    email VARCHAR (45),
    senha VARCHAR (75),
    nivelAcesso VARCHAR (20) CONSTRAINT chAcesso CHECK (nivelAcesso IN ('Visualizador', 'Operador', 'Administrador'))
    -- Pode apenas ver os dashboards e gráficos. Não pode alterar nada.
    -- Pode ver os dados, cadastrar novos sensores e marcar alertas como "resolvidos"
    -- Pode cadastrar novas obras, apagar registros e criar outros usuários.
    );
    
    
    
    
    
    
    