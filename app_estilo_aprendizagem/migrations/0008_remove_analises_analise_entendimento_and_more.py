# Generated by Django 4.1.2 on 2022-12-20 19:48

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app_estilo_aprendizagem', '0007_usuario_turma'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='analises',
            name='analise_entendimento',
        ),
        migrations.RemoveField(
            model_name='analises',
            name='analise_entrada',
        ),
        migrations.RemoveField(
            model_name='analises',
            name='analise_percepcao',
        ),
        migrations.RemoveField(
            model_name='analises',
            name='analise_processamento',
        ),
        migrations.AddField(
            model_name='analises',
            name='usuario_nome',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='app_estilo_aprendizagem.usuario'),
        ),
        migrations.CreateModel(
            name='Form_Atual',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('aluno', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='app_estilo_aprendizagem.usuario')),
                ('analises', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='app_estilo_aprendizagem.analises')),
            ],
        ),
    ]