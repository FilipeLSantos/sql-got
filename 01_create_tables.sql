// Continente
CREATE TABLE Continente(
	Nome varchar(80) primary key, 
	Descricao varchar(150),
	Info_Produtivas varchar(150),
	Info_Climaticas varchar(150)
);

// Raça
CREATE TABLE Raca(
	Nome varchar(80) primary key
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


// Arma
CREATE TABLE Arma(
	Nome varchar(50) primary key,
	Tipo varchar(30),
	Periodo_Pertencimento int
);