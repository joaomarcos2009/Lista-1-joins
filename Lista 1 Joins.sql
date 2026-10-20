CREATE DATABASE DB_ESCOLA_JOIN;
USE DB_ESCOLA_JOIN;

CREATE TABLE Alunos (
    cod INT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100)
);

-- Inserindo dados na tabela Alunos
INSERT INTO Alunos (cod, nome, cidade) VALUES
(1, 'Carlos', 'Sorocaba'),
(2, 'Beatriz', 'Itu'),
(3, 'Lucas', 'Votorantim');

-- Criando a tabela Matriculas
CREATE TABLE Matriculas (
    cod INT PRIMARY KEY,
    valor DECIMAL(10, 2),
    data DATE,
    cod_aluno INT,
    FOREIGN KEY (cod_aluno) REFERENCES Alunos(cod)
);

-- Inserindo dados na tabela Matriculas
INSERT INTO Matriculas (cod, valor, data, cod_aluno) VALUES
(1, 180.00, '2023-10-10', 1),
(2, 250.00, '2023-10-11', 2),
(3, 400.00, '2023-10-12', 1);

-- exercicio 1
INSERT INTO Alunos (cod, nome, cidade) VALUES
(4, 'anderson', 'Holambra'),
(5, 'admir', 'Campos do Jordão'),
(6, 'vanessa', 'Socorro'),
(7, 'sasha', 'Campinas'),
(8, 'isabelli', 'Ribeirão Preto'),
(9, 'Caio', 'Jundiaí'),
(10, 'José', 'São Roque');

-- exercicio 2

select Alunos.nome, Alunos.cidade, Matriculas.valor
from Alunos
join Matriculas
on Alunos.cod = Matriculas.cod_aluno;

-- exercicio 3

select 
Alunos.nome, 
Matriculas.valor
from Alunos
join Matriculas
on Alunos.cod = Matriculas.cod_aluno;

-- exercicio 4

select Alunos.nome, 
Matriculas.cod, Matriculas.valor, Matriculas.data, Matriculas.cod_aluno
from Alunos
join Matriculas
on Alunos.cod = Matriculas.cod_aluno;

-- exercicio 5

select Alunos.nome, Matriculas.cod is null
from Alunos
join Matriculas
on Alunos.cod = Matriculas.cod_aluno;

-- exercicio 6

select Alunos.nome, Matriculas.valor >= 200.00
from Alunos
join Matriculas
on Alunos.cod = Matriculas.cod_aluno;

-- exercicio 7

select data, Alunos.nome, Matriculas.data >= '2023-10-01' && data <= '2023-11-1'
from Alunos
join Matriculas
on Alunos.cod = Matriculas.cod_aluno;