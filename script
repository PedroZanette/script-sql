create table TIPO (
	id_tipo serial not null primary key ,
	nome varchar(100)
);

create table PROGRAMATV (
	id_programa serial not null primary key ,
	titulo varchar(100),
	ano date,
	fk_id_tipo int not null,
	FOREIGN KEY (fk_id_tipo) REFERENCES TIPO(id_tipo) on update CASCADE on delete RESTRICT
);

create table GENERO (
	id_genero serial not null primary key ,
	nome varchar(50)
);

create table PROG_GENERO (
	fk_id_programa int not null,
	fk_id_genero int not null,
	PRIMARY KEY (fk_id_programa, fk_id_genero),
	FOREIGN KEY (fk_id_programa) REFERENCES PROGRAMATV(id_programa) on update CASCADE on delete CASCADE,
	FOREIGN KEY (fk_id_genero) REFERENCES GENERO(id_genero) on update CASCADE on delete RESTRICT
);

create table CONTATOS (
	id_contatos serial not null primary key ,
	nome varchar(100),
	email varchar(100),
	senha varchar(100)
);

create table AVALIACAO(
	nota int not null,
	fk_id_programa int not null,
	fk_id_contatos int not null,
	PRIMARY KEY (fk_id_programa, fk_id_contatos),
	FOREIGN KEY (fk_id_programa) REFERENCES PROGRAMATV(id_programa) on update CASCADE on delete RESTRICT,
	FOREIGN KEY (fk_id_contatos) REFERENCES CONTATOS(id_contatos) on update CASCADE on delete RESTRICT
);

create table PAIS (
	id_pais serial not null primary key ,
	nome varchar(100)
);

create table ATOR (
	id_ator serial not null primary key ,
	nome varchar(100),
	fk_id_pais int not null,
	FOREIGN KEY (fk_id_pais) REFERENCES PAIS(id_pais) on update CASCADE on delete RESTRICT
);

create table PRO_ELENCO (
	chk_ator boolean,
	chk_diretor boolean,
	fk_id_programa int not null,
	fk_id_ator int not null,
	PRIMARY KEY (fk_id_programa, fk_id_ator),
	FOREIGN KEY (fk_id_programa) REFERENCES PROGRAMATV(id_programa) on update CASCADE on delete RESTRICT,
	FOREIGN KEY (fk_id_ator) REFERENCES ATOR(id_ator) on update CASCADE on delete RESTRICT
);

create table PROG_INFORMACOES (
	id_prog_informacoes serial not null primary key ,
	titulo_original varchar(100),
	sinopse text,
	fk_id_programa INT UNIQUE not null, 
	fk_id_pais int not null,
	FOREIGN KEY (fk_id_programa) REFERENCES PROGRAMATV(id_programa) on update CASCADE on delete RESTRICT,
	FOREIGN KEY (fk_id_pais) REFERENCES PAIS(id_pais) on update CASCADE on delete RESTRICT
);

create table PLATAFORMA (
	id_plataforma serial not null primary key ,
	nome varchar(100)
);

create table DISPONIBILIDADE(
	fk_id_programa INT UNIQUE not null, 
	fk_id_plataforma int not null,
	PRIMARY KEY (fk_id_programa, fk_id_plataforma),
	FOREIGN KEY (fk_id_programa) REFERENCES PROGRAMATV(id_programa) on update CASCADE on delete CASCADE,
	FOREIGN KEY (fk_id_plataforma) REFERENCES PLATAFORMA(id_plataforma) on update CASCADE on delete RESTRICT
);

-- nextval('teste_id_test_seq'::regclass)
