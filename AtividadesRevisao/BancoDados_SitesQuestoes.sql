CREATE DATABASE IF NOT EXISTS SitesQuestoes_Leyukezer;

USE SitesQuestoes_Leyukezer;

-- DDL

CREATE TABLE IF NOT EXISTS Usuario(
id_usu INT PRIMARY KEY AUTO_INCREMENT,
nome_usu VARCHAR(80) NOT NULL,
data_cadastro_usu DATE NOT NULL,
email_usu VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Disciplina(
id_dis INT PRIMARY KEY AUTO_INCREMENT,
nome_dis VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Banca(
id_ban INT PRIMARY KEY AUTO_INCREMENT,
nome_ban VARCHAR(80) NOT NULL,
sigla_ban VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS Professor(
id_prof INT PRIMARY KEY AUTO_INCREMENT,
nome_prof VARCHAR(80) NOT NULL,
telefone_prof VARCHAR(30) NOT NULL,
email_prof VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Assunto(
id_ass INT PRIMARY KEY AUTO_INCREMENT,
texto_ass TEXT,
fk_disciplina_id INT NOT NULL,
FOREIGN KEY (fk_disciplina_id) REFERENCES Disciplina(id_dis)
);

CREATE TABLE IF NOT EXISTS Questao(
id_ques INT PRIMARY KEY AUTO_INCREMENT,
enunciado_ques VARCHAR(50) NOT NULL,
modalidade_ques VARCHAR(20),
nivel_ques VARCHAR(20),
fk_assunto_id INT NOT NULL,
fk_banca_id INT NOT NULL,
FOREIGN KEY (fk_assunto_id) REFERENCES Assunto(id_ass),
FOREIGN KEY (fk_banca_id) REFERENCES Banca(id_ban)
);

CREATE TABLE IF NOT EXISTS Alternativas(
id_alter INT PRIMARY KEY AUTO_INCREMENT,
gabarito_alter BOOLEAN DEFAULT FALSE,
texto_alter TEXT,
fk_questao_id INT NOT NULL,
FOREIGN KEY (fk_questao_id) REFERENCES Questao(id_ques)
);

CREATE TABLE IF NOT EXISTS Resposta(
id_res INT PRIMARY KEY AUTO_INCREMENT,
data_res DATE NOT NULL,
resultado_res BOOLEAN NOT NULL,
texto_res TEXT NOT NULL,
fk_usuario_id INT NOT NULL, 
fk_questao_id INT NOT NULL,
FOREIGN KEY (fk_usuario_id) REFERENCES Usuario(id_usu),
FOREIGN KEY (fk_questao_id) REFERENCES Questao(id_ques)
);

CREATE TABLE IF NOT EXISTS Comentario(
id_com INT PRIMARY KEY AUTO_INCREMENT,
data_com DATE NOT NULL,
resposta_com TEXT,
fk_professor_id INT NOT NULL,
fk_questao_id INT NOT NULL,
FOREIGN KEY (fk_professor_id) REFERENCES Professor(id_prof),
FOREIGN KEY (fk_questao_id) REFERENCES Questao(id_ques)
);

ALTER TABLE Usuario ADD data_nascimento_usu DATE NOT NULL AFTER nome_usu;

ALTER TABLE Questao ADD data_cadastro_quest DATE NOT NULL AFTER modalidade_ques;

-- DML

INSERT INTO Usuario (nome_usu, data_cadastro_usu, email_usu, data_nascimento_usu) VALUES("Fulano", '2023-08-23', "accont@email.com", '2000-02-18');
INSERT INTO Usuario (nome_usu, data_cadastro_usu, email_usu, data_nascimento_usu) VALUES("JUCK", '2023-08-23', "juck@email.com", '2000-09-09');
INSERT INTO Usuario (nome_usu, data_cadastro_usu, email_usu, data_nascimento_usu) VALUES("LUCK", '2023-08-23', "luck@email.com", '2000-05-10');
INSERT INTO Usuario (nome_usu, data_cadastro_usu, email_usu, data_nascimento_usu) VALUES("BEATH", '2023-08-23', "beath@email.com", '2000-03-28');
INSERT INTO Usuario (nome_usu, data_cadastro_usu, email_usu, data_nascimento_usu) VALUES("AGABE", '2023-08-23', "agabe@email.com", '2000-12-25');

SELECT * FROM Usuario;

INSERT INTO Professor (nome_prof, telefone_prof, email_prof) VALUES ("AVAST", "(69) 00000-0000", "avast@email.com");
INSERT INTO Professor (nome_prof, telefone_prof, email_prof) VALUES ("GHOST", "(69) 00000-0000", "ghost@email.com");
INSERT INTO Professor (nome_prof, telefone_prof, email_prof) VALUES ("STEVE", "(69) 00000-0000", "minecraft@email.com");
INSERT INTO Professor (nome_prof, telefone_prof, email_prof) VALUES ("ALEX", "(69) 00000-0000", "alex@email.com");
INSERT INTO Professor (nome_prof, telefone_prof, email_prof) VALUES ("MINION", "(69) 00000-0000", "minions@email.com");

DESC Professor;

SELECT * FROM Professor;

#DROP DATABASE SitesQuestoes_Leyukezer;