create database EstrelaDaMorteDIO;
go
use EstrelaDaMorteDIO;

CREATE TABLE Planetas(
	IdPlaneta int not null CONSTRAINT PK_Planetas Primary key,
	Nome varchar(50)not null ,
	Rotacao float not null ,
	Orbita float not null ,
	Diametro float not null ,
	Clima varchar(50)not null ,
	Populacao int not null
);

CREATE TABLE Naves(
	IdNave int not null CONSTRAINT PK_Naves PRIMARY KEY,
	Nome  VARCHAR(100) NOT NULL,
	Modelo VARCHAR(150) NOT NULL,
	Passageiros int not null,
	Carga FLOAT NOT NULL,
	Classe VARCHAR(100) NOT NULL
);

CREATE TABLE Pilotos(
	IdPiloto INT NOT NULL CONSTRAINT PK_Pilotos PRIMARY KEY,
	Nome varchar(200) NOT NULL,
	AnoNascimento varchar(10) not null,
	IdPlaneta INT NOT NULL CONSTRAINT FK_Pilotos_Planetas FOREIGN KEY REFERENCES Planetas(IdPlaneta)
);


CREATE TABLE PilotosNaves(
	IdPiloto int not null,
	IdNave int not null,
	FlagAutorizacao bit not null,
	CONSTRAINT PK_PilotosNaves PRIMARY KEY(IdPiloto,IdNave),
	CONSTRAINT FK_PilotosNaves_Pilotos FOREIGN KEY(IdPiloto) references Pilotos(IdPiloto),
	CONSTRAINT FK_PilotosNaves_Naves FOREIGN KEY(IdNave) references Naves(idNave)
);

ALTER TABLE PilotosNaves ADD CONSTRAINT DF_PilotosNaves_FlagAutorizacao DEFAULT(1) FOR FlagAutorizacao 



CREATE TAbLE HistoricoViagens(
	IdPiloto int not null ,
	IdNave int not null ,
	DtSaida DATETIME NOT NULL,
	DtChegada DATETIME,
	CONSTRAINT FK_HistoricoViagens_PilotosNaves FOREIGN KEY(IdPiloto,IdNave) REFERENCES PilotosNaves(IdPiloto,IdNave)
);