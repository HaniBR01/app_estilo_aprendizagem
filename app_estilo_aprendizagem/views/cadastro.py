from django import forms
from django.contrib.auth.hashers import make_password
from django.forms import ModelForm
from django.shortcuts import redirect, render

from app_estilo_aprendizagem.models import Usuario


class UsuarioForm(ModelForm):
    class Meta:
        model = Usuario
        fields = '__all__'

def criar(request):

    frm = UsuarioForm(request.POST or None)

    if frm.is_valid():
        frm.password = make_password(frm.password)
        frm.save()
        return redirect('login')

    return render(request, 'auth/cadastro.html',{
        'nome' : 'Cadastre-se',
        'frm':frm
    })
