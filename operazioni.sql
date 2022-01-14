/*Operazione 1: inserimento nuovo Cliente Carta Passione Cinema*/		
INSERT INTO CliCPC(CodiceFiscale,Nome,Cognome,DataNascita,Telefono,Sesso,Nazionalità,
					NumeroCarta,Città,CAP,Via,NumeroCivico)
			VALUES(...);


					
/*Operazione 2: inserimento nuovo Cliente Online*/
INSERT INTO CliOnline(CodiceFiscale,Nome,Cognome,DataNascita,Telefono,Email,Password)
			VALUES(...);

/*Operazione 3: inserimento nuovo Film*/
/*ID deve essere NULL in quanto tramite l'auto-increment esso si autoincrementerà*/
INSERT INTO Film(Codice, Titolo,Anno,Durata,Valutazione)
			VALUES(...);

INSERT INTO Appart(Film,Genere)
			VALUES(...);
			
INSERT INTO Partecip(Film,Persona,Ruolo)
			VALUES(...);
			
/*Operazione 4: inserimento nuovo Prodotto Bar*/
/*ID deve essere NULL in quanto tramite l'auto-increment esso si autoincrementerà*/
INSERT INTO Prodotto(ID,Nome,Prezzo)
			VALUES(...);
					 
/*Operazione 5: inserimento nuovo Menu Convenienza*/
INSERT INTO Prodotto(ID,Nome,Prezzo)
			VALUES(...);

INSERT INTO Compos(Composto,Componente,Quantita)
			VALUES(...);
/*Operazione 6: inserimento nuovo Orario*/
/*Numero deve essere NULL in quanto tramite l'auto-increment esso si autoincrementerà*/
INSERT INTO Orario(Numero,OraInizio,OraFine)
			VALUES(...);
				   
/*Operazione 7: inserimento nuovo Tariffa dei Biglietti*/
/*Codice deve essere NULL in quanto tramite l'auto-increment esso si autoincrementerà*/
INSERT INTO Tariffario(Codice,Descrizione,Prezzo)
			VALUES(...);
					   
/*Operazione 8: inserimento nuovo Acquisto Biglietto Fisico*/
/*ID deve essere NULL in quanto tramite l'auto-increment esso si autoincrementerà*/
INSERT INTO AcqFisico(ID,CostoTotale,Film,DataProiez,Orario,Cliente,Pagamento)
			VALUES(...);

INSERT INTO SceltaFisica(AcqFisico,Sala,Fila,Posto,Tariffa)
			VALUES(...);
/*Operazione 9: inserimento nuovo Acquisto Biglietto Online*/
/*ID deve essere NULL in quanto tramite l'auto-increment esso si autoincrementerà*/
INSERT INTO AcqOnline(ID,CostoTotale,Film,DataAcq,DataProiez,Orario,Cliente)
			VALUES(...);

INSERT INTO SceltaOnline(AcqOnline,Sala,Fila,Posto,Tariffa)
			VALUES(...);	  
/*Operazione 10: inserimento nuovo Acquisto Bar*/
/*ID deve essere NULL in quanto tramite l'auto-increment esso si autoincrementerà*/
INSERT INTO AcqBar(ID,Data,Ora,CostoTotale,Cliente)
			VALUES(...);

INSERT INTO Contenere(AcqBar,Prodotto,Quantita)
			VALUES(...);
/*Operazione 11: inserimento nuovo Attore*/
/*Operazione 12: inserimento nuovo Regista*/
/*Dato il collasso verso l'alto della generalizzazione persona, le due operazioni,
prima divise si uniscono in una sola: Inserimento nuova Persona*/
/*Codice deve essere NULL in quanto tramite l'auto-increment esso si autoincrementerà*/
INSERT INTO Persona(Codice,nome,Cognome,DataNascita)
			VALUES(...);

/*Operazione : Inserimento Programmazione film in sala*/ DA AGGIUNGERE
INSERT INTO Program(Film,Sala,DataInizio,DataFine)
			VALUES(...);

/*Operazione 13: modifica dati Cliente Card Passione Cinema */
UPDATE CliCPC SET Nome=<nome>, Cognome=<cognome>, DataNascita=<datanascita>,
				Telefono=<telefono>, Sesso=<sesso>, Nazionalita=<nazionalita>, NumeroCarta=<numerocarta>,
				Citta=<citta>, CAP=<cap>, Via=<via>, NumeroCivico=<numerocivico>
WHERE CodiceFiscale=<codicefiscale>;
					
/*Operazione 14: modifica dati Cliente Online*/
UPDATE CliOnline SET Nome=<nome>, Cognome=<cognome>, DataNascita=<datanascita>,
				Telefono=<telefono>, Email=<email>, Password=<password>
WHERE CodiceFiscale=<codicefiscale>;
					
/*Operazione 15: modifica di una Tariffa dei Biglietti*/
UPDATE Tariffario SET Descrizione=<descrizione>, Prezzo=<prezzo>
WHERE Codice=<codice>;

/*Operazione 16: modifica di un Prodotto Bar*/
UPDATE Prodotto SET Nome=<nome>, Prezzo=<prezzo>
WHERE ID=<id>;

/*Operazione 17: modifica di un Menu Convenienza*/
UPDATE Prodotto SET Nome=<nome>, Prezzo=<prezzo>
WHERE ID=<id>;
/*Se si vuole cambiare nome o il prezzo del menù*/

UPDATE Compos SET Componente=<id-prodotto>, Quantita=<quantita>
WHERE Compos.Composto=<id-prodotto>;
/*Se si vuole cambiare la composizione del menu*/


/*Operazione 18: modifica di un Orario*/
UPDATE Orario SET OraInizio=<orainizio>, OraFine=<orafine>
WHERE Numero=<numero>;

/*Operazione 19: cancellazione di un Prodotto Bar*/
DELETE FROM Prodotto WHERE ID=<id>; 

/*Operazione 20: cancellazione di un Menu Convenienza*/
DELETE FROM Prodotto WHERE ID=<id>;

DELETE FROM Compos WHERE Composto=<id>;
 
/*Operazione 21: cancellazione di un Orario*/
DELETE FROM Orario WHERE Numero=<numero>;

/*Operazione 22: cancellazione di una Tariffa dei Biglietti*/
DELETE FROM Tariffario WHERE Codice=<codice>;

/*Operazione 23: cancellazione di un Cliente Card Passione Cinema*/
DELETE FROM CliCPC WHERE CodiceFiscale=<codicefiscale>;

/*Operazione 24: cancellazione di un Cliente Online*/
DELETE FROM CliOnline WHERE CodiceFiscale=<codicefiscale>;

/*Operazione 25: consultazione dati Tariffario*/
SELECT * FROM Tariffario;

/*Operazione 26: consultazione dati Prodotto Bar*/
SELECT * FROM Prodotto;

/*Operazione 27: consultazione dati Menu Convenienza*/
SELECT Compos.Componente AS Prodotto, Compos.Quantita AS Quantita
FROM Compos,Prodotto
WHERE Compos.Composto=Prodotto.ID AND Prodotto.ID=<id>;
/*Operazione 28: consultazione dati Cliente Card Passione Cinema*/
SELECT * FROM CliCPC WHERE CodiceFiscale=<codicefiscale>;

/*Operazione 29: consultazione dati Cliente Online*/
SELECT * FROM CliOnline WHERE CodiceFiscale=<codicefiscale>;

/*Operazione 30: consultazione dati Orario*/
SELECT * FROM Orario;

/*Operazione 31: consultazione Posti Disponibili di una sala*/
SELECT SceltaFisica.Posto,SceltaFisica.Fila,
FROM SceltaFisica,(SELECT AcqFisico.ID AS ID 
					FROM AcqFisico
					WHERE AcqFisico.DataProiez= <Datad> AND AcqFisico.Orario=<numero>)Tab
WHERE SceltaFisica.Sala=<Sala> AND Tab.ID=SceltaFisica.AcqFisico
/*Per gli acquisti fisici*/

SELECT SceltaOnline.Posto,SceltaOnline.Fila,
FROM SceltaOnline,(SELECT AcqOnline.ID AS ID 
					FROM AcqOnline
					WHERE AcqOnline.DataProiez= <Datad> AND AcqOnline.Orario=<numero>)Tab
WHERE SceltaOnline.Sala=<Sala> AND Tab.ID=SceltaOnline.AcqOnline
/*Per gli acquisti Online*/


/*Operazione 32: consultazione Costo Totale Acquisto Biglietto Fisico*/
SELECT CostoTotale FROM AcqFisico WHERE ID=<id>;

/*Operazione 33: consultazione Costo Totale Acquisto Biglietto Online*/
SELECT CostoTotale FROM AcqOnline WHERE ID=<id>;

/*Operazione 34: consultazione Costo Totale Acquisto Bar*/
SELECT CostoTotale FROM AcqBar WHERE ID=<id>;

/*Operazione 35: consultazione programmazione Sala in una determinata data*/
SELECT Sala.Numero AS Sala, Film.Titolo AS Film
FROM Sala,Program,Film
WHERE Sala.Numero=Program.Sala AND Program.DataInizio<= <datad>
							   AND Program.DataFine>= <datad>
							   AND Program.Film=Film.Codice;

/*Operazione 36: consultazione Film non programmati*/
SELECT Codice,Titolo
FROM Film
WHERE Codice=<codice> AND NOT EXISTS(SELECT * FROM Program WHERE Film=<codice>);

/*Operazione 37: consultazione vendite fisiche Film in programmazione ultima settimana*/
SELECT COUNT(*) AS VentiteFisiche
FROM AcqFisico
WHERE DataProiez> now()-INTERVAL 7 DAY AND Film=<Titolo>

/*Operazione 38: consultazione vendite online Film in programmazione ultima settimana*/
SELECT COUNT(*) AS VenditeOnline
FROM AcqOnline
WHERE DataProiez> now()-INTERVAL 7 DAY AND Film=<Titolo>

/*Operazione 39: visualizzazione Prodotto Bar piu acquistato*/

SELECT Prodotto.Codice AS Codice,Prodotto.Nome AS Prodotto,MAX(Tab.Vendite) AS Vendite
FROM (SELECT COUNT(*) AS Vendite, Prodotto FROM Contenere GROUP BY Prodotto) Tab,Prodotto
WHERE Tab.Prodotto=Prodotto.Codice

/*Operazione 40: visualizzazione Clienti Card Passione Cinema con piu acquisti*/
SELECT TOP 10 COUNT(*) AS Acquisti, CliCPC.CodiceFiscale AS CodiceFiscale, CliCPC.Nome AS Nome, CliCPC.Cognome AS Cognome 
FROM AcqFisico,CliCPC
WHERE CliCPC.CodiceFiscale=AcqFisico.Cliente
GROUP BY AcqFisico.Cliente ORDER BY Acquisti

/*Operazione 41: visualizzazione Clienti Online con nessun acquisto nell'ultimo mese*/
SELECT CliOnline.CodiceFiscale AS CodiceFiscale, CliOnline.Nome AS Nome, CliOnline.Cognome AS Cognome
FROM CliOnline,AcqOnline, (SELECT COUNT(*) AS Acquisti, Cliente FROM AcqOnline GROUP BY Cliente) Tab
WHERE CliOnline.CodiceFiscale=AcqOnline.Cliente AND AcqOnline.Cliente=Tab.Cliente AND Tab.Acquisti=0;

/*Operazione 42: visualizzazione Sala con piu acquisti nell'ultimo anno*/
SELECT TOP 1 COUNT(SceltaFisica.Posto) AS Acquisti, SceltaFisica.Sala 
FROM SceltaFisica,AcqFisico 
GROUP BY SceltaFisica.Sala 
WHERE YEAR(AcqFisico.DataProiez)= <Anno>)
/*Per gli acquisti fisici*/

SELECT TOP 1 COUNT(SceltaOnline.Posto) AS Acquisti, SceltaOnline.Sala 
FROM SceltaOnline,AcqOnline 
GROUP BY SceltaOnline.Sala 
WHERE YEAR(AcqOnline.DataProiez)= <Anno>)
/*Per gli acquisti Online*/

/*Operazione 43: visualizzazione Tipologia di Biglietti piu acquistati*/
SELECT TOP 5 COUNT(*) AS Acquisti, Tariffario.Descrizione As Biglietto
FROM SceltaFisica,Tariffario
WHERE Tariffario.Codice=SceltaFisica.Tariffa
GROUP BY SceltaFisica.Tariffa ORDER BY Acquisti
/*Per gli acquisti fisici*/

SELECT TOP 5 COUNT(*) AS Acquisti, Tariffario.Descrizione As Biglietto
FROM SceltaOnline,Tariffario
WHERE Tariffario.Codice=SceltaOnline.Tariffa
GROUP BY SceltaOnline.Tariffa ORDER BY Acquisti
/*Per gli acquisti Online*/


/*Operazione 44: visualizzazione Generi film piu visti*/ DA RIMUOVERE

/*Operazione 45: visualizzazione Sala piu utilizzata nell'ultimo mese*/ DA RIMUOVERE


/*Operazione 46: visualizzazione Clienti Card Passione Cinema con più acquisti per età*/ 
SELECT TOP 10 COUNT(*) AS Acquisti, DATEDIFF(HOUR,CliCPC.DataNascita,AcqFisico.DataProiez)/8766 AS Età
FROM CliCPC,AcqFisico
WHERE CliCPC.CodiceFiscale=AcqFisico.Cliente
GROUP BY DATEDIFF(HOUR,CliCPC.DataNascita,AcqFisico.DataProiez)/8766

/*Operazione 47: visualizzazione numero Acquisti Fisici per orario*/ DA AGGIUNGERE
SELECT COUNT(*) AS Acquisti, Orario.OraInizio AS Orario
FROM Orario,AcqFisico 
WHERE AcqFisico.Orario=Orario.Numero
GROUP By Orario.Numero

/*Operazione 47: visualizzazione numero Acquisti Online per orario*/ DA MODIFICARE
SELECT COUNT(*) AS Acquisti, Orario.OraInizio AS Orario
FROM Orario,AcqOnline 
WHERE AcqOnline.Orario=Orario.Numero
GROUP By Orario.Numero



/*Operazione 48: visualizzazione incassi Bar mensili*/
SELECT SUM(CostoTotale) AS IncassiBarMensili
FROM AcqBar
WHERE YEAR(Data)= <Anno> AND MONTH(DataProiez)= <Mese>

/*Operazione 49: visualizzazione incassi Acquisti Fisici di un determinato Film*/
SELECT SUM(CostoTotale) AS IncassiFilm
FROM AcqFisico
WHERE Film= <Titolo>

/*Operazione 50: visualizzazione incassi Acquisti Online di un determinato Film*/
SELECT SUM(CostoTotale) AS IncassiFilm
FROM AcqOnline
WHERE Film= <Titolo>

/*Operazione 51: visualizzazione incassi Acquisti Biglietti Fisici annuali*/
SELECT SUM(CostoTotale) AS IncassiFisiciAnnuali
FROM AcqFisico
WHERE YEAR(DataProiez)= <Anno>

/*Operazione 52: visualizzazione incassi Acquisti Fisici Clienti Carta Passione Cinema annuali*/
SELECT SUM(CostoTotale) AS IncassiClientiCPCAnnuali
FROM AcqFisico
WHERE YEAR(DataProiez)= <Anno> AND Cliente NOT NULL

/*Operazione 53: visualizzazione incassi Acquisti Online annuali*/
SELECT SUM(CostoTotale) AS IncassiOnlineAnnuali
FROM AcqOnline
WHERE YEAR(DataProiez)= <Anno>