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
				SELECT 	CodiceFiscale,
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
					 
/*Operazione inserimento nuovo Cliente Online*/
INSERT INTO CliOnline (
                          CodiceFiscale,
                          Nome,
                          Cognome,
                          DataNascita,
                          Telefono,
                          Email,
                          Password
                      );


/*Operazione lettura tabella Cliente Online*/

				SELECT  	CodiceFiscale,
                            Nome,
                            Cognome,
                            DataNascita,
                            Telefono,
                            Email,
                            Password
                        FROM CliOnline;