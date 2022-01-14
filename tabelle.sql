/*Entita'*/

/*Creazione tabella Cliente Carta Passione Cinema*/
CREATE TABLE CliCPC (
    CodiceFiscale CHAR (16)    PRIMARY KEY,
    Nome          VARCHAR (20) NOT NULL,
    Cognome       VARCHAR (20) NOT NULL,
    DataNascita   DATE         NOT NULL,
    Telefono      CHAR (10)    NOT NULL,
    Sesso         VARCHAR      NOT NULL,
    Nazionalità   VARCHAR      NOT NULL,
    NumeroCarta   CHAR (16)    NOT NULL,
    Città         VARCHAR      NOT NULL,
    CAP           CHAR (5)     NOT NULL,
    Via           VARCHAR      NOT NULL,
    NumeroCivico  CHAR (1)     NOT NULL
);

/*Creazione tabella Cliente Online*/					 
CREATE TABLE CliOnline (
    CodiceFiscale CHAR (16)    PRIMARY KEY,
    Nome          VARCHAR (20) NOT NULL,
    Cognome       VARCHAR (20) NOT NULL,
    DataNascita   DATE         NOT NULL,
    Telefono      CHAR (10)    NOT NULL,
    Email         VARCHAR      NOT NULL,
    Password      VARCHAR      NOT NULL
);

/*Creazione tabella Acquisto Bar*/
CREATE TABLE AcqBar (
    ID          INTEGER   PRIMARY KEY AUTOINCREMENT,
    Data        DATE      NOT NULL,
    Ora         TIME      NOT NULL,
    CostoTotale DECIMAL   NOT NULL,
    Cliente     CHAR (16) REFERENCES CliCPC (CodiceFiscale) 
);


/*Creazione tabella Prodotto*/
CREATE TABLE Prodotto (
    ID     INTEGER      PRIMARY KEY AUTOINCREMENT,
    Nome   VARCHAR (20) NOT NULL,
    Prezzo DECIMAL      NOT NULL
);


/*Creazione tabella Genere*/
CREATE TABLE Genere (
    Genere VARCHAR PRIMARY KEY
);



/*Creazione tabella Film*/
CREATE TABLE Film (
    Codice      INTEGER PRIMARY KEY AUTOINCREMENT,
    Titolo      VARCHAR NOT NULL,
    Anno        INTEGER NOT NULL,
    Durata      INTEGER NOT NULL,
    Valutazione DECIMAL
);

/*Creazione tabella Persona*/
CREATE TABLE Persona (
    Codice      INTEGER      PRIMARY KEY AUTOINCREMENT,
    Nome        VARCHAR (20) NOT NULL,
    Cognome     VARCHAR (20) NOT NULL,
    Ruolo       VARCHAR      NOT NULL,
    DataNascita DATE         NOT NULL
);

/*Creazione tabella Sala*/
CREATE TABLE Sala (
    Numero    INTEGER PRIMARY KEY,
    Metratura DECIMAL NOT NULL
);

/*Creazione tabella Fila*/
CREATE TABLE Fila (
    Lettera CHAR (1) PRIMARY KEY,
    Sala    INTEGER  REFERENCES Sala (Numero) 
);


/*Creazione tabella Posto*/
CREATE TABLE Posto (
    Numero INTEGER  PRIMARY KEY,
    Fila   CHAR (1) REFERENCES Fila (Lettera),
    Sala   INTEGER  REFERENCES Sala (Numero) 
);

/*Creazione tabella Tariffario*/
CREATE TABLE Tariffario (
    Codice      INTEGER PRIMARY KEY AUTOINCREMENT,
    Descrizione VARCHAR NOT NULL,
    Prezzo      DECIMAL NOT NULL
);

/*Creazione tabella Orario*/
CREATE TABLE Orario (
    Numero    INTEGER PRIMARY KEY AUTOINCREMENT,
    OraInizio TIME    NOT NULL,
    OraFine   TIME    NOT NULL
);










/*Creazione tabella Acquisto Biglietto Online*/
CREATE TABLE AcqOnline (
    ID          INTEGER   PRIMARY KEY AUTOINCREMENT,
    CostoTotale DECIMAL   NOT NULL,
    Film        VARCHAR   NOT NULL,
    DataAcq     DATE      NOT NULL,
    DataProiez  DATE      NOT NULL,
    Orario      INTEGER   REFERENCES Orario (Numero),
    Cliente     CHAR (16) REFERENCES CliOnline (CodiceFiscale) 
);

/*Creazione tabella Acquisto Biglietto Fisico*/
CREATE TABLE AcqFisico (
    ID          INTEGER   PRIMARY KEY AUTOINCREMENT,
    CostoTotale DECIMAL   NOT NULL,
    Film        VARCHAR   NOT NULL,
    DataProiez  DATE      NOT NULL,
    Orario      INTEGER   REFERENCES Orario (Numero),
    Cliente     CHAR (16) REFERENCES CliCPC (CodiceFiscale),
    Pagamento   VARCHAR   NOT NULL
);



/*Relazioni*/


/*Creazione tabella Appartenenza*/
CREATE TABLE Appart (
    Film   VARCHAR REFERENCES Film (Codice),
    Genere VARCHAR REFERENCES Genere (Genere) 
);

/*Creazione tabella Partecipazione*/
CREATE TABLE Partecip (
    Film    VARCHAR REFERENCES Film (Codice),
    Persona INTEGER REFERENCES Persona (Codice),
    Ruolo   VARCHAR NOT NULL
);

/*Creazione tabella Programmazione*/
CREATE TABLE Program (
    Film       VARCHAR REFERENCES Film (Codice),
    Sala       INTEGER REFERENCES Sala (Numero),
    DataInizio DATE    NOT NULL,
    DataFine   DATE    NOT NULL
);

/*Creazione tabella Scelta Fisica*/
CREATE TABLE SceltaFisica (
    AcqFisico INTEGER  REFERENCES AcqFisico (ID),
    Sala      INTEGER  REFERENCES Sala (Numero),
    Fila      CHAR (1) REFERENCES Posto (Fila),
    Posto     INTEGER  REFERENCES Posto (Numero),
    Tariffa   INTEGER  REFERENCES Tariffario (Codice) 
);



/*Creazione tabella Scelta Online*/
CREATE TABLE SceltaOnline (
    AcqOnline  INTEGER  REFERENCES AcqOnline (ID),
    Sala       INTEGER  REFERENCES Posto (Sala),
    Fila       CHAR (1) REFERENCES Posto (Fila),
    Posto      INTEGER  REFERENCES Posto (Numero),
    Tariffario INTEGER  REFERENCES Tariffario (Codice) 
);

/*Creazione tabella Contenere*/
CREATE TABLE Contenere (
    AcqBar   INTEGER REFERENCES AcqBar (ID),
    Prodotto INTEGER REFERENCES Prodotto (ID),
    Quantita INTEGER NOT NULL
);

/*Creazione tabella Composto*/
CREATE TABLE Compos (
    Composto   INTEGER REFERENCES Prodotto (ID),
    Componente INTEGER REFERENCES Prodotto (ID),
    Quantita   INTEGER NOT NULL
);










