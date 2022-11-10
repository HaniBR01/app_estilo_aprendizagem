from django.contrib import auth
from django.forms import ModelForm
from django.shortcuts import redirect, render
from app_estilo_aprendizagem.models import Usuario

class UsuarioForm(ModelForm):
    class Meta:
        model = Usuario
        fields = '__all__'

def sing_up(request):
    frm = UsuarioForm

    if frm.is_valid():
        frm.save()
        return redirect('home')

    return render(request, 'auth/login.html', {
        'frm': frm
    })

def login(request):
    frm = UsuarioForm(request.POST or None)

    if frm.is_valid():
        usuario = auth.authenticate(request, email = frm.cleaned_data['email'], senha=frm.cleaned_data['senha'])

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