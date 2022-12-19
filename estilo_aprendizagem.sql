create database estilo_aprendizagem;
use estilo_aprendizagem;
insert into app_estilo_aprendizagem_escola(nome,uf,cidade,endereco) values('Instituto Federal campus Ribeirão das Neves','MG','Ribeirão das Neves','33805-488');
insert into app_estilo_aprendizagem_turma(curso,periodo,descricao,escola_id) values('Informática 1º ano','2022','Curso técnico integrado ao ensino médio de informática',2);
insert into app_estilo_aprendizagem_turma(curso,periodo,descricao,escola_id) values('Informática 2º ano','2022','Curso técnico integrado ao ensino médio de informática',2);
insert into app_estilo_aprendizagem_turma(curso,periodo,descricao,escola_id) values('Informática 3º ano','2022','Curso técnico integrado ao ensino médio de informática',2);
insert into app_estilo_aprendizagem_turma(curso,periodo,descricao,escola_id) values('Administração 1º ano','2022','Curso técnico integrado ao ensino médio de Administração',2);
insert into app_estilo_aprendizagem_turma(curso,periodo,descricao,escola_id) values('Administração 2º ano','2022','Curso técnico integrado ao ensino médio de Administração',2);
insert into app_estilo_aprendizagem_turma(curso,periodo,descricao,escola_id) values('Administração 3º ano','2022','Curso técnico integrado ao ensino médio de Administração',2);
insert into app_estilo_aprendizagem_turma(curso,periodo,descricao,escola_id) values('Eletro 1º ano','2022','Curso técnico integrado ao ensino médio de Eletroeletronica',2);
insert into app_estilo_aprendizagem_turma(curso,periodo,descricao,escola_id) values('Eletro 2º ano','2022','Curso técnico integrado ao ensino médio de Eletroeletronica',2);
insert into app_estilo_aprendizagem_turma(curso,periodo,descricao,escola_id) values('Eletro 3º ano','2022','Curso técnico integrado ao ensino médio de Eletroeletronica',2);

delimiter $$
create trigger Analise after insert on app_estilo_aprendizagem_formulario for each row
begin

    declare contPe int default 0;
declare contEa int default 0;
declare contPr int default 0;
declare contEe int default 0;
declare textPe text;
declare textEa text;
declare textPr text;
declare textEe text;
   
    if new.questao_1 = "A" then
set contPr = contPr + 1;
end IF;
    if new.questao_5 = "A" then
set contPr = contPr + 1;
end IF;
    if new.questao_9 = "A" then
set contPr = contPr + 1;
end IF;
    if new.questao_13 = "A" then
set contPr = contPr + 1;
end IF;
    if new.questao_17 = "A" then
set contPr = contPr + 1;
end IF;
   
    if new.questao_2 = "A" then
set contPe = contPe + 1;
end IF;
    if new.questao_6 = "A" then
set contPe = contPe + 1;
end IF;
    if new.questao_10 = "A" then
set contPe = contPe + 1;
end IF;
    if new.questao_14 = "A" then
set contPe = contPe + 1;
end IF;
    if new.questao_18 = "A" then
set contPe = contPe + 1;
end IF;
   
    if new.questao_3 = "A" then
set contEa = contEa + 1;
end IF;
    if new.questao_7 = "A" then
set contEa = contEa + 1;
end IF;
    if new.questao_11 = "A" then
set contEa = contEa + 1;
end IF;
    if new.questao_15 = "A" then
set contEa = contEa + 1;
end IF;
    if new.questao_19 = "A" then
set contEa = contEa + 1;
end IF;
   
    if new.questao_4 = "A" then
set contEe = contEe + 1;
end IF;
    if new.questao_8 = "A" then
set contEe = contEe + 1;
end IF;
    if new.questao_12 = "A" then
set contEe = contEe + 1;
end IF;
    if new.questao_16 = "A" then
set contEe = contEe + 1;
end IF;
    if new.questao_20 = "A" then
set contEe = contEe + 1;
end IF;
   
    if contPe >=3 then
set textPe = 'ATI';
    else
set textPe = 'REF';
end if;
   
    if contEa >=3 then
set textEa = 'SEN';
    else
set textEa = 'INT';
end if;
   
    if contPr >=3 then
set textPr = 'VIS';
    else
set textPr = 'VER';
end if;
   
    if contEe >=3 then
set textEe = 'SEQ';
    else
set textEe = 'GLO';
end if;
   
    insert into app_estilo_aprendizagem_analises(formulario_id,percepcao,entrada,processamento,entendimento) values (new.id, textPe, textEa, textPr, textEe);
end $$
delimiter ;