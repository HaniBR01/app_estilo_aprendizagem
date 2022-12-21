create database app_estilo_aprendizagem;
use app_estilo_aprendizagem;

insert into app_estilo_aprendizagem_escola(nome,uf,cidade,endereco) values('Instituto Federal campus Ribeirão das Neves','MG','Ribeirão das Neves','33805-488');

insert into app_estilo_aprendizagem_turma(curso,periodo,descricao,escola_id) values('Informática 1º ano','2022','Curso técnico integrado ao ensino médio de informática',1);
insert into app_estilo_aprendizagem_turma(curso,periodo,descricao,escola_id) values('Informática 2º ano','2022','Curso técnico integrado ao ensino médio de informática',1);
insert into app_estilo_aprendizagem_turma(curso,periodo,descricao,escola_id) values('Informática 3º ano','2022','Curso técnico integrado ao ensino médio de informática',1);
insert into app_estilo_aprendizagem_turma(curso,periodo,descricao,escola_id) values('Administração 1º ano','2022','Curso técnico integrado ao ensino médio de Administração',1);
insert into app_estilo_aprendizagem_turma(curso,periodo,descricao,escola_id) values('Administração 2º ano','2022','Curso técnico integrado ao ensino médio de Administração',1);
insert into app_estilo_aprendizagem_turma(curso,periodo,descricao,escola_id) values('Administração 3º ano','2022','Curso técnico integrado ao ensino médio de Administração',1);
insert into app_estilo_aprendizagem_turma(curso,periodo,descricao,escola_id) values('Eletro 1º ano','2022','Curso técnico integrado ao ensino médio de Eletroeletronica',1);
insert into app_estilo_aprendizagem_turma(curso,periodo,descricao,escola_id) values('Eletro 2º ano','2022','Curso técnico integrado ao ensino médio de Eletroeletronica',1);
insert into app_estilo_aprendizagem_turma(curso,periodo,descricao,escola_id) values('Eletro 3º ano','2022','Curso técnico integrado ao ensino médio de Eletroeletronica',1);
drop trigger FormAtual;
