/*Entità*/

/*Creazione tabella Cliente Carta Passione Cinema*/
CREATE TABLE CliCPC (
    CodiceFiscale STRING (16) PRIMARY KEY,
    Nome          STRING (20) NOT NULL,
    Cognome       STRING (20) NOT NULL,
    DataNascita   DATE        NOT NULL,
    Telefono      STRING (10) NOT NULL,
    Sesso         STRING      NOT NULL,
    Nazionalita   STRING      NOT NULL,
    NumeroCarta   STRING      NOT NULL,
    Citta         STRING (5)  NOT NULL,
    CAP           STRING (5)  NOT NULL,
    Via           STRING      NOT NULL,
    NumeroCivico  STRING      NOT NULL
);

/*Creazione tabella Cliente Online*/					 
CREATE TABLE CliOnline (
    CodiceFiscale STRING (16) PRIMARY KEY,
    Nome          STRING (20) NOT NULL,
    Cognome       STRING (20) NOT NULL,
    DataNascita   DATE        NOT NULL,
    Telefono      STRING      NOT NULL,
    Email         STRING      NOT NULL,
    Password      STRING      NOT NULL
);

/*Creazione tabella Acquisto Bar*/
CREATE TABLE AcqBar (
    ID          INTEGER     PRIMARY KEY AUTOINCREMENT,
    Data        DATE        NOT NULL,
    Ora         TIME        NOT NULL,
    CostoTotale DECIMAL     NOT NULL,
    Cliente     STRING (16) NOT NULL
                            REFERENCES CliCPC (CodiceFiscale) 
);

/*Creazione tabella Prodotto*/
CREATE TABLE Prodotto (
    ID     INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome   STRING  NOT NULL,
    Prezzo DECIMAL NOT NULL
);


/*Creazione tabella Genere*/
CREATE TABLE Genere (
    Genere STRING PRIMARY KEY
);

/*Creazione tabella Film*/
CREATE TABLE Film (
    Codice      INTEGER PRIMARY KEY AUTOINCREMENT,
    Titolo      STRING  NOT NULL,
    Anno        STRING  NOT NULL,
    Durata      INTEGER NOT NULL,
    Valutazione DECIMAL
);

/*Creazione tabella Persona*/
CREATE TABLE Persona (
    Codice      INTEGER     PRIMARY KEY AUTOINCREMENT,
    Nome        STRING (20) NOT NULL,
    Cognome     STRING (20) NOT NULL,
    Ruolo       STRING      NOT NULL,
    DataNascita DATE        NOT NULL
);

/*Creazione tabella Sala*/
CREATE TABLE Sala (
    Numero    INTEGER PRIMARY KEY,
    Metratura DECIMAL NOT NULL
);

/*Creazione tabella Fila*/
CREATE TABLE Fila (
    Lettera CHAR PRIMARY KEY,
    Sala         REFERENCES Sala (Numero) 
);


/*Creazione tabella Posto*/
CREATE TABLE Posto (
    Numero INTEGER PRIMARY KEY,
    Fila   CHAR    REFERENCES Fila (Lettera),
    Sala   INTEGER REFERENCES Sala (Numero) 
);

/*Creazione tabella Tariffario*/
CREATE TABLE Tariffario (
    Codice      INTEGER PRIMARY KEY AUTOINCREMENT,
    Descrizione STRING  NOT NULL,
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
    ID          INTEGER     PRIMARY KEY AUTOINCREMENT,
    CostoTotale DECIMAL     NOT NULL,
    Film        STRING      NOT NULL,
    DataAcq     DATE        NOT NULL,
    DataProiez  DATE        NOT NULL,
    Orario      INTEGER     REFERENCES Orario (Numero),
    Cliente     STRING (16) REFERENCES CliOnline (CodiceFiscale) 
);

/*Creazione tabella Acquisto Biglietto Fisico*/
CREATE TABLE AcqFisico (
    ID          INTEGER     PRIMARY KEY AUTOINCREMENT,
    CostoTotale DECIMAL     NOT NULL,
    Film        STRING      NOT NULL,
    DataProiez  DATE        NOT NULL,
    Orario      INTEGER     REFERENCES Orario (Numero),
    Cliente     STRING (16) REFERENCES CliCPC (CodiceFiscale),
    Pagamento   STRING      NOT NULL
);



/*Relazioni*/



/*Creazione tabella Appartenenza*/
CREATE TABLE Appart (
    Film   STRING REFERENCES Film (Codice),
    Genere STRING REFERENCES Genere (Genere) 
);



