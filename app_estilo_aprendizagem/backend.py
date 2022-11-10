from django.contrib.auth.backends import BaseBackend
from django.contrib.auth.hashers import check_password, make_password
from django.shortcuts import redirect, render

from app_estilo_aprendizagem.models import Usuario

class UsuarioBackend(BaseBackend):

    def authenticate(self, request, **kwargs):
        try:
            usuario = Usuario.objects.get(matricula=kwargs['matricula'])
            if check_password(kwargs['senha'],usuario.senha):
                return usuario
        except:
            pass
        return None

    def get_user(self, user_id):
        return Usuario.objects.get(pk=user_id)

    def has_perm(self, user_obj, perm):
        return True
    
    def sing_up(self, request, **kwargs):
    
    if frm.is_valid():
        frm.save()
        return redirect('home')

    return render(request, 'auth/login.html', {
        'frm': frm
    })