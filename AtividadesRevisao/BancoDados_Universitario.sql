CREATE DATABASE IF NOT EXISTS Universidade;

USE Universidade;

CREATE TABLE IF NOT EXISTS Universitario(
matricula_alu INT AUTO_INCREMENT PRIMARY KEY,
nome_alu VARCHAR(80) NOT NULL,
email_alu VARCHAR(100) UNIQUE,
telefone_alu VARCHAR(50),
dataNascimento_alu DATE NOT NULL,
ativo_alu BOOLEAN DEFAULT TRUE 
);

CREATE TABLE IF NOT EXISTS FUNCIONARIO(
id_funcionario INT PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE IF NOT EXISTS DEPARTAMENTO(
id_departamento INT PRIMARY KEY AUTO_INCREMENT
);

ALTER TABLE FUNCIONARIO ADD fk_departamento_id INT NOT NULL;
ALTER TABLE FUNCIONARIO ADD FOREIGN KEY (fk_departamento_id) REFERENCES DEPARTAMENTO(id_departamento);

DESC Universitario;

ALTER TABLE Universitario ADD  cpf_alu VARCHAR(11) NOT NULL UNIQUE;

DESC Universitario;

ALTER TABLE Universitario DROP cpf_alu;

ALTER TABLE Universitario ADD cpf_alu VARCHAR(11) NOT NULL UNIQUE AFTER nome_alu;

ALTER TABLE Universitario CHANGE ativo_alu status_alu BOOLEAN DEFAULT TRUE;

DESC Universitario;

#RENAME TABLE Universitario TO Aluno;

#SELECT * FROM Universitario;

#DROP DATABASE Universidade;

#SHOW DATABASES;