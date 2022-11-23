from django.contrib.auth.decorators import login_required
from django.shortcuts import redirect, render, get_object_or_404
from django.forms import ModelForm
from app_estilo_aprendizagem.models import Analises

class AnaliseForm(ModelForm):
    class Meta:
        model = Analises
        fields = '__all__'

@login_required
def listar(request,id):
    lista = Analises.objects.filter(formulario=id).all()

    return render(request, 'formulario/analises.html', {
        'nome' : 'Resultados',
        'lista' : lista
    })