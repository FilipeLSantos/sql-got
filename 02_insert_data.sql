BEGIN;

INSERT INTO Continente (Nome, Descricao, Info_Produtivas, Info_Climaticas) VALUES
    ('Westeros', 'The main continent of the known world', 'Grain and iron', 'Temperate and cold'),
    ('Essos', 'The eastern continent of the known world', 'Spices and horses', 'Mediterranean and steppe'),
    ('Sothoryos', 'A southern continent full of mysteries', 'Rare woods and gems', 'Tropical and humid'),
    ('Ulthos', 'A distant and hostile land', 'Unknown minerals', 'Harsh and volcanic'),
    ('The Lands of Always Winter', 'Frozen lands beyond the Wall', 'No agriculture', 'Frozen and bleak'),
    ('The Summer Sea', 'The sea bordering the western lands', 'Fishing and salt', 'Mild and maritime');

INSERT INTO Guerra (Nome, Data_Inicio, Data_Fim) VALUES
    ('War of the Five Kings', '2000-01-01', '2005-01-01'),
    ('Dance of the Dragons', '2007-01-01', '2011-01-01'),
    ('The Long Night', '2012-01-01', '2015-01-01'),
    ('The Blackfyre Rebellion', '2016-01-01', '2020-01-01'),
    ('The War of the Stepstones', '2021-01-01', '2023-01-01'),
    ('The Conquest of Dorne', '2024-01-01', NULL);

INSERT INTO Profissao (Nome) VALUES
    ('King'),
    ('Knight'),
    ('Maester'),
    ('Lord Commander'),
    ('Septon'),
    ('Builder');

INSERT INTO Dragao (Nome, Estado, Tamanho, Cor) VALUES
    ('Drogon', 'Vivo', 1000.00, 'Black'),
    ('Viserion', 'Morto', 900.00, 'White'),
    ('Rhaegal', 'Vivo', 950.00, 'Green'),
    ('Balerion', 'Morto', 1100.00, 'Black'),
    ('Meraxes', 'Morto', 850.00, 'Red'),
    ('Sunfyre', 'Vivo', 980.00, 'Gold');

INSERT INTO Profecia (Nome, Origem, Descricao) VALUES
    ('The Prince That Was Promised', 'The Red Priests', 'A savior who will face darkness'),
    ('The Song of Ice and Fire', 'The Children of the Forest', 'A prophecy of winter and fire'),
    ('The Night King', 'The Wall', 'A being that will bring endless night'),
    ('The Dragon has Three Heads', 'Old Valyria', 'A prophecy about the dragon lineage'),
    ('The Sword of the Morning', 'The Reach', 'A blade of legend and honor'),
    ('The Last Dragon', 'The Targaryens', 'The final return of dragons');

INSERT INTO Raca (Nome) VALUES
    ('Humans'),
    ('Andals'),
    ('Dothraki'),
    ('Free Folk'),
    ('Valyrians'),
    ('Giants');

INSERT INTO Caracteristicas (Nome_Raca, Caracteristicas) VALUES
    ('Humans', 'Adaptable'),
    ('Andals', 'Faithful'),
    ('Dothraki', 'Nomadic'),
    ('Free Folk', 'Resilient'),
    ('Valyrians', 'Dragon riders'),
    ('Giants', 'Immense');

INSERT INTO CaracteristicasFisicas (Nome_Raca, Cor_Cabelos, Cor_Olhos) VALUES
    ('Humans', 'Brown', 'Blue'),
    ('Andals', 'Blond', 'Grey'),
    ('Dothraki', 'Black', 'Brown'),
    ('Free Folk', 'Red', 'Green'),
    ('Valyrians', 'Silver', 'Violet'),
    ('Giants', 'White', 'Grey');

INSERT INTO Batalha (Nome, Localizacao, Nome_Guerra) VALUES
    ('Battle of the Blackwater', 'Blackwater Bay', 'War of the Five Kings'),
    ('Battle of Winterfell', 'Winterfell', 'The Long Night'),
    ('Battle of Rook''s Rest', 'The Reach', 'Dance of the Dragons'),
    ('Battle of the Bastards', 'The North', 'War of the Five Kings'),
    ('Battle of the Trident', 'The Trident', 'The Blackfyre Rebellion'),
    ('Battle of Starfall', 'Dorne', 'The Conquest of Dorne');

INSERT INTO Participa (Nome_Batalha, Nome_Dragao) VALUES
    ('Battle of the Blackwater', 'Drogon'),
    ('Battle of Winterfell', 'Viserion'),
    ('Battle of Rook''s Rest', 'Rhaegal'),
    ('Battle of the Bastards', 'Balerion'),
    ('Battle of the Trident', 'Meraxes'),
    ('Battle of Starfall', 'Sunfyre');

INSERT INTO ImpactoCausado (Nome_Batalha, Nome_Dragao, Impacto_Causado) VALUES
    ('Battle of the Blackwater', 'Drogon', 'Fire'),
    ('Battle of Winterfell', 'Viserion', 'Ice'),
    ('Battle of Rook''s Rest', 'Rhaegal', 'Destruction'),
    ('Battle of the Bastards', 'Balerion', 'Fear'),
    ('Battle of the Trident', 'Meraxes', 'Chaos'),
    ('Battle of Starfall', 'Sunfyre', 'Glory');

INSERT INTO Capital (Nome_Cidade, Nome_Reino, Nome_Continente) VALUES
    ('Winterfell', NULL, 'Westeros'),
    ('King''s Landing', NULL, 'Westeros'),
    ('Casterly Rock', NULL, 'Westeros'),
    ('Dragonstone', NULL, 'Westeros'),
    ('Meereen', NULL, 'Essos'),
    ('Qarth', NULL, 'Essos');

INSERT INTO Reino (Nome, Tipo_Governo, Descricao, Nome_Capital) VALUES
    ('The North', 'Monarchy', 'The northern realm of Westeros', 'Winterfell'),
    ('The Crownlands', 'Monarchy', 'The lands surrounding the Iron Throne', 'King''s Landing'),
    ('The Westerlands', 'Lordship', 'The western riches of Westeros', 'Casterly Rock'),
    ('Dragonstone', 'House rule', 'The island stronghold of House Targaryen', 'Dragonstone'),
    ('Yunkai', 'City-State', 'A slave city of Essos', 'Meereen'),
    ('Qarth', 'Merchant republic', 'A city of wealth and trade', 'Qarth');

UPDATE Capital SET Nome_Reino = 'The North' WHERE Nome_Cidade = 'Winterfell';
UPDATE Capital SET Nome_Reino = 'The Crownlands' WHERE Nome_Cidade = 'King''s Landing';
UPDATE Capital SET Nome_Reino = 'The Westerlands' WHERE Nome_Cidade = 'Casterly Rock';
UPDATE Capital SET Nome_Reino = 'Dragonstone' WHERE Nome_Cidade = 'Dragonstone';
UPDATE Capital SET Nome_Reino = 'Yunkai' WHERE Nome_Cidade = 'Meereen';
UPDATE Capital SET Nome_Reino = 'Qarth' WHERE Nome_Cidade = 'Qarth';

INSERT INTO Casa (Nome, Bandeira, Palavras_Casa, Nome_Capital) VALUES
    ('House Stark', 'Direwolf', 'Winter is Coming', 'Winterfell'),
    ('House Lannister', 'Lion', 'Hear Me Roar', 'Casterly Rock'),
    ('House Targaryen', 'Dragon', 'Fire and Blood', 'Dragonstone'),
    ('House Baratheon', 'Stag', 'Ours is the Fury', 'King''s Landing'),
    ('House Greyjoy', 'Kraken', 'We Do Not Sow', 'Qarth'),
    ('House Tyrell', 'Rose', 'Growing Strong', 'Meereen');

INSERT INTO Cidade (Nome, Periodo_Construcao, Tipo, Historia, Nome_Casa) VALUES
    ('Winterfell', 1000, TRUE, 'The ancestral seat of the Starks', 'House Stark'),
    ('King''s Landing', 1000, TRUE, 'The capital of the Seven Kingdoms', 'House Baratheon'),
    ('Casterly Rock', 1200, TRUE, 'The stronghold of House Lannister', 'House Lannister'),
    ('Dragonstone', 1200, FALSE, 'The island fortress of House Targaryen', 'House Targaryen'),
    ('Meereen', 1400, TRUE, 'A great city of the Slaver Bay', 'House Greyjoy'),
    ('Qarth', 1100, FALSE, 'A wealthy merchant city', 'House Tyrell');

INSERT INTO Personagem (ID, Nome, ID_Pai, ID_Mae, Cidade_Nascimento, Cidade_Morte, Casa_Fundada) VALUES
    (1, 'Eddard Stark', NULL, NULL, 'Winterfell', 'Winterfell', 'House Stark'),
    (2, 'Catelyn Stark', NULL, NULL, 'Winterfell', NULL, 'House Stark'),
    (3, 'Robb Stark', 1, 2, 'Winterfell', 'Winterfell', NULL),
    (4, 'Jon Snow', 1, NULL, 'Winterfell', NULL, NULL),
    (5, 'Tyrion Lannister', NULL, NULL, 'Casterly Rock', 'King''s Landing', 'House Lannister'),
    (6, 'Daenerys Targaryen', NULL, NULL, 'Dragonstone', NULL, 'House Targaryen'),
    (7, 'Ghost', NULL, NULL, NULL, NULL, NULL),
    (8, 'Nymeria', NULL, NULL, NULL, NULL, NULL),
    (9, 'Drogon', NULL, NULL, NULL, NULL, NULL),
    (10, 'Viserion', NULL, NULL, NULL, NULL, NULL),
    (11, 'Rhaegal', NULL, NULL, NULL, NULL, NULL),
    (12, 'Balerion', NULL, NULL, NULL, NULL, NULL);

INSERT INTO Humano (ID_Personagem, Causa_Morte, Genero, Sobrenome, Ano_Nascimento, Ano_Morte, Nome_Raca) VALUES
    (1, NULL, TRUE, 'Stark', 250, NULL, 'Humans'),
    (2, NULL, FALSE, 'Stark', 252, NULL, 'Andals'),
    (3, 'Battle wound', TRUE, 'Stark', 277, 299, 'Humans'),
    (4, NULL, TRUE, 'Snow', 280, NULL, 'Free Folk'),
    (5, NULL, TRUE, 'Lannister', 274, NULL, 'Humans'),
    (6, NULL, FALSE, 'Targaryen', 284, NULL, 'Valyrians');

INSERT INTO Nao_Humano (ID_Personagem, Especie) VALUES
    (7, 'Direwolf'),
    (8, 'Direwolf'),
    (9, 'Dragon'),
    (10, 'Dragon'),
    (11, 'Dragon'),
    (12, 'Dragon');

INSERT INTO TipoArma (Tipo, Material) VALUES
    ('Sword', 'Valyrian steel'),
    ('Spear', 'Bronze'),
    ('Bow', 'Wood'),
    ('Dagger', 'Iron'),
    ('Mace', 'Steel'),
    ('Crossbow', 'Wood');

INSERT INTO Arma (Nome, Tipo, ID_Dono, Periodo_Pertencimento) VALUES
    ('Ice', 'Sword', 1, 300),
    ('Oathkeeper', 'Sword', 3, 299),
    ('Widow''s Wail', 'Crossbow', 4, 280),
    ('Needle', 'Dagger', 2, 260),
    ('The Hound''s Axe', 'Mace', 5, 290),
    ('Longclaw', 'Sword', 6, 300);

INSERT INTO Animal (ID_Dono, Nome, Especie, Ano_Nascimento, Ano_Morte) VALUES
    (1, 'Ghost', 'Direwolf', 250, NULL),
    (2, 'Nymeria', 'Direwolf', 252, NULL),
    (3, 'Shaggydog', 'Direwolf', 277, 299),
    (4, 'Summer', 'Direwolf', 280, NULL),
    (5, 'Hodor', 'Giant', 270, NULL),
    (6, 'Drogon', 'Dragon', 284, NULL);

INSERT INTO Pertencimento (Nome_Casa, ID_Personagem, Data_Inicio, Data_Fim, Tipo) VALUES
    ('House Stark', 1, '2000-01-01', NULL, 'Lord'),
    ('House Stark', 2, '2001-01-01', NULL, 'Lady'),
    ('House Lannister', 5, '2002-01-01', NULL, 'Heir'),
    ('House Targaryen', 6, '2003-01-01', NULL, 'Queen'),
    ('House Baratheon', 4, '2004-01-01', NULL, 'Bastard'),
    ('House Greyjoy', 3, '2005-01-01', NULL, 'Warlord');

INSERT INTO Lealdade (Nome_Casa, ID_Personagem, Data_Inicio, Data_Fim, Razao_Inicio, Razao_Fim) VALUES
    ('House Stark', 1, '2000-01-01', NULL, 'Blood', NULL),
    ('House Stark', 2, '2001-01-01', NULL, 'Marriage', NULL),
    ('House Lannister', 5, '2002-01-01', NULL, 'Gold', NULL),
    ('House Targaryen', 6, '2003-01-01', NULL, 'Claim', NULL),
    ('House Baratheon', 4, '2004-01-01', NULL, 'Honor', NULL),
    ('House Greyjoy', 3, '2005-01-01', NULL, 'Sea', NULL);

INSERT INTO Lorde (Nome_Casa, ID_Personagem, Data_Inicio, Data_Fim) VALUES
    ('House Stark', 1, '2000-01-01', NULL),
    ('House Stark', 3, '2010-01-01', '2012-01-01'),
    ('House Lannister', 5, '2011-01-01', NULL),
    ('House Targaryen', 6, '2012-01-01', NULL),
    ('House Baratheon', 4, '2013-01-01', NULL),
    ('House Greyjoy', 2, '2014-01-01', NULL);

INSERT INTO Casamento (ID_Personagem1, ID_Personagem2, Data_Inicio, Data_Fim, Razao_Dissolucao) VALUES
    (1, 2, '1998-01-01', NULL, NULL),
    (2, 3, '2002-01-01', '2004-01-01', 'War'),
    (3, 4, '2010-01-01', NULL, NULL),
    (5, 6, '2015-01-01', NULL, NULL),
    (1, 5, '2016-01-01', '2018-01-01', 'Politics'),
    (4, 6, '2019-01-01', NULL, NULL);

INSERT INTO Assassinato (ID_Assassinado, ID_Assassino, Data_Morte, Causa_Morte, Localizacao, Nome_Arma) VALUES
    (1, 5, '2004-01-01', 'Beheading', 'King''s Landing', 'Ice'),
    (3, 6, '2005-01-01', 'Sword wound', 'The North', 'Longclaw'),
    (2, 4, '2006-01-01', 'Poison', 'Winterfell', 'Needle'),
    (4, 5, '2007-01-01', 'Fire', 'The Reach', 'Widow''s Wail'),
    (6, 1, '2008-01-01', 'Drowning', 'Blackwater Bay', 'Oathkeeper'),
    (5, 3, '2009-01-01', 'Stabbing', 'Casterly Rock', 'The Hound''s Axe');

INSERT INTO Governante (ID_Personagem, Nome_Reino, Data_Inicio, Data_Fim, ID_Sucessor, Nome_Reino_Sucessor, Data_Inicio_Sucessor) VALUES
    (1, 'The North', '2000-01-01', NULL, NULL, NULL, NULL),
    (2, 'The Crownlands', '2001-01-01', NULL, NULL, NULL, NULL),
    (3, 'The Westerlands', '2002-01-01', NULL, NULL, NULL, NULL),
    (4, 'Dragonstone', '2003-01-01', NULL, NULL, NULL, NULL),
    (5, 'Yunkai', '2004-01-01', NULL, NULL, NULL, NULL),
    (6, 'Qarth', '2005-01-01', NULL, NULL, NULL, NULL);

INSERT INTO Cavaleiro (Data_Inicio, Data_Fim, ID_Personagem, Nome_Dragao) VALUES
    ('2000-01-01', NULL, 1, 'Drogon'),
    ('2001-01-01', NULL, 2, 'Viserion'),
    ('2002-01-01', '2003-01-01', 3, 'Rhaegal'),
    ('2003-01-01', NULL, 4, 'Balerion'),
    ('2004-01-01', NULL, 5, 'Meraxes'),
    ('2005-01-01', NULL, 6, 'Sunfyre');

INSERT INTO Alianca (Data_Inicio, Data_Fim, Nome_Capital, Reino1, Reino2) VALUES
    ('2000-01-01', NULL, 'Winterfell', 'The North', 'The Crownlands'),
    ('2001-01-01', NULL, 'Casterly Rock', 'The Westerlands', 'Dragonstone'),
    ('2002-01-01', '2004-01-01', 'King''s Landing', 'The North', 'Yunkai'),
    ('2003-01-01', NULL, 'Dragonstone', 'The Crownlands', 'Qarth'),
    ('2004-01-01', NULL, 'Meereen', 'The Westerlands', 'The North'),
    ('2005-01-01', NULL, 'Qarth', 'Dragonstone', 'Qarth');

INSERT INTO Posse_Territorial (Reino, Nome_Cidade, Data_Inicio, Data_Fim, Razao_Mudanca) VALUES
    ('The North', 'Winterfell', '2000-01-01', NULL, NULL),
    ('The Crownlands', 'King''s Landing', '2001-01-01', NULL, NULL),
    ('The Westerlands', 'Casterly Rock', '2002-01-01', NULL, NULL),
    ('Dragonstone', 'Dragonstone', '2003-01-01', NULL, NULL),
    ('Yunkai', 'Meereen', '2004-01-01', NULL, NULL),
    ('Qarth', 'Qarth', '2005-01-01', NULL, NULL);

INSERT INTO Muda (Nome_Guerra, Reino, Cidade, Data_Inicio) VALUES
    ('War of the Five Kings', 'The North', 'Winterfell', '2000-01-01'),
    ('Dance of the Dragons', 'The Crownlands', 'King''s Landing', '2001-01-01'),
    ('The Long Night', 'The Westerlands', 'Casterly Rock', '2002-01-01'),
    ('The Blackfyre Rebellion', 'Dragonstone', 'Dragonstone', '2003-01-01'),
    ('The War of the Stepstones', 'Yunkai', 'Meereen', '2004-01-01'),
    ('The Conquest of Dorne', 'Qarth', 'Qarth', '2005-01-01');

INSERT INTO Exerce (Nome_Profissao, ID_Personagem) VALUES
    ('King', 1),
    ('Knight', 3),
    ('Maester', 4),
    ('Lord Commander', 5),
    ('Septon', 6),
    ('Builder', 2);

INSERT INTO Desempenhada_na (Nome_Profissao, Nome_Cidade) VALUES
    ('King', 'Winterfell'),
    ('Knight', 'King''s Landing'),
    ('Maester', 'Casterly Rock'),
    ('Lord Commander', 'Dragonstone'),
    ('Septon', 'Meereen'),
    ('Builder', 'Qarth');

INSERT INTO Envolve_se (Nome_Casa, Nome_Batalha, Vencedor) VALUES
    ('House Stark', 'Battle of the Blackwater', 'Derrota'),
    ('House Lannister', 'Battle of Winterfell', 'Vitória'),
    ('House Targaryen', 'Battle of Rook''s Rest', 'Derrota'),
    ('House Baratheon', 'Battle of the Bastards', 'Vitória'),
    ('House Greyjoy', 'Battle of the Trident', 'Impasse'),
    ('House Tyrell', 'Battle of Starfall', 'Derrota');

INSERT INTO Atua_na (Nome_Casa, Nome_Guerra, Vencedor) VALUES
    ('House Stark', 'War of the Five Kings', 'Derrota'),
    ('House Lannister', 'Dance of the Dragons', 'Vitória'),
    ('House Targaryen', 'The Long Night', 'Vitória'),
    ('House Baratheon', 'The Blackfyre Rebellion', 'Impasse'),
    ('House Greyjoy', 'The War of the Stepstones', 'Derrota'),
    ('House Tyrell', 'The Conquest of Dorne', 'Vitória');

INSERT INTO Guerreia_em (ID_Personagem, Nome_Guerra, Vencedor) VALUES
    (1, 'War of the Five Kings', 'Derrota'),
    (2, 'Dance of the Dragons', 'Vitória'),
    (3, 'The Long Night', 'Derrota'),
    (4, 'The Blackfyre Rebellion', 'Impasse'),
    (5, 'The War of the Stepstones', 'Vitória'),
    (6, 'The Conquest of Dorne', 'Vitória');

INSERT INTO Luta_em (ID_Personagem, Nome_Batalha, Vencedor) VALUES
    (1, 'Battle of the Blackwater', 'Derrota'),
    (2, 'Battle of Winterfell', 'Vitória'),
    (3, 'Battle of Rook''s Rest', 'Derrota'),
    (4, 'Battle of the Bastards', 'Vitória'),
    (5, 'Battle of the Trident', 'Impasse'),
    (6, 'Battle of Starfall', 'Vitória');

INSERT INTO Mata (Nome_Animal, ID_Dono, ID_Personagem_Morto, Data, Descricao_Morte, Localizacao) VALUES
    ('Ghost', 1, 2, '2004-01-01', 'By a blade', 'Winterfell'),
    ('Nymeria', 2, 3, '2005-01-01', 'In battle', 'The North'),
    ('Shaggydog', 3, 4, '2006-01-01', 'By poison', 'The Reach'),
    ('Summer', 4, 5, '2007-01-01', 'In the snow', 'Winterfell'),
    ('Hodor', 5, 6, '2008-01-01', 'By fire', 'King''s Landing'),
    ('Drogon', 6, 1, '2009-01-01', 'In the sea', 'Blackwater Bay');

INSERT INTO Interpretacao (Momento_Realizada, Descricao_Interpretacao, ID_Personagem, Origem_Profecia, Nome_Profecia) VALUES
    ('2000-01-01', 'The prophecy was heard in a sacred rite', 1, 'The Red Priests', 'The Prince That Was Promised'),
    ('2001-01-01', 'The omen was spoken before the war', 2, 'The Children of the Forest', 'The Song of Ice and Fire'),
    ('2002-01-01', 'The warning came from the Wall', 3, 'The Wall', 'The Night King'),
    ('2003-01-01', 'The old words were remembered by the dragonlords', 4, 'Old Valyria', 'The Dragon has Three Heads'),
    ('2004-01-01', 'The sword was blessed for justice', 5, 'The Reach', 'The Sword of the Morning'),
    ('2005-01-01', 'The last dragon was awaited by the realm', 6, 'The Targaryens', 'The Last Dragon');

INSERT INTO Associacao_Profetica (Tipo, Periodo_Em_Que_Valido, ID_Personagem, Nome_Profecia, Origem_Profecia) VALUES
    ('Faithful', 'Before the war', 1, 'The Prince That Was Promised', 'The Red Priests'),
    ('Ancient', 'During the cold', 2, 'The Song of Ice and Fire', 'The Children of the Forest'),
    ('Dreadful', 'At the Wall', 3, 'The Night King', 'The Wall'),
    ('Royal', 'In old times', 4, 'The Dragon has Three Heads', 'Old Valyria'),
    ('Honorable', 'In the age of blades', 5, 'The Sword of the Morning', 'The Reach'),
    ('Legendary', 'At the end of days', 6, 'The Last Dragon', 'The Targaryens');

COMMIT;
