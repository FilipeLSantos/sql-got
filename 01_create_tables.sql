// Continente
CREATE TABLE Continente(
	Nome varchar(80) primary key, 
	Descricao varchar(150),
	Info_Produtivas varchar(150),
	Info_Climaticas varchar(150)
);

// Guerra
CREATE TABLE Guerra(
	Nome varchar(80) primary key,
	Data_Incio date,
	Data_Fim date
);

// Profissão
CREATE TABLE Profissao(
	Nome varchar(80) primary key
);

// Dragão
CREATE TABLE Dragao(
	Nome varchar(80) primary key,
	Estado varchar(15),
	Tamanho numeric(8,2),
	Cor varchar(30)
);

// Profecia
CREATE TABLE Profecia(
	Nome varchar(80),
	Origem varchar(80),
	Descricao varchar(150),

	primary key (Nome, Origem)
);

// Tipo Arma
CREATE TABLE TipoArma(
	Tipo varchar(100) primary key,
    Material varchar(100) not null
);

// Arma
CREATE TABLE Arma(
	Nome varchar(50) primary key,
	Tipo varchar(30),
	Periodo_Pertencimento int,

	constraint fk_arma_tipo foreign key (Tipo) references TipoArma(Tipo)
);

// Raça
CREATE TABLE Raca(
	Nome varchar(80) primary key
);

// Caracterisiticas Fisicas
CREATE TABLE CaracteristicasFisicas(
	Nome_Raca varchar(100),
	Cor_Cabelos varchar(100),
	Cor_Olhos varchar(100),

	primary key(Nome_Raca, Cor_Cabelos, Cor_Olhos)
);

// Caracterisiticas
CREATE TABLE Caracteristicas(
	Nome_Raca varchar(100),
	Caracteristicas varchar(100),

	primary key(Nome_Raca, Caracteristicas),

	constraint fk_caracteristicas_raca foreign key (Nome_Raca) references Raca(Nome)
);