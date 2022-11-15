from django import forms
from django.contrib.auth.hashers import make_password
from django.forms import ModelForm
from django.shortcuts import redirect, render

from app_estilo_aprendizagem.models import Usuario


class UsuarioForm(ModelForm):
    class Meta:
        model = Usuario
        fields = '__all__'
        widgets = {
            'password': forms.PasswordInput()
        }
    def clean_password(self):
        return make_password(self.cleaned_data['password'])

def criar(request):

    frm = UsuarioForm(request.POST or None)

    if frm.is_valid():
        frm.save()
        return redirect('login')

    return render(request, 'auth/cadastro.html',{
        'nome' : 'Cadastre-se',
        'frm':frm
    })
