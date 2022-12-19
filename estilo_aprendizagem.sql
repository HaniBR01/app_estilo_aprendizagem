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
	declare dimePe text;
	declare dimeEa text;
	declare dimePr text;
	declare dimeEe text;
	declare anaPe text;
	declare anaEa text;
	declare anaPr text;
	declare anaEe text;
	declare turma int;
	   
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
		set textPe = 'Você gosta de fatos, dados e experimentação. Você prefere observar os fenômenos pelos sentidos: vendo, tocando e ouvindo.';
		set anaPe = 'Devem-se realizar apresentações mais detalhadas (passo-a-passo); Priorize apresentações que façam conexões com o dia-a-dia (apresentando dados resultantes de experimentos e/ou casos reais);Explore apresentações que incitem os sentidos (utilizando vídeos, imagens, animações etc.).';
		set dimePe = 'Sensorial';
	else
		set textPe = 'Você gosta de conceitos e teorias. Você prefere analisar os fenômenos teoricamente por princípios e modelos.';
		set anaPe = 'Devem-se realizar apresentações mais sucintas que exijam reflexão (menos detalhadas); Utilize apresentações mais abstratas que forcem o raciocínio (estabelecendo relações entre os conceitos, apresentando significados e teorias de forma geral); Prepare apresentações que utilizem problemas e desafios (especialmente questões abertas, pois, as múltiplas escolhas são preferidas do polo reflexivo).';
        set dimePe = 'Intuitivo';
	end if;
	   
	if contEa >=3 then
		set textEa = 'Você se lembra melhor daquilo que vê: imagens, diagramas, filmes e demonstrações.';
        set anaEa = 'Exemplifique e aprofunde os conceitos visualmente. Os fenômenos e resultados devem ser apresentados principalmente por fotos, diagramas e fluxogramas. Quando necessário, para cursos de exatas, realize demonstrações mais claras, utilizando menos "linguagem matemática" no sentido formal de símbolos e verbetes). A matematização deve ser "visualmente" mais apresentável em termos de organização (fácil visualização e interpretação) e sempre acompanhada de representações visuais, como gráficos, para a discussão ou compreensão dos fenômenos.';
        set dimeEa = 'Visual';
	else
		set textEa = 'Você tem boa argumentação e prefere uma explicação verbal a uma demonstração visual.';
        set anaEa = 'Exemplifique e aprofunde os conceitos textualmente (discursivamente); Comentários e análises sobre os fenômenos devem ser mais textuais (a não ser em raros casos onde isso se torne muito mais extenso do que um gráfico ou tabela). Durante as explicações devem-se estabelecer discussões acerca do conteúdo; Os fenômenos, para cursos de exatas, devem ser apresentados principalmente com linguagem formalmente matemática.';
		set dimeEa = 'Verbal';
	end if;
	   
	if contPr >=3 then
		set textPr = 'Você trabalha bem em grupo e tende a ser experimentalista. Você gosta de fazer as coisas por si próprio.';
		set anaPr = 'Sempre que possível, realize análises a partir de simulações (software) ou applets (animações interativas) onde os alunos precisam coletar dados e a partir desses dados, proponha discussões práticas ou problemas; Utilize animações que permitam manipular grandezas numérica ou graficamente. Animações sem interatividade (que funcionam sozinhas) devem ser utilizadas, preferencialmente, para o polo sensorial; Quando não for possível usar interações computacionais, substitua por exercícios que obriguem alguma manipulação (ou resolução). Por exemplo, deixe a resposta oculta mostrando-a apenas quando do interesse do aluno (se o aluno for intuitivo apenas mostre a resposta, se for sensorial descreva-a por etapas).';
        set dimePr = 'Ativo';
	else
		set textPr = 'Você não aprende muito em situações onde não é levado a pensar sobre algo. Você tende a ser bastante teórico.';
		set anaPr = 'Promova análises de conceitos a partir de exercícios, onde várias possibilidades necessitam ser comparadas antes de se executar uma atividade (questões de múltipla escolha são úteis). Quando o aluno apresentar a resposta em uma atividade, discuta (via feedback) conceitualmente o resultado - estando certo ou errado.';
        set dimePr = 'Reflexivo';
	end if;
	   
	if contEe >=3 then
		set textEe = 'Você possui raciocínio linear durante a solução de questões e se dá bem com problemas que progressivamente se tornam mais complexos. Normalmente entende primeiro as pequenas partes, para depois compreender o todo.';
		set anaEe = 'Como um todo, deve-se apresentar o conteúdo de forma linear, com atividades se tornando progressivamente complexas; Deve-se partir de itens específicos para o todo, explicando cada etapa para depois apresentar o problema maior.';
        set dimeEe = 'Sequencial';
	else
		set textEe = 'Você raciocina por saltos intuitivos e nem sempre é capaz de explicar como chega à solução. Normalmente entende primeiro o todo, para depois compreender as pequenas partes.';
		set anaEe = 'Como um todo, deve-se apresentar o conteúdo por grandes etapas, de forma a analisar primeiro o todo e depois os detalhes específicos; Apresente o problema maior, para depois explicar as etapas necessárias (sugere-se que temas transversais ou de conhecimento prévio sejam dispostos na forma de conteúdo hipertextual - links - quando utilizar material virtual).';
        set dimeEe = 'Global';
	end if;

	select turma_id into turma from app_estilo_aprendizagem_usuario u where new.usuario_id = u.id;

    insert into app_estilo_aprendizagem_analises
    (formulario_id,usuario_turma_id,dimensao_percepcao,dimensao_entrada,dimensao_processamento,dimensao_entendimento,reflexao_percepcao,reflexao_entrada,reflexao_processamento,reflexao_entendimento,analise_percepcao,analise_entrada,analise_processamento,analise_entendimento)
    values (new.id,turma,dimePe,dimeEa,dimePr,dimeEe,textPe,textEa,textPr,textEe,anaPe,anaEa,anaPr,anaEe);
end $$
delimiter ;