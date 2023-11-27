CREATE DATABASE IF NOT EXISTS Tema2_Artesanato;

USE Tema2_Artesanato;

-- DDL

CREATE TABLE IF NOT EXISTS Estado(
id_estado INT PRIMARY KEY AUTO_INCREMENT, 
nome_est VARCHAR(50) NOT NULL, 
uf_est VARCHAR(3) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Categoria(
id_categoria INT PRIMARY KEY AUTO_INCREMENT,
nome_cat VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Estoque(
id_estoque INT PRIMARY KEY AUTO_INCREMENT,
quantidade_est INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Cidade(
id_cidade INT PRIMARY KEY AUTO_INCREMENT, 
nome_cidade VARCHAR(50) NOT NULL, 
fk_id_estado INT NOT NULL,
FOREIGN KEY (fk_id_estado) REFERENCES Estado(id_estado)
);

CREATE TABLE IF NOT EXISTS Endereco(
id_endereco INT PRIMARY KEY AUTO_INCREMENT, 
cep_end INT NOT NULL, 
rua_end VARCHAR(80) NOT NULL,
numero_end INT NOT NULL,
bairro_end VARCHAR(50) NOT NULL,
ponto_ref_end VARCHAR(20),
fk_id_cidade INT NOT NULL,
FOREIGN KEY (fk_id_cidade) REFERENCES Cidade(id_cidade)
);

CREATE TABLE IF NOT EXISTS Usuario(
id_usuario INT PRIMARY KEY AUTO_INCREMENT,
nome_usu VARCHAR(20) NOT NULL,
email_usu VARCHAR(50) NOT NULL UNIQUE,
cpf_usu VARCHAR(11) NOT NULL,
sexo_usu VARCHAR(10) NOT NULL,
senha_usu VARCHAR(255) NOT NULL,
fk_id_endereco INT NOT NULL,
FOREIGN KEY (fk_id_endereco) REFERENCES Endereco(id_endereco)
);

CREATE TABLE IF NOT EXISTS Transportadora(
id_transportadora INT PRIMARY KEY AUTO_INCREMENT,
nome_tran VARCHAR(20) NOT NULL,
telefone_tran VARCHAR(16) NOT NULL,
fk_id_endereco INT NOT NULL,
FOREIGN KEY (fk_id_endereco) REFERENCES Endereco(id_endereco)
);

CREATE TABLE IF NOT EXISTS Artesao(
id_artesao INT PRIMARY KEY AUTO_INCREMENT,
nome_art VARCHAR(20) NOT NULL,
sexo_art VARCHAR(10) NOT NULL,
telefone_art VARCHAR(16) NOT NULL,
fk_id_endereco INT NOT NULL,
FOREIGN KEY (fk_id_endereco) REFERENCES Endereco(id_endereco)
);

CREATE TABLE IF NOT EXISTS Fornecedor(
id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
nome_for VARCHAR(20) NOT NULL,
cnpj_for VARCHAR(14) NOT NULL,
telefone_for VARCHAR(16) NOT NULL,
fk_id_endereco INT NOT NULL,
FOREIGN KEY (fk_id_endereco) REFERENCES Endereco(id_endereco)
);
 
 CREATE TABLE IF NOT EXISTS Servico (
id_servico INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(30) NOT NULL,
valor DOUBLE NOT NULL,
descricao TEXT,
observacao VARCHAR(30) NOT NULL,
fk_id_artesao INT NOT NULL,
FOREIGN KEY (fk_id_artesao) REFERENCES Artesao(id_artesao)
);

CREATE TABLE IF NOT EXISTS Produto (
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
 
CREATE TABLE IF NOT EXISTS Produto_Categoria (
id_produto_categoria INT PRIMARY KEY AUTO_INCREMENT,
fk_id_categoria INT NOT NULL,
fk_id_produto INT NOT NULL,
FOREIGN KEY(fk_id_categoria) REFERENCES Categoria(id_categoria),
FOREIGN KEY (fk_id_produto) REFERENCES Produto(id_produto)
);

CREATE TABLE IF NOT EXISTS Venda (
id_venda INT PRIMARY KEY,
valor_total_vend DOUBLE NOT NULL,
forma_pag_vend VARCHAR(20) NOT NULL,
cupom_desc_vend DOUBLE NOT NULL,
fk_id_usuario INT NOT NULL,
FOREIGN KEY (fk_id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE IF NOT EXISTS Itens_Venda (
id_itens_venda INT PRIMARY KEY AUTO_INCREMENT,
quantidade_int_vend INT NOT NULL,
fk_id_servico INT,
fk_id_produto INT,
fk_id_venda INT NOT NULL,
FOREIGN KEY (fk_id_servico) REFERENCES Servico(id_servico),
FOREIGN KEY (fk_id_produto) REFERENCES Produto(id_produto),
FOREIGN KEY (fk_id_venda) REFERENCES Venda(id_venda)
);


CREATE TABLE IF NOT EXISTS Entrega (
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

-- DML

INSERT INTO Estado VALUES (null, "Rondônia", "RO"), (null, "Amazonas", "AM"),
(null, "Acre","AC"), (null, "Rio de Janeiro", "RJ"), (null, "São Paulo", "SP");

INSERT INTO Categoria VALUES (null, "Artesanato"), (null, "Material");

INSERT INTO Estoque VALUES (null, 0);

INSERT INTO Cidade VALUES (null, "Ji-Paraná", 1), (null, "Manaus", 2), 
(null, "Rio Branco", 3),(null,"Cabo Frio", 4), (null,"Bebedouro", 5);

INSERT INTO Endereco VALUES (null, 76901062, "Rua Das Pedras", 937, "Jardim Presidencial", null, 1), 
(null, 69082660, "Avenida Beira Rio", 125, "Coroado", null, 2),
(null, 69911253, "Rua Tomé de Souza", 4, "Castelo Branco", null, 3),
(null, 28910360, "Rua Inglaterra", 200, "Jardim Caiçara", null, 4),
(null, 14706082, "Rua Paraguai", 223, "Jardim Maraja", null, 5);

INSERT INTO Usuario VALUES (null, "MAJU", "maju@gmail.com", '00804937265', "FEMININO", md5("123456"), 1);

INSERT INTO Transportadora VALUES (null, "ACRE EXPRESS TRANSPORTES", "(68)3229-7160", 3);

INSERT INTO Artesao VALUES (null, "Alvincy Diona Charllie", "FEMININO", "(68)98624-1735", 2);

INSERT INTO Fornecedor VALUES (NULL, "Xariff MDF Provençais", 90231618000155, "(22)3053-3810", 4);

INSERT INTO Servico VALUES (NULL, "bordar tecido", 267.50, "Bordar qualquer tipo de tecido", "somente tecidos e panos simples...", 1);

INSERT INTO Produto VALUES (NULL, "capa de almofada", 15, 36.75, "Roxo", "30cm", "capa de almofadas para travesseiros caseiros como de estofados", NULL,NULL, 1,1);

UPDATE Estoque SET quantidade_est = 15 WHERE id_estoque = 1;

INSERT INTO Produto_Categoria VALUES (NULL, 1,1);

INSERT INTO Venda VALUES (NULL, 183.75, "DINHEIRO", NULL, 1);

INSERT INTO Itens_Venda VALUES (NULL, 5, NULL,1,1);

INSERT INTO Entrega VALUES (NULL, "USUARIO", "CASA DO USUARIO", CURDATE(), "NABR0928374", 2, 1, 1);

DELETE FROM Endereco WHERE id_endereco = 5;

SELECT v.*, u.nome_usu AS "Nome do Cliente" FROM Venda v, Usuario u WHERE v.fk_id_usuario = u.id_usuario;