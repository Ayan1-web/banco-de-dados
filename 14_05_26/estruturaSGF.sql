**Schema (MySQL v5.7)**

    CREATE TABLE obra (
        id_obra SERIAL PRIMARY KEY,
        codigo_obra VARCHAR(10) NOT NULL,
        nome_obra VARCHAR(200) NOT NULL,
        fator_k NUMERIC(5,4) NOT NULL,
        bdi NUMERIC(6,4) NOT NULL
    );
    
    CREATE TABLE item (
        id_item SERIAL PRIMARY KEY,
        codigo_item VARCHAR(20) NOT NULL,
        descricao VARCHAR(300) NOT NULL,
        unidade VARCHAR(5) NOT NULL,
        preco_unitario NUMERIC(15,2) NOT NULL
    );
    
    CREATE TABLE item_orcado (
        id_orcado SERIAL PRIMARY KEY,
        id_obra INTEGER NOT NULL REFERENCES obra(id_obra),
        id_item INTEGER NOT NULL REFERENCES item(id_item),
        quantidade NUMERIC(15,4) NOT NULL DEFAULT 0,
        preco_final NUMERIC(15,2)
    );

---

**Query #1**

    INSERT INTO obra (codigo_obra, nome_obra, fator_k, bdi)
    VALUES
    ('00000D',
    'MANUT.ELET.PREV.E COR. MED/BAIXA TENS NA CAP.E INT - REG.1 E 3 - LOTE 02',
    0.7600, 0.2404),
    
    ('11111A',
    'CCO - CADASTRO GERAL SINAPI',
    0.7600, 0.2404),
    
    ('22222B',
    'MANUTENCAO PREVENTIVA E CORRETIVA DE PREDIOS PUBLICOS, DO DETRAN - LOTE 2',
    0.7600, 0.2404);

There are no results to be displayed.

---
**Query #2**

    INSERT INTO item (codigo_item, descricao, unidade, preco_unitario)
    VALUES
    ('27-01-01-001 O',
    'ADMINISTRACAO LOCAL PARA O.S. ATE R$ 1.000,00',
    'UN', 251.98),
    
    ('27-01-01-006 O',
    'ADMINISTRACAO LOCAL PARA O.S. DE R$ 5.000,01 A R$ 10.000,00',
    'UN', 2081.60),
    
    ('27-01-01-013 O',
    'DESLOCAMENTO PARA CAMINHAO CARROCERIA, INCLUSIVE MOTORISTA E COMBUSTIVEL',
    'KM', 5.74),
    
    ('02-01-01-300 O',
    'ADICIONAL HORA EXTRA DOMINGOS/FERIADOS 110% - PEDREIRO CS:88309',
    'H', 30.45),
    
    ('02-01-01-301 O',
    'ADICIONAL HORA EXTRA DOMINGOS/FERIADOS 110% - AJUDANTE ESPECIALIZADO CS:88243',
    'H', 22.54);

There are no results to be displayed.

---
**Query #3**

    INSERT INTO item_orcado (id_obra, id_item, quantidade, preco_final)
    VALUES
    (1, 1, 5.00, 191.50),
    (1, 3, 120.00, 4.36),
    (1, 4, 8.00, 23.14),
    
    (2, 2, 3.00, 1582.02),
    (2, 5, 10.00, 17.13),
    
    (3, 1, 2.00, 191.50),
    (3, 4, 20.00, 23.14);

There are no results to be displayed.

---
**Query #4**

    SELECT
        o.codigo_obra,
        o.nome_obra,
        i.codigo_item,
        i.descricao,
        i.unidade,
        io.quantidade,
        io.preco_final,
        ROUND(io.quantidade * io.preco_final, 2) AS total_item
    FROM item_orcado io
    INNER JOIN obra o
        ON io.id_obra = o.id_obra
    INNER JOIN item i
        ON io.id_item = i.id_item
    ORDER BY o.codigo_obra, i.codigo_item;

| codigo_obra | nome_obra                                                                 | codigo_item    | descricao                                                                     | unidade | quantidade | preco_final | total_item |
| ----------- | ------------------------------------------------------------------------- | -------------- | ----------------------------------------------------------------------------- | ------- | ---------- | ----------- | ---------- |
| 00000D      | MANUT.ELET.PREV.E COR. MED/BAIXA TENS NA CAP.E INT - REG.1 E 3 - LOTE 02  | 02-01-01-300 O | ADICIONAL HORA EXTRA DOMINGOS/FERIADOS 110% - PEDREIRO CS:88309               | H       | 8.0        | 23.14       | 185.12     |
| 00000D      | MANUT.ELET.PREV.E COR. MED/BAIXA TENS NA CAP.E INT - REG.1 E 3 - LOTE 02  | 27-01-01-001 O | ADMINISTRACAO LOCAL PARA O.S. ATE R$ 1.000,00                                 | UN      | 5.0        | 191.5       | 957.5      |
| 00000D      | MANUT.ELET.PREV.E COR. MED/BAIXA TENS NA CAP.E INT - REG.1 E 3 - LOTE 02  | 27-01-01-013 O | DESLOCAMENTO PARA CAMINHAO CARROCERIA, INCLUSIVE MOTORISTA E COMBUSTIVEL      | KM      | 120.0      | 4.36        | 523.2      |
| 11111A      | CCO - CADASTRO GERAL SINAPI                                               | 02-01-01-301 O | ADICIONAL HORA EXTRA DOMINGOS/FERIADOS 110% - AJUDANTE ESPECIALIZADO CS:88243 | H       | 10.0       | 17.13       | 171.3      |
| 11111A      | CCO - CADASTRO GERAL SINAPI                                               | 27-01-01-006 O | ADMINISTRACAO LOCAL PARA O.S. DE R$ 5.000,01 A R$ 10.000,00                   | UN      | 3.0        | 1582.02     | 4746.06    |
| 22222B      | MANUTENCAO PREVENTIVA E CORRETIVA DE PREDIOS PUBLICOS, DO DETRAN - LOTE 2 | 02-01-01-300 O | ADICIONAL HORA EXTRA DOMINGOS/FERIADOS 110% - PEDREIRO CS:88309               | H       | 20.0       | 23.14       | 462.8      |
| 22222B      | MANUTENCAO PREVENTIVA E CORRETIVA DE PREDIOS PUBLICOS, DO DETRAN - LOTE 2 | 27-01-01-001 O | ADMINISTRACAO LOCAL PARA O.S. ATE R$ 1.000,00                                 | UN      | 2.0        | 191.5       | 383.0      |

---
**Query #5**

    SELECT
        o.codigo_obra,
        o.nome_obra,
        COUNT(io.id_orcado) AS qtd_itens,
        SUM(io.quantidade * io.preco_final) AS valor_total_k,
    
        ROUND(
            SUM(io.quantidade * io.preco_final) * (1 + o.bdi),
            2
        ) AS valor_com_bdi
    
    FROM item_orcado io
    
    INNER JOIN obra o
        ON io.id_obra = o.id_obra
    
    INNER JOIN item i
        ON io.id_item = i.id_item
    
    GROUP BY
        o.id_obra,
        o.codigo_obra,
        o.nome_obra,
        o.bdi
    
    ORDER BY valor_com_bdi DESC;

| codigo_obra | nome_obra                                                                 | qtd_itens | valor_total_k | valor_com_bdi |
| ----------- | ------------------------------------------------------------------------- | --------- | ------------- | ------------- |
| 11111A      | CCO - CADASTRO GERAL SINAPI                                               | 2         | 4917.36       | 6099.49       |
| 00000D      | MANUT.ELET.PREV.E COR. MED/BAIXA TENS NA CAP.E INT - REG.1 E 3 - LOTE 02  | 3         | 1665.82       | 2066.28       |
| 22222B      | MANUTENCAO PREVENTIVA E CORRETIVA DE PREDIOS PUBLICOS, DO DETRAN - LOTE 2 | 2         | 845.8         | 1049.13       |

---

[View on DB Fiddle](https://www.db-fiddle.com/f/ujyXi9uHg6DSDyySpjYFvM/0)
