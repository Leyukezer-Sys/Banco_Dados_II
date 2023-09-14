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

ALTER TABLE Usuario ADD ativo_usu BOOL DEFAULT TRUE;
ALTER TABLE Usuario ADD sexo_usu CHAR AFTER email_usu;
INSERT INTO usuario (id_usu, nome_usu, email_usu,sexo_usu, data_cadastro_usu, data_nascimento_usu, ativo_usu)
VALUES 
	   (null, 'Lucas da Silva Guilherme','lucassguilherme159@gmail.com','M', '2023-09-13', '1994-04-10',TRUE),
	   (null, 'Ádrian Henrique Ferreira','adrianhenriqueferreiraopo@gmail.com','M', '2023-09-13', '2000-01-01',true),
	   (null, 'Rubens Gomes da Silva','rubinho_paraf@hotmail.com','M', '2023-09-13', '1977-05-07',TRUE),
       (null, 'Ana Beatriz Tomaz de Sá','anabeatrizts.12@gmail.com','F', '2023-09-13', '2003-12-12',FALSE),
       (null, 'Andressa Lorena de Moura Marinho','andressalorena09@gmail.com','F', '2023-09-13', '2001-04-02',TRUE),
       (null, 'Anny Stele Fernandes da Silva','annysfs@gmail.com', 'F','2023-09-13', '1994-05-20',TRUE),
       (null, 'Bruno Santos Ferreira','brunosfe.info@gmail.com', 'M','2023-09-13', '2003-06-29',TRUE),
       (null, 'Katielly Bordin Santos','katiellyscherbatsky@gmail.com','F', '2023-09-13', '2001-06-26',TRUE),
       (null, 'Cenilza da Silva Lanes','cenilza.lanes@estudante.ifro.edu.br','F', '2023-09-13', '1986-03-10',FALSE),
       (null, 'Douglas Melo Cutisque','douglaskutisque@gmail.com','M', '2023-09-13', '1986-05-12',TRUE),
       (null, 'Lhuany Thainara Motta Euzébio','lhuany.euzebio@estudante.ifro.edu.br','F', '2023-09-13', '2001-07-01',TRUE),
       (null, 'Maria Júlia Souza de Albuquerque Lins','majuhlins76@gmail.com','F', '2023-09-13', '2003-09-11',TRUE),
       (null, 'Eidy Naray Alves da Silva','eidyalves3@gmail.com','F', '2023-09-13', '2003-12-10',TRUE),
       (null, 'Raiane Alves de Macedo','raianealvesmacedo15@gmail.com','F', '2023-09-13', '2005-02-09',TRUE),
       (null, 'Fabiano Brito de Souza','fabianobrito99.fbs@gmail.com','M', '2023-09-13', '2000-09-09',TRUE),
       (null, 'Igor do Nascimento Mendes','igor.mendes.3939503@gmail.com','M', '2023-09-13', '1998-03-06',TRUE),
       (null, 'Jefferson Borges Saldanha','jeffersongege@hotmail.com.br','M', '2023-09-13', '1990-01-03',FALSE),
       (null, 'Amanda Teodoro Cunha','amandateodoro1408@gmail.com','F', '2023-09-13', '2003-09-02',true),
       (null, 'Leidervan Ortiz Francisqueti de Oliveira','leidervan1234@gmail.com','M', '2023-09-13', '2003-02-08',TRUE),
       (null, 'Leyukezer Cruz de Lima','leyukezer@gmail.com','M', '2023-09-13', '2002-06-21',TRUE),
       (null, 'Edson Fernando Souza Bezerra','ed.f3rn@gmail.com','M', '2023-09-13', '2001-06-08',TRUE),
       (null, 'Luan Mateus Teofilo de Lima','luanmateus2002@gmail.com', 'M', '2023-09-13', '2001-08-28',TRUE),
       (null, 'Lucas da Silva Nunes','lucas.silvaifro@gmail.com','M', '2023-09-13', '2002-09-13',TRUE),
       (null, 'Naiany Moreira França','naianymfranca@gmail.com','F', '2023-09-13', '2003-09-18',TRUE),
       (null, 'Luiz Fernando da Silva Ramos','Luiz11fernando@hotmail.com','M', '2023-09-13', '2000-11-16',TRUE),
       (null, 'Marcos Edson Anerio dos Santos','marcosedsonanerio@hotmail.com','M', '2023-09-13', '2002-10-01',TRUE),
       (null, 'Natália da Silva Fernandes','fernandesnataliadasilva454@gmail.com','F', '2023-09-13', '2003-05-28',TRUE),
       (null, 'Vitor dos Reis Eugenio','vitorreiseugenio@gmail.com','M', '2023-09-13', '2003-04-18',FALSE),
       (null, 'Sabrina Rodrigues dos Santos','sabrina.ifro@gmail.com','F', '2023-09-13', '2002-08-02',FALSE),
       (null, 'Thiago Apolinário Câmara Bráz','cartuchomais@hotmail.com','M', '2023-09-13', '1981-07-06',TRUE),
       (null, 'Vitor Viana Silva','vitorpoke01@gmail.com','M', '2023-09-13', '2001-09-16',TRUE),
	   (null, 'Elias de Abreu Domingos da Silva','elias.silva@ifro.edu.br','M', '2023-09-13', '1992-07-22',TRUE);

SELECT nome_usu as "Nome Usuario", email_usu as "Email Usuario", data_nascimento_usu as "Data Nascimento Usuario" FROM Usuario ORDER BY nome_usu;

SELECT nome_usu FROM Usuario WHERE sexo_usu <> 'M' AND ativo_usu = TRUE;

SELECT nome_usu FROM Usuario WHERE nome_usu LIKE "L%"AND nome_usu LIKE "%A";

SELECT id_usu, nome_usu as "Usuarios Inativos" FROM Usuario WHERE ativo_usu = FALSE;

UPDATE Usuario SET ativo_usu = TRUE WHERE id_usu = 29;

SELECT a.texto_ass as "Assunto", d.nome_dis as "Disciplina" FROM assunto a INNER JOIN disciplina d ON fk_disciplina_id = id_dis;

#DELETE FROM Disciplina WHERE id_dis = 1;
 
#DROP DATABASE SitesQuestoes_Leyukezer;