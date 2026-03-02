CREATE DATABASE projetopi;
USE projetopi;

/*
PROJETO DE PI – GRUPO 03

Este arquivo contém:

1) O SCRIPT OFICIAL DO GRUPO (primeira parte do documento),
que representa a modelagem das tabelas criadas e definidas em conjunto e é o único
script destinado à execução e avaliação.

2) Os scripts individuais de cada integrante do grupo,
incluídos apenas para fins de registro e comparação das propostas
desenvolvidas individualmente.

Observação:
Caso o arquivo seja executado integralmente, poderão ocorrer conflitos
de criação de tabelas com o mesmo nome, pois os scripts individuais
não foram projetados para execução conjunta, apenas para apresentação.
*/

-- Início script Grupo 03 - Projeto de PI

CREATE TABLE obra (
idObra INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nomeEmpresa VARCHAR (50) NOT NULL,
endereco VARCHAR (60) NOT NULL,
dataInicio DATE NOT NULL,
dataFinalizacao DATE NOT NULL,
situacaoObra VARCHAR (40) NOT NULL,
CHECK (situacaoObra IN ('Estruturação', 'Em execução', 'Paralisada', 'Finalizada'))
);

CREATE TABLE usuarios (
idUsuario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR (50) NOT NULL,
email VARCHAR (60) NOT NULL,
senha VARCHAR (60) NOT NULL,
funcao VARCHAR (50) NOT NULL,
nivelAcesso VARCHAR (20),
CHECK (nivelAcesso IN ('Administrador', 'Operador Técnico', 'Visualizador'))
);

CREATE TABLE sensor (
idSensor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
idObra INT NOT NULL,
serialCodeSensor VARCHAR (50) NOT NULL,
modelo VARCHAR (50) NOT NULL,
dataInstalacao DATETIME,
setorObra VARCHAR (50) NOT NULL,
CHECK (setorObra IN ('Norte', 'Sul', 'Leste', 'Oeste')),
statusSensor VARCHAR (50),
CHECK (statusSensor IN ('Ativo', 'Inativo', 'Manutenção'))
);

CREATE TABLE leitura (
idLeitura INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
idSensor INT NOT NULL,
dataLeitura DATETIME NOT NULL,
valoresUmidade DECIMAL (4,2) NOT NULL,
alerta VARCHAR (25) NOT NULL,
CHECK (valoresUmidade >= 0 AND valoresUmidade <= 100),
CHECK (alerta IN ('Ótimo', 'Normal', 'Atenção', 'Crítico'))
);

CREATE TABLE alerta (
idAlerta INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
idSensor INT NOT NULL,
dataHora DATETIME NOT NULL,
valorUmidade DECIMAL (4,2) NOT NULL,
alertas VARCHAR (25) NOT NULL,
CHECK (valorUmidade >= 0 AND valorUmidade <= 100),
CHECK (alertas IN ('Ótimo', 'Normal', 'Atenção', 'Crítico'))
);

INSERT INTO obra (nomeEmpresa, endereco, dataInicio, dataFinalizacao, situacaoObra)
VALUES
('Construtora TerraCota LTDA', 'Rua das Palmeiras, 120', '2025-01-10', '2025-12-20', 'Em execução'),
('Engenharia BetaSoccer', 'Av. Palestra Itália, 450', '2024-03-01', '2024-11-30', 'Finalizada');

INSERT INTO usuarios (nome, email, senha, funcao, nivelAcesso)
VALUES
('Carlos Silva', 'carlos@email.com
', '143876', 'Engenheiro', 'Administrador'),
('Mariana Souza', 'mariana@email.com
', 'ab1f2h3', 'Técnica', 'Operador Técnico'),
('João Lima', 'joao@email.com
', 'senha789', 'Estagiário', 'Visualizador');

INSERT INTO sensor (idObra, serialCodeSensor, modelo, dataInstalacao, setorObra, statusSensor)
VALUES
(1, 'SN-001', 'HS-300', '2025-01-15 08:30:00', 'Norte', 'Ativo'),
(1, 'SN-002', 'HS-300', '2025-01-16 09:00:00', 'Sul', 'Ativo'),
(2, 'SN-003', 'XT-100', '2024-03-10 10:15:00', 'Leste', 'Inativo');

INSERT INTO leitura (idSensor, dataLeitura, valoresUmidade, alerta)
VALUES
(1, '2025-02-01 14:00:00', 45.50, 'Normal'),
(1, '2025-02-02 14:00:00', 78.20, 'Atenção'),
(2, '2025-02-01 15:30:00', 30.00, 'Ótimo'),
(3, '2024-04-01 11:00:00', 90.00, 'Crítico');

INSERT INTO alerta (idSensor, dataHora, valorUmidade, alertas)
VALUES
(1, '2025-02-02 14:00:00', 78.20, 'Atenção'),
(3, '2024-04-01 11:00:00', 90.00, 'Crítico');

SELECT * FROM obra;

SELECT * FROM sensor
WHERE statusSensor = 'Ativo';

SELECT * FROM leitura
WHERE alerta = 'Crítico';

SELECT * FROM alerta;

SELECT * FROM leitura
WHERE idSensor = 1;

SELECT * FROM obra
WHERE situacaoObra = 'Em execução';



-- FIM script Grupo 03 - Projeto de PI



-- Abaixo estão as tabelas individuais de cada aluno do grupo 03

-- Início script Dayvid José da Silva Dias

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
    resolvido INT NOT NULL,
    CHECK (nivel IN ('baixo', 'medio', 'alto', 'critico')),
    CHECK (resolvido IN (0,1))
);

-- FIM script Dayvid José da Silva Dias

-- Início script Diego Abreu de Souza

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
    idObra INT, FOREIGN KEY (idObra) REFERENCES obra(idObra),
    nomeZona VARCHAR (15) NOT NULL CONSTRAINT chZona check (nomeZona IN ('zona sul', 'zona norte', 'zona oeste', 'zona leste')),
    limiteUmidade VARCHAR (4)
    );
    
    CREATE TABLE sensor(
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    idZona INT, FOREIGN KEY (idZona) REFERENCES zonaObra (idZona),
    modelo VARCHAR (45),
    stats VARCHAR (10) CONSTRAINT chStats CHECK (stats IN ('Ativo', 'Offline', 'Manutenção')),
    dataInstalacao DATETIME
    );
    
    CREATE TABLE dados(
    idDados INT PRIMARY KEY AUTO_INCREMENT,
    idSensor INT, FOREIGN KEY (idSensor) REFERENCES sensor (idSensor),
    tempo DATETIME,
    nivelUmidade DECIMAL (4,2) CONSTRAINT chNivel CHECK (nivelUmidade >= 0 AND nivelUmidade <= 100)
    );
    
    CREATE TABLE avisos(
    idAlerta INT PRIMARY KEY AUTO_INCREMENT,
    idSensor INT, FOREIGN KEY (idSensor) REFERENCES sensor (idSensor),
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
    );
    
    -- FIM script Diego Abreu de Souza
    
    -- Início script Felipe Falconi de Azevedo
    
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

-- FIM script Felipe Falconi de Azevedo

-- Início script Luis Henrique Barreira

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

-- FIM script Luis Henrique Barreira

-- Início script Paulo Henrique Lima Silva

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

-- FIM script Paulo Henrique Lima Silva

-- Início script Roger Bozzo

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

-- FIM script Roger Bozzo

-- Início script Thamyres da Silva Batista

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

-- FIM script Thamyres da Silva Batista