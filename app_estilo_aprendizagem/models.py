from django.contrib.auth.models import AbstractBaseUser
from django.db import models

class Turma(models.Model):
    curso = models.CharField(max_length=20)
    periodo = models.CharField(max_length=20)
    descricao = models.CharField(max_length=200)
    
    def __str__(self):
        return (f"{self.curso} {self.periodo}")

class Usuario(AbstractBaseUser):
    #dados pessoas
    nome = models.CharField(max_length=100, null=False)
    data_nascimento = models.DateField(null=False)
    genero = models.CharField(max_length=20, null=False)
    
    #dados unicos e primary key
    cpf = models.CharField(max_length=14, null=False, unique=True)
    matricula = models.CharField(max_length=9, null=False, primary_key=True)
    email = models.EmailField(max_length=100, null=False, unique=True)
    telefone = models.CharField(max_length=11, null=False, unique=True)
    
    servidor = models.BooleanField(null=False)
    #servidor é um solução rápida para separar as permissoes,
    #o ideal era ter tipo_pessoa(aluno, nae, professor etc...)
    #pensei em implementar o recurso models.Choice mas demandaria tempo de estudo
    
    #senha
    @property
    def senha(self):
        return self.password

    #foreignKey
    turma = models.ForeignKey(Turma, on_delete=models.SET_NULL, null=True)
    
