CREATE DATABASE Tema2_Artesanato;

USE Tema2_Artesanato;

CREATE TABLE Estado(
id_estado INT PRIMARY KEY AUTO_INCREMENT, 
nome_est VARCHAR(50) NOT NULL, 
uf_est VARCHAR(3) NOT NULL UNIQUE
);

CREATE TABLE Categoria(
id_categoria INT PRIMARY KEY AUTO_INCREMENT,
nome_cat VARCHAR(20) NOT NULL
);

CREATE TABLE Estoque(
id_estoque INT PRIMARY KEY AUTO_INCREMENT,
quantidade_est INT NOT NULL
);

CREATE TABLE Cidade(
id_cidade INT PRIMARY KEY AUTO_INCREMENT, 
nome_cidade VARCHAR(50) NOT NULL, 
fk_id_estado INT NOT NULL,
FOREIGN KEY (fk_id_estado) REFERENCES Estado(id_estado)
);

CREATE TABLE Endereco(
id_endereco INT PRIMARY KEY AUTO_INCREMENT, 
cep_end INT NOT NULL, 
rua_end VARCHAR(80) NOT NULL,
numero_end INT NOT NULL,
bairro_end VARCHAR(50) NOT NULL,
ponto_ref_end VARCHAR(20),
fk_id_cidade INT NOT NULL,
FOREIGN KEY (fk_id_cidade) REFERENCES Cidade(id_cidade)
);

CREATE TABLE Usuario(
id_usuario INT PRIMARY KEY AUTO_INCREMENT,
nome_usu VARCHAR(20) NOT NULL,
email_usu VARCHAR(50) NOT NULL UNIQUE,
cpf_usu VARCHAR(11) NOT NULL,
sexo_usu VARCHAR(10) NOT NULL,
senha_usu VARCHAR(255) NOT NULL,
fk_id_endereco INT NOT NULL,
FOREIGN KEY (fk_id_endereco) REFERENCES Endereco(id_endereco)
);

CREATE TABLE Transportadora(
id_transportadora INT PRIMARY KEY AUTO_INCREMENT,
nome_tran VARCHAR(20) NOT NULL,
telefone_tran VARCHAR(16) NOT NULL,
fk_id_endereco INT NOT NULL,
FOREIGN KEY (fk_id_endereco) REFERENCES Endereco(id_endereco)
);

CREATE TABLE Artesao(
id_art INT PRIMARY KEY AUTO_INCREMENT,
nome_art VARCHAR(20) NOT NULL,
sexo_art VARCHAR(10) NOT NULL,
telefone_art VARCHAR(16) NOT NULL,
fk_id_endereco INT NOT NULL,
FOREIGN KEY (fk_id_endereco) REFERENCES Endereco(id_endereco)
);

CREATE TABLE Fornecedor(
id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
nome_for VARCHAR(20) NOT NULL,
cnpj_for VARCHAR(14) NOT NULL,
telefone_for VARCHAR(16) NOT NULL,
fk_id_endereco INT NOT NULL,
FOREIGN KEY (fk_id_endereco) REFERENCES Endereco(id_endereco)
);

