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
enunciado_ques TEXT NOT NULL,
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

INSERT INTO Usuario (nome_usu, email_usu, data_nascimento_usu,data_cadastro_usu) VALUES("Fulano", "accont@email.com", '2000-02-18', CURDATE());
INSERT INTO Usuario (nome_usu, email_usu, data_nascimento_usu,data_cadastro_usu) VALUES("JUCK", "juck@email.com", '2000-09-09', CURDATE());
INSERT INTO Usuario (nome_usu, email_usu, data_nascimento_usu,data_cadastro_usu) VALUES("LUCK", "luck@email.com", '2000-05-10', CURDATE());
INSERT INTO Usuario (nome_usu , email_usu, data_nascimento_usu,data_cadastro_usu) VALUES("BEATH", "beath@email.com", '2000-03-28', CURDATE());
INSERT INTO Usuario (nome_usu, email_usu, data_nascimento_usu,data_cadastro_usu) VALUES("AGABE", "agabe@email.com", '2000-12-25', CURDATE());

INSERT INTO Professor (nome_prof, telefone_prof, email_prof) VALUES ("AVAST", "(69) 00000-0000", "avast@email.com");
INSERT INTO Professor (nome_prof, telefone_prof, email_prof) VALUES ("GHOST", "(69) 00000-0000", "ghost@email.com");
INSERT INTO Professor (nome_prof, telefone_prof, email_prof) VALUES ("STEVE", "(69) 00000-0000", "minecraft@email.com");
INSERT INTO Professor (nome_prof, telefone_prof, email_prof) VALUES ("ALEX", "(69) 00000-0000", "alex@email.com");
INSERT INTO Professor (nome_prof, telefone_prof, email_prof) VALUES ("MINION", "(69) 00000-0000", "minions@email.com");

INSERT INTO disciplina (nome_dis) VALUES ("BANCO DE DADOS II"), ("PROGRAMAÇÃO ORIENTADA A OBJETO"), ("LÓGICA DE PROGRAMAÇÃO");

INSERT INTO assunto (texto_ass, fk_disciplina_id) VALUES ("Encapsulamento", 2), ("Comandos DDL", 1), ("Laço de Repetição", 3),
														 ("Objetos", 2), ("Comandos DML", 1), ("IF e ELSE", 3),
                                                         ("Classes Estáticas", 2), ("Revisão Modelo Lógico", 1), ("SWITCH CASE", 3);

UPDATE disciplina SET nome_dis = "PROGRAMAÇÃO ORIENTADA AO OBJETO" WHERE id_dis = 2;

INSERT INTO Banca (nome_ban , sigla_ban) VALUES ("VESTIBULAR DA UNIVERSIDADE ESTADUAL PAULISTA", "VUNESP"), ("INSTITUTO BRASILEIRO DE FORMAÇÃO E CAPACITAÇÃO","IBFC"),
 ("INSTITUTO BRASILEIRO DE APOIO E DESENVOLVIMENTO EXECUTIVO", "IBADE");

INSERT INTO Questao (enunciado_ques, modalidade_ques, data_cadastro_quest, nivel_ques, fk_assunto_id, fk_banca_id) VALUES ("Qual a Função do Encapsulamento?", "VERDADEIRO OU FALSO", CURDATE(), "Facil", 1, 2);

INSERT INTO alternativas (gabarito_alter, texto_alter, fk_questao_id) VALUES 
(TRUE, "um mecanismo utilizado para reunir os dados e os métodos numa estrutura que pode esconder a implementação do objeto", 1), 
(FALSE, "permite que referências de tipos de classes mais abstratas representem o comportamento das classes concretas que referenciam", 1),
(FALSE, "permite a existência de vários métodos de mesmo nome, contanto que tenham assinaturas levemente diferentes",1),
(FALSE, "é o processo de pensamento em que as ideias são distanciadas dos objetos",1),
(FALSE, "permite que classes compartilhem atributos e métodos, através deste",1);


INSERT INTO Questao (enunciado_ques, modalidade_ques, data_cadastro_quest, nivel_ques, fk_assunto_id, fk_banca_id) VALUES ("Acerca dos conhecimentos sobre expressões DDL do SQL, marque a alternativa INCORRETA:", "VERDADEIRO OU FALSO", CURDATE(), "Médio", 2, 1);

INSERT INTO alternativas (gabarito_alter, texto_alter, fk_questao_id) VALUES 
(FALSE, "Permitem especificar as tabelas primárias DDL´s.", 2), 
(FALSE, "Permitem especificar esquema de ralações (tabelas).", 2),
(TRUE, "Permitem especificar autorização de acesso para cada relação.",2),
(FALSE, "Permitem especificar domínio de valores associados a cada atributo.",2),
(FALSE, "permite especificar modelagens relacionadas ao relacionamento",2);

INSERT INTO Questao (enunciado_ques, modalidade_ques, data_cadastro_quest, nivel_ques, fk_assunto_id, fk_banca_id) VALUES ("2 + 2", "VERDADEIRO OU FALSO", CURDATE(), "Fácil", 6, 3);

INSERT INTO alternativas (gabarito_alter, texto_alter, fk_questao_id) VALUES 
(FALSE, "2", 3), 
(FALSE, "3+2", 3),
(TRUE, "4",3),
(FALSE, "2.2",3),
(FALSE, "22",3);

INSERT INTO Questao (enunciado_ques, modalidade_ques, data_cadastro_quest, nivel_ques, fk_assunto_id, fk_banca_id) VALUES ("Qual das seguintes afirmações sobre classes estáticas em programação orientada a objetos está correta?", "MULTIPLA ESCOLHA", CURDATE(), "Médio", 7, 1);

INSERT INTO alternativas (gabarito_alter, texto_alter, fk_questao_id) VALUES 
(TRUE, "Classes estáticas permitem a criação de vários métodos e atributos do tipo estáticos.", 4), 
(FALSE, "Métodos estáticos podem ser chamados usando uma instância da classe.", 4),
(TRUE, "Classes estáticas são úteis para organizar constantes e variáveis imutáveis.",4),
(FALSE, "Uma classe estática pode herdar de uma classe não estática.",4),
(FALSE, "Classes estáticas permitem a aplicação de herança múltipla.",4);

INSERT INTO Questao (enunciado_ques, modalidade_ques, data_cadastro_quest, nivel_ques, fk_assunto_id, fk_banca_id) VALUES ("Qual é a principal vantagem do uso da estrutura switch case em comparação com múltiplas declarações if encadeadas em linguagens de programação?", "VERDADEIRO OU FALSO", CURDATE(), "Dificil", 9, 3);

INSERT INTO alternativas (gabarito_alter, texto_alter, fk_questao_id) VALUES 
(TRUE, "A estrutura switch case é mais eficiente em termos de desempenho.", 5), 
(FALSE, "A estrutura switch case pode lidar com condições complexas.", 5),
(FALSE, "A estrutura switch case permite a execução paralela de múltiplas condições.",5),
(FALSE, "A estrutura switch case pode ser usada para criar loops.",5),
(FALSE, "A estrutura switch case oferece mais flexibilidade na manipulação de exceções.",5);

UPDATE Questao SET nivel_ques = "EXTREMAMENTE-DIFÍCIL" WHERE id_ques = 3;

SELECT a.texto_ass as "Assunto", d.nome_dis as "Disciplina" FROM assunto a INNER JOIN disciplina d ON fk_disciplina_id = id_dis;

#DELETE FROM Disciplina WHERE id_dis = 1;
 
#DROP DATABASE SitesQuestoes_Leyukezer;