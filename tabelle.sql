/*Prova commento*/
CREATE TABLE Cliente_CPC (
    codice_fiscale STRING (16) PRIMARY KEY,
    nome           STRING      NOT NULL,
    cognome        STRING (20) NOT NULL,
    sesso          STRING      NOT NULL,
    nazionalità    STRING      NOT NULL,
    numero_carta   STRING      NOT NULL,
    data_nascita   DATE        NOT NULL,
    telefono       STRING      NOT NULL,
    CAP            STRING (5)  NOT NULL,
    città          STRING      NOT NULL,
    via            STRING      NOT NULL,
    numero_civico  STRING      NOT NULL
);


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





