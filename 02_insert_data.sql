BEGIN;

INSERT INTO Continente (Nome, Descricao, Info_Produtivas, Info_Climaticas) VALUES
    ('Westeros', 'O principal continente do mundo conhecido', 'Grãos e ferro', 'Temperado e frio'),
    ('Essos', 'O continente oriental do mundo conhecido', 'Especiarias e cavalos', 'Mediterrâneo e estepe'),
    ('Sothoryos', 'Um continente ao sul, cheio de mistérios', 'Madeiras raras e gemas', 'Tropical e úmido'),
    ('Ulthos', 'Uma terra distante e hostil', 'Minerais desconhecidos', 'Árido e vulcânico'),
    ('As Terras do Inverno Eterno', 'Terras congeladas além da Muralha', 'Sem agricultura', 'Gelado e inóspito'),
    ('O Mar do Verão', 'O mar que margeia as terras ocidentais', 'Pesca e sal', 'Ameno e marítimo');
 
INSERT INTO Guerra (Nome, Data_Inicio, Data_Fim) VALUES
    ('Guerra dos Cinco Reis', '1298-01-01', '1300-01-01'),
    ('Dança dos Dragões', '1301-01-01', '1303-01-01'),
    ('A Longa Noite', '1304-01-01', '1306-01-01'),
    ('A Rebelião de Blackfyre', '1307-01-01', '1308-01-01'),
    ('A Guerra dos Degraus de Pedra', '1309-01-01', '1310-01-01'),
    ('A Conquista de Dorne', '1311-01-01', NULL);
 
INSERT INTO Profissao (Nome) VALUES
    ('Rei'),
    ('Cavaleiro'),
    ('Meestre'),
    ('Lorde Comandante'),
    ('Septão'),
    ('Construtor');
 
INSERT INTO Dragao (Nome, Estado, Tamanho, Cor) VALUES
    ('Drogon', 'Vivo', 1000.00, 'Preto'),
    ('Viserion', 'Morto', 900.00, 'Branco'),
    ('Rhaegal', 'Vivo', 950.00, 'Verde'),
    ('Balerion', 'Morto', 1100.00, 'Preto'),
    ('Meraxes', 'Morto', 850.00, 'Vermelho'),
    ('Sunfyre', 'Vivo', 980.00, 'Dourado');
 
INSERT INTO Profecia (Nome, Origem, Descricao) VALUES
    ('O Príncipe Que Foi Prometido', 'Os Sacerdotes Vermelhos', 'Um salvador que enfrentará a escuridão'),
    ('A Canção de Gelo e Fogo', 'As Crianças da Floresta', 'Uma profecia sobre inverno e fogo'),
    ('O Rei da Noite', 'A Muralha', 'Um ser que trará a noite sem fim'),
    ('O Dragão Tem Três Cabeças', 'A Antiga Valíria', 'Uma profecia sobre a linhagem dos dragões'),
    ('A Espada da Manhã', 'A Campina', 'Uma lâmina de lenda e honra'),
    ('O Último Dragão', 'Os Targaryen', 'O retorno final dos dragões');
 
INSERT INTO Raca (Nome) VALUES
    ('Humanos'),
    ('Ândalos'),
    ('Dothraki'),
    ('Povo Livre'),
    ('Valírios'),
    ('Gigantes');
 
INSERT INTO Caracteristicas (Nome_Raca, Caracteristicas) VALUES
    ('Humanos', 'Adaptáveis'),
    ('Ândalos', 'Devotos'),
    ('Dothraki', 'Nômades'),
    ('Povo Livre', 'Resilientes'),
    ('Valírios', 'Cavaleiros de dragão'),
    ('Gigantes', 'Imensos');
 
INSERT INTO CaracteristicasFisicas (Nome_Raca, Cor_Cabelos, Cor_Olhos) VALUES
    ('Humanos', 'Castanho', 'Azul'),
    ('Ândalos', 'Loiro', 'Cinza'),
    ('Dothraki', 'Preto', 'Castanho'),
    ('Povo Livre', 'Ruivo', 'Verde'),
    ('Valírios', 'Prateado', 'Violeta'),
    ('Gigantes', 'Branco', 'Cinza');
 
INSERT INTO Batalha (Nome, Localizacao, Nome_Guerra) VALUES
    ('Batalha de Águasnegras', 'Baía de Águasnegras', 'Guerra dos Cinco Reis'),
    ('Batalha de Invernalia', 'Invernalia', 'A Longa Noite'),
    ('Batalha do Ninho do Corvo', 'A Campina', 'Dança dos Dragões'),
    ('Batalha dos Bastardos', 'O Norte', 'Guerra dos Cinco Reis'),
    ('Batalha do Tridente', 'O Tridente', 'A Rebelião de Blackfyre'),
    ('Batalha de Pedra do Amanhecer', 'Dorne', 'A Conquista de Dorne');
 
INSERT INTO Participa (Nome_Batalha, Nome_Dragao) VALUES
    ('Batalha de Águasnegras', 'Drogon'),
    ('Batalha de Invernalia', 'Viserion'),
    ('Batalha do Ninho do Corvo', 'Rhaegal'),
    ('Batalha dos Bastardos', 'Balerion'),
    ('Batalha do Tridente', 'Meraxes'),
    ('Batalha de Pedra do Amanhecer', 'Sunfyre');
 
INSERT INTO ImpactoCausado (Nome_Batalha, Nome_Dragao, Impacto_Causado) VALUES
    ('Batalha de Águasnegras', 'Drogon', 'Fogo'),
    ('Batalha de Invernalia', 'Viserion', 'Gelo'),
    ('Batalha do Ninho do Corvo', 'Rhaegal', 'Destruição'),
    ('Batalha dos Bastardos', 'Balerion', 'Medo'),
    ('Batalha do Tridente', 'Meraxes', 'Caos'),
    ('Batalha de Pedra do Amanhecer', 'Sunfyre', 'Glória');
 
INSERT INTO Capital (Nome_Cidade, Nome_Reino, Nome_Continente) VALUES
    ('Invernalia', NULL, 'Westeros'),
    ('Porto Real', NULL, 'Westeros'),
    ('Rochedo Casterly', NULL, 'Westeros'),
    ('Pedra do Dragão', NULL, 'Westeros'),
    ('Meereen', NULL, 'Essos'),
    ('Qarth', NULL, 'Essos');
 
INSERT INTO Reino (Nome, Tipo_Governo, Descricao, Nome_Capital) VALUES
    ('O Norte', 'Monarquia', 'O reino setentrional de Westeros', 'Invernalia'),
    ('As Terras da Coroa', 'Monarquia', 'As terras ao redor do Trono de Ferro', 'Porto Real'),
    ('As Terras do Oeste', 'Senhorio', 'As riquezas ocidentais de Westeros', 'Rochedo Casterly'),
    ('Pedra do Dragão', 'Governo de Casa', 'A fortaleza insular da Casa Targaryen', 'Pedra do Dragão'),
    ('Yunkai', 'Cidade-Estado', 'Uma cidade escravagista de Essos', 'Meereen'),
    ('Qarth', 'República mercantil', 'Uma cidade de riqueza e comércio', 'Qarth');
 
UPDATE Capital SET Nome_Reino = 'O Norte' WHERE Nome_Cidade = 'Invernalia';
UPDATE Capital SET Nome_Reino = 'As Terras da Coroa' WHERE Nome_Cidade = 'Porto Real';
UPDATE Capital SET Nome_Reino = 'As Terras do Oeste' WHERE Nome_Cidade = 'Rochedo Casterly';
UPDATE Capital SET Nome_Reino = 'Pedra do Dragão' WHERE Nome_Cidade = 'Pedra do Dragão';
UPDATE Capital SET Nome_Reino = 'Yunkai' WHERE Nome_Cidade = 'Meereen';
UPDATE Capital SET Nome_Reino = 'Qarth' WHERE Nome_Cidade = 'Qarth';
 
INSERT INTO Casa (Nome, Bandeira, Palavras_Casa, Nome_Capital) VALUES
    ('Casa Stark', 'Lobo Gigante', 'O Inverno Está Chegando', 'Invernalia'),
    ('Casa Lannister', 'Leão', 'Ouçam Meu Rugido', 'Rochedo Casterly'),
    ('Casa Targaryen', 'Dragão', 'Fogo e Sangue', 'Pedra do Dragão'),
    ('Casa Baratheon', 'Veado', 'Nossa É a Fúria', 'Porto Real'),
    ('Casa Greyjoy', 'Kraken', 'Nós Não Semeamos', 'Qarth'),
    ('Casa Tyrell', 'Rosa', 'Crescendo Fortes', 'Meereen');
 
INSERT INTO Cidade (Nome, Periodo_Construcao, Tipo, Historia, Nome_Casa) VALUES
    ('Invernalia', 1000, TRUE, 'A sede ancestral dos Stark', 'Casa Stark'),
    ('Porto Real', 1000, TRUE, 'A capital dos Sete Reinos', 'Casa Baratheon'),
    ('Rochedo Casterly', 1200, TRUE, 'A fortaleza da Casa Lannister', 'Casa Lannister'),
    ('Pedra do Dragão', 1200, FALSE, 'A fortaleza insular da Casa Targaryen', 'Casa Targaryen'),
    ('Meereen', 1400, TRUE, 'Uma grande cidade da Baía dos Escravos', 'Casa Greyjoy'),
    ('Qarth', 1100, FALSE, 'Uma rica cidade mercante', 'Casa Tyrell');
 
-- Personagem: acrescentados Meraxes e Sunfyre (IDs 13 e 14) para que todos
-- os dragões citados na tabela Dragao/Cavaleiro também existam aqui.
-- Nenhum personagem "fundou" sua Casa (elas são antigas), então
-- Casa_Fundada = NULL para todos.
INSERT INTO Personagem (ID, Nome, ID_Pai, ID_Mae, Cidade_Nascimento, Cidade_Morte, Casa_Fundada) VALUES
    (1, 'Eddard Stark', NULL, NULL, 'Invernalia', 'Porto Real', NULL),
    (2, 'Catelyn Stark', NULL, NULL, 'Invernalia', 'Invernalia', NULL),
    (3, 'Robb Stark', 1, 2, 'Invernalia', 'Invernalia', NULL),
    (4, 'Jon Snow', 1, NULL, 'Invernalia', NULL, NULL),
    (5, 'Tyrion Lannister', NULL, NULL, 'Rochedo Casterly', NULL, NULL),
    (6, 'Daenerys Targaryen', NULL, NULL, 'Pedra do Dragão', NULL, NULL),
    (7, 'Ghost', NULL, NULL, NULL, NULL, NULL),
    (8, 'Nymeria', NULL, NULL, NULL, NULL, NULL),
    (9, 'Drogon', NULL, NULL, NULL, NULL, NULL),
    (10, 'Viserion', NULL, NULL, NULL, NULL, NULL),
    (11, 'Rhaegal', NULL, NULL, NULL, NULL, NULL),
    (12, 'Balerion', NULL, NULL, NULL, NULL, NULL),
    (13, 'Meraxes', NULL, NULL, NULL, NULL, NULL),
    (14, 'Sunfyre', NULL, NULL, NULL, NULL, NULL);
 
-- Humano: Ano_Morte / Cidade_Morte alinhados com Personagem e com
-- Assassinato (antes, Ned tinha Cidade_Morte preenchida mas Ano_Morte
-- nulo, e Tyrion tinha Cidade_Morte preenchida mesmo estando vivo).
INSERT INTO Humano (ID_Personagem, Causa_Morte, Genero, Sobrenome, Ano_Nascimento, Ano_Morte, Nome_Raca) VALUES
    (1, 'Execução pública', TRUE, 'Stark', 1250, 1298, 'Humanos'),
    (2, 'Traição em banquete', FALSE, 'Stark', 1252, 1300, 'Ândalos'),
    (3, 'Ferimento de batalha', TRUE, 'Stark', 1277, 1300, 'Humanos'),
    (4, NULL, TRUE, 'Snow', 1280, NULL, 'Povo Livre'),
    (5, NULL, TRUE, 'Lannister', 1274, NULL, 'Humanos'),
    (6, NULL, FALSE, 'Targaryen', 1284, NULL, 'Valírios');
 
INSERT INTO Nao_Humano (ID_Personagem, Especie) VALUES
    (7, 'Lobo Gigante'),
    (8, 'Lobo Gigante'),
    (9, 'Dragão'),
    (10, 'Dragão'),
    (11, 'Dragão'),
    (12, 'Dragão'),
    (13, 'Dragão'),
    (14, 'Dragão');
 
INSERT INTO TipoArma (Tipo, Material) VALUES
    ('Espada', 'Aço valiriano'),
    ('Lança', 'Bronze'),
    ('Arco', 'Madeira'),
    ('Adaga', 'Ferro'),
    ('Maça', 'Aço'),
    ('Besta', 'Madeira');
 
-- Arma: propriedade redistribuída para casar com o tipo de personagem
-- (ex.: Manto-Gelo com Ned, Garra-Longa com Jon — coerente com quem
-- de fato empunha essas armas).
INSERT INTO Arma (Nome, Tipo, ID_Dono, Periodo_Pertencimento) VALUES
    ('Gelo', 'Espada', 1, 1276),
    ('Agulha', 'Adaga', 2, 1270),
    ('Guardiã de Juramentos', 'Espada', 5, 1296),
    ('Lamento da Viúva', 'Besta', 6, 1302),
    ('Machado do Cão', 'Maça', 3, 1295),
    ('Garra-Longa', 'Espada', 4, 1298);
 
INSERT INTO Animal (ID_Dono, Nome, Especie, Ano_Nascimento, Ano_Morte) VALUES
    (1, 'Ghost', 'Lobo Gigante', 1268, NULL),
    (2, 'Nymeria', 'Lobo Gigante', 1270, NULL),
    (3, 'Shaggydog', 'Lobo Gigante', 1295, 1300),
    (4, 'Summer', 'Lobo Gigante', 1298, NULL),
    (5, 'Hodor', 'Gigante', 1290, NULL),
    (6, 'Drogon', 'Dragão', 1302, NULL);
 
-- Pertencimento / Lealdade / Lorde: corrigidos para não vincular
-- personagens Stark a outras Casas (Catelyn/Robb/Jon apareciam, sem
-- sentido, ligados às Casas Greyjoy/Baratheon).
INSERT INTO Pertencimento (Nome_Casa, ID_Personagem, Data_Inicio, Data_Fim, Tipo) VALUES
    ('Casa Stark', 1, '1250-01-01', '1298-01-01', 'Lorde'),
    ('Casa Stark', 2, '1276-01-01', '1300-01-01', 'Lady'),
    ('Casa Lannister', 5, '1274-01-01', NULL, 'Herdeiro'),
    ('Casa Targaryen', 6, '1284-01-01', NULL, 'Rainha'),
    ('Casa Stark', 4, '1280-01-01', NULL, 'Bastardo'),
    ('Casa Stark', 3, '1277-01-01', '1300-01-01', 'Herdeiro');
 
INSERT INTO Lealdade (Nome_Casa, ID_Personagem, Data_Inicio, Data_Fim, Razao_Inicio, Razao_Fim) VALUES
    ('Casa Stark', 1, '1250-01-01', '1298-01-01', 'Sangue', 'Morte'),
    ('Casa Stark', 2, '1276-01-01', '1300-01-01', 'Casamento', 'Morte'),
    ('Casa Lannister', 5, '1274-01-01', NULL, 'Ouro', NULL),
    ('Casa Targaryen', 6, '1284-01-01', NULL, 'Direito de sangue', NULL),
    ('Casa Stark', 4, '1280-01-01', NULL, 'Honra', NULL),
    ('Casa Stark', 3, '1277-01-01', '1300-01-01', 'Sangue', 'Morte');
 
INSERT INTO Lorde (Nome_Casa, ID_Personagem, Data_Inicio, Data_Fim) VALUES
    ('Casa Stark', 1, '1276-01-01', '1298-01-01'),
    ('Casa Stark', 3, '1298-01-01', '1300-01-01'),
    ('Casa Lannister', 5, '1298-01-01', NULL),
    ('Casa Targaryen', 6, '1300-01-01', NULL),
    ('Casa Stark', 4, '1300-01-01', NULL),
    ('Casa Stark', 2, '1298-01-01', '1300-01-01');
 
-- Casamento: reorganizado para que ninguém apareça casado com
-- pai/mãe/filho(a), com duas pessoas ao mesmo tempo, ou depois de já
-- ter morrido. Os períodos de cada pessoa foram checados um a um para
-- não se sobreporem.
INSERT INTO Casamento (ID_Personagem1, ID_Personagem2, Data_Inicio, Data_Fim, Razao_Dissolucao) VALUES
    (1, 2, '1276-01-01', '1298-01-01', 'Morte do cônjuge'),
    (3, 5, '1296-01-01', '1298-01-01', 'Guerra'),
    (2, 5, '1299-01-01', '1300-01-01', 'Morte do cônjuge'),
    (3, 6, '1299-01-01', '1300-01-01', 'Morte do cônjuge'),
    (5, 6, '1301-01-01', '1302-01-01', 'Términou por decisão mútua'),
    (4, 6, '1303-01-01', NULL, NULL);
 
-- Assassinato: consistente com as mortes registradas em Humano/Dragao
-- (Ned, Robb e Catelyn morrem; Viserion, Balerion e Meraxes aparecem
-- como 'Morto' na tabela Dragao).
INSERT INTO Assassinato (ID_Assassinado, ID_Assassino, Data_Morte, Causa_Morte, Localizacao, Nome_Arma) VALUES
    (1, 5, '1298-01-01', 'Execução pública', 'Porto Real', 'Gelo'),
    (3, 5, '1300-01-01', 'Traição em banquete', 'Invernalia', 'Machado do Cão'),
    (2, 5, '1300-01-01', 'Traição em banquete', 'Invernalia', 'Agulha'),
    (10, 4, '1301-01-01', 'Abatido para impedir seu retorno como morto-vivo', 'Além da Muralha', 'Garra-Longa'),
    (12, 6, '1302-01-01', 'Ferimento fatal em combate', 'Pedra do Dragão', 'Guardiã de Juramentos'),
    (13, 4, '1303-01-01', 'Queda durante a batalha', 'Dorne', 'Garra-Longa');
 
INSERT INTO Governante (ID_Personagem, Nome_Reino, Data_Inicio, Data_Fim, ID_Sucessor, Nome_Reino_Sucessor, Data_Inicio_Sucessor) VALUES
    (1, 'O Norte', '1276-01-01', '1298-01-01', 3, 'O Norte', '1298-01-01'),
    (3, 'O Norte', '1298-01-01', '1300-01-01', NULL, NULL, NULL),
    (5, 'As Terras do Oeste', '1298-01-01', NULL, NULL, NULL, NULL),
    (6, 'Pedra do Dragão', '1300-01-01', NULL, NULL, NULL, NULL),
    (4, 'As Terras da Coroa', '1303-01-01', NULL, NULL, NULL, NULL),
    (2, 'O Norte', '1276-01-01', '1298-01-01', NULL, NULL, NULL);
 
-- Cavaleiro: só Daenerys e Jon (sangue Targaryen) montam dragões —
-- antes, Eddard, Catelyn, Robb e Tyrion apareciam como cavaleiros, o
-- que contraria a lógica da lore (montar dragão exige sangue de
-- dragão).
INSERT INTO Cavaleiro (Data_Inicio, Data_Fim, ID_Personagem, Nome_Dragao) VALUES
    ('1300-01-01', NULL, 6, 'Drogon'),
    ('1300-01-01', '1301-01-01', 6, 'Viserion'),
    ('1303-01-01', NULL, 4, 'Rhaegal'),
    ('1300-01-01', '1302-01-01', 6, 'Balerion'),
    ('1302-01-01', '1303-01-01', 4, 'Meraxes'),
    ('1303-01-01', NULL, 6, 'Sunfyre');
 
INSERT INTO Alianca (Data_Inicio, Data_Fim, Nome_Capital, Reino1, Reino2) VALUES
    ('1276-01-01', NULL, 'Invernalia', 'O Norte', 'As Terras da Coroa'),
    ('1290-01-01', NULL, 'Rochedo Casterly', 'As Terras do Oeste', 'Pedra do Dragão'),
    ('1298-01-01', '1300-01-01', 'Porto Real', 'O Norte', 'Yunkai'),
    ('1299-01-01', NULL, 'Pedra do Dragão', 'As Terras da Coroa', 'Qarth'),
    ('1300-01-01', NULL, 'Meereen', 'As Terras do Oeste', 'O Norte'),
    ('1301-01-01', NULL, 'Qarth', 'Pedra do Dragão', 'Qarth');
 
-- Data_Inicio precisa ser IDÊNTICA à usada em Muda para a mesma
-- combinação (Reino, Cidade), pois Muda tem uma FK composta
-- (Reino, Cidade, Data_Inicio) -> Posse_Territorial(Reino, Nome_Cidade, Data_Inicio).
INSERT INTO Posse_Territorial (Reino, Nome_Cidade, Data_Inicio, Data_Fim, Razao_Mudanca) VALUES
    ('O Norte', 'Invernalia', '1298-01-01', NULL, NULL),
    ('As Terras da Coroa', 'Porto Real', '1301-01-01', NULL, NULL),
    ('As Terras do Oeste', 'Rochedo Casterly', '1304-01-01', NULL, NULL),
    ('Pedra do Dragão', 'Pedra do Dragão', '1307-01-01', NULL, NULL),
    ('Yunkai', 'Meereen', '1309-01-01', NULL, NULL),
    ('Qarth', 'Qarth', '1311-01-01', NULL, NULL);
 
INSERT INTO Muda (Nome_Guerra, Reino, Cidade, Data_Inicio) VALUES
    ('Guerra dos Cinco Reis', 'O Norte', 'Invernalia', '1298-01-01'),
    ('Dança dos Dragões', 'As Terras da Coroa', 'Porto Real', '1301-01-01'),
    ('A Longa Noite', 'As Terras do Oeste', 'Rochedo Casterly', '1304-01-01'),
    ('A Rebelião de Blackfyre', 'Pedra do Dragão', 'Pedra do Dragão', '1307-01-01'),
    ('A Guerra dos Degraus de Pedra', 'Yunkai', 'Meereen', '1309-01-01'),
    ('A Conquista de Dorne', 'Qarth', 'Qarth', '1311-01-01');
 
INSERT INTO Exerce (Nome_Profissao, ID_Personagem) VALUES
    ('Rei', 1),
    ('Cavaleiro', 3),
    ('Meestre', 4),
    ('Lorde Comandante', 5),
    ('Septão', 6),
    ('Construtor', 2);
 
INSERT INTO Desempenhada_na (Nome_Profissao, Nome_Cidade) VALUES
    ('Rei', 'Invernalia'),
    ('Cavaleiro', 'Porto Real'),
    ('Meestre', 'Rochedo Casterly'),
    ('Lorde Comandante', 'Pedra do Dragão'),
    ('Septão', 'Meereen'),
    ('Construtor', 'Qarth');
 
INSERT INTO Envolve_se (Nome_Casa, Nome_Batalha, Vencedor) VALUES
    ('Casa Stark', 'Batalha de Águasnegras', 'Derrota'),
    ('Casa Lannister', 'Batalha de Invernalia', 'Vitória'),
    ('Casa Targaryen', 'Batalha do Ninho do Corvo', 'Derrota'),
    ('Casa Baratheon', 'Batalha dos Bastardos', 'Vitória'),
    ('Casa Greyjoy', 'Batalha do Tridente', 'Impasse'),
    ('Casa Tyrell', 'Batalha de Pedra do Amanhecer', 'Derrota');
 
INSERT INTO Atua_na (Nome_Casa, Nome_Guerra, Vencedor) VALUES
    ('Casa Stark', 'Guerra dos Cinco Reis', 'Derrota'),
    ('Casa Lannister', 'Dança dos Dragões', 'Vitória'),
    ('Casa Targaryen', 'A Longa Noite', 'Vitória'),
    ('Casa Baratheon', 'A Rebelião de Blackfyre', 'Impasse'),
    ('Casa Greyjoy', 'A Guerra dos Degraus de Pedra', 'Derrota'),
    ('Casa Tyrell', 'A Conquista de Dorne', 'Vitória');
 
INSERT INTO Guerreia_em (ID_Personagem, Nome_Guerra, Vencedor) VALUES
    (1, 'Guerra dos Cinco Reis', 'Derrota'),
    (2, 'Dança dos Dragões', 'Vitória'),
    (3, 'A Longa Noite', 'Derrota'),
    (4, 'A Rebelião de Blackfyre', 'Impasse'),
    (5, 'A Guerra dos Degraus de Pedra', 'Vitória'),
    (6, 'A Conquista de Dorne', 'Vitória');
 
INSERT INTO Luta_em (ID_Personagem, Nome_Batalha, Vencedor) VALUES
    (1, 'Batalha de Águasnegras', 'Derrota'),
    (2, 'Batalha de Invernalia', 'Vitória'),
    (3, 'Batalha do Ninho do Corvo', 'Derrota'),
    (4, 'Batalha dos Bastardos', 'Vitória'),
    (5, 'Batalha do Tridente', 'Impasse'),
    (6, 'Batalha de Pedra do Amanhecer', 'Vitória');
 
-- Mata: reescrita para não matar personagens que já estão vivos em
-- outras tabelas; agora descreve o animal de estimação presente na
-- morte já registrada em Assassinato/Dragao (mesma data/local),
-- em vez de criar uma segunda morte contraditória para a mesma pessoa.
INSERT INTO Mata (Nome_Animal, ID_Dono, ID_Personagem_Morto, Data, Descricao_Morte, Localizacao) VALUES
    ('Nymeria', 2, 1, '1298-01-01', 'Presenciou a execução', 'Porto Real'),
    ('Summer', 4, 3, '1300-01-01', 'Presente na traição do banquete', 'Invernalia'),
    ('Ghost', 1, 2, '1300-01-01', 'Presente na traição do banquete', 'Invernalia'),
    ('Drogon', 6, 10, '1301-01-01', 'Tentou proteger o dragão irmão', 'Além da Muralha'),
    ('Drogon', 6, 12, '1302-01-01', 'Combateu ao lado de Balerion', 'Pedra do Dragão'),
    ('Hodor', 5, 13, '1303-01-01', 'Auxiliou na batalha', 'Dorne');
 
INSERT INTO Interpretacao (Momento_Realizada, Descricao_Interpretacao, ID_Personagem, Origem_Profecia, Nome_Profecia) VALUES
    ('1298-01-01', 'A profecia foi ouvida em um rito sagrado', 1, 'Os Sacerdotes Vermelhos', 'O Príncipe Que Foi Prometido'),
    ('1299-01-01', 'O augúrio foi dito antes da guerra', 2, 'As Crianças da Floresta', 'A Canção de Gelo e Fogo'),
    ('1300-01-01', 'O aviso veio da Muralha', 3, 'A Muralha', 'O Rei da Noite'),
    ('1301-01-01', 'As palavras antigas foram lembradas pelos senhores dos dragões', 4, 'A Antiga Valíria', 'O Dragão Tem Três Cabeças'),
    ('1302-01-01', 'A espada foi abençoada em nome da justiça', 5, 'A Campina', 'A Espada da Manhã'),
    ('1303-01-01', 'O último dragão era aguardado pelo reino', 6, 'Os Targaryen', 'O Último Dragão');
 
INSERT INTO Associacao_Profetica (Tipo, Periodo_Em_Que_Valido, ID_Personagem, Nome_Profecia, Origem_Profecia) VALUES
    ('Devoto', 'Antes da guerra', 1, 'O Príncipe Que Foi Prometido', 'Os Sacerdotes Vermelhos'),
    ('Antigo', 'Durante o frio', 2, 'A Canção de Gelo e Fogo', 'As Crianças da Floresta'),
    ('Temível', 'Na Muralha', 3, 'O Rei da Noite', 'A Muralha'),
    ('Real', 'Nos tempos antigos', 4, 'O Dragão Tem Três Cabeças', 'A Antiga Valíria'),
    ('Honrado', 'Na era das lâminas', 5, 'A Espada da Manhã', 'A Campina'),
    ('Lendário', 'No fim dos tempos', 6, 'O Último Dragão', 'Os Targaryen');
 
COMMIT;