/*criação do bd para avaliação de programas de tv*/
create database TV_FILMES;

create table tipo(/*tabela simples*/
id_tipo serial not null primary key,
nome varchar(30)
);
create table plataforma(/*tabela simples*/
id_plataforma serial not null primary key,
nome varchar(30)
);
create table genero(/*tabela simples*/
id_genero serial not null primary key,
nome varchar(30)
);
create table pais(/*tabela simples*/
id_pais serial not null primary key,
nome varchar(30)
);
create table ator(/*tabela simples*/
id_ator serial not null primary key,
nome varchar(30),
fk_id_pais int not null references pais(id_pais) 
   on update cascade on delete restrict
);
create table contato(/*tabela simples*/
id_contato serial not null primary key,
nome varchar(30),
email varchar(60),
senha varchar(15)
);
create table programa_tv( /*tabela simples*/
id_programa serial not null primary key,
titulo varchar(30),
ano int,
fk_id_tipo int not null references tipo(id_tipo) 
   on update cascade on delete restrict
);
create table prog_informacao( /*tabela simples dependente de programa_tv*/
id_prog_informacao serial not null primary key,
titulo_originao varchar(30),
sinopse text,
fk_id_programa int not null references programa_tv(id_programa) 
   on update cascade on delete cascade,
fk_id_pais int not null references pais(id_pais) 
   on update cascade on delete cascade
);
create table prog_elenco( /*tabela associativa*/
fk_id_programa int not null references programa_tv(id_programa) 
   on update cascade on delete cascade,
fk_id_ator int not null references ator(id_ator) 
   on update cascade on delete cascade,
chk_ator boolean,
chk_diretor boolean,
primary key (fk_id_programa,fk_id_ator)
);
create table prog_genero( /*tabela associativa*/
fk_id_programa int not null references programa_tv(id_programa) 
   on update cascade on delete cascade,
fk_id_genero int not null references genero(id_genero) 
   on update cascade on delete cascade,
primary key (fk_id_programa,fk_id_genero)
);
create table disponibilidade( /*tabela associativa*/
fk_id_programa int not null references programa_tv(id_programa) 
   on update cascade on delete cascade,
fk_id_plataforma int not null references plataforma(id_plataforma) 
   on update cascade on delete cascade,
primary key (fk_id_programa,fk_id_plataforma)
);
create table avaliacao( /*tabela associativa*/
nota int not null, -- nota de 0 a 10
fk_id_programa int not null references programa_tv(id_programa) 
   on update cascade on delete cascade,
fk_id_contato int not null references contato(id_contato) 
   on update cascade on delete cascade,
primary key (fk_id_programa,fk_id_contato) 
);

/*Inserts em tipos*/
insert into tipo (id_tipo, nome) values (1, 'Série');
insert into tipo (id_tipo, nome) values (2, 'Novela');
insert into tipo (id_tipo, nome) values (3, 'Anime');
insert into tipo (id_tipo, nome) values (4, 'Desenho');
insert into tipo (id_tipo, nome) values (5, 'Documentário');
insert into tipo (id_tipo, nome) values (6, 'Reality Show');
insert into tipo (id_tipo, nome) values (7, 'Talk Show');
insert into tipo (id_tipo, nome) values (8, 'Minissérie');
insert into tipo (id_tipo, nome) values (9, 'Programa de Variedades');
insert into tipo (id_tipo, nome) values (10, 'Programa de Auditório');
insert into tipo (id_tipo, nome) values (11, 'Telefilme');
insert into tipo (id_tipo, nome) values (12, 'Show Musical');
insert into tipo (id_tipo, nome) values (13, 'Esportivo');
insert into tipo (id_tipo, nome) values (14, 'Jornalístico');
insert into tipo (id_tipo, nome) values (15, 'Investigativo');
insert into tipo (id_tipo, nome) values (16, 'Culinário');
insert into tipo (id_tipo, nome) values (17, 'Educativo');
insert into tipo (id_tipo, nome) values (18, 'Infantil');
insert into tipo (id_tipo, nome) values (19, 'Game Show');
insert into tipo (id_tipo, nome) values (20, 'Satírico');

select * from tipo;

/*Plataformas*/
insert into plataforma (id_plataforma, nome) values (1, 'Netflix');
insert into plataforma (id_plataforma, nome) values (2, 'Amazon Prime Video');
insert into plataforma (id_plataforma, nome) values (3, 'Disney+');
insert into plataforma (id_plataforma, nome) values (4, 'HBO Max');
insert into plataforma (id_plataforma, nome) values (5, 'Globoplay');
insert into plataforma (id_plataforma, nome) values (6, 'Paramount+');
insert into plataforma (id_plataforma, nome) values (7, 'Apple TV+');
insert into plataforma (id_plataforma, nome) values (8, 'Star+');
insert into plataforma (id_plataforma, nome) values (9, 'Discovery+');
insert into plataforma (id_plataforma, nome) values (10, 'Crunchyroll');
insert into plataforma (id_plataforma, nome) values (11, 'YouTube');
insert into plataforma (id_plataforma, nome) values (12, 'Peacock');
insert into plataforma (id_plataforma, nome) values (13, 'Telecine Play');
insert into plataforma (id_plataforma, nome) values (14, 'NOW (Claro TV)');
insert into plataforma (id_plataforma, nome) values (15, 'Rakuten TV');
insert into plataforma (id_plataforma, nome) values (16, 'Pluto TV');
insert into plataforma (id_plataforma, nome) values (17, 'SBT Vídeos');
insert into plataforma (id_plataforma, nome) values (18, 'BandPlay');
insert into plataforma (id_plataforma, nome) values (19, 'PlayPlus');
insert into plataforma (id_plataforma, nome) values (20, 'Looke');
INSERT INTO plataforma (id_plataforma, nome) VALUES (21, 'Netflix Kids');
INSERT INTO plataforma (id_plataforma, nome) VALUES (22, 'AnimeLab');
INSERT INTO plataforma (id_plataforma, nome) VALUES (23, 'BBC iPlayer');
INSERT INTO plataforma (id_plataforma, nome) VALUES (24, 'Hulu');
INSERT INTO plataforma (id_plataforma, nome) VALUES (25, 'Crunchyroll BR');


/*Genero*/
insert into genero (id_genero, nome) values (1, 'Drama');
insert into genero (id_genero, nome) values (2, 'Comédia');
insert into genero (id_genero, nome) values (3, 'Ação');
insert into genero (id_genero, nome) values (4, 'Aventura');
insert into genero (id_genero, nome) values (5, 'Terror');
insert into genero (id_genero, nome) values (6, 'Suspense');
insert into genero (id_genero, nome) values (7, 'Romance');
insert into genero (id_genero, nome) values (8, 'Ficção Científica');
insert into genero (id_genero, nome) values (9, 'Fantasia');
insert into genero (id_genero, nome) values (10, 'Musical');
insert into genero (id_genero, nome) values (11, 'Documentário');
insert into genero (id_genero, nome) values (12, 'Reality');
insert into genero (id_genero, nome) values (13, 'Infantil');
insert into genero (id_genero, nome) values (14, 'Policial');
insert into genero (id_genero, nome) values (15, 'Mistério');
insert into genero (id_genero, nome) values (16, 'Biografia');
insert into genero (id_genero, nome) values (17, 'Histórico');
insert into genero (id_genero, nome) values (18, 'Esportivo');
insert into genero (id_genero, nome) values (19, 'Culinário');
insert into genero (id_genero, nome) values (20, 'Satírico');

/*Pais*/
insert into pais (id_pais, nome) values (1, 'Brasil');
insert into pais (id_pais, nome) values (2, 'Estados Unidos');
insert into pais (id_pais, nome) values (3, 'Reino Unido');
insert into pais (id_pais, nome) values (4, 'Canadá');
insert into pais (id_pais, nome) values (5, 'França');
insert into pais (id_pais, nome) values (6, 'Alemanha');
insert into pais (id_pais, nome) values (7, 'Itália');
insert into pais (id_pais, nome) values (8, 'Espanha');
insert into pais (id_pais, nome) values (9, 'México');
insert into pais (id_pais, nome) values (10, 'Argentina');
insert into pais (id_pais, nome) values (11, 'Japão');
insert into pais (id_pais, nome) values (12, 'Coreia do Sul');
insert into pais (id_pais, nome) values (13, 'Índia');
insert into pais (id_pais, nome) values (14, 'China');
insert into pais (id_pais, nome) values (15, 'Austrália');
insert into pais (id_pais, nome) values (16, 'Portugal');
insert into pais (id_pais, nome) values (17, 'Rússia');
insert into pais (id_pais, nome) values (18, 'África do Sul');
insert into pais (id_pais, nome) values (19, 'Suécia');
insert into pais (id_pais, nome) values (20, 'Noruega');
insert into pais (id_pais, nome) values (21, 'Dinamarca');
insert into pais (id_pais, nome) values (22, 'Holanda');
insert into pais (id_pais, nome) values (23, 'Bélgica');
insert into pais (id_pais, nome) values (24, 'Suíça');
insert into pais (id_pais, nome) values (25, 'Áustria');
insert into pais (id_pais, nome) values (26, 'Finlândia');
insert into pais (id_pais, nome) values (27, 'Irlanda');
insert into pais (id_pais, nome) values (28, 'Nova Zelândia');
insert into pais (id_pais, nome) values (29, 'Turquia');
insert into pais (id_pais, nome) values (30, 'Egito');

/*Programas_tv*/
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (1, 'Breaking Bad', 2008, 1);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (2, 'Game of Thrones', 2011, 1);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (3, 'Friends', 1994, 1);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (4, 'Greys Anatomy', 2005, 1);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (5, 'Avenida Brasil', 2012, 2);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (6, 'Senhora do Destino', 2004, 2);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (7, 'Naruto', 2002, 3);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (8, 'Attack on Titan', 2013, 3);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (9, 'Rick and Morty', 2013, 4);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (10, 'The Simpsons', 1989, 4);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (11, 'Planet Earth', 2006, 5);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (12, 'The Last Dance', 2020, 5);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (13, 'Big Brother Brasil', 2002, 6);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (14, 'MasterChef Brasil', 2014, 6);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (15, 'The Tonight Show', 1954, 7);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (16, 'Conversa com Bial', 2017, 7);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (17, 'Chernobyl', 2019, 8);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (18, 'The Queens Gambit', 2020, 8);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (19, 'Domingão do Faustão', 1989, 9);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (20, 'Altas Horas',2000, 9);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (21, 'Programa Silvio Santos', 1963, 10);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (22, 'Caldeirão com Mion', 2021, 10);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (23, 'Black Mirror: Bandersnatch', 2018, 11);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (24, 'O Auto da Compadecida', 2000, 11);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (25, 'Glee', 2009, 12);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (26, 'The Voice', 2011, 12);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (27, 'Esporte Espetacular', 1973, 13);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (28, 'Globo Esporte', 1978, 13);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (29, 'Fantástico', 1973, 14);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (30, 'Jornal Nacional', 1969, 14);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (31, 'Linha Direta', 1990, 15);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (32, 'Profissão Repórter', 2006, 15);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (33, 'Mestre do Sabor', 2019, 16);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (34, 'Cozinheiros em Ação', 2013, 16);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (35, 'Castelo Rá-Tim-Bum', 1994, 17);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (36, 'Mundo de Beakman', 1992, 17);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (37, 'Peppa Pig', 2004, 18);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (38, 'Galinha Pintadinha', 2006, 18);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (39, 'Quem Quer Ser um Milionário?', 1998, 19);
insert into programa_tv (id_programa, titulo, ano, fk_id_tipo) values (40, 'Topa ou Não Topa', 2003, 19);

/*prog_informacao*/
insert into prog_informacao (id_prog_informacao, titulo_originao, sinopse, fk_id_programa, fk_id_pais) values 
(1, 'Breaking Bad', 'Um professor de química do ensino médio diagnosticado com câncer terminal começa a fabricar metanfetamina para garantir o futuro de sua família.', 1, 2),
(2, 'Game of Thrones', 'Nove famílias nobres lutam pelo controle das terras místicas de Westeros, enquanto um inimigo antigo retorna.', 2, 2),
(3, 'Friends', 'Seis amigos navegam pelos altos e baixos da vida em Nova York.', 3, 2),
(4, 'Greys Anatomy', 'Cirurgiões do Seattle Grace Hospital enfrentam dramas pessoais e profissionais.', 4, 2),
(5, 'Avenida Brasil', 'Rita busca vingança contra sua madrasta cruel que destruiu sua infância.', 5, 1),
(6, 'Senhora do Destino', 'Maria do Carmo tem sua filha sequestrada e enfrenta grandes batalhas para recuperá-la.', 6, 1),
(7, 'Naruto', 'Um jovem ninja busca reconhecimento e sonha em se tornar Hokage.', 7, 11),
(8, 'Shingeki no Kyojin', 'A humanidade luta pela sobrevivência contra gigantes devoradores de homens.', 8, 11),
(9, 'Rick and Morty', 'Um cientista excêntrico e seu neto vivem aventuras bizarras por diferentes realidades.', 9, 2),
(10, 'The Simpsons', 'As sátiras da vida americana através das lentes da excêntrica família Simpson.', 10, 2),
(11, 'Planet Earth', 'Documentário que mostra a beleza natural do planeta Terra com imagens impressionantes.', 11, 2),
(12, 'The Last Dance', 'A história da carreira de Michael Jordan e a ascensão do Chicago Bulls.', 12, 2),
(13, 'Big Brother Brasil', 'Participantes confinados em uma casa competem por um grande prêmio, sob constante vigilância.', 13, 1),
(14, 'MasterChef Brasil', 'Cozinheiros amadores competem em provas culinárias eliminatórias.', 14, 1),
(15, 'The Tonight Show', 'Talk show noturno com entrevistas, música e comédia.', 15, 2),
(16, 'Conversa com Bial', 'Pedro Bial entrevista figuras marcantes da cultura e sociedade brasileira.', 16, 1),
(17, 'Chernobyl', 'Minissérie sobre o desastre nuclear em Chernobyl e suas consequências.', 17, 3),
(18, 'The Queens Gambit', 'Uma jovem prodígio do xadrez lida com vícios enquanto tenta se tornar campeã mundial.', 18, 2),
(19, 'Domingão do Faustão', 'Programa de variedades com quadros de dança, entrevistas e humor.', 19, 1),
(20, 'Altas Horas', 'Serginho Groisman apresenta um programa jovem com debates e shows musicais.', 20, 1),
(21, 'Programa Silvio Santos', 'Silvio Santos comanda quadros de auditório com carisma e humor.', 21, 1),
(22, 'Caldeirão com Mion', 'Programa de auditório com atrações musicais e quadros divertidos.', 22, 1),
(23, 'Black Mirror: Bandersnatch', 'Filme interativo onde o espectador escolhe o rumo da história.', 23, 3),
(24, 'O Auto da Compadecida', 'Dois nordestinos enfrentam situações hilárias e religiosas no sertão.', 24, 1),
(25, 'Glee', 'Um grupo de estudantes participa do coral da escola e enfrenta desafios pessoais.', 25, 2),
(26, 'The Voice', 'Cantores competem em um show de talentos vocal com técnicos famosos.', 26, 2),
(27, 'Esporte Espetacular', 'Programa esportivo com reportagens especiais e cobertura de eventos.', 27, 1),
(28, 'Globo Esporte', 'Noticiário esportivo diário com destaque para o futebol.', 28, 1),
(29, 'Fantástico', 'Revista eletrônica com reportagens, entrevistas e entretenimento.', 29, 1),
(30, 'Jornal Nacional', 'Principal telejornal do Brasil com cobertura nacional e internacional.', 30, 1),
(31, 'Linha Direta', 'Reconstituições de crimes reais que chocaram o Brasil.', 31, 1),
(32, 'Profissão Repórter', 'Jovens repórteres investigam temas relevantes em profundidade.', 32, 1),
(33, 'Mestre do Sabor', 'Chefs renomados avaliam pratos criativos de cozinheiros profissionais.', 33, 1),
(34, 'Cozinheiros em Ação', 'Competição entre cozinheiros em provas temáticas na cozinha.', 34, 1),
(35, 'Castelo Rá-Tim-Bum', 'Programa educativo infantil que combina fantasia e ciência.', 35, 1),
(36, 'Mundo de Beakman', 'Beakman ensina ciência de forma divertida com experiências malucas.', 36, 2),
(37, 'Peppa Pig', 'Porquinha Peppa vive aventuras educativas com sua família.', 37, 3),
(38, 'Galinha Pintadinha', 'Clipes musicais infantis com canções populares brasileiras.', 38, 1),
(39, 'Who Wants to Be a Millionaire?', 'Participantes respondem perguntas para ganhar até um milhão.', 39, 2),
(40, 'Deal or No Deal', 'Jogadores escolhem maletas misteriosas em busca de grandes prêmios.', 40, 2);

/*atores*/
-- Atores internacionais
insert into ator (id_ator, nome, fk_id_pais) values (1, 'Bryan Cranston', 2);
insert into ator (id_ator, nome, fk_id_pais) values (2, 'Aaron Paul', 2);
insert into ator (id_ator, nome, fk_id_pais) values (3, 'Peter Dinklage', 2);
insert into ator (id_ator, nome, fk_id_pais) values (4, 'Emilia Clarke', 3);
insert into ator (id_ator, nome, fk_id_pais) values (5, 'Jennifer Aniston', 2);
insert into ator (id_ator, nome, fk_id_pais) values (6, 'David Schwimmer', 2);
insert into ator (id_ator, nome, fk_id_pais) values (7, 'Ellen Pompeo', 2);
insert into ator (id_ator, nome, fk_id_pais) values (8, 'Patrick Dempsey', 2);
insert into ator (id_ator, nome, fk_id_pais) values (9, 'Masashi Kishimoto', 11); -- Criador/diretor de Naruto
insert into ator (id_ator, nome, fk_id_pais) values (10, 'Junko Takeuchi', 11);
insert into ator (id_ator, nome, fk_id_pais) values (11, 'Yuki Kaji', 11);
insert into ator (id_ator, nome, fk_id_pais) values (12, 'Hajime Isayama', 11); -- Criador de Attack on Titan
insert into ator (id_ator, nome, fk_id_pais) values (13, 'Justin Roiland', 2);
insert into ator (id_ator, nome, fk_id_pais) values (14, 'Dan Harmon', 2);
insert into ator (id_ator, nome, fk_id_pais) values (15, 'Matt Groening', 2); -- Criador de Simpsons
insert into ator (id_ator, nome, fk_id_pais) values (16, 'Nancy Cartwright', 2);
insert into ator (id_ator, nome, fk_id_pais) values (17, 'David Attenborough', 3);
insert into ator (id_ator, nome, fk_id_pais) values (18, 'Michael Jordan', 2);
insert into ator (id_ator, nome, fk_id_pais) values (19, 'Jimmy Fallon', 2);
insert into ator (id_ator, nome, fk_id_pais) values (20, 'Anya Taylor-Joy', 2);
insert into ator (id_ator, nome, fk_id_pais) values (21, 'Craig Mazin', 2); -- Diretor de Chernobyl
insert into ator (id_ator, nome, fk_id_pais) values (22, 'Matthew Perry', 2);
insert into ator (id_ator, nome, fk_id_pais) values (23, 'Courteney Cox', 2);
insert into ator (id_ator, nome, fk_id_pais) values (24, 'Lisa Kudrow', 2);
insert into ator (id_ator, nome, fk_id_pais) values (25, 'Mark Harmon', 2);
insert into ator (id_ator, nome, fk_id_pais) values (26, 'Steve Carell', 2);
insert into ator (id_ator, nome, fk_id_pais) values (27, 'Paul Rudd', 2);
insert into ator (id_ator, nome, fk_id_pais) values (28, 'Matthew Fox', 2);
insert into ator (id_ator, nome, fk_id_pais) values (29, 'Hugh Laurie', 3);
insert into ator (id_ator, nome, fk_id_pais) values (30, 'Lea Michele', 2);
-- Atores brasileiros
insert into ator (id_ator, nome, fk_id_pais) values (31, 'Murilo Benício', 1);
insert into ator (id_ator, nome, fk_id_pais) values (32, 'Débora Falabella', 1);
insert into ator (id_ator, nome, fk_id_pais) values (33, 'Renata Sorrah', 1);
insert into ator (id_ator, nome, fk_id_pais) values (34, 'Susana Vieira', 1);
insert into ator (id_ator, nome, fk_id_pais) values (35, 'Pedro Bial', 1);
insert into ator (id_ator, nome, fk_id_pais) values (36, 'Fausto Silva', 1);
insert into ator (id_ator, nome, fk_id_pais) values (37, 'Serginho Groisman', 1);
insert into ator (id_ator, nome, fk_id_pais) values (38, 'Silvio Santos', 1);
insert into ator (id_ator, nome, fk_id_pais) values (39, 'Marcos Mion', 1);
insert into ator (id_ator, nome, fk_id_pais) values (40, 'Matheus Nachtergaele', 1);
insert into ator (id_ator, nome, fk_id_pais) values (41, 'Selton Mello', 1);
insert into ator (id_ator, nome, fk_id_pais) values (42, 'Fátima Bernardes', 1);
insert into ator (id_ator, nome, fk_id_pais) values (43, 'William Bonner', 1);
insert into ator (id_ator, nome, fk_id_pais) values (44, 'Caco Barcellos', 1);
insert into ator (id_ator, nome, fk_id_pais) values (45, 'Ana Paula Padrão', 1);
insert into ator (id_ator, nome, fk_id_pais) values (46, 'Paola Carosella', 1);
insert into ator (id_ator, nome, fk_id_pais) values (47, 'Claude Troisgros', 1);
insert into ator (id_ator, nome, fk_id_pais) values (48, 'Rodrigo Hilbert', 1);
insert into ator (id_ator, nome, fk_id_pais) values (49, 'Luciano Huck', 1);
insert into ator (id_ator, nome, fk_id_pais) values (50, 'Peppa Pig', 3); -- personagem de dublagem
insert into ator (id_ator, nome, fk_id_pais) values (51, 'Galinha Pintadinha', 1); -- dublagem
insert into ator (id_ator, nome, fk_id_pais) values (52, 'Beakman', 2);
insert into ator (id_ator, nome, fk_id_pais) values (53, 'Roberto Justus', 1);
insert into ator (id_ator, nome, fk_id_pais) values (54, 'Tiago Leifert', 1);
insert into ator (id_ator, nome, fk_id_pais) values (55, 'Ana Maria Braga', 1);
insert into ator (id_ator, nome, fk_id_pais) values (56, 'Fernanda Lima', 1);
insert into ator (id_ator, nome, fk_id_pais) values (57, 'Ivete Sangalo', 1);
insert into ator (id_ator, nome, fk_id_pais) values (58, 'Luciano do Valle', 1);
insert into ator (id_ator, nome, fk_id_pais) values (59, 'Galvão Bueno', 1);
insert into ator (id_ator, nome, fk_id_pais) values (60, 'Tony Ramos', 1);
insert into ator (id_ator, nome, fk_id_pais) values (61, 'Tatá Werneck', 1);
insert into ator (id_ator, nome, fk_id_pais) values (62, 'Lázaro Ramos', 1);
insert into ator (id_ator, nome, fk_id_pais) values (63, 'Wagner Moura', 1);
insert into ator (id_ator, nome, fk_id_pais) values (64, 'Letícia Sabatella', 1);
insert into ator (id_ator, nome, fk_id_pais) values (65, 'Taís Araújo', 1);
insert into ator (id_ator, nome, fk_id_pais) values (66, 'Selena Gomez', 2);
insert into ator (id_ator, nome, fk_id_pais) values (67, 'Millie Bobby Brown', 3);
insert into ator (id_ator, nome, fk_id_pais) values (68, 'Pedro Pascal', 2);
insert into ator (id_ator, nome, fk_id_pais) values (69, 'Zendaya', 2);
insert into ator (id_ator, nome, fk_id_pais) values (70, 'João Miguel', 1);

/*contatos*/
INSERT INTO contato (id_contato, nome, email, senha) VALUES
(1, 'João Silva', 'joao.silva@email.com', 'senha123'),
(2, 'Maria Oliveira', 'maria.oliveira@email.com', 'senha456'),
(3, 'Pedro Santos', 'pedro.santos@email.com', 'senha789'),
(4, 'Ana Costa', 'ana.costa@email.com', 'minhasenha'),
(5, 'Carlos Souza', 'carlos.souza@email.com', 'abc123'),
(6, 'Juliana Lima', 'juliana.lima@email.com', '123456'),
(7, 'Lucas Rocha', 'lucas.rocha@email.com', 'senha321'),
(8, 'Fernanda Mendes', 'fernanda.mendes@email.com', 'senha999'),
(9, 'Rafael Barbosa', 'rafael.barbosa@email.com', 'acesso123'),
(10, 'Camila Ferreira', 'camila.ferreira@email.com', 'meupass'),
(11, 'Marcos Almeida', 'marcos.almeida@email.com', 'seguro1'),
(12, 'Patrícia Nunes', 'patricia.nunes@email.com', 'senhaaaa'),
(13, 'Bruno Ribeiro', 'bruno.ribeiro@email.com', 'testesenha'),
(14, 'Vanessa Martins', 'vanessa.martins@email.com', 'pass321'),
(15, 'Tiago Carvalho', 'tiago.carvalho@email.com', 'meu123'),
(16, 'Larissa Gonçalves', 'larissa.goncalves@email.com', 'gogogo'),
(17, 'Felipe Araújo', 'felipe.araujo@email.com', 'teste654'),
(18, 'Beatriz Pinto', 'beatriz.pinto@email.com', 'senha098'),
(19, 'Rodrigo Teixeira', 'rodrigo.teixeira@email.com', 'passe2021'),
(20, 'Aline Duarte', 'aline.duarte@email.com', 'segura123'),
(21, 'Eduardo Moreira', 'eduardo.moreira@email.com', 'senha2020'),
(22, 'Renata Farias', 'renata.farias@email.com', 'mypasswd'),
(23, 'Gustavo Brito', 'gustavo.brito@email.com', 'senha987'),
(24, 'Isabela Correia', 'isabela.correia@email.com', 'p4ssw0rd'),
(25, 'André Matos', 'andre.matos@email.com', 'entrar123'),
(26, 'Tatiane Ribeiro', 'tatiane.ribeiro@email.com', 'login321'),
(27, 'Diego Fernandes', 'diego.fernandes@email.com', 'minhas123'),
(28, 'Natália Almeida', 'natalia.almeida@email.com', 'senha1234'),
(29, 'Leonardo Castro', 'leonardo.castro@email.com', '123senha'),
(30, 'Débora Moraes', 'debora.moraes@email.com', 'acesso456');



/*Prog_elenco*/
-- Breaking Bad (ID 1)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(1, 1, true, false),  -- Bryan Cranston
(1, 2, true, false),  -- Aaron Paul
(1, 25, true, false), -- Mark Harmon
(1, 61, false, true); -- Tatá Werneck como diretora (exemplo)

-- Game of Thrones (ID 2)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(2, 3, true, false),  -- Peter Dinklage
(2, 4, true, false),  -- Emilia Clarke
(2, 67, true, false), -- Millie Bobby Brown
(2, 68, false, true); -- Pedro Pascal como diretor

-- Friends (ID 3)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(3, 5, true, false),  -- Jennifer Aniston
(3, 6, true, false),  -- David Schwimmer
(3, 22, true, false), -- Matthew Perry
(3, 23, false, true); -- Courteney Cox como diretora

-- Grey's Anatomy (ID 4)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(4, 7, true, false),  -- Ellen Pompeo
(4, 8, true, false),  -- Patrick Dempsey
(4, 29, true, false), -- Hugh Laurie
(4, 64, false, true); -- Letícia Sabatella como diretora

-- Avenida Brasil (ID 5)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(5, 31, true, false), -- Murilo Benício
(5, 32, true, false), -- Débora Falabella
(5, 60, true, false), -- Tony Ramos
(5, 62, false, true); -- Lázaro Ramos como diretor

-- Senhora do Destino (ID 6)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(6, 33, true, false), -- Renata Sorrah
(6, 34, true, false), -- Susana Vieira
(6, 60, true, false), -- Tony Ramos
(6, 63, false, true); -- Wagner Moura como diretor

-- Naruto (ID 7)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(7, 10, true, false), -- Junko Takeuchi
(7, 9, false, true),  -- Masashi Kishimoto como diretor
(7, 66, true, false), -- Selena Gomez
(7, 69, true, false); -- Zendaya

-- Attack on Titan (ID 8)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(8, 11, true, false), -- Yuki Kaji
(8, 12, false, true), -- Hajime Isayama como diretor
(8, 66, true, false), -- Selena Gomez
(8, 69, true, false); -- Zendaya

-- Rick and Morty (ID 9)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(9, 13, true, false), -- Justin Roiland
(9, 14, false, true), -- Dan Harmon como diretor
(9, 66, true, false), -- Selena Gomez
(9, 69, true, false); -- Zendaya

-- The Simpsons (ID 10)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(10, 15, false, true), -- Matt Groening como diretor
(10, 16, true, false), -- Nancy Cartwright
(10, 66, true, false), -- Selena Gomez
(10, 69, true, false); -- Zendaya

-- Planet Earth (ID 11)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(11, 17, true, false), -- David Attenborough
(11, 64, true, false),
(11, 65, true, false),
(11, 68, false, true); -- Pedro Pascal

-- The Last Dance (ID 12)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(12, 18, true, false), -- Michael Jordan
(12, 65, true, false),
(12, 66, true, false),
(12, 69, false, true); -- Zendaya

-- Big Brother Brasil (ID 13)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(13, 35, false, true), -- Pedro Bial como apresentador/diretor
(13, 54, true, false), -- Tiago Leifert
(13, 61, true, false), -- Tatá Werneck
(13, 62, true, false); -- Lázaro Ramos

-- MasterChef Brasil (ID 14)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(14, 45, true, false), -- Ana Paula Padrão
(14, 46, true, false), -- Paola Carosella
(14, 47, false, true), -- Claude Troisgros como jurado/diretor
(14, 70, true, false); -- João Miguel

-- The Tonight Show (ID 15)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(15, 19, true, false), -- Jimmy Fallon
(15, 26, true, false), -- Steve Carell
(15, 27, true, false), -- Paul Rudd
(15, 68, false, true); -- Pedro Pascal

-- Conversa com Bial (ID 16)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(16, 35, true, false), -- Pedro Bial
(16, 64, true, false), -- Letícia Sabatella
(16, 65, true, false), -- Taís Araújo
(16, 70, false, true); -- João Miguel

-- Chernobyl (ID 17)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(17, 21, false, true), -- Craig Mazin
(17, 66, true, false),
(17, 67, true, false),
(17, 69, true, false);

-- The Queen's Gambit (ID 18)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(18, 20, true, false), -- Anya Taylor-Joy
(18, 66,true, false),
(18, 69, true, false),
(18, 64, false, true); -- Letícia Sabatella

-- Domingão do Faustão (ID 19)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(19, 36, true, false), -- Fausto Silva
(19, 57, true, false), -- Ivete Sangalo
(19, 49, true, false), -- Luciano Huck
(19, 65, false, true); -- Taís Araújo

-- Altas Horas (ID 20)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(20, 37, true, false), -- Serginho Groisman
(20, 57, true, false), -- Ivete Sangalo
(20, 69, true, false), -- Zendaya
(20, 63, false, true); -- Wagner Moura

-- Programa Silvio Santos (ID 21)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(21, 38, true, false), -- Silvio Santos
(21, 61, true, false), -- Tatá Werneck
(21, 62, true, false), -- Lázaro Ramos
(21, 65, false, true); -- Taís Araújo

-- Caldeirão com Mion (ID 22)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(22, 39, true, false), -- Marcos Mion
(22, 61, true, false),
(22, 62, true, false),
(22, 64, false, true); -- Letícia Sabatella

-- Black Mirror: Bandersnatch (ID 23)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(23, 66, true, false),
(23, 67, true, false),
(23, 68, true, false),
(23, 69, false, true); -- Zendaya

-- O Auto da Compadecida (ID 24)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(24, 40, true, false), -- Matheus Nachtergaele
(24, 41, true, false), -- Selton Mello
(24, 70, true, false), -- João Miguel
(24, 65, false, true); -- Taís Araújo

-- Glee (ID 25)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(25, 30, true, false), -- Lea Michele
(25, 66, true, false),
(25, 69, true, false),
(25, 68, false, true); -- Pedro Pascal

-- The Voice (ID 26)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(26, 26, true, false), -- Steve Carell
(26, 27, true, false), -- Paul Rudd
(26, 69, true, false),
(26, 67, false, true); -- Millie Bobby Brown

-- Esporte Espetacular (ID 27)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(27, 58, true, false), -- Luciano do Valle
(27, 59,true, false), -- Galvão Bueno
(27, 70, true, false),
(27, 63, false, true); -- Wagner Moura

-- Globo Esporte (ID 28)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(28, 42, true, false), -- Fátima Bernardes
(28, 43, true, false), -- William Bonner
(28, 70, true, false),
(28, 62, true, true); -- Lázaro Ramos

-- Fantástico (ID 29)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(29, 42, true, false),
(29, 43, true, false),
(29, 65, true, false),
(29, 64, false, true); -- Letícia Sabatella

-- Jornal Nacional (ID 30)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(30, 42, true, false),
(30, 43, true, false),
(30, 70,true, false),
(30, 61, false, true); -- Tatá Werneck

-- Linha Direta (ID 31)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(31, 44, true, false), -- Caco Barcellos
(31, 62, true, false), -- Lázaro Ramos
(31, 63, true, false), -- Wagner Moura
(31, 64, false, true); -- Letícia Sabatella

-- Profissão Repórter (ID 32)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(32, 44, true, false), -- Caco Barcellos
(32, 61, true, false), -- Tatá Werneck
(32, 65, true, false), -- Taís Araújo
(32, 70, false, true); -- João Miguel

-- Mestre do Sabor (ID 33)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(33, 47, true, false), -- Claude Troisgros
(33, 48, true, false), -- Rodrigo Hilbert
(33, 61, true, false),
(33, 62, false, true); -- Lázaro Ramos

-- Cozinheiros em Ação (ID 34)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(34, 47, true, false),
(34, 61, true, false),
(34, 62, true, false),
(34, 63, false, true); -- Wagner Moura

-- Castelo Rá-Tim-Bum (ID 35)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(35, 41, true, false), -- Selton Mello
(35, 42, true, false), -- Fátima Bernardes
(35, 50, true, false), -- Peppa Pig
(35, 65, false, true); -- Taís Araújo

-- Mundo de Beakman (ID 36)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(36, 52, true, false), -- Beakman
(36, 66, true, false),
(36, 69, true, false),
(36, 64, true, true); -- Letícia Sabatella

-- Peppa Pig (ID 37)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(37, 50, true, false), -- Peppa Pig
(37, 66, true, false),
(37, 69, true, false),
(37, 67, false, true); -- Millie Bobby Brown

-- Galinha Pintadinha (ID 38)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(38, 51, true, false), -- Galinha Pintadinha
(38, 65, true, false),
(38, 69, true, false),
(38, 63, true, true); -- Wagner Moura

-- Quem Quer Ser um Milionário? (ID 39)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(39, 53, true, false), -- Roberto Justus
(39, 66, true, false),
(39, 68, true, false),
(39, 67, false, true); -- Millie Bobby Brown

-- Topa ou Não Topa (ID 40)
INSERT INTO prog_elenco (fk_id_programa, fk_id_ator, chk_ator, chk_diretor) VALUES
(40, 53, true, false),
(40, 66, true, false),
(40, 69, true, false),
(40, 64, true, true); -- Letícia Sabatella

--delete from prog_elenco;

/*prog_genero*/
INSERT INTO prog_genero (fk_id_programa, fk_id_genero) VALUES
(1, 1),  -- Breaking Bad: Drama
(1, 6),  -- Suspense

(2, 1),  -- Game of Thrones: Drama
(2, 9),  -- Fantasia

(3, 2),  -- Friends: Comédia
(3, 7),  -- Romance

(4, 1),  -- Grey's Anatomy: Drama
(4, 7),  -- Romance

(5, 1),  -- Avenida Brasil: Drama

(6, 1),  -- Senhora do Destino: Drama

(7, 4),  -- Naruto: Aventura
(7, 9),  -- Fantasia

(8, 3),  -- Attack on Titan: Ação
(8, 6),  -- Suspense

(9, 2),  -- Rick and Morty: Comédia
(9, 8),  -- Ficção Científica

(10, 2), -- The Simpsons: Comédia
(10, 20),-- Satírico

(11, 11),-- Planet Earth: Documentário

(12, 11),-- The Last Dance: Documentário
(12, 18),-- Esportivo

(13, 12),-- Big Brother Brasil: Reality

(14, 12),-- MasterChef Brasil: Reality
(14, 19),-- Culinário

(15, 2), -- The Tonight Show: Comédia
(15, 20),-- Satírico

(16, 2), -- Conversa com Bial: Comédia
(16, 1), -- Drama

(17, 1), -- Chernobyl: Drama
(17, 15),-- Mistério

(18, 1), -- The Queen's Gambit: Drama

(19, 9), -- Domingão do Faustão: Fantasia
(19, 20),-- Satírico

(20, 9), -- Altas Horas: Fantasia

(21, 2), -- Programa Silvio Santos: Comédia

(22, 2), -- Caldeirão com Mion: Comédia

(23, 8), -- Black Mirror: Ficção Científica
(23, 6), -- Suspense

(24, 2), -- O Auto da Compadecida: Comédia
(24, 9), -- Fantasia

(25, 2), -- Glee: Comédia
(25, 10),-- Musical

(26, 10),-- The Voice: Musical
(26, 12),-- Reality

(27, 18),-- Esporte Espetacular: Esportivo

(28, 18),-- Globo Esporte: Esportivo

(29, 1), -- Fantástico: Drama
(29, 14),-- Policial

(30, 14),-- Jornal Nacional: Policial

(31, 14),-- Linha Direta: Policial
(31, 15),-- Mistério

(32, 1), -- Profissão Repórter: Drama

(33, 19),-- Mestre do Sabor: Culinário

(34, 19),-- Cozinheiros em Ação: Culinário

(35, 13),-- Castelo Rá-Tim-Bum: Infantil
(35, 9), -- Fantasia

(36, 17),-- Mundo de Beakman: Educativo

(37, 13),-- Peppa Pig: Infantil

(38, 13),-- Galinha Pintadinha: Infantil
(38, 10),-- Musical

(39, 12),-- Quem Quer Ser um Milionário?: Culinário
(39, 19),-- Culinário

(40, 19);-- Topa ou Não Topa: Culinário


/*Disponibilidade*/
INSERT INTO disponibilidade (fk_id_programa, fk_id_plataforma) VALUES
(1, 1), (1, 4),
(2, 4), (2, 24),
(3, 1), (3, 24),
(4, 1), (4, 24),
(5, 5), (5, 14),
(6, 5), (6, 14),
(7, 10), (7, 22), (7, 25),
(8, 10), (8, 22), (8, 25),
(9, 3), (9, 11),
(10, 11), (10, 3),
(11, 1), (11, 23),
(12, 1), (12, 24),
(13, 5), (13, 14),
(14, 5), (14, 6),
(15, 2), (15, 24),
(16, 5), (16, 14),
(17, 4), (17, 23),
(18, 1), (18, 4),
(19, 5), (19, 14),
(20, 5), (20, 14),
(21, 17), (21, 19),
(22, 5), (22, 14),
(23, 1), (23, 3),
(24, 5), (24, 14),
(25, 1), (25, 3),
(26, 2), (26, 12),
(27, 5), (27, 14),
(28, 5), (28, 14),
(29, 5), (29, 14),
(30, 5), (30, 14),
(31, 5), (31, 14),
(32, 5), (32, 14),
(33, 5), (33, 6),
(34, 5), (34, 6),
(35, 5), (35, 21),
(36, 1), (36, 23),
(37, 3), (37, 21),
(38, 5), (38, 21),
(39, 2), (39, 24),
(40, 2), (40, 24);

/*avaliação*/
INSERT INTO avaliacao (nota, fk_id_programa, fk_id_contato) VALUES
(8, 1, 1), (7, 2, 1), (9, 3, 1), (6, 4, 1), (5, 5, 1),
(9, 6, 2), (6, 7, 2), (8, 8, 2), (7, 9, 2), (5, 10, 2),
(7, 11, 3), (6, 12, 3), (8, 13, 3), (5, 14, 3), (6, 15, 3),
(9, 16, 4), (7, 17, 4), (6, 18, 4), (8, 19, 4), (5, 20, 4),
(6, 21, 5), (7, 22, 5), (8, 23, 5), (5, 24, 5), (6, 25, 5),
(9, 26, 6), (7, 27, 6), (6, 28, 6), (8, 29, 6), (7, 30, 6),
(5, 31, 7), (6, 32, 7), (8, 33, 7), (7, 34, 7), (9, 35, 7),
(6, 36, 8), (7, 37, 8), (9, 38, 8), (5, 39, 8), (6, 40, 8),
(8, 1, 9), (7, 3, 9), (9, 5, 9), (6, 7, 9), (5, 9, 9),
(7, 11, 10), (6, 13, 10), (8, 15, 10), (5, 17, 10), (6, 19, 10),
(9, 2, 11), (8, 4, 11), (7, 6, 11), (6, 8, 11), (5, 10, 11),
(8, 12, 12), (6, 14, 12), (7, 16, 12), (9, 18, 12), (6, 20, 12),
(7, 22, 13), (6, 24, 13), (8, 26, 13), (7, 28, 13), (9, 30, 13),
(6, 32, 14), (8, 34, 14), (7, 36, 14), (6, 38, 14), (5, 40, 14),
(9, 1, 15), (7, 3, 15), (6, 5, 15), (8, 7, 15), (6, 9, 15),
(7, 11, 16), (6, 13, 16), (9, 15, 16), (5, 17, 16), (7, 19, 16),
(8, 21, 17), (6, 23, 17), (7, 25, 17), (9, 27, 17), (6, 29, 17),
(5, 31, 18), (7, 33, 18), (6, 35, 18), (8, 37, 18), (6, 39, 18),
(9, 2, 19), (6, 4, 19), (7, 6, 19), (8, 8, 19), (7, 10, 19),
(6, 12, 20), (7, 14, 20), (9, 16, 20), (6, 18, 20), (5, 20, 20),
(7, 22, 21), (6, 24, 21), (8, 26, 21), (6, 28, 21), (7, 30, 21),
(5, 32, 22), (7, 34, 22), (6, 36, 22), (8, 38, 22), (6, 40, 22),
(9, 1, 23), (7, 3, 23), (6, 5, 23), (8, 7, 23), (6, 9, 23),
(7, 11, 24), (6, 13, 24), (9, 15, 24), (5, 17, 24), (6, 19, 24),
(8, 21, 25), (6, 23, 25), (7, 25, 25), (9, 27, 25), (6, 29, 25),
(5, 31, 26), (7, 33, 26), (6, 35, 26), (8, 37, 26), (6, 39, 26),
(9, 2, 27), (6, 4, 27), (7, 6, 27), (8, 8, 27), (7, 10, 27),
(6, 12, 28), (7, 14, 28), (9, 16, 28), (6, 18, 28), (5, 20, 28),
(7, 22, 29), (6, 24, 29), (8, 26, 29), (6, 28, 29), (7, 30, 29),
(5, 32, 30), (7, 34, 30), (6, 36, 30), (8, 38, 30), (6, 40, 30);
