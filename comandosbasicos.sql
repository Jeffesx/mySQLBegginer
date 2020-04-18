/*criando o banco*/
create database banco;
/* usando o banco*/
use banco;
/*create database banco2;*/
/*apagando o banco*/
drop database jeffe;
/*criando tabela/entidade e colunas*/
create table clientes(
id int,
nome varchar(100)
);
/*Inserindo informação em uma coluna selecionando coluna 1 einserindo o valor após a virgula*/
insert into clientes values(1,'José da Silva');
/*selecionando todos os valores da tabela*/
select*from clientes;
insert into clientes(nome,id) values ('joão da silva',2);
drop database banco;
create database jeffe;
use database jeffe;
create table tb_funcionario(
/*inteiro*/
id int,
/*caracter*/
nome varchar(100),
/*decimal*/
salario decimal(10,2),
/*data*/
adimissao date,
/*validação de valores*/
sexo enum('M','F'),
/*trása data atual*/
cadastro timestamp default current_timestamp()
);
insert into tb_funcionario values(1,'Pedro Henrique',1000.00,'2019-01-01','M',null);
select*from tb_funcionario;
/*alteração da tabela*/
update tb_funcionario
set salario = salario * 1.1;
/*conta a quantidade de linha em uma coluna*/
select count(*) as total from tb_funcionario;
/*convertendo uma expressão em decimal*/
select nome,salario as atual,
(salario*1.1, decimal(10,2)) as 'salario com aumento de 10%'

from tb_funcionario;
/*um comando possui uma ou mais clausulas e as clausulas possuem operadores*/
/*O operator respeita o Datatype*/
/*Igual:= Diferente:<>*/
select*from tb_funcionario where sexo = 'M';
/*Operador AND*/
select*from tb_funcionario where sexo 'M' and salario>1000;
update tb_funcionario set salario = salario*1.4 where id =3;
/*Operador OR*/
select*from tb_funcionario where sexo 'F' or salario>1000;
update tb_funcionario set salario = salario*1.4 where id =3;
/*Operadores de busca*/
/*busca algum nome que possui o j nele*/
select*from tb_funcionarios where nome LIKE '%j%';
/*busca algum nome que possui o j no inicio dele*/
select*from tb_funcionarios where nome LIKE 'j%';
/*busca algum nome que possui o j no final dele*/
select*from tb_funcionarios where nome LIKE '%j';
/*busca algum nome que possui o j em alguma referência sendo escrito com _ que significa espaços*/
select*from tb_funcionarios where nome LIKE '__j%';
/*busca algum nome que não começa com a letra j*/
select*from tb_funcionarios where nome not LIKE 'j%';
/*busca um valor entre um intervalo pré definido*/
select*from tb_funcionario where salario between 1000 and 2000;
/*pesquisa de nomes de escritas diferentes por exemplo o nome :Luiz, quando utilizar com iguldades no inicio da pronuncia terá que utilizar or*/
select*from tb_funcionario where soundex(nome) = soundex('Luis');
/*verificação de datas*/
/*UPDATE SEMPRE COM WHERE*/
/*alterar a data de um certo id para a data atual*/
update tb_funcionario set admissao = CURRENT_DATE() WHERE id = 1;
/*altera a data atual e adiciona os dias (data,intervalo de dias) */
update tb_funcionario set admissao = date_add(current_date(),interval 60 DAY) WHERE ID = 2;
/* verificando a diferença de dias de uma daata comparando com a data atual*/
select datediff(admissao, CURRENT_DATE()) as 'diferença de dias' FROM tb_funcionario where id=2;
/*seleciona as pessoas que tiveram admissao no mes 2*/
select*from tb_funcionario where month(admisao) = 2;
/*clausula ORDERBY E LIMIT sempre no final do select*/
/*ordenando em ordem alfabética pode ser colocado o numero da coluna também*/
select*from tb_funcionario order by nome;
/*ordenando de forma descendente do maior para o menor*/
select*from tb_funcionario order by salario desc;
/*subordenação  em cima da outra ordenação colocando os menores em ordem alfabética*/
select*from tb_funcionario order by salario desc,nome asc;
/*limitando um valor na busca limit ponto inicial,pontofinal*/
select*from tb_funcionario order by salario limit 0,3;
/*UPDATE RECURSOS updete sem where está errado*/
update tb_funcionario
set salario ='3000'
where id = 3;

/*alterando mais de uma coluna*/
update tb_funcionario
set salario =3000, admissao='2016-12-29'
where id = 6;
/*DELETE sem where não existe*/
/*deletando uma linha*/
delete from tb_funcionario where id=1;
/* inicia uma ação que pode ser cancelada*/
start transaction
delete from tb_pessoas;
/*Desfaz oque foi feito.*/
rollback;
/*confirma o transaction*/
commit;
/*utilizado para zerar id, utilizado para coletar dados de outra tabela*/
truncate table tb_pessoas;



