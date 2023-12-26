#Group by
SELECT Typé,COUNT(*) FROM Cosmétique GROUP BY Typé;
#Double NOT EXISTS
SELECT DISTINCT c.ID_Joueur, c.Nom, c.Prénom FROM Compte c WHERE NOT EXISTS (SELECT c1.ID_cosmétique FROM Cosmétique c1 WHERE NOT EXISTS (SELECT r.ID_achat FROM Reference r JOIN Achat a ON r.ID_achat = a.ID_achat WHERE a.Id_Joueur = c.ID_Joueur AND r.ID_cosmétique = c1.ID_cosmétique));
#Version sans double not exists pour vérifier si c'est cohérant
#SELECT c.ID_Joueur,c.Nom,c.Prénom FROM Compte c, Achat a WHERE c.ID_Joueur = a.ID_Joueur AND a.ID_Joueur IN (SELECT ID_Achat FROM Reference GROUP BY ID_Achat HAVING COUNT(*) = (SELECT COUNT(*) FROM Cosmétique));
