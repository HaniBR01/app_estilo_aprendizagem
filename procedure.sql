use app_estilo_aprendizagem;
delimiter $$
create procedure BuscaTurma(in turma int,out alunos int,out ati int,out ref int,out vis int,out ver int,out sen int,out intu int,out seq int,out glo int)
begin

	select count(f.aluno_id) into alunos
	from app_estilo_aprendizagem_Analises a, app_estilo_aprendizagem_form_atual f
	where a.id = f.analises_id
	and a.usuario_turma_id = turma;
    
	select count(f.id) into sen
	from app_estilo_aprendizagem_Analises a, app_estilo_aprendizagem_form_atual f
	where a.dimensao_percepcao = 'Sensorial'
	and a.id = f.analises_id
	and a.usuario_turma_id = turma;

	select count(f.id) into intu
	from app_estilo_aprendizagem_Analises a, app_estilo_aprendizagem_form_atual f
	where a.dimensao_percepcao = 'Intuitivo'
	and a.id = f.analises_id
	and a.usuario_turma_id = turma;

	select count(f.id) into vis
	from app_estilo_aprendizagem_Analises a, app_estilo_aprendizagem_form_atual f
	where a.dimensao_entrada = 'Visual'
	and a.id = f.analises_id
	and a.usuario_turma_id = turma;

	select count(f.id) into ver
	from app_estilo_aprendizagem_Analises a, app_estilo_aprendizagem_form_atual f
	where a.dimensao_entrada = 'Verbal'
	and a.id = f.analises_id
	and a.usuario_turma_id = turma;

	select count(f.id) into ati
	from app_estilo_aprendizagem_Analises a, app_estilo_aprendizagem_form_atual f
	where a.dimensao_processamento = 'Ativo'
	and a.id = f.analises_id
	and a.usuario_turma_id = turma;

	select count(f.id) into ref
	from app_estilo_aprendizagem_Analises a, app_estilo_aprendizagem_form_atual f
	where a.dimensao_processamento = 'Reflexivo'
	and a.id = f.analises_id
	and a.usuario_turma_id = turma;

	select count(f.id) into seq
	from app_estilo_aprendizagem_Analises a, app_estilo_aprendizagem_form_atual f
	where a.dimensao_entendimento = 'Sequencial'
	and a.id = f.analises_id
	and a.usuario_turma_id = turma;

	select count(f.id) into glo
	from app_estilo_aprendizagem_Analises a, app_estilo_aprendizagem_form_atual f
	where a.dimensao_entendimento = 'Global'
	and a.id = f.analises_id
	and a.usuario_turma_id = turma;
    
end$$
delimiter ;