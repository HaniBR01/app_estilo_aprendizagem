from django.contrib.auth.decorators import login_required
from django.shortcuts import redirect, render, get_object_or_404
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
        frm.usuario = request.user.id
        frm.save()
        redirect('home')

    return render(request,'formulario/formulario.html',{
        "frm":frm
    })