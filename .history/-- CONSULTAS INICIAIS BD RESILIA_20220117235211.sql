-- CRIANDO VIEW PARA SELECIONAR A QUANTIDADE DE ALUNOS CADASTRADOS NO BANCO
CREATE VIEW vw_alunos_cadastro AS
SELECT COUNT(alunos.nome_aluno) FROM alunos;

--PARA CHECAR:
SELECT * FROM vw_alunos_cadastro

-- CRIANDO VIEW PARA SELECIONAR TODOS OS ALUNOS E OS CURSOS EM QUE ESTÃO CADASTRADOS
CREATE VIEW vw_alunos_cursos AS
SELECT alunos.nome_aluno, cursos.nome_curso FROM alunos 
JOIN cursos
ON cursos.id_curso = alunos.id_curso
GROUP BY alunos.nome_aluno, cursos.nome_curso 
ORDER BY cursos.nome_curso;

--PARA CHECAR:
SELECT * FROM vw_alunos_cursos

--CRIANDO VIEW PARA SELECIONAR QUAIS PESSOAS FACILITADORAS ATUAM EM MAIS DE UMA TURMA
CREATE VIEW vw_facilitador_turma AS 
SELECT alunos.turma, facilitadores.nome_facilitador FROM alunos 
JOIN facilitadores
ON facilitadores.id_facilitador = alunos.id_facilitador 
GROUP BY alunos.turma, facilitadores.nome_facilitador 
ORDER BY COUNT(facilitadores.nome_facilitador) >=2;

--PARA CHECAR:
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

--PARA CHECAR:
SELECT * FROM vw_aluno_facilitador_curso

--CRIANDO VIEW PARA SELECIONAR OS ALUNOS QUE POSSUEM EQUIPAMENTOS EMPRESTADOS:
SELECT alunos.nome_aluno, alunos.id_equipamento, equipamentos.tipo FROM alunos
JOIN equipamentos ON equipamentos.id_aluno = alunos.id_aluno
GROUP BY alunos.nome_aluno, alunos.id_equipamento, equipamentos.tipo
ORDER BY alunos.nome_aluno;

CREATE VIEW vw_alunos_equipamentos AS 
SELECT alunos.nome_aluno, alunos.id_equipamento, equipamentos.tipo FROM alunos
JOIN equipamentos ON equipamentos.id_aluno = alunos.id_aluno
GROUP BY alunos.nome_aluno, alunos.id_equipamento, equipamentos.tipo
ORDER BY alunos.nome_aluno;

SELECT * FROM vw_alunos_equipamentos


