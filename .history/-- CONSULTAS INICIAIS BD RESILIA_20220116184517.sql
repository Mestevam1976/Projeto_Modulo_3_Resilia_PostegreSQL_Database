
--SELECIONAR A QUANTIDADE DE ALUNOS CADASTRADOS NO BANCO
SELECT COUNT(alunos.nome_aluno) FROM alunos

--SELECIONAR TODOS OS ALUNOS E OS CURSOS EM QUE ESTÃO CADASTRADOS
SELECT alunos.nome_aluno, cursos.nome_curso FROM alunos 
JOIN cursos
ON cursos.id_curso = alunos.id_curso
GROUP BY alunos.nome_aluno, cursos.nome_curso 
ORDER BY cursos.nome_curso

--SELECIONAR QUAIS PESSOAS FACILITADORAS ATUAM EM MAIS DE UMA TURMA
SELECT alunos.turma, facilitadores.nome_facilitador FROM alunos 
JOIN facilitadores
ON facilitadores.id_facilitador = alunos.id_facilitador 
GROUP BY alunos.turma, facilitadores.nome_facilitador 
ORDER BY COUNT(facilitadores.nome_facilitador) >=2

--SELECIONAR CONSULTA DE 03 TABELAS DIFERENTES
SELECT alunos.nome_aluno, facilitadores.nome_facilitador, cursos.nome_curso FROM alunos 
JOIN facilitadores
ON facilitadores.id_facilitador = alunos.id_facilitador 
JOIN cursos
ON cursos.id_curso = alunos.id_curso
GROUP BY alunos.nome_aluno, facilitadores.nome_facilitador, cursos.nome_curso 
ORDER BY cursos.nome_curso
