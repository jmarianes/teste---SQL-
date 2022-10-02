create database avaliativa2;
use avaliativa2;
create table produto(
    id integer not null primary key,
    descricao varchar(30),
    quant decimal(9, 3),
    valor decimal(5, 2),
    qt_minima decimal(9, 3),
    perecivel boolean
);
create table entrada(
    id integer not null primary key,
    dt_entrada date,
    qt_entrada decimal(9, 3),
    produto_id integer,
    foreign key(produto_id) references produto(id)
);
create table saida(
    id integer not null primary key,
    dt_saida date,
    qt_entrada decimal,
    saidacol varchar(45),
    produto_id integer,
    foreign key(produto_id) references produto(id)
);
create table lote(
    id integer not null primary key,
    dt_vencimento date,
    num_lote varchar(20),
    qt_lote decimal(9, 3),
    lotecol varchar(45),
    produto_id integer,
    foreign key(produto_id) references produto(id)
);
create table uf(
    id integer not null primary key,
    nome varchar(20),
    sigla char(2)
);
create table municipio(
    id integer not null primary key,
    nome varchar(30),
    uf_id integer,
    foreign key(uf_id) references uf(id)
);
create table cliente(
    id integer not null primary key,
    nome varchar(50),
    logradouro varchar(30),
    numero varchar(6),
    bairro varchar(20),
    municipio_id integer,
    municipio_uf integer,
    foreign key(municipio_id) references municipio(id),
    foreign key(municipio_uf) references uf(id)
);
create table tipo_pagto(
    id integer not null primary key,
    tipo_pagto varchar(20)
);
create table venda(
    id integer not null primary key,
    dt_venda date,
    tipo_pagto_id integer,
    cliente_id integer,
    foreign key(tipo_pagto_id) references tipo_pagto(id),
    foreign key(cliente_id) references cliente(id)
);
create table item_venda(
    id integer not null primary key,
    qt_item decimal(9, 3),
    vr_item decimal(9, 3),
    venda_id integer,
    produto_id integer,
    foreign key(venda_id) references venda(id),
    foreign key(produto_id) references produto(id)
);
create table telefone(
    id integer not null primary key,
    telefone varchar(15),
    cliente_id integer,
    cliente_municipio_id integer,
    cliente_municipio_uf_id integer,
    foreign key(cliente_id) references cliente(id),
    foreign key(cliente_municipio_id) references cliente(municipio_id),
    foreign key(cliente_municipio_uf_id) references cliente(municipio_uf)
);
create table documento(
    id integer not null primary key,
    vr_documento integer,
    dt_vence date,
    venda_id integer,
    venda_tipo_pagto_id integer,
    cliente_id integer,
    foreign key(venda_id) references venda(id),
    foreign key(venda_tipo_pagto_id) references venda(tipo_pagto_id),
    foreign key(cliente_id) references cliente(id)
);
insert into uf
values (1, 'AMAZONAS', 'AM');
insert into uf (id, sigla)
values (2, 'PA');
insert into uf
values (3, 'CEARÁ', 'CE');
insert into uf
values (4, 'PERNAMBUCO', 'PE');
insert into uf
values (5, 'TOCANTINS', 'TO');
insert into uf
values (6, 'MATO GROSSO', 'MT');
insert into uf
values (7, 'SÃO PAULO', 'SP');
insert into uf
values (8, 'MINAS GERAIS', 'MG');
insert into uf
values (9, 'RIO GRANDE DO SUL', 'RS');
insert into uf
values (10, 'SANTA CATARINA', 'SC');
insert into municipio
values (1, 'Manaus', 1);
insert into municipio (id, uf_id)
values (2, 1);
insert into municipio
values (3, 'Belém', 2);
insert into municipio
values (4, 'Novo Progresso', 2);
insert into municipio
values (5, 'Fortaleza', 3);
insert into municipio
values (6, 'Juazeiro do Norte', 3);
insert into municipio
values (7, 'Barbalha', 3);
insert into municipio
values (8, 'Crato', 3);
insert into municipio
values (9, 'Recife', 4);
insert into municipio
values (10, 'Trindade', 4);
insert into municipio
values (11, 'Palmas', 5);
insert into municipio
values (12, 'Nazaré', 5);
insert into municipio
values (13, 'Cuiabá', 6);
insert into municipio
values (14, 'Água Branca', 6);
insert into municipio
values (15, 'São Paulo', 7);
insert into municipio
values (16, 'Osasco', 7);
insert into municipio
values (17, 'Belo Horizonte', 8);
insert into municipio
values (18, 'Campo Azul', 8);
insert into municipio
values (19, 'Porto Alegre', 9);
insert into municipio
values (20, 'Sertão', 9);
insert into municipio
values (21, 'Florianópolis', 10);
insert into municipio
values (22, 'Sertão', 10);
insert into cliente (
        ID,
        NOME,
        LOGRADOURO,
        NUMERO,
        BAIRRO,
        MUNICIPIO_ID
    )
values (
        1,
        'Adriana Penteado',
        'Rua Zuriel Lobato',
        '348',
        'SEABRA',
        6
    );
insert into cliente (
        ID,
        NOME,
        LOGRADOURO,
        NUMERO,
        BAIRRO,
        MUNICIPIO_ID
    )
values (
        2,
        'Bernardo Trindade',
        'Rua Sabino Silva',
        '986',
        'CENTRO',
        6
    );
insert into cliente (
        ID,
        NOME,
        LOGRADOURO,
        NUMERO,
        BAIRRO,
        MUNICIPIO_ID
    )
values (
        3,
        'Graça Junqueira',
        'Av. Belmiro Carneiro',
        '9374A',
        'BAIXÃO',
        6
    );
insert into cliente (
        ID,
        NOME,
        LOGRADOURO,
        NUMERO,
        BAIRRO,
        MUNICIPIO_ID
    )
values (
        4,
        'Juliano Parahyba',
        'Rua Raimunda da Silva',
        '3572',
        'LAGOA',
        6
    );
insert into cliente (
        ID,
        NOME,
        LOGRADOURO,
        NUMERO,
        BAIRRO,
        MUNICIPIO_ID
    )
values (
        5,
        'Eugênio Peres',
        'Rua André Leão',
        '876B',
        'BRASÍLIA',
        7
    );
insert into cliente (
        ID,
        NOME,
        LOGRADOURO,
        NUMERO,
        BAIRRO,
        MUNICIPIO_ID
    )
values (
        6,
        'Amelia Carmelino',
        'Rua Leite Neto',
        '5737',
        'CACIMBAS',
        8
    );
insert into cliente (ID, NOME, LOGRADOURO, BAIRRO)
values (
        7,
        'Francisco Silva',
        'Av. Francisco Silva',
        'CENTRO'
    );
insert into cliente (
        ID,
        NOME,
        LOGRADOURO,
        NUMERO,
        BAIRRO,
        MUNICIPIO_ID
    )
values (
        8,
        'Caetalto Teles',
        'Av. Delfina Caldas',
        '945',
        'CENTRO',
        10
    );
insert into tipo_pagto
values (1, 'DINHEIRO');
insert into tipo_pagto
values (2, 'CARTÃO');
insert into tipo_pagto
values (3, 'BOLETO');
insert into produto
values (
        1,
        'BAUDUCCO - BISCOITO WAFER',
        100,
        1.85,
        10,
        TRUE
    );
insert into produto
values (
        2,
        'BOMBRIL - ESPONJA DE AÇO',
        200,
        1.99,
        20,
        FALSE
    );
insert into produto
values (3, 'COCA-COLA - REFRIGRANTE', 50, 6.50, 10, TRUE);
insert into produto
values (4, 'DANONINHO - PETIT SUISSE', 25, 5.99, 5, TRUE);
insert into produto
values (
        5,
        'DONA BENTA - FARINHA DE TRIGO',
        17,
        5.99,
        6,
        TRUE
    );
insert into produto
values (
        6,
        'ELEFANTE - EXTRATO DE TOMATE',
        12,
        3.50,
        5,
        TRUE
    );
insert into produto
values (7, 'HAVAINAS - CHINELO', 15, 20.0, 10, FALSE);
insert into produto
values (8, 'KIBON - SORVETE', 9, 18.99, 10, FALSE);
insert into produto
values (9, 'KNORR - CALDO', 72, 1.47, 50, FALSE);
insert into produto
values (
        10,
        'LUX - SABONETE EM BARRA',
        48,
        1.99,
        20,
        FALSE
    );
insert into produto
values (11, 'MAGGI - SOPA', 4, 4.59, 8, TRUE);
insert into produto
values (12, 'NESCAFÉ - CAFÉ SOLÚVEL', 90, 3.55, 50, TRUE);
insert into produto
values (
        13,
        'NESCAU - ACHOCOLATADO EM PÓ',
        13,
        7.70,
        10,
        FALSE
    );
insert into produto
values (
        14,
        'NISSIN LÁMEN - INSTANT NEO',
        33,
        1.29,
        25,
        TRUE
    );
insert into produto
values (15, 'OMO - SABÃO EM PÓ', 26, 9.70, 7, TRUE);
insert into venda
values (1, '2019-11-06', 1, 1);
insert into venda
values (2, '2019-11-06', 3, 2);
insert into venda
values (3, '2019-11-16', 2, 1);
insert into venda
values (4, '2019-11-16', 1, 3);
insert into venda
values (5, '2019-11-26', 3, 3);
insert into venda
values (6, '2019-11-26', 1, 2);
insert into venda
values (7, '2019-12-01', 2, 1);
insert into venda
values (8, '2019-12-01', 3, 1);
insert into venda
values (9, '2019-12-06', 2, 3);
insert into venda
values (10, '2019-12-06', 3, 2);
insert into venda
values (11, '2019-12-06', 1, 2);
insert into venda
values (12, '2019-12-06', 3, 3);
insert into venda
values (13, '2019-12-06', 2, 2);
insert into venda
values (14, '2019-12-06', 1, 2);
insert into venda
values (15, '2019-12-16', 2, 3);
insert into venda
values (16, '2019-12-16', 3, 3);
insert into venda
values (17, '2019-12-16', 1, 1);
insert into venda
values (18, '2019-12-26', 3, 3);
insert into venda
values (19, '2019-12-26', 1, 3);
insert into venda
values (20, '2019-12-26', 2, 2);
insert into documento (id, vr_documento, dt_vence, venda_id, cliente_id)
values (1, 4.41, '2020-11-21', 4, 4);
insert into documento (id, vr_documento, dt_vence, venda_id, cliente_id)
values (2, 129.10, '2020-11-26', 5, 3);
insert into documento (id, vr_documento, dt_vence, venda_id, cliente_id)
values (3, 61.72, '2020-12-01', 9, 5);
insert into documento (id, vr_documento, dt_vence, venda_id, cliente_id)
values (4, 98.40, '2020-12-06', 12, 3);
insert into documento (id, vr_documento, dt_vence, venda_id, cliente_id)
values (5, 80.82, '2020-12-16', 15, 2);
insert into documento (id, vr_documento, dt_vence, venda_id, cliente_id)
values (6, 31.84, '2020-11-25', 16, 3);
insert into documento (id, vr_documento, dt_vence, venda_id, cliente_id)
values (7, 180.09, '2021-01-07', 18, 3);
insert into documento (id, vr_documento, dt_vence, venda_id, cliente_id)
values (8, 7.74, '2021-03-26', 19, 1);
insert into item_venda
values (1, 1, 13, 6, 7.70);
insert into item_venda (id, venda_id, produto_id, qt_item, vr_item)
values (2, 2, 3, 8, 6.50);
insert into item_venda (id, venda_id, produto_id, qt_item, vr_item)
values (3, 3, 8, 9, 18.99);
insert into item_venda
values (4, 3, 3, 10, 6.50);
insert into item_venda
values (5, 3, 12, 5, 3.55);
insert into item_venda
values (6, 3, 10, 9, 1.99);
insert into item_venda
values (7, 4, 9, 3, 1.47);
insert into item_venda
values (8, 5, 9, 9, 1.47);
insert into item_venda
values (9, 5, 2, 9, 1.99);
insert into item_venda
values (10, 5, 6, 4, 3.50);
insert into item_venda
values (11, 5, 4, 4, 5.99);
insert into item_venda (id, venda_id, produto_id, qt_item, vr_item)
values (12, 5, 7, 3, 20.00);
insert into item_venda
values (13, 6, 10, 4, 1.99);
insert into item_venda
values (14, 6, 6, 6, 3.50);
insert into item_venda
values (15, 6, 13, 2, 7.70);
insert into item_venda
values (16, 7, 12, 10, 3.55);
insert into item_venda
values (17, 7, 1, 6, 1.85);
insert into item_venda
values (18, 7, 11, 4, 4.59);
insert into item_venda
values (19, 8, 14, 3, 1.29);
insert into item_venda
values (20, 9, 11, 3, 4.59);
insert into item_venda
values (21, 9, 12, 7, 3.55);
insert into item_venda
values (22, 9, 13, 3, 7.70);
insert into item_venda
values (23, 10, 10, 8, 1.99);
insert into item_venda
values (24, 11, 3, 7, 6.50);
insert into item_venda
values (25, 12, 13, 5, 7.70);
insert into item_venda
values (26, 12, 4, 10, 5.99);
insert into item_venda
values (27, 13, 15, 3, 9.70);
insert into item_venda
values (28, 13, 13, 10, 7.70);
insert into item_venda
values (29, 13, 6, 6, 3.50);
insert into item_venda
values (30, 13, 10, 8, 1.99);
insert into item_venda
values (31, 14, 3, 6, 6.50);
insert into item_venda (id, venda_id, produto_id, qt_item, vr_item)
values (32, 14, 8, 2, 18.99);
insert into item_venda
values (33, 15, 5, 8, 5.99);
insert into item_venda
values (34, 15, 11, 5, 4.59);
insert into item_venda
values (35, 15, 10, 5, 1.99);
insert into item_venda
values (36, 16, 12, 1, 3.55);
insert into item_venda
values (37, 16, 14, 8, 1.29);
insert into item_venda
values (38, 16, 5, 3, 5.99);
insert into item_venda
values (39, 17, 3, 3, 6.50);
insert into item_venda
values (40, 17, 12, 2, 3.55);
insert into item_venda
values (41, 17, 1, 3, 1.85);
insert into item_venda
values (42, 18, 11, 10, 4.59);
insert into item_venda
values (43, 18, 14, 11, 1.29);