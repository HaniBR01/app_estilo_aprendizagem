from django.contrib.auth.decorators import login_required
from django.shortcuts import redirect, render
from django.forms import ModelForm
from app_estilo_aprendizagem.models import Formulario

class FormularioForm(ModelForm):
    class Meta:
        model = Formulario
        fields = '__all__'

@login_required
def formulario(request):

    frm = FormularioForm(request.POST or None)
    
    if frm.is_valid():
        frm.instance.usuario = request.user
        frm.save()
        return redirect(f'analise/{frm.instance.id}')

    return render(request,'formulario/formulario.html',{
        "frm":frm
    })

@login_required
def listar(request):

    formularios =  Formulario.objects.filter(usuario=request.user).all()

    return render(request, 'formulario/listar.html', {
        'nome' : 'Meus Testes',
        'formularios' : formularios
    })