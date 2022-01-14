/*Operazione 1: inserimento nuovo Cliente Carta Passione Cinema*/		
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
                   ) VALUES (...);


					 
/*Operazione 2: inserimento nuovo Cliente Online*/
INSERT INTO CliOnline (
                          CodiceFiscale,
                          Nome,
                          Cognome,
                          DataNascita,
                          Telefono,
                          Email,
                          Password
                      ) VALUES (...);

/*Operazione 3: inserimento nuovo Film*/
INSERT INTO Film (
                     Codice,
                     Titolo,
                     Anno,
                     Durata,
                     Valutazione
                 ) VALUES (...);
/*Operazione 4: inserimento nuovo Prodotto Bar*/
INSERT INTO Prodotto (
                         ID,
                         Nome,
                         Prezzo
                     ) VALUES (...);
/*Operazione 5: inserimento nuovo Menu Convenienza*/
/*Operazione 6: inserimento nuovo Orario*/
INSERT INTO Orario (
                       Numero,
                       OraInizio,
                       OraFine
                   ) VALUES (...);
/*Operazione 7: inserimento nuovo Tariffa dei Biglietti*/
INSERT INTO Tariffario (
                           Codice,
                           Descrizione,
                           Prezzo
                       ) VALUES (...);
					   
/*Operazione 8: inserimento nuovo Acquisto Biglietto Fisico*/
INSERT INTO AcqFisico (
                          ID,
                          CostoTotale,
                          Film,
                          DataProiez,
                          Orario,
                          Cliente,
                          Pagamento
                      ) VALUES (...);
					  
/*Operazione 9: inserimento nuovo Acquisto Biglietto Online*/
INSERT INTO AcqOnline (
                          ID,
                          CostoTotale,
                          Film,
                          DataAcq,
                          DataProiez,
                          Orario,
                          Cliente
                      ) VALUES (...);
					  
/*Operazione 10: inserimento nuovo Acquisto Bar*/
INSERT INTO AcqBar (
                       ID,
                       Data,
                       Ora,
                       CostoTotale,
                       Cliente
                   ) VALUES (...);
/*Operazione 11: inserimento nuovo Attore*/
/*Operazione 12: inserimento nuovo Regista*/
/*Operazione 13: modifica dati Cliente Card Passione Cinema */
/*Operazione 14: modifica dati Cliente Online*/
/*Operazione 15: modifica di una Tariffa dei Biglietti*/
/*Operazione 16: modifica di un Prodotto Bar*/
/*Operazione 17: modifica di un Menu Convenienza*/
/*Operazione 18: modifica di un Orario*/
/*Operazione 19: cancellazione di un Prodotto Bar*/
/*Operazione 20: cancellazione di un Menu Convenienza*/
/*Operazione 21: cancellazione di un Orario*/
/*Operazione 22: cancellazione di una Tariffa dei Biglietti*/
/*Operazione 23: cancellazione di un Cliente Card Passione Cinema*/
/*Operazione 24: cancellazione di un Cliente Online*/
/*Operazione 25: consultazione dati Tariffario*/
/*Operazione 26: consultazione dati Prodotto Bar*/
/*Operazione 27: consultazione dati Menu Convenienza*/
/*Operazione 28: consultazione dati Cliente Card Passione Cinema*/
/*Operazione 29: consultazione dati Cliente Online*/
/*Operazione 30: consultazione dati Orario Film*/
/*Operazione 31: consultazione Posti Disponibili*/
/*Operazione 32: consultazione Costo Totale Acquisto Biglietto Fisico*/
/*Operazione 33: consultazione Costo Totale Acquisto Biglietto Online*/
/*Operazione 34: consultazione Costo Totale Acquisto Bar*/
/*Operazione 35: consultazione Sala senza programmazione in una determinata data*/
/*Operazione 36: consultazione Film non programmati*/
/*Operazione 37: consultazione vendite fisiche Film in programmazione ultima settimana*/
/*Operazione 38: consultazione vendite online Film in programmazione ultima settimana*/
/*Operazione 39: visualizzazione Prodotto Bar piu acquistato*/
/*Operazione 40: visualizzazione Clienti Card Passione Cinema con piu acquisti*/
/*Operazione 41: visualizzazione Clienti Online con nessun acquisto nell'ultimo mese*/
/*Operazione 42: visualizzazione File per Sala con piu acquisti nell'ultimo anno*/
/*Operazione 43: visualizzazione Tipologia di Biglietti piu acquistati*/
/*Operazione 44: visualizzazione Generi film piu visti*/
/*Operazione 45: visualizzazione Sala piu utilizzata nell'ultimo mese*/
/*Operazione 46: visualizzazione Acquisti Clienti Card Passione Cinema per fascia d'eta*/
/*Operazione 47: visualizzazione numero Acquisti Bar per fascia oraria*/
/*Operazione 48: visualizzazione incassi Bar mensili*/
/*Operazione 49: visualizzazione incassi Acquisti Fisici di un determinato Film*/
/*Operazione 50: visualizzazione incassi Acquisti Online di un determinato Film*/
/*Operazione 51: visualizzazione incassi Acquisti Biglietti Fisici annuali*/
/*Operazione 52: visualizzazione incassi Acquisti Fisici Clienti Carta Passione Cinema annuali*/
/*Operazione 53: visualizzazione incassi Acquisti Online annuali*/