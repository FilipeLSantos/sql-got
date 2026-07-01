CREATE TABLE Continente(
	Nome varchar(80) not null, 
	Descricao varchar(150),
	Info_Produtivas varchar(150),
	Info_Climaticas varchar(150),

	constraint pk_continente primary key (Nome),
	constraint ck_nome_continente check (Nome ~ '^[^0-9]'),
	constraint ck_descricao_continente check (Descricao ~ '^[^0-9]'),
	constraint ck_info_produtivas check (Info_Climaticas ~ '^[^0-9]'),
	constraint ck_info_climaticas check (Info_Produtivas ~ '^[^0-9]')
);

CREATE TABLE Guerra(
	Nome varchar(80) not null,
	Data_Inicio date not null,
	Data_Fim date,

	constraint pk_guerra primary key (Nome),
	constraint ck_nome_guerra check (Nome ~ '^[^0-9]'),
	constraint ck_guerra_data_inicio check (Data_Inicio <= current_date),
	constraint ck_guerra_data_fim check (Data_Fim is null or Data_Fim > Data_Inicio)
	
);

CREATE TABLE Profissao(
	Nome varchar(50) not null,

	constraint pk_profissao primary key (Nome),
	constraint ck_nome_profissao check (Nome ~ '^[^0-9]')
);

CREATE TABLE Dragao(
	Nome varchar(80) not null,
	Estado varchar(15) not null default 'Vivo',
	Tamanho numeric(8,2),
	Cor varchar(30),

	constraint pk_dragao primary key (Nome),
	constraint ck_nome_dragao check (Nome ~ '^[^0-9]'),
	constraint ck_estado_dragao check (Estado in('Vivo', 'Morto', 'Desaparecido')),
	constraint ck_cor_dragao check (Cor ~ '^[^0-9]')
);

CREATE TABLE Profecia(
	Nome varchar(50) not null,
	Origem varchar(80) not null,
	Descricao varchar(150),

	constraint pk_profecia primary key (Nome, Origem),
	constraint ck_nome_profecia check (Nome ~ '^[^0-9]'),
	constraint ck_origem_profecia check (Origem ~ '^[^0-9]'),
	constraint ck_descricao_profecia check (Descricao ~ '^[^0-9]')
);

CREATE TABLE Raca(
	Nome varchar(80) not null,

	constraint pk_raca primary key (Nome),
	constraint ck_nome_raca check (Nome ~ '^[^0-9]')
);

CREATE TABLE Caracteristicas(
	Nome_Raca varchar(80) not null,
	Caracteristicas varchar(100) not null,

	constraint pk_caracteristicas primary key (Nome_Raca, Caracteristicas),
	constraint ck_caracteristicas_caracteristicas check (Caracteristicas ~ '^[^0-9]'),

	constraint fk_caracteristicas_raca foreign key (Nome_Raca)
		references Raca(Nome)
		on delete RESTRICT
);

CREATE TABLE CaracteristicasFisicas(
	Nome_Raca varchar(100) not null,
	Cor_Cabelos varchar(100) not null,
	Cor_Olhos varchar(100) not null,

	constraint pk_caracteristicasfisicas primary key(Nome_Raca, Cor_Cabelos, Cor_Olhos),
	constraint ck_nome_raca check (Nome_Raca ~ '^[^0-9]'),
	constraint ck_cor_cabelo check (Cor_Cabelos ~ '^[^0-9]'),
	constraint ck_cor_olhos check (Cor_Olhos ~ '^[^0-9]'),
	constraint fk_nome_raca foreign key (Nome_Raca)
		references Raca (Nome)
		on delete cascade	
);

CREATE TABLE Batalha(
	Nome varchar(80) not null,
	Localizacao varchar(100),
	Nome_Guerra varchar(80) not null,

	constraint pk_batalha primary key (Nome),
	constraint ck_nome_batalha check (Nome ~ '^[^0-9]'),
	constraint ck_localizacao check (Localizacao ~ '^[^0-9]'),
	constraint ck_nome_guerra check (Nome_Guerra ~ '^[^0-9]'),
	
	constraint fk_batalha_guerra foreign key(Nome_Guerra)
		references Guerra (Nome)
		on delete RESTRICT
);

CREATE TABLE Participa(
	Nome_Batalha varchar(80) not null,
	Nome_Dragao varchar(80) not null,

	constraint pk_participa primary key (Nome_Batalha, Nome_Dragao),

	constraint fk_participa_batalha foreign key (Nome_Batalha)
		references Batalha (Nome)
		on delete RESTRICT,

	constraint fk_participa_dragao foreign key (Nome_Dragao)
		references Dragao (Nome)
		on delete RESTRICT,
	constraint ck_nome_batalha check (Nome_Batalha ~ '^[^0-9]'),
	constraint ck_nome_dragao check (Nome_Dragao ~ '^[^0-9]')
);

CREATE TABLE ImpactoCausado(
	Nome_Batalha varchar(80) not null,
	Nome_Dragao varchar(80) not null, 
	Impacto_Causado varchar(50) not null, 

	constraint pk_impacto_causado primary key (Nome_Batalha, Nome_Dragao, Impacto_Causado),
	constraint ck_impacto_causado check (Impacto_Causado ~ '^[^0-9]'),
	constraint ck_nome_batalha check (Nome_Batalha ~ '^[^0-9]'),
	constraint ck_nome_dragao check (Nome_Dragao ~ '^[^0-9]'),
	constraint fk_impactocausado_batalha_dragao foreign key (Nome_Batalha, Nome_Dragao)
		references Participa (Nome_Batalha, Nome_Dragao)
		on delete RESTRICT
);

CREATE TABLE Capital (
    Nome_Cidade VARCHAR(80) NOT NULL,
    Nome_Reino VARCHAR(80),
    Nome_Continente VARCHAR(80),
    CONSTRAINT pk_capital PRIMARY KEY (Nome_Cidade),
    CONSTRAINT uq_capital_reino UNIQUE (Nome_Reino),
    CONSTRAINT ck_nome_cidade CHECK (Nome_Cidade ~ '^[^0-9]'),
    CONSTRAINT ck_nome_reino CHECK (Nome_Reino ~ '^[^0-9]'),
    CONSTRAINT ck_nome_continente CHECK (Nome_Continente ~ '^[^0-9]')
);

CREATE TABLE Reino (
    Nome VARCHAR(80) NOT NULL,
    Tipo_Governo VARCHAR(50) NOT NULL,
    Descricao VARCHAR(150) NOT NULL,
    Nome_Capital VARCHAR(80) NOT NULL,
    CONSTRAINT pk_reino PRIMARY KEY (Nome),
    CONSTRAINT uq_nome_capital UNIQUE (Nome_Capital),
    CONSTRAINT fk_nome_capital FOREIGN KEY (Nome_Capital)
        REFERENCES Capital(Nome_Cidade)
        ON DELETE RESTRICT,
    CONSTRAINT ck_nome_reino CHECK (Nome ~ '^[^0-9]'),
    CONSTRAINT ck_tipo_governo CHECK (Tipo_Governo ~ '^[^0-9]'),
    CONSTRAINT ck_descricao CHECK (Descricao ~ '^[^0-9]'),
    CONSTRAINT ck_nome_capital CHECK (Nome_Capital ~ '^[^0-9]')
);

CREATE TABLE Casa (
    Nome VARCHAR(50) NOT NULL,
    Bandeira VARCHAR(100) NOT NULL,
    Palavras_Casa VARCHAR(50) NOT NULL,
    Nome_Capital VARCHAR(80) NOT NULL,
    CONSTRAINT pk_casa PRIMARY KEY (Nome),
    CONSTRAINT fk_nome_capital FOREIGN KEY (Nome_Capital)
        REFERENCES Capital(Nome_Cidade)
        ON DELETE RESTRICT,
    CONSTRAINT ck_casa_nome CHECK (Nome ~ '^[^0-9]'),
	CONSTRAINT ck_bandeira CHECK (Bandeira ~ '^[^0-9]'),
	CONSTRAINT ck_palavras_casa CHECK (Palavras_Casa ~ '^[^0-9]'),
	CONSTRAINT ck_nome_capital CHECK (Nome_Capital ~ '^[^0-9]')
);

ALTER TABLE Capital
    ADD CONSTRAINT fk_capital_reino FOREIGN KEY (Nome_Reino)
        REFERENCES Reino(Nome)
        ON DELETE SET NULL,
    ADD CONSTRAINT fk_capital_continente FOREIGN KEY (Nome_Continente)
        REFERENCES Continente(Nome)
        ON DELETE SET NULL;
		
CREATE TABLE Cidade (
    Nome VARCHAR(80) NOT NULL,
    Periodo_Construcao INTEGER,
    Tipo BOOLEAN NOT NULL DEFAULT FALSE,
    Historia VARCHAR(200) NOT NULL,
    Nome_Casa VARCHAR(50),
    CONSTRAINT pk_cidade PRIMARY KEY (Nome),
    CONSTRAINT fk_nome_casa FOREIGN KEY (Nome_Casa)
        REFERENCES Casa(Nome)
        ON DELETE SET NULL,
    CONSTRAINT ck_cidade_nome CHECK (Nome ~ '^[^0-9]'),
    CONSTRAINT ck_cidade_periodo CHECK (Periodo_Construcao IS NULL OR Periodo_Construcao > 0),
	CONSTRAINT ck_historia CHECK (Historia ~ '^[^0-9]'),
	CONSTRAINT ck_nome_casa CHECK (Nome_Casa ~ '^[^0-9]')
);

CREATE TABLE Personagem (
    ID INTEGER NOT NULL,
    Nome VARCHAR(80) NOT NULL,
    ID_Pai INTEGER,
    ID_Mae INTEGER,
    Cidade_Nascimento VARCHAR(80),
    Cidade_Morte VARCHAR(80),
    Casa_Fundada VARCHAR(50),
	
    CONSTRAINT pk_personagem PRIMARY KEY (ID),
    CONSTRAINT fk_id_pai FOREIGN KEY (ID_Pai)
        REFERENCES Personagem(ID)
        ON DELETE SET NULL,
    CONSTRAINT fk_id_mae FOREIGN KEY (ID_Mae)
        REFERENCES Personagem(ID)
        ON DELETE SET NULL,
    CONSTRAINT fk_cidade_nascimento FOREIGN KEY (Cidade_Nascimento)
        REFERENCES Cidade(Nome)
        ON DELETE SET NULL,
    CONSTRAINT fk_cidade_morte FOREIGN KEY (Cidade_Morte)
        REFERENCES Cidade(Nome)
        ON DELETE SET NULL,
    CONSTRAINT fk_casa_fundada FOREIGN KEY (Casa_Fundada)
        REFERENCES Casa(Nome)
        ON DELETE SET NULL,
    CONSTRAINT ck_nome CHECK (Nome ~ '^[^0-9]'),
	CONSTRAINT ck_cidade_morte CHECK (Cidade_Morte ~ '^[^0-9]'),
	CONSTRAINT ck_casa_fundada CHECK (Casa_Fundada ~ '^[^0-9]'),
	CONSTRAINT ck_cidade_nascimento CHECK (Cidade_Nascimento ~ '^[^0-9]')
);

CREATE TABLE Humano (
    ID_Personagem INTEGER NOT NULL,
    Causa_Morte VARCHAR(150),
    Genero BOOLEAN NOT NULL,
    Sobrenome VARCHAR(80) NOT NULL,
    Ano_Nascimento INTEGER NOT NULL,
    Ano_Morte INTEGER,
    Nome_Raca VARCHAR(80) NOT NULL,
	
    CONSTRAINT pk_humano PRIMARY KEY (ID_Personagem),
    CONSTRAINT fk_id_personagem FOREIGN KEY (ID_Personagem)
        REFERENCES Personagem(ID)
        ON DELETE CASCADE,
    CONSTRAINT fk_nome_raca FOREIGN KEY (Nome_Raca)
        REFERENCES Raca(Nome)
        ON DELETE RESTRICT,
    CONSTRAINT ck_anos CHECK (Ano_Morte IS NULL OR Ano_Morte > Ano_Nascimento),
    CONSTRAINT ck_sobrenome CHECK (Sobrenome ~ '^[^0-9]'),
	CONSTRAINT ck_causa_morte CHECK (Causa_Morte ~ '^[^0-9]'),
	CONSTRAINT ck_nome_raca CHECK (Nome_Raca ~ '^[^0-9]')
);

CREATE TABLE Nao_Humano (
    ID_Personagem INTEGER NOT NULL,
    Especie VARCHAR(80) NOT NULL,
	
    CONSTRAINT pk_nao_humano PRIMARY KEY (ID_Personagem),
    CONSTRAINT fk_id_personagem FOREIGN KEY (ID_Personagem)
        REFERENCES Personagem(ID)
        ON DELETE CASCADE,
    CONSTRAINT ck_especie CHECK (Especie ~ '^[^0-9]')
);

CREATE TABLE TipoArma(
	Tipo varchar(100) not null,
    Material varchar(100) not null,

	constraint pk_tipo_arma primary key (Tipo),
	constraint ck_tipo check (Tipo ~ '^[^0-9]'),
	constraint ck_material check (Material ~ '^[^0-9]')
);
CREATE TABLE Arma(
	Nome varchar(50) not null,
	Tipo varchar(30) not null,
	ID_Dono INTEGER,
	Periodo_Pertencimento int,

	constraint pk_arma primary key (Nome),
	constraint fk_tipo foreign key (Tipo)
		references tipoArma(Tipo)
		on delete restrict,
	constraint ck_nome_arma check (Nome ~ '^[^0-9]'),
	constraint ck_tipo check (Tipo ~ '^[^0-9]'),
	constraint fk_id_dono foreign key (ID_Dono)
		references Personagem (ID)
		on delete set null
);


CREATE TABLE Animal (
    ID_Dono INTEGER NOT NULL,
    Nome VARCHAR(80) NOT NULL,
    Especie VARCHAR(80) NOT NULL,
    Ano_Nascimento INTEGER,
    Ano_Morte INTEGER,
	
    CONSTRAINT pk_animal PRIMARY KEY (ID_Dono, Nome),
    CONSTRAINT fk_id_dono FOREIGN KEY (ID_Dono)
        REFERENCES Personagem(ID)
        ON DELETE CASCADE,
    CONSTRAINT ck_anos CHECK (Ano_Morte IS NULL OR Ano_Morte > Ano_Nascimento),
    CONSTRAINT ck_animal_nome CHECK (Nome ~ '^[^0-9]'),
	CONSTRAINT ck_especie CHECK (Especie ~ '^[^0-9]')
);

CREATE TABLE Pertencimento (
    Nome_Casa VARCHAR(50) NOT NULL,
    ID_Personagem INTEGER NOT NULL,
    Data_Inicio DATE NOT NULL,
    Data_Fim DATE,
    Tipo VARCHAR(80) NOT NULL,
	
    CONSTRAINT pk_pertencimento PRIMARY KEY (Nome_Casa, ID_Personagem, Data_Inicio),
    CONSTRAINT fk_nome_casa FOREIGN KEY (Nome_Casa)
        REFERENCES Casa(Nome)
        ON DELETE RESTRICT,
    CONSTRAINT fk_id_personagem FOREIGN KEY (ID_Personagem)
        REFERENCES Personagem(ID)
        ON DELETE RESTRICT,
    CONSTRAINT ck_datas CHECK (Data_Fim IS NULL OR Data_Fim > Data_Inicio),
    CONSTRAINT ck_tipo CHECK (Tipo ~ '^[^0-9]'),
	CONSTRAINT ck_nome_casa CHECK (Nome_Casa ~ '^[^0-9]')
);

CREATE TABLE Lealdade (
    Nome_Casa VARCHAR(50) NOT NULL,
    ID_Personagem INTEGER NOT NULL,
    Data_Inicio DATE NOT NULL,
    Data_Fim DATE,
    Razao_Inicio VARCHAR(150),
    Razao_Fim VARCHAR(150),
	
    CONSTRAINT pk_lealdade PRIMARY KEY (Nome_Casa, ID_Personagem, Data_Inicio),
    CONSTRAINT fk_nome_casa FOREIGN KEY (Nome_Casa)
        REFERENCES Casa(Nome)
        ON DELETE RESTRICT,
    CONSTRAINT fk_id FOREIGN KEY (ID_Personagem)
        REFERENCES Personagem(ID)
        ON DELETE RESTRICT,
    CONSTRAINT ck_datas CHECK (Data_Fim IS NULL OR Data_Fim > Data_Inicio),
	CONSTRAINT ck_razao_inicio CHECK (Razao_Inicio ~ '^[^0-9]'),
	CONSTRAINT ck_razao_fim CHECK (Razao_Fim ~ '^[^0-9]')
);

CREATE TABLE Lorde (
    Nome_Casa VARCHAR(50) NOT NULL,
    ID_Personagem INTEGER NOT NULL,
    Data_Inicio DATE NOT NULL,
    Data_Fim DATE,
	
    CONSTRAINT pk_lorde PRIMARY KEY (Nome_Casa, ID_Personagem, Data_Inicio),
    CONSTRAINT fk_nome_casa FOREIGN KEY (Nome_Casa)
        REFERENCES Casa(Nome)
        ON DELETE RESTRICT,
    CONSTRAINT fk_id_personagem FOREIGN KEY (ID_Personagem)
        REFERENCES Personagem(ID)
        ON DELETE RESTRICT,
    CONSTRAINT ck_datas CHECK (Data_Fim IS NULL OR Data_Fim > Data_Inicio),
	CONSTRAINT ck_nome_casa CHECK (Nome_Casa ~ '^[^0-9]')
);

CREATE TABLE Casamento (
    ID_Personagem1 INTEGER NOT NULL,
    ID_Personagem2 INTEGER NOT NULL,
    Data_Inicio DATE NOT NULL,
    Data_Fim DATE,
    Razao_Dissolucao VARCHAR(150),
	
    CONSTRAINT pk_casamento PRIMARY KEY (ID_Personagem1, ID_Personagem2, Data_Inicio),
    CONSTRAINT fk_id_personagem1 FOREIGN KEY (ID_Personagem1)
        REFERENCES Personagem(ID)
        ON DELETE RESTRICT,
    CONSTRAINT fk_id_personagem2 FOREIGN KEY (ID_Personagem2)
        REFERENCES Personagem(ID)
        ON DELETE RESTRICT,
    CONSTRAINT ck_datas CHECK (Data_Fim IS NULL OR Data_Fim > Data_Inicio),
    CONSTRAINT ck_personagens CHECK (ID_Personagem1 <> ID_Personagem2),
	CONSTRAINT ck_razao_dissolucao CHECK (Razao_dissolucao ~ '^[^0-9]')
);

CREATE TABLE Assassinato (
    ID_Assassinado INTEGER NOT NULL,
    ID_Assassino INTEGER NOT NULL,
    Data_Morte DATE NOT NULL,
    Causa_Morte VARCHAR(150) NOT NULL,
    Localizacao VARCHAR(100),
    Nome_Arma VARCHAR(50),	
	
    CONSTRAINT pk_assassinato PRIMARY KEY (ID_Assassinado, ID_Assassino, Data_Morte),
    CONSTRAINT fk_id_assassinado FOREIGN KEY (ID_Assassinado)
        REFERENCES Personagem(ID)
        ON DELETE RESTRICT,
    CONSTRAINT fk_assassino FOREIGN KEY (ID_Assassino)
        REFERENCES Personagem(ID)
        ON DELETE RESTRICT,
    CONSTRAINT fk_nome_arma FOREIGN KEY (Nome_Arma)
        REFERENCES Arma(Nome)
        ON DELETE SET NULL,
    CONSTRAINT ck_ids_distintos CHECK (ID_Assassinado <> ID_Assassino),
	CONSTRAINT ck_causa_morte CHECK (Causa_Morte ~ '^[^0-9]'),
	CONSTRAINT ck_localizacao CHECK (Localizacao ~ '^[^0-9]'),
	CONSTRAINT ck_nome_arma CHECK (Nome_Arma ~ '^[^0-9]')
);
           
CREATE TABLE Governante (
    ID_Personagem INTEGER NOT NULL,
    Nome_Reino VARCHAR(80) NOT NULL,
    Data_Inicio DATE NOT NULL,
    Data_Fim DATE,
    ID_Sucessor INTEGER,
    Nome_Reino_Sucessor VARCHAR(80),
    Data_Inicio_Sucessor DATE,
    
	CONSTRAINT pk_governante PRIMARY KEY (ID_Personagem, Nome_Reino, Data_Inicio),
    CONSTRAINT fk_id_personagem FOREIGN KEY (ID_Personagem)
        REFERENCES Personagem(ID)
        ON DELETE RESTRICT,
    CONSTRAINT fk_nome_reino FOREIGN KEY (Nome_Reino)
        REFERENCES Reino(Nome)
        ON DELETE RESTRICT,
    CONSTRAINT fk_id_sucessor FOREIGN KEY (ID_Sucessor)
        REFERENCES Personagem (ID)
        ON DELETE SET NULL,
	CONSTRAINT fk_nome_reino_sucessor FOREIGN KEY (Nome_Reino_Sucessor)
		REFERENCES Reino (Nome)
		ON DELETE SET NULL,
    CONSTRAINT ck_gov_datas CHECK (Data_Fim IS NULL OR Data_Fim > Data_Inicio),
	CONSTRAINT ck_nome_reino CHECK (Nome_Reino ~ '^[^0-9]')
);	
           
CREATE TABLE Cavaleiro (
    Data_Inicio DATE NOT NULL,
    Data_Fim DATE,
    ID_Personagem INTEGER NOT NULL,
    Nome_Dragao VARCHAR(80) NOT NULL,
	
    CONSTRAINT pk_cavaleiro PRIMARY KEY (Data_Inicio, ID_Personagem, Nome_Dragao),
    CONSTRAINT fk_id_personagem FOREIGN KEY (ID_Personagem)
        REFERENCES Personagem(ID)
        ON DELETE RESTRICT,
    CONSTRAINT fk_nome_dragao FOREIGN KEY (Nome_Dragao)
        REFERENCES Dragao(Nome)
        ON DELETE RESTRICT,
    CONSTRAINT ck_cav_datas CHECK (Data_Fim IS NULL OR Data_Fim > Data_Inicio),
	CONSTRAINT ck_nome_dragao CHECK (Nome_Dragao ~ '^[^0-9]')
);
            
CREATE TABLE Alianca (
    Data_Inicio DATE NOT NULL,
    Data_Fim DATE,
    Nome_Capital VARCHAR(80) NOT NULL,
    Reino1 VARCHAR(80) NOT NULL,
    Reino2 VARCHAR(80) NOT NULL,
	
    CONSTRAINT pk_alianca PRIMARY KEY (Data_Inicio, Reino1, Reino2),
    CONSTRAINT fk_nome_capital FOREIGN KEY (Nome_Capital)
        REFERENCES Capital(Nome_Cidade)
        ON DELETE RESTRICT,
    CONSTRAINT fk_reino1 FOREIGN KEY (Reino1)
        REFERENCES Reino(Nome)
        ON DELETE RESTRICT,
    CONSTRAINT fk_reino2 FOREIGN KEY (Reino2)
        REFERENCES Reino(Nome)
        ON DELETE RESTRICT,
    CONSTRAINT ck_alianca_datas CHECK (Data_Fim IS NULL OR Data_Fim > Data_Inicio),
    CONSTRAINT ck_alianca_reinos CHECK (Reino1 <> Reino2),
	CONSTRAINT ck_nome_cidade CHECK (Nome_Capital ~ '^[^0-9]'),
	CONSTRAINT ck_reino1 CHECK (Reino1 ~ '^[^0-9]'),
	CONSTRAINT ck_reino2 CHECK (Reino2 ~ '^[^0-9]')
);

CREATE TABLE Posse_Territorial (
    Reino VARCHAR(80) NOT NULL,
    Nome_Cidade VARCHAR(80) NOT NULL,
    Data_Inicio DATE NOT NULL,
    Data_Fim DATE,
    Razao_Mudanca VARCHAR(150),

    CONSTRAINT pk_posse PRIMARY KEY (Reino, Nome_Cidade, Data_Inicio),
    CONSTRAINT fk_reino FOREIGN KEY (Reino)
        REFERENCES Reino(Nome)
        ON DELETE RESTRICT,
    CONSTRAINT fk_nome_cidade FOREIGN KEY (Nome_Cidade)
        REFERENCES Cidade(Nome)
        ON DELETE RESTRICT,
    CONSTRAINT ck_posse_datas CHECK (Data_Fim IS NULL OR Data_Fim > Data_Inicio),
	CONSTRAINT ck_reino CHECK (Reino ~ '^[^0-9]'),
	CONSTRAINT ck_nome_cidade CHECK (Nome_Cidade ~ '^[^0-9]'),
	CONSTRAINT ck_razao_mudanca CHECK (Razao_Mudanca ~ '^[^0-9]')
);
                
CREATE TABLE Muda (
    Nome_Guerra VARCHAR(80) NOT NULL,
    Reino VARCHAR(80) NOT NULL,
    Cidade VARCHAR(80) NOT NULL,
    Data_Inicio DATE NOT NULL,
	
    CONSTRAINT pk_muda PRIMARY KEY (Nome_Guerra, Reino, Cidade, Data_Inicio),
    CONSTRAINT fk_nome_guerra FOREIGN KEY (Nome_Guerra)
        REFERENCES Guerra(Nome)
        ON DELETE RESTRICT,
    CONSTRAINT fk_posse_territorial FOREIGN KEY (Reino, Cidade, Data_Inicio)
        REFERENCES Posse_Territorial(Reino, Nome_Cidade, Data_Inicio)
        ON DELETE RESTRICT,
	CONSTRAINT ck_nome_guerra CHECK (Nome_Guerra ~ '^[^0-9]'),
	CONSTRAINT ck_reino CHECK (Reino ~ '^[^0-9]'),
	CONSTRAINT ck_cidade CHECK (Cidade ~ '^[^0-9]')
);
               
CREATE TABLE Exerce (
    Nome_Profissao VARCHAR(50) NOT NULL,
    ID_Personagem INTEGER NOT NULL,
    
	CONSTRAINT pk_exerce PRIMARY KEY (Nome_Profissao, ID_Personagem),
    CONSTRAINT fk_nome_profissao FOREIGN KEY (Nome_Profissao)
        REFERENCES Profissao(Nome)
        ON DELETE RESTRICT,
    CONSTRAINT fk_id_personagem FOREIGN KEY (ID_Personagem)
        REFERENCES Personagem(ID)
        ON DELETE RESTRICT,
	CONSTRAINT ck_nome_profissao CHECK (Nome_Profissao ~ '^[^0-9]')
);
       
CREATE TABLE Desempenhada_na (
    Nome_Profissao VARCHAR(50) NOT NULL,
    Nome_Cidade VARCHAR(80) NOT NULL,
    CONSTRAINT pk_desempenha PRIMARY KEY (Nome_Profissao, Nome_Cidade),
    CONSTRAINT fk_nome_profissao FOREIGN KEY (Nome_Profissao)
        REFERENCES Profissao(Nome)
        ON DELETE RESTRICT,
    CONSTRAINT fk_nome_cidade FOREIGN KEY (Nome_Cidade)
        REFERENCES Cidade(Nome)
        ON DELETE RESTRICT,
	CONSTRAINT ck_nome_profissao CHECK (Nome_Profissao ~ '^[^0-9]'),
	CONSTRAINT ck_nome_cidade CHECK (Nome_Cidade ~ '^[^0-9]')
);
         
CREATE TABLE Envolve_se (
    Nome_Casa VARCHAR(50) NOT NULL,
    Nome_Batalha VARCHAR(80) NOT NULL,
    Vencedor VARCHAR(10) NOT NULL DEFAULT 'Impasse',
	
    CONSTRAINT pk_envolve PRIMARY KEY (Nome_Casa, Nome_Batalha),
    CONSTRAINT fk_nome_casa FOREIGN KEY (Nome_Casa)
        REFERENCES Casa(Nome)
        ON DELETE RESTRICT,
    CONSTRAINT fk_nome_batalha FOREIGN KEY (Nome_Batalha)
        REFERENCES Batalha(Nome)
        ON DELETE RESTRICT,
    CONSTRAINT ck_vencedor CHECK (Vencedor IN ('Vitória', 'Derrota', 'Impasse')),
	CONSTRAINT ck_nome_batalha CHECK (Nome_Batalha ~ '^[^0-9]')
);
             
CREATE TABLE Atua_na (
    Nome_Casa VARCHAR(50) NOT NULL,
    Nome_Guerra VARCHAR(80) NOT NULL,
    Vencedor VARCHAR(10) NOT NULL DEFAULT 'Impasse',
    
	CONSTRAINT pk_atua PRIMARY KEY (Nome_Casa, Nome_Guerra),
    CONSTRAINT fk_nome_casa FOREIGN KEY (Nome_Casa)
        REFERENCES Casa(Nome)
        ON DELETE RESTRICT,
    CONSTRAINT fk_nome_guerra FOREIGN KEY (Nome_Guerra)
        REFERENCES Guerra(Nome)
        ON DELETE RESTRICT,
    CONSTRAINT ck_vencedor CHECK (Vencedor IN ('Vitória', 'Derrota', 'Impasse')),
	CONSTRAINT ck_nome_guerra CHECK (Nome_Guerra ~ '^[^0-9]')
);

CREATE TABLE Guerreia_em (
    ID_Personagem INTEGER NOT NULL,
    Nome_Guerra VARCHAR(80) NOT NULL,
    Vencedor VARCHAR(10) NOT NULL DEFAULT 'Impasse',
	
    CONSTRAINT pk_guerreia PRIMARY KEY (ID_Personagem, Nome_Guerra),
    CONSTRAINT fk_guerr_person FOREIGN KEY (ID_Personagem)
        REFERENCES Personagem(ID)
        ON DELETE RESTRICT,
    CONSTRAINT fk_nome_guerra FOREIGN KEY (Nome_Guerra)
        REFERENCES Guerra(Nome)
        ON DELETE RESTRICT,
    CONSTRAINT ck_vencedor CHECK (Vencedor IN ('Vitória', 'Derrota', 'Impasse')),
	CONSTRAINT ck_nome_guerra CHECK (Nome_Guerra ~ '^[^0-9]')
);
              
CREATE TABLE Luta_em (
    ID_Personagem INTEGER NOT NULL,
    Nome_Batalha VARCHAR(80) NOT NULL,
    Vencedor VARCHAR(10) NOT NULL DEFAULT 'Impasse',
	
    CONSTRAINT pk_luta PRIMARY KEY (ID_Personagem, Nome_Batalha),
    CONSTRAINT fk_id_personagem FOREIGN KEY (ID_Personagem)
        REFERENCES Personagem(ID)
        ON DELETE RESTRICT,
    CONSTRAINT fk_nome_batalha FOREIGN KEY (Nome_Batalha)
        REFERENCES Batalha(Nome)
        ON DELETE RESTRICT,
    CONSTRAINT ck_vencedor CHECK (Vencedor IN ('Vitória', 'Derrota', 'Impasse')),
	CONSTRAINT ck_nome_batalha CHECK (Nome_Batalha ~ '^[^0-9]')
	
);
                 
CREATE TABLE Mata (
    Nome_Animal VARCHAR(80) NOT NULL,
    ID_Dono INTEGER NOT NULL,
    ID_Personagem_Morto INTEGER NOT NULL,
    Data DATE,
    Descricao_Morte VARCHAR(100),
    Localizacao VARCHAR(100),
	
    CONSTRAINT pk_mata PRIMARY KEY (Nome_Animal, ID_Dono, ID_Personagem_Morto),
    CONSTRAINT fk_mata FOREIGN KEY (ID_Dono, Nome_Animal)
        REFERENCES Animal(ID_Dono, Nome)
        ON DELETE RESTRICT,
    CONSTRAINT fk_personagem_morto FOREIGN KEY (ID_Personagem_Morto)
        REFERENCES Personagem(ID)
        ON DELETE RESTRICT,
	CONSTRAINT ck_nome_animal CHECK (Nome_Animal ~ '^[^0-9]'),
	CONSTRAINT ck_descricao_morte CHECK (Descricao_Morte ~ '^[^0-9]'),
	CONSTRAINT ck_localizacao CHECK (Localizacao ~ '^[^0-9]')
);
          
CREATE TABLE Interpretacao (
    Momento_Realizada DATE NOT NULL,
    Descricao_Interpretacao VARCHAR(150),
    ID_Personagem INTEGER NOT NULL,
    Origem_Profecia VARCHAR(50) NOT NULL,
    Nome_Profecia VARCHAR(80) NOT NULL,
	
    CONSTRAINT pk_interpretacao PRIMARY KEY (Momento_Realizada, ID_Personagem, Origem_Profecia, Nome_Profecia),
    CONSTRAINT fk_id_personagem FOREIGN KEY (ID_Personagem)
        REFERENCES Personagem(ID)
        ON DELETE RESTRICT,
    CONSTRAINT fk_interpretacao FOREIGN KEY (Nome_Profecia, Origem_Profecia)
        REFERENCES Profecia(Nome, Origem)
        ON DELETE RESTRICT,
	CONSTRAINT ck_descricao_interpretacao CHECK (Descricao_Interpretacao ~ '^[^0-9]'),
	CONSTRAINT ck_origem_profecia CHECK (Origem_Profecia ~ '^[^0-9]'),
	CONSTRAINT ck_nome_profecia CHECK (Nome_Profecia ~ '^[^0-9]')
);

CREATE TABLE Associacao_Profetica (
    Tipo VARCHAR(80) NOT NULL,
    Periodo_Em_Que_Valido VARCHAR(50),
    ID_Personagem INTEGER NOT NULL,
    Nome_Profecia VARCHAR(80) NOT NULL,
    Origem_Profecia VARCHAR(50) NOT NULL,
	
    CONSTRAINT pk_associacao_profetica PRIMARY KEY (Tipo, ID_Personagem, Nome_Profecia, Origem_Profecia),
	CONSTRAINT fk_id_personagem FOREIGN KEY (ID_Personagem)
        REFERENCES Personagem(ID)
        ON DELETE RESTRICT,
    CONSTRAINT fk_associacao_profetica FOREIGN KEY (Nome_Profecia, Origem_Profecia)
        REFERENCES Profecia(Nome, Origem)
        ON DELETE RESTRICT,
	CONSTRAINT ck_tipo CHECK (Tipo ~ '^[^0-9]'),
	CONSTRAINT ck_periodo_em_que_valido CHECK (Periodo_Em_Que_Valido ~ '^[^0-9]'),
	CONSTRAINT ck_nome_profecia CHECK (Nome_Profecia ~ '^[^0-9]'),
	CONSTRAINT ck_origem_profecia CHECK (Origem_Profecia ~ '^[^0-9]')
);