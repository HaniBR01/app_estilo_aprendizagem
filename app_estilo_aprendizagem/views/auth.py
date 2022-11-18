from django.contrib import auth
from django import forms
from django.shortcuts import redirect, render
from django.contrib.auth.hashers import make_password
from django.forms import ModelForm
from app_estilo_aprendizagem.models import Usuario

class LoginForm(forms.Form):
    matricula = forms.CharField(max_length=7)
    senha = forms.CharField(widget=forms.PasswordInput)

class UsuarioForm(ModelForm):
    class Meta:
        model = Usuario
        fields = '__all__'
        widgets = {
            'password': forms.PasswordInput()
        }
    def clean_password(self):
        return make_password(self.cleaned_data['password'])

def cadastro(request):

    frm = UsuarioForm(request.POST or None)

    if frm.is_valid():
        frm.save()
        return redirect('login')

    return render(request, 'auth/cadastro.html',{
        'nome' : 'Cadastre-se',
        'frm':frm
    })


def login(request):
    frm = LoginForm(request.POST or None)

    if frm.is_valid():
        usuario = auth.authenticate(request, matricula = frm.cleaned_data['matricula'], senha=frm.cleaned_data['senha'])

        if usuario is not None:
            auth.login(request, usuario)
            return redirect('home')
        else:
            frm.add_error(None, 'Usuário ou senha inválidos')

    return render(request, 'auth/login.html', {
        'frm':  frm
    })

def logout(request):
    auth.logout(request)
    return redirect('login')