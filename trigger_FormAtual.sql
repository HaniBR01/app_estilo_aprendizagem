Use app_estilo_aprendizagem;
delimiter $$
create trigger FormAtual after insert on app_estilo_aprendizagem_analises for each row
begin
    
	if exists(select u.id
		from app_estilo_aprendizagem_Usuario u
		where u.id = new.usuario_nome_id) then
		if exists(select a.id
			from app_estilo_aprendizagem_Usuario u, app_estilo_aprendizagem_form_atual a
			where u.id = new.usuario_nome_id
			and a.aluno_id = u.id) then
			update app_estilo_aprendizagem_Form_Atual a set a.analises_id = new.id where a.aluno_id = new.usuario_nome_id;
        else
			insert into app_estilo_aprendizagem_Form_Atual(aluno_id,analises_id) values (new.usuario_nome_id,new.id);
        end if;
	end if;

end$$
delimiter ;