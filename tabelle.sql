/*Creazione tabella Clienti Carta Passione Cinema*/
CREATE TABLE CliCPC (
    CodiceFiscale STRING (16) PRIMARY KEY,
    Nome          STRING (20) NOT NULL,
    Cognome       STRING (20) NOT NULL,
    DataNascita   DATE        NOT NULL,
    Telefono      STRING (10) NOT NULL,
    Sesso         STRING      NOT NULL,
    Nazionalità   STRING      NOT NULL,
    NumeroCarta   STRING      NOT NULL,
    Città         STRING (5)  NOT NULL,
    CAP           STRING (5)  NOT NULL,
    Via           STRING      NOT NULL,
    NumeroCivico  STRING      NOT NULL
);

/*Operazione inserimento nuovo Cliente Carta Passione Cinema*/		
INSERT INTO CliCPC (
                       CodiceFiscale,
                       Nome,
                       Cognome,
                       DataNascita,
                       Telefono,
                       Sesso,
                       Nazionalità,
                       NumeroCarta,
                       Città,
                       CAP,
                       Via,
                       NumeroCivico
                   );

/*Operazione lettura tabella Cliente Carta Passione Cinema*/
SELECT 					CodiceFiscale,
						Nome,
                        Cognome,
                        DataNascita,
                        Telefono,
                        Sesso,
                        Nazionalità,
                        NumeroCarta,
                        Città,
                        CAP,
                        Via,
                        NumeroCivico
                     FROM CliCPC;

					 
CREATE TABLE Cliente_Online (
    codice_fiscale STRING (16) PRIMARY KEY,
    Nome           STRING (20) NOT NULL,
    Cognome        STRING (20) NOT NULL,
    Data_Nascita   DATE        NOT NULL,
    Telefono       STRING      NOT NULL,
    Email          STRING      NOT NULL,
    Password       STRING      NOT NULL
);

CREATE TABLE prova_commit (
     nome STRING (10) PRIMARY KEY,
);





