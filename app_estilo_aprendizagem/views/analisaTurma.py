from django.contrib.auth.decorators import login_required
from django.shortcuts import redirect, render, get_object_or_404
from django.forms import ModelForm
from app_estilo_aprendizagem.models import Turma
from django.db import connection

class TurmaForm(ModelForm):
    class Meta:
        model = Turma
        fields = '__all__'

@login_required
def listar(request):
    turmas = Turma.objects.filter(periodo=2022).all()

    return render(request, 'formulario/professor/turmas.html', {
        'nome' : 'Turmas de 2022',
        'turmas' : turmas
    })

def analisar(request,id):
    
    turma = get_object_or_404(Turma, pk=id)
    turma = TurmaForm(request.POST or None, instance=turma)
    nome = turma.instance.curso

    with connection.cursor() as cursor:
        cursor.execute(f"call BuscaTurma({id},@alunos,@ati,@ref,@vis,@ver,@sen,@intu,@seq,@glo);")
        cursor.execute(f"select @alunos,@ati,@ref,@vis,@ver,@sen,@intu,@seq,@glo;")
        analise = cursor.fetchall()
        cursor.close()
    for item in analise:
        analises={
            "alunos":item[0],
            "ativo":item[1],
            "reflexivo":item[2],
            "visual":item[3],
            "verbal":item[4],
            "sensorial":item[5],
            "intuitivo":item[6],
            "sequencial":item[7],
            "global":item[8]
            }
    return render(request, 'formulario/professor/analise.html', {
        'nome' : nome,
        'analises' : analises
    })