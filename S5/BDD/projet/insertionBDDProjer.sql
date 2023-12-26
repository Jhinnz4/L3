use Fortnite;
INSERT INTO Boutique (IDBoutique, Date) VALUES (1, '2023-01-01');

INSERT INTO Tournoi (ID_tournoi, Nom, Récompense, Date, Type) VALUES (1, 'Tournoi1', 'Récompense1', '2023-02-01', 'Solo');

INSERT INTO PNJ (ID_PNJ, Nom, PV) VALUES (1, 'PNJ1', 100);

INSERT INTO Coffre (ID_coffre, PV) VALUES (1, 50);

INSERT INTO Arme (ID_arme, Nom, Rareté, Dégat, Cadence_Tire, Type) VALUES (1, 'Scar', 'Epique', 35, 5, 'Fusil');
INSERT INTO Arme (ID_arme, Nom, Rareté, Dégat, Cadence_Tire, Type) VALUES (2, 'Pompe chasseur', 'Rare', 100, 1, 'Fusil');
INSERT INTO Arme (ID_arme, Nom, Rareté, Dégat, Cadence_Tire, Type) VALUES (3, 'Pistolet', 'Atypique', 25, 7, 'Fusil');
INSERT INTO Arme (ID_arme, Nom, Rareté, Dégat, Cadence_Tire, Type) VALUES (4, 'Lance roquette', 'Legendaire', 130, 1, 'Fusil');

INSERT INTO Partie (Id_partie, Date, Exp_gagné, Ranked, Constru, ID_tournoi) VALUES (1, '2023-03-01', 100, TRUE, 'Construction1', 1);

INSERT INTO PartiePrivee (Id_partiePerso, Date, Exp_gagné, Ranked, Constru, ID_tournoi, pwd) VALUES (2, '2023-03-02', 150, FALSE, 'Construction2', 1, 'motdepasse');

INSERT INTO PartieRanked (Id_partieRanked, Date, Exp_gagné, Ranked, Constru, ID_tournoi, Points_gagné, rang) VALUES (3, '2023-03-03', 200, TRUE, 'Construction3', 1, 50, 'Or');
DELIMITER //

CREATE PROCEDURE generateRandomPlayerAccounts()
BEGIN
    DECLARE counter INT DEFAULT 0;
    
    WHILE counter < 100 DO
        INSERT INTO Compte (Nom, Prénom, e_mail, Niveau, EXP, V_Buckl, Date_Inscription, Rang, ID_tournoi)
        SELECT
            CONCAT('Joueur', counter),
            CONCAT('Random', counter),
            CONCAT('joueur', counter, '@example.com'),
            FLOOR(RAND() * 10) + 1,
            FLOOR(RAND() * 1000) + 500,
            FLOOR(RAND() * 500) + 100,
            '2023-01-01',
            CASE
                WHEN FLOOR(RAND() * 10) % 2 = 0 THEN 'Platine'
                ELSE 'Diamant'
            END,
            1
        FROM information_schema.tables
        LIMIT 1;
        
        SET counter = counter + 1;
    END WHILE;
    
END //

DELIMITER ;

CALL generateRandomPlayerAccounts();



DELIMITER //

CREATE PROCEDURE generateRandomCosmetique()
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE randomType INT DEFAULT 0;
    DECLARE randomRarity INT DEFAULT 0;
    WHILE counter < 30 DO
        SET randomType = FLOOR(RAND() * 6)+1;
        SET randomRarity = FLOOR(RAND() * 5)+1;
        INSERT INTO Cosmétique (Nom, Prix, Typé, Rareté, IDBoutique)
        SELECT
            CONCAT('Cosmétique', counter),
            FLOOR(RAND() * 100) + 50,
            CASE
                WHEN randomType = 1 THEN 'Arme'
                WHEN randomType = 2 THEN 'Skin_complet'
                WHEN randomType = 3 THEN 'Danse'
                WHEN randomType = 4 THEN 'Emoji'
                WHEN randomType = 5 THEN 'Planeur'
                ELSE 'Sac à dos'
            END,
            CASE
                WHEN randomRarity = 1 THEN 'Typique'
                WHEN randomRarity = 2 THEN 'Atypique'
                WHEN randomRarity = 3 THEN 'Rare'
                WHEN randomRarity = 4 THEN 'Épique'
                ELSE 'Légendaire'
            END,
            1
        FROM information_schema.tables
        LIMIT 1;
        SET counter = counter + 1;
    END WHILE;
END //

DELIMITER ;

CALL generateRandomCosmetique();

DELIMITER //

CREATE PROCEDURE generateRandomAchat()
BEGIN
    DECLARE counter INT DEFAULT 1;
    DECLARE prixTotal INT DEFAULT 0;
    DECLARE nbCosmetique INT DEFAULT 0;
    DECLARE random INT DEFAULT 0;
    DECLARE i INT DEFAULT 1;
    DECLARE randomCosmetique INT DEFAULT 1;
    DECLARE referenceID INT;
    DECLARE prix INT DEFAULT 0;
    SET prixTotal = (SELECT SUM(Prix) FROM Cosmétique);
    SET nbCosmetique = (SELECT MAX(ID_cosmétique) FROM Cosmétique);
    WHILE counter < 20 DO
        SET random = FLOOR(RAND() * 3) + 1;
        CASE random
            WHEN 1 THEN
                SET i = 1;
                INSERT INTO Achat (Prix, Date, Id_Joueur, Remboursable, IDBoutique)
                SELECT
                    prixTotal,
                    '2023-04-01',
                    counter,
                    TRUE,
                    1;
                WHILE i <= nbCosmetique DO
                    IF EXISTS (SELECT * FROM Cosmétique WHERE ID_cosmétique = i) THEN
                        
                        SET referenceID = (SELECT MAX(ID_achat) FROM Achat);

                        IF referenceID IS NOT NULL AND i IS NOT NULL THEN
                            INSERT INTO Reference (ID_achat, ID_cosmétique)
                            VALUES (referenceID, i);
                        END IF;
                    END IF;
                    SET i = i + 1;
                END WHILE;
            ELSE
                
                SET randomCosmetique = (FLOOR(RAND() * nbCosmetique)) + 1;
                SET prix = (SELECT Prix FROM Cosmétique WHERE ID_cosmétique = randomCosmetique);
                INSERT INTO Achat (Prix, Date, Id_Joueur, Remboursable, IDBoutique)
                SELECT
                    prix,
                    '2023-04-01',
                    counter,
                    TRUE,
                    1
                FROM information_schema.tables
                LIMIT 1;
                INSERT INTO Reference (ID_achat, ID_cosmétique)
                SELECT
                    (SELECT MAX(ID_achat) FROM Achat),
                    (randomCosmetique)
                FROM information_schema.tables
                LIMIT 1;
        END CASE;
        SET counter = counter + 1;
    END WHILE;
END //

DELIMITER ;

CALL generateRandomAchat();


INSERT INTO EstAmi (ID_Joueur1, ID_Joueur2) VALUES (1, 2);

INSERT INTO Rejoint (ID_Joueur, Id_partie, PV, Shield, nbKill, Materiaux) VALUES (1, 1, 100, 50, 5, 200);

INSERT INTO Utilise (ID_PNJ, ID_arme) VALUES (1, 1);

DELIMITER //

CREATE PROCEDURE generatePossedeArme()
BEGIN
    DECLARE counter INT DEFAULT 1;
    
    WHILE counter < 100 DO
        INSERT INTO Possede (ID_Joueur, ID_arme)
        SELECT
            counter,
            (FLOOR(RAND() * (SELECT COUNT(*) FROM Arme))) + 1
        FROM information_schema.tables
        ORDER BY RAND()
        LIMIT 1;
        
        SET counter = counter + 1;
    END WHILE;
    
END //

DELIMITER ;

CALL generatePossedeArme();
INSERT INTO Contient (ID_arme, ID_coffre) VALUES (1, 1);

INSERT INTO EstDans (Id_partie, ID_coffre) VALUES (1, 1);

INSERT INTO Spawn (Id_partie, ID_PNJ) VALUES (1, 1);