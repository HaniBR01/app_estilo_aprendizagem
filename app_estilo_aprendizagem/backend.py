from django.contrib.auth.backends import BaseBackend
from django.contrib.auth.hashers import check_password, make_password

from app_estilo_aprendizagem.models import Usuario

print(make_password('123'))

class UsuarioBackend(BaseBackend):

    def authenticate(self, request, **kwargs):
        print(kwargs)
        try:
            usuario = Usuario.objects.get(matricula=kwargs['matricula'])
            print(kwargs['senha'])
            
            if check_password(kwargs['senha'],usuario.senha):
                return usuario
        except:
            pass
        return None

    def get_user(self, user_id):
        return Usuario.objects.get(pk=user_id)

    def has_perm(self, user_obj, perm):
        return True