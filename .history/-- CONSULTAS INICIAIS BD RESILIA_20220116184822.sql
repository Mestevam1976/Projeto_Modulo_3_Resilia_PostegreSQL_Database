-- CRIANDO VIEW PARA SELECIONAR A QUANTIDADE DE ALUNOS CADASTRADOS NO BANCO
CREATE VIEW vw_alunos_cadastro AS
SELECT COUNT(alunos.nome_aluno) FROM alunos;

--PARA CHECAR:
SELECT 

-- CRIANDO VIEW PARA SELECIONAR TODOS OS ALUNOS E OS CURSOS EM QUE ESTÃO CADASTRADOS
CREATE VIEW vw_alunos_cursos AS
SELECT alunos.nome_aluno, cursos.nome_curso FROM alunos 
JOIN cursos
ON cursos.id_curso = alunos.id_curso
GROUP BY alunos.nome_aluno, cursos.nome_curso 
ORDER BY cursos.nome_curso;

--CRIANDO VIEW PARA SELECIONAR QUAIS PESSOAS FACILITADORAS ATUAM EM MAIS DE UMA TURMA
CREATE VIEW vw_facilitador_turma AS 
SELECT alunos.turma, facilitadores.nome_facilitador FROM alunos 
JOIN facilitadores
ON facilitadores.id_facilitador = alunos.id_facilitador 
GROUP BY alunos.turma, facilitadores.nome_facilitador 
ORDER BY COUNT(facilitadores.nome_facilitador) >=2;

SELECT * FROM vw_facilitador_turma

-- NOVAS CONSULTAS
--CRIANDO VIEW PARA SELECIONAR CONSULTA DE ALUNO X FACILITADOR X CURSO
CREATE VIEW vw_aluno_facilitador_curso AS
SELECT alunos.nome_aluno, facilitadores.nome_facilitador, cursos.nome_curso FROM alunos 
JOIN facilitadores
ON facilitadores.id_facilitador = alunos.id_facilitador 
JOIN cursos
ON cursos.id_curso = alunos.id_curso
GROUP BY alunos.nome_aluno, facilitadores.nome_facilitador, cursos.nome_curso 
ORDER BY cursos.nome_curso;

SELECT * FROM vw_aluno_facilitador_curso

