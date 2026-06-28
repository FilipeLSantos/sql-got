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