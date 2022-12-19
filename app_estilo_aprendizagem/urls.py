"""app_estilo_aprendizagem URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from app_estilo_aprendizagem.views import auth, pages,formulario, analise

urlpatterns = [
    path('login', auth.login, name='login'),
    path('', pages.home, name='home'),
    path('logout', auth.logout, name='logout'),
    path('cadastro',auth.cadastro,name='cadastro'),
    path('formulario',formulario.formulario,name='formulario'),
    path('listar', formulario.listar, name='listar'),
    path('analise/<id>',analise.listar,name='analise')
]
