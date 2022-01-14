/*Entita'*/

/*Creazione tabella Cliente Carta Passione Cinema*/
CREATE TABLE CliCPC (
    CodiceFiscale CHAR(16) PRIMARY KEY,
    Nome VARCHAR(20) NOT NULL,
    Cognome VARCHAR(20) NOT NULL,
    DataNascita DATE,
    Telefono VARCHAR(10) UNIQUE,
    Sesso VARCHAR(10),
	CHECK (Sesso='Maschio' OR Sesso='Femmina' OR Sesso='Altro')
    Nazionalità VARCHAR(20),
    NumeroCarta CHAR(16) NOT NULL UNIQUE,
    Città VARCHAR(30),
    CAP VARCHAR(5),
    Via VARCHAR(20),
    NumeroCivico CHAR(4)
);

/*Creazione tabella Cliente Online*/					 
CREATE TABLE CliOnline (
    CodiceFiscale CHAR(16) PRIMARY KEY,
    Nome VARCHAR(20) NOT NULL,
    Cognome VARCHAR(20) NOT NULL,
    DataNascita DATE,
    Telefono CHAR(10),
    Email VARCHAR(30) NOT NULL UNIQUE,
    Password VARCHAR(20) NOT NULL
);

/*Creazione tabella Prodotto*/
CREATE TABLE Prodotto (
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(20) NOT NULL UNIQUE,
    Prezzo DECIMAL(6,2) NOT NULL,
	CHECK(Prezzo>0.0)
);

/*Creazione tabella Acquisto Bar*/
CREATE TABLE AcqBar (
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    Data DATE,
    Ora TIME,
	CHECK(Ora<='23:30:00' AND Ora>='15:30:00'),
    CostoTotale DECIMAL(6,2) NOT NULL,
	CHECK(CostoTotale>0),
    Cliente CHAR(16) REFERENCES CliCPC(CodiceFiscale) ON UPDATE CASCADE
);


/*Creazione tabella Genere*/
CREATE TABLE Genere (
    Genere VARCHAR(20) PRIMARY KEY
);



/*Creazione tabella Film*/
CREATE TABLE Film (
    Codice INTEGER PRIMARY KEY AUTO_INCREMENT,
    Titolo VARCHAR(50) NOT NULL,
    Anno INTEGER,
	CHECK(Anno<2100 AND Anno>1900),
    Durata INTEGER,
    Valutazione DECIMAL(1,1),
	CHECK(Valutazione>=1.0 AND Valutazione<=5.0)
);

/*Creazione tabella Persona*/
CREATE TABLE Persona (
    Codice INTEGER PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(20) NOT NULL,
    Cognome VARCHAR(20) NOT NULL,
    DataNascita DATE
);

/*Creazione tabella Sala*/
CREATE TABLE Sala (
    Numero INTEGER PRIMARY KEY,
	CHECK(Numero>0 AND Numero<9),
    Metratura DECIMAL(5,2)
);

/*Creazione tabella Fila*/
CREATE TABLE Fila (
    Lettera CHAR(1) NOT NULL,
    Sala INTEGER NOT NULL REFERENCES Sala(Numero) ON UPDATE CASCADE ON DELETE CASCADE,
	CHECK(Lettera<='N' AND Lettera>='A'),
	PRIMARY KEY(Lettera,Sala)
);


/*Creazione tabella Posto*/
CREATE TABLE Posto (
    Numero INTEGER NOT NULL,
    Fila CHAR(1) NOT NULL REFERENCES Fila(Lettera) ON UPDATE CASCADE ON DELETE CASCADE,
    Sala INTEGER NOT NULL REFERENCES Fila(Sala) ON UPDATE CASCADE ON DELETE CASCADE
	CHECK(Numero>0 AND Numero<19),
	PRIMARY KEY(Numero,Fila,Sala)
);

/*Creazione tabella Tariffario*/
CREATE TABLE Tariffario (
    Codice INTEGER PRIMARY KEY AUTO_INCREMENT,
    Descrizione VARCHAR(20) NOT NULL,
    Prezzo DECIMAL NOT NULL,
	CHECK(Prezzo>0)
);

/*Creazione tabella Orario*/
CREATE TABLE Orario (
    Numero INTEGER PRIMARY KEY AUTO_INCREMENT,
    OraInizio TIME NOT NULL,
    OraFine TIME NOT NULL,
	CHECK((OraInizio='16:00:00' AND OraFine<='19:00:00')
		OR(OraInizio='19:00:00' AND OraFine<='22:00:00')
		OR(OraInizio='22:00:00'))
);










/*Creazione tabella Acquisto Biglietto Online*/
CREATE TABLE AcqOnline (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    CostoTotale DECIMAL(6,2),
	CHECK(CostoTotale>0)
    Film VARCHAR(50) NOT NULL,
    DataAcq DATE NOT NULL,
    DataProiez DATE NOT NULL,
	CHECK(DataAcq<=DataProiez),
    Orario TIME REFERENCES Orario(Numero),
    Cliente CHAR(16) REFERENCES CliOnline(CodiceFiscale) 
);

/*Creazione tabella Acquisto Biglietto Fisico*/
CREATE TABLE AcqFisico (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    CostoTotale DECIMAL(6,2),
	CHECK(CostoTotale>0)
    Film VARCHAR(50) NOT NULL,
    DataProiez DATE NOT NULL,
    Orario INTEGER REFERENCES Orario(Numero),
    Cliente CHAR(16) REFERENCES CliCPC(CodiceFiscale),
    Pagamento VARCHAR(20) NOT NULL,
	CHECK(Pagamento='Contanti' OR Pagamento='Carta' OR Pagamento='Bancomat')
);



/*Relazioni*/


/*Creazione tabella Appartenenza*/
CREATE TABLE Appart (
    Film INTEGER NOT NULL REFERENCES Film(Codice) ON UPDATE CASCADE ON DELETE CASCADE,
    Genere INTEGER NOT NULL REFERENCES Genere(Genere) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(Film,Genere)
);

/*Creazione tabella Partecipazione*/
CREATE TABLE Partecip (
    Film INTEGER NOT NULL REFERENCES Film(Codice) ON UPDATE CASCADE ON DELETE CASCADE,
    Persona INTEGER NOT NULL REFERENCES Persona(Codice) ON UPDATE CASCADE ON DELETE CASCADE,
    Ruolo VARCHAR(10) NOT NULL,
	CHECK(Ruolo='Attore' OR Ruolo='Regista'),
	PRIMARY KEY(Film,Persona)
);

/*Creazione tabella Programmazione*/
CREATE TABLE Program (
    Film INTEGER NOT NULL REFERENCES Film(Codice) ON UPDATE CASCADE ON DELETE CASCADE,
    Sala INTEGER NOT NULL REFERENCES Sala(Numero) ON UPDATE CASCADE ON DELETE CASCADE,
    DataInizio DATE,
    DataFine DATE,
	CHECK(DataInizio<=DataFine),
	PRIMARY KEY(Film,Sala)
);

/*Creazione tabella Scelta Fisica*/
CREATE TABLE SceltaFisica (
    AcqFisico INTEGER NOT NULL REFERENCES AcqFisico(ID) ON UPDATE CASCADE ON DELETE CASCADE,
    Sala INTEGER NOT NULL REFERENCES Posto(Sala) ON UPDATE CASCADE ON DELETE NO ACTION,
    Fila CHAR(1) NOT NULL REFERENCES Posto(Fila) ON UPDATE CASCADE ON DELETE NO ACTION,
    Posto INTEGER NOT NULL REFERENCES Posto(Numero) ON UPDATE CASCADE ON DELETE NO ACTION,
    Tariffa INTEGER NOT NULL REFERENCES Tariffario(Codice) ON UPDATE CASCADE ON DELETE NO ACTION,
	PRIMARY KEY(AcqFisico,Sala,Fila,Posto,Tariffa)
);



/*Creazione tabella Scelta Online*/
CREATE TABLE SceltaOnline (
    AcqOnline INTEGER NOT NULL REFERENCES AcqOnline(ID) ON UPDATE CASCADE ON DELETE CASCADE,
    Sala INTEGER NOT NULL REFERENCES Posto(Sala) ON UPDATE CASCADE ON DELETE NO ACTION,
    Fila CHAR(1) NOT NULL REFERENCES Posto(Fila) ON UPDATE CASCADE ON DELETE NO ACTION,
    Posto INTEGER NOT NULL REFERENCES Posto(Numero) ON UPDATE CASCADE ON DELETE NO ACTION,
    Tariffa INTEGER NOT NULL REFERENCES Tariffario(Codice) ON UPDATE CASCADE ON DELETE NO ACTION 
	PRIMARY KEY(AcqOnline,Sala,Fila,Posto,Tariffa)
);

/*Creazione tabella Contenere*/
CREATE TABLE Contenere (
    AcqBar INTEGER NOT NULL REFERENCES AcqBar(ID) ON UPDATE CASCADE ON DELETE CASCADE,
    Prodotto INTEGER NOT NULL REFERENCES Prodotto(ID) ON UPDATE CASCADE ON DELETE NO ACTION,
    Quantita INTEGER NOT NULL,
	CHECK(Quantita>0),
	PRIMARY KEY(AcqBar,Prodotto)
);

/*Creazione tabella Composto*/
CREATE TABLE Compos (
    Composto INTEGER NOT NULL REFERENCES Prodotto(ID) ON UPDATE CASCADE ON DELETE CASCADE,
    Componente INTEGER NOT NULL REFERENCES Prodotto(ID) ON UPDATE CASCADE ON DELETE NO ACTION,
    Quantita INTEGER NOT NULL,
	CHECK(Quantita>0),
	PRIMARY KEY(Composto,Componente)
);










