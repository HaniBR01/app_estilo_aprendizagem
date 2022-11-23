from django.contrib.auth.models import AbstractBaseUser
from django.db import models


class Escola(models.Model):
    nome = models.CharField(max_length=50)
    uf = models.CharField(max_length=2)
    cidade = models.CharField(max_length=50)
    endereco = models.CharField(max_length=50)

    def __str__(self):
        return self.nome

class Turma(models.Model):
    curso = models.CharField(max_length=20)
    periodo = models.CharField(max_length=20)
    descricao = models.CharField(max_length=200)
    escola = models.ForeignKey(Escola, on_delete=models.CASCADE, null=True)
    
    def __str__(self):
        return (f"{self.curso}, {self.periodo}")

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

    resposta_choices = (
        ("A","Resposta: A"),
        ("B","Resposta: B"),
    )
    date_create = models.DateTimeField(auto_now_add=True, blank=True)
    usuario = models.ForeignKey(Usuario, on_delete=models.SET_NULL, null=True, blank=True)
    questao_1  = models.CharField(max_length=1, choices=resposta_choices, null=True, blank=True)
    questao_2  = models.CharField(max_length=1, choices=resposta_choices, null=True, blank=True)
    questao_3  = models.CharField(max_length=1, choices=resposta_choices, null=True, blank=True)
    questao_4  = models.CharField(max_length=1, choices=resposta_choices, null=True, blank=True)
    questao_5  = models.CharField(max_length=1, choices=resposta_choices, null=True, blank=True)
    questao_6  = models.CharField(max_length=1, choices=resposta_choices, null=True, blank=True)
    questao_7  = models.CharField(max_length=1, choices=resposta_choices, null=True, blank=True)
    questao_8  = models.CharField(max_length=1, choices=resposta_choices, null=True, blank=True)
    questao_9  = models.CharField(max_length=1, choices=resposta_choices, null=True, blank=True)
    questao_10 = models.CharField(max_length=1, choices=resposta_choices, null=True, blank=True)
    questao_11 = models.CharField(max_length=1, choices=resposta_choices, null=True, blank=True)
    questao_12 = models.CharField(max_length=1, choices=resposta_choices, null=True, blank=True)
    questao_13 = models.CharField(max_length=1, choices=resposta_choices, null=True, blank=True)
    questao_14 = models.CharField(max_length=1, choices=resposta_choices, null=True, blank=True)
    questao_15 = models.CharField(max_length=1, choices=resposta_choices, null=True, blank=True)
    questao_16 = models.CharField(max_length=1, choices=resposta_choices, null=True, blank=True)
    questao_17 = models.CharField(max_length=1, choices=resposta_choices, null=True, blank=True)
    questao_18 = models.CharField(max_length=1, choices=resposta_choices, null=True, blank=True)
    questao_19 = models.CharField(max_length=1, choices=resposta_choices, null=True, blank=True)
    questao_20 = models.CharField(max_length=1, choices=resposta_choices, null=True, blank=True)


    def __str__(self):
        return self.usuario.nome

class Analises(models.Model):
    formulario = models.ForeignKey(Formulario, on_delete=models.CASCADE, blank=True)
    percepcao = models.TextField()
    entrada = models.TextField()
    processamento = models.TextField()
    entendimento = models.TextField()