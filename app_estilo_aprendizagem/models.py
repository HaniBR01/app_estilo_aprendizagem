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
    genero_choices = (
        ("M", "Masculino"),
        ("F", "Feminino"),
        ("N", "Prefiro não declarar")
    )
    genero = models.CharField(max_length=1, choices=genero_choices,null=False)
    
    #dados unicos e primary key
    cpf = models.CharField(max_length=14, null=False, unique=True)
    matricula = models.CharField(max_length=7, null=False, unique=True)
    USERNAME_FIELD = 'matricula'
    email = models.EmailField(max_length=100, null=False, unique=True)
    telefone = models.CharField(max_length=11, null=False, unique=True)
    
    tipo_pessoa_choices = (
        ("N", "Núcleo de Apoio ao Educando"),
        ("A", "Aluno"),
        ("P", "Professor"),
        ("S", "Secretario"),
    )
    tipo_pessoa = models.CharField(max_length=1, choices=tipo_pessoa_choices,null=False)
    #utilizei o recurso choice para implementar permissoes posteriormente
    
    #senha
    @property
    def senha(self):
        return self.password

    #foreignKey
    turma = models.ForeignKey(Turma, on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return self.nome

class Formulario(models.Model):
    
    date_create = models.DateTimeField(auto_now=True, blank=True)
    usuario = models.ForeignKey(Usuario, on_delete=models.SET_NULL, null=True)
    
    def __str__(self):
        return self.usuario

class Questao(models.Model):
    
    numero = models.IntegerField(null=False)
    enunciado = models.TextField(null=False)
    opcaoA = models.TextField(null=False)
    opcaoB = models.TextField(null=False)
    resposta_choices = (
        ("A",opcaoA),
        ("B",opcaoB),
    )
    resposta = models.CharField(max_length=1, choices=resposta_choices, null=False)
    formulario = models.ForeignKey(Formulario, on_delete=models.CASCADE, null=False)