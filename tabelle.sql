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
    ID          INTEGER     PRIMARY KEY,
    Data        DATE        NOT NULL,
    Ora         TIME        NOT NULL,
    CostoTotale DECIMAL     NOT NULL,
    Cliente     STRING (16) NOT NULL
                            REFERENCES CliCPC (CodiceFiscale) 
);

/*Creazione tabella Prodotto*/
CREATE TABLE Prodotto (
    ID     INTEGER PRIMARY KEY,
    Nome   STRING  NOT NULL,
    Prezzo DECIMAL NOT NULL
);

/*Creazione tabella Genere*/
CREATE TABLE Genere (
    Genere STRING PRIMARY KEY
);

/*Creazione tabella Film*/
CREATE TABLE Film (
    Codice      INTEGER PRIMARY KEY,
    Titolo      STRING  NOT NULL,
    Anno        STRING  NOT NULL,
    Durata      INTEGER NOT NULL,
    Valutazione DECIMAL
);



































/*Relazioni*/



/*Creazione tabella Appartenenza*/
CREATE TABLE Appart (
    Film   STRING REFERENCES Film (Codice),
    Genere STRING REFERENCES Genere (Genere) 
);



