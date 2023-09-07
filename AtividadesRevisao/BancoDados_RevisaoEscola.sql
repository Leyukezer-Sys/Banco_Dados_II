CREATE DATABASE IF NOT EXISTS Diciplina_Aluno;

USE Diciplina_Aluno;

CREATE TABLE IF NOT EXISTS Disciplina(
id_disc INT PRIMARY KEY AUTO_INCREMENT,
nome_disc VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Aluno(
id_alun INT PRIMARY KEY AUTO_INCREMENT,
nome_alun VARCHAR(50) NOT NULL,
cpf_alun VARCHAR(14) NOT NULL UNIQUE,
email_alun VARCHAR(80) NOT NULL UNIQUE,
dataNasci_alun DATE NOT NULL
);

INSERT INTO Disciplina VALUES (null, "BANCO DE DADOS II"),(null, "PROGRAMAÇÃO ORIENTADA AO OBJETO");

INSERT INTO Aluno Values (null, "Edson Fernando", "877.283.542-72", "Edson.fernando@email.com", '2001-08-06'),
(null, "Maria Julia", "717.223.822-28", "Maria.Julia@email.com", '2003-09-11'),
(null, "Amanda Teodoro", "650.219.022-70", "Amanda.Teodoro@email.com", '2003-09-14'),
(null, "Luan Matheus", "837.340.012-50", "Luan.Matheus@email.com", '2001-08-28'),
(null, "Bruno", "109.335.902-10", "Bruno@email.com", '2003-06-29'),
(null, "Thiago", "308.897.262-64", "thiago@email.com", '1981-06-07'),
(null, "Elias Abreu", "766.146.552-30", "Elias@email.com", '1982-07-22'),
(null, "Rubens", "790.569.272-80", "Rubens@email.com", '1977-07-05'),
(null, "Katiele", "841.500.612-89", "Katiele@email.com", '2001-06-26'),
(null, "Ana Beatriz", "211.018.802-28", "Ana.Beatriz@email.com", '2002-12-12');

ALTER TABLE Aluno ADD sexo_alun VARCHAR(9) NOT NULL;

UPDATE Aluno SET sexo_alun = "MASCULINO" WHERE id_alun = 1;
UPDATE Aluno SET sexo_alun = "FEMININO" WHERE id_alun = 2;
UPDATE Aluno SET sexo_alun = "FEMININO" WHERE id_alun = 3;
UPDATE Aluno SET sexo_alun = "MASCULINO" WHERE id_alun = 4;
UPDATE Aluno SET sexo_alun = "MASCULINO" WHERE id_alun = 5;
UPDATE Aluno SET sexo_alun = "MASCULINO" WHERE id_alun = 6;
UPDATE Aluno SET sexo_alun = "MASCULINO" WHERE id_alun = 7;
UPDATE Aluno SET sexo_alun = "MASCULINO" WHERE id_alun = 8;
UPDATE Aluno SET sexo_alun = "FEMININO" WHERE id_alun = 9;
UPDATE Aluno SET sexo_alun = "FEMININO" WHERE id_alun = 10;

select * from Aluno ORDER BY nome_alun;

DELETE FROM Aluno WHERE dataNasci_alun < '1990-01-01';

select * from Aluno ORDER BY nome_alun;