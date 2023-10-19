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
id_artesao INT PRIMARY KEY AUTO_INCREMENT,
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
 
 CREATE TABLE Servico (
id_servico INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(30) NOT NULL,
valor DOUBLE NOT NULL,
descricao TEXT,
observacao VARCHAR(30) NOT NULL,
fk_id_artesao INT NOT NULL,
FOREIGN KEY (fk_id_artesao) REFERENCES Artesao(id_artesao)
);

CREATE TABLE Produto (
 id_produto INT PRIMARY KEY AUTO_INCREMENT,
 nome_prod VARCHAR(30) NOT NULL,
 quantidade_prod INT NOT NULL,
 valor_prod DOUBLE NOT NULL,
 cor_prod VARCHAR(15) NOT NULL,
 tamanho_prod VARCHAR(10) NOT NULL,
 descricao_prod TEXT,
 imagem_prod BLOB,
 avaliacao_prod INT,
 fk_id_estoque INT NOT NULL,
 fk_id_fornecedor INT NOT NULL,
 FOREIGN KEY(fk_id_estoque) REFERENCES Estoque(id_estoque),
 FOREIGN KEY (fk_id_fornecedor) REFERENCES Fornecedor(id_fornecedor)
 );
 
CREATE TABLE Produto_Categoria (
id_produto_categoria INT PRIMARY KEY AUTO_INCREMENT,
fk_id_categoria INT NOT NULL,
fk_id_produto INT NOT NULL,
FOREIGN KEY(fk_id_categoria) REFERENCES Categoria(id_categoria),
FOREIGN KEY (fk_id_produto) REFERENCES Produto(id_produto)
);

CREATE TABLE Itens_Venda (
id_itens_venda INT PRIMARY KEY AUTO_INCREMENT,
quantidade_int_vend INT NOT NULL,
fk_id_servico INT,
fk_id_produto INT,
FOREIGN KEY (fk_id_servico) REFERENCES Servico(id_servico),
FOREIGN KEY (fk_id_produto) REFERENCES Produto(id_produto)
);

CREATE TABLE Venda (
id_venda INT PRIMARY KEY,
valor_total_vend DOUBLE NOT NULL,
forma_pag_vend VARCHAR(20) NOT NULL,
cupom_desc_vend DOUBLE NOT NULL,
fk_id_usuario INT NOT NULL,
fk_id_itens_venda INT NOT NULL,
FOREIGN KEY (fk_id_usuario) REFERENCES Usuario(id_usuario),
FOREIGN KEY (fk_id_itens_venda) REFERENCES Itens_Venda(id_itens_venda)
);

CREATE TABLE Entrega (
id_entrega INT PRIMARY KEY AUTO_INCREMENT,
remetente_ent VARCHAR(30) NOT NULL,
destinatario_ent VARCHAR(30) NOT NULL,
prazo_ent DATETIME NOT NULL,
cod_rastreio_ent VARCHAR(30) NOT NULL,
fk_id_endereco INT NOT NULL,
fk_id_transportadora INT NOT NULL,
fk_id_venda INT NOT NULL,
FOREIGN KEY (fk_id_endereco) REFERENCES Endereco(id_endereco),
FOREIGN KEY (fk_id_transportadora) REFERENCES Transportadora(id_transportadora),
FOREIGN KEY (fk_id_venda) REFERENCES Venda(id_venda)
);