-- TABELA DE Depto facilitador

CREATE TABLE depto_facilitador (

    id_depto_facilitador INT PRIMARY KEY,
	nome_facilitador VARCHAR(150) NULL UNIQUE,
	id_facilitador INT NOT NULL,
	id_depto INT NOT NULL,
	nome_depto VARCHAR(150) NULL,	
    FOREIGN KEY (nome_facilitador) REFERENCES facilitadores(nome_facilitador),
    FOREIGN KEY (id_facilitador) REFERENCES facilitadores(id_facilitador),
    FOREIGN KEY (id_depto) REFERENCES departamentos (id_depto),
    FOREIGN KEY (nome_depto) REFERENCES departamentos(nome_depto)

);

SELECT * FROM depto_facilitador;

-- TABELA DE DEPARTAMENTOS
CREATE TABLE departamentos (

    id_depto INT NOT NULL PRIMARY KEY UNIQUE,
	nome_depto varchar(150) NULL UNIQUE,
	email_depto varchar(50) NULL,
    qtde_funcionarios varchar(50) NULL,
    gerente_depto varchar(50) NULL
  
);

-- TABELA DE EQUIPAMENTOS
CREATE TABLE equipamentos (

    id_equipamento INT NOT NULL PRIMARY KEY UNIQUE,
	tipo varchar(50) NULL,
	ean varchar(50) NULL,
    estoque varchar(50) NULL,
    prazo_emprestimo varchar(50) NULL,
    id_aluno INT NOT NULL

);

-- TABELA DE FACILITADORES
CREATE TABLE facilitadores (

    id_facilitador INT NOT NULL PRIMARY KEY UNIQUE,
	nome_facilitador varchar(150) NOT NULL UNIQUE,
	cargo varchar(50) NOT NULL,
    data_nascimento DATE NULL,
    data_admissao DATE NULL,
    data_demissao DATE NULL,
    cpf_facilitador varchar(11) NOT NULL,
    rg_facilitador varchar(11) NULL,
    endereco_facilitador varchar(150) NULL,
    cidade_facilitador varchar(50) NULL,
    estado_facilitador varchar(50) NULL,
    cep_facilitador varchar(50) NULL,
    telefone varchar(50) NULL,
    email_facilitador varchar(150) NULL,
    observacoes varchar(150) NULL
    
);

-- TABELA DE ALUNOS
CREATE TABLE alunos (

    id_aluno INT NOT NULL PRIMARY KEY UNIQUE,
	nome_aluno varchar(150) NULL UNIQUE,
	cpf_aluno varchar(11) NULL,
    email_aluno varchar(50) NULL,
    telefone_aluno varchar(50) NULL,
    endereco_aluno varchar(150) NULL,
    id_curso INT NOT NULL,
    turma varchar(50) NULL,
    id_equipamento INT NOT NULL,
    id_facilitador INT NOT NULL,
    emprego_antes_resilia varchar(50) NULL,
    emprego_pos_resilia varchar(50) NULL,
	observacoes varchar(150) NULL, 
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso),
    FOREIGN KEY (id_equipamento) REFERENCES equipamentos(id_equipamento),
    FOREIGN KEY (id_facilitador) REFERENCES facilitadores (id_facilitador)

);

-- TABELA DE CURSOS
CREATE TABLE cursos (

    id_curso INT NOT NULL PRIMARY KEY UNIQUE,
	nome_curso varchar(150) NULL UNIQUE, 
	requisitos_curso varchar(50) NULL,
    horario_curso varchar(50) NULL,
    turno_curso varchar(50) NULL,
    duracao_curso varchar(50) NULL,
    carga_horaria_curso varchar(50) NULL,
	preco_curso varchar(50) NULL
    

);

-- TABELA DE MÓDULOS
CREATE TABLE modulos (

    id_modulo INT NOT NULL PRIMARY KEY UNIQUE,
	nome_modulo varchar(150) NULL UNIQUE,
	area_formacao varchar(50) NULL,
    descricao_modulos varchar(50) NULL, 
    hard_skills varchar(50) NULL,
    soft_skills varchar(50) NULL,
    duracao_modulos varchar(50) NULL,
    projeto_final varchar(50) NULL,
	id_facilitador INT NOT NULL -- FOI ALTERADO O TIPO PARA INTEGER 
    
);

CREATE TABLE modulo_curso (

    id_modulo_curso INT PRIMARY KEY,
	id_modulo INT NOT NULL,
	nome_modulo VARCHAR(150) NULL,
	id_curso INT NOT NULL,
	nome_curso VARCHAR(150),
    FOREIGN KEY (nome_modulo) REFERENCES modulos(nome_modulo),
    FOREIGN KEY (id_modulo) REFERENCES modulos(id_modulo),
    FOREIGN KEY (id_curso) REFERENCES cursos (id_curso),
    FOREIGN KEY (nome_curso) REFERENCES cursos(nome_curso)

);

--MÉTODO INSERT PARA POVOAMENTO DAS TABELAS (OBS: NÃO OPTAMOS POR ESSE MÉTODO E SIM PELO IMPORT DE 
--ARQUIVOS CSV)

INSERT INTO "nome_da_tabela" (atributo_1, atributo_2, atributo_3, ...atributo_n) 
    VALUES (valor_a1, valor_a2, valor_3, ...valor_n)