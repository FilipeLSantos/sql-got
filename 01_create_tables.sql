// Continente
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

// Guerra
CREATE TABLE Guerra(
	Nome varchar(80) not null,
	Data_Incio date not null,
	Data_Fim date,

	constraint pk_guerra primary key (Nome),
	constraint ck_nome_guerra check (Nome ~ '^[^0-9]'),
	constraint ck_guerra_data_inicio check (Data_Incio <= current_date),
	constraint ck_guerra_data_fim check (Data_Fim is null or Data_Fim > Data_Incio)
	constraint fk_nome_guerra_batalha foreignkey (Nome)
		references Batalha (Nome_Guerra)
		on delete RESTRICT
);

// Profissão
CREATE TABLE Profissao(
	Nome varchar(50) not null,

	constraint pk_profissao primary key (Nome),
	constraint ck_nome_profissao check (Nome ~ '^[^0-9]')
);

// Dragão
CREATE TABLE Dragao(
	Nome varchar(80) not null,
	Estado varchar(15),
	Tamanho numeric(8,2),
	Cor varchar(30)

	constraint pk_dragao primary key (Nome),
	constraint ck_nome_dragao check (Nome ~ '^[^0-9]'),
	constraint ck_estado_dragao check (Estado in('Vivo', 'Morto', 'Desaparecido'))

	constraint fk_participa_dragao foreign (Nome)
		references Participa (Nome_Dragao)
		on delete RESTRICT
);

// Profecia
CREATE TABLE Profecia(
	Nome varchar(50) not null,
	Origem varchar(80) not null,
	Descricao varchar(150),

	constraint pk_profecia primary key (Nome, Origem),
	constraint ck_nome_profecia check (Nome ~ '^[^0-9]'),
	constraint ck_origem_profecia check (Origem ~ '^[^0-9]')
	constraint ck_descricao_profecia check (Descricao ~ '^[^0-9]')
);

// Tipo Arma
CREATE TABLE TipoArma(
	Tipo varchar(100) not null,
    Material varchar(100) not null,

	constraint pk_tipo_arma primary key (Tipo)
);

// Arma
CREATE TABLE Arma(
	Nome varchar(50) not null,
	Tipo varchar(30) not null,
	ID_Dono INTEGER,
	Periodo_Pertencimento int,

	constraint pk_arma primary key (Nome),
	constraint ck_nome_arma check (Nome ~ '^[^0-9]')
	constraint fk_arma_tipo foreign key (Tipo)
		references TipoArma (Tipo)
		on delete RESTRICT
);

// Caracterisiticas
CREATE TABLE Caracteristicas(
	Nome_Raca varchar(80) not null,
	Caracteristicas varchar(100) not null,

	constraint pk_caracteristicas priamry key (Nome_Raca, Caracteristicas),
	constraint ck_caracteristicas_caracteristicas check (Caracteristicas ~ '^[^0-9]')
	constraint fk_caracteristicas_raca foreign key (Nome_Raca)
		references Raca(Nome)
		on delete casacade
);

// Raça
CREATE TABLE Raca(
	Nome varchar(80) not null,

	constraint pk_raca primary key (Nome),
	constraint ck_nome_raca check (Nome ~ '^[^0-9]')
);

// Caracterisiticas Fisicas
CREATE TABLE CaracteristicasFisicas(
	Nome_Raca varchar(100),
	Cor_Cabelos varchar(100),
	Cor_Olhos varchar(100),

	primary key(Nome_Raca, Cor_Cabelos, Cor_Olhos)
);

// Batalha
CREATE TABLE Batalha(
	Nome varchar(80) not null,
	Localizacao varchar(100),
	Nome_Guerra varchar(80) not null,

	constraint pk_batalha primary key (Nome),
	constraint ck_nome_batalha check (Nome ~ '^[^0-9]')

	constraint fk_participa_batalha foreign (Nome)
		references Participa (Nome_Batalha)
		on delete RESTRICT
);

// Participa
CREATE TABLE Participa(
	Nome_Batalha varchar(80) not null,
	Nome_Dragao varchar(80) not null,

	constraint pk_participa primary key (Nome_Batalha, Nome_Dragao)
	constraint fk_impacto_participa_batalha foreign (Nome_Batalha)
		references ImpactoCausado (Nome_Batalha)
		on delete RESTRICT
	constraint fk_impacto_participa_dragao foreign (Nome_Dragao)
		references ImpactoCausado (Nome_Dragao)
		on delete RESTRICT
);


// Impacto Causado
CREATE TABLE ImpactoCausado(
	Nome_Batalha varchar(80) not null,
	Nome_Dragao(80) not null, 
	Impacto_Causado varchar(50) not null, 

	constraint pk_impacto_causado primary key (Nome_Batalha, Nome_Dragao, Impacto_Causado),
	constraint ck_imapcto_causado check (Nome ~ '^[^0-9]')
);