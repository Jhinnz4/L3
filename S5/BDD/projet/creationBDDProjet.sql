CREATE DATABASE Fortnite;
use Fortnite;

CREATE TABLE IF NOT EXISTS Boutique (
    IDBoutique INT PRIMARY KEY,
    Date DATE
);

CREATE TABLE IF NOT EXISTS Tournoi (
    ID_tournoi INT PRIMARY KEY,
    Nom TEXT,
    Récompense TEXT,
    Date DATE,
    Type TEXT
);

CREATE TABLE IF NOT EXISTS PNJ (
    ID_PNJ INT PRIMARY KEY,
    Nom TEXT,
    PV INT
);

CREATE TABLE IF NOT EXISTS Coffre (
    ID_coffre INT PRIMARY KEY,
    PV INT
);

CREATE TABLE IF NOT EXISTS Arme (
    ID_arme INT PRIMARY KEY,
    Nom TEXT,
    Rareté ENUM("Typique","Atypique","Rare","Épique","Légendaire"),
    Dégat INT,
    Cadence_Tire INT,
    Type TEXT
);

CREATE TABLE IF NOT EXISTS Partie (
    Id_partie INT PRIMARY KEY,
    Date DATE,
    Exp_gagné INT,
    Ranked BOOLEAN,
    Constru TEXT,
    ID_tournoi INT,
    FOREIGN KEY (ID_tournoi) REFERENCES Tournoi(ID_tournoi)
);

CREATE TABLE IF NOT EXISTS PartiePrivee (
    Id_partiePerso INT PRIMARY KEY,
    Date DATE,
    Exp_gagné INT,
    Ranked BOOLEAN,
    Constru TEXT,
    ID_tournoi INT,
    pwd TEXT,
    FOREIGN KEY (ID_tournoi) REFERENCES Tournoi(ID_tournoi)
);

CREATE TABLE IF NOT EXISTS PartieRanked (
    Id_partieRanked INT PRIMARY KEY,
    Date DATE,
    Exp_gagné INT,
    Ranked BOOLEAN,
    Constru TEXT,
    ID_tournoi INT,
    Points_gagné INT,
    rang ENUM("Bronze","Argent","Or","Platine","Diamant","Elite","Champion","Unreal"),
    FOREIGN KEY (ID_tournoi) REFERENCES Tournoi(ID_tournoi)
    
);



CREATE TABLE IF NOT EXISTS Compte (
    ID_Joueur INT PRIMARY KEY AUTO_INCREMENT,
    Nom TEXT,
    Prénom TEXT,
    e_mail TEXT,
    Niveau INT,
    EXP INT,
    V_Buckl INT,
    Date_Inscription DATE,
    Rang ENUM("Bronze","Argent","Or","Platine","Diamant","Elite","Champion","Unreal"),
    ID_tournoi INT,
    FOREIGN KEY (ID_tournoi) REFERENCES Tournoi(ID_tournoi)
);
CREATE TABLE IF NOT EXISTS Achat (
    ID_achat INT PRIMARY KEY auto_increment,
    Prix INT,
    Date DATE,
    Id_Joueur INT NOT NULL,
    Remboursable BOOLEAN,
    IDBoutique INT NOT NULL,
    FOREIGN KEY (Id_Joueur) REFERENCES Compte(ID_Joueur),
    FOREIGN KEY (IDBoutique) REFERENCES Boutique(IDBoutique)
);
CREATE TABLE IF NOT EXISTS Cosmétique (
    ID_cosmétique INT PRIMARY KEY AUTO_INCREMENT,
    Nom TEXT,
    Prix INT,
    Typé ENUM("Arme","Skin_complet","Danse","Emoji","Planeur","Sac à dos"),
    Rareté ENUM("Typique","Atypique","Rare","Épique","Légendaire"),
    IDBoutique INT NOT NULL,
    FOREIGN KEY (IDBoutique) REFERENCES Boutique(IDBoutique)
);

CREATE TABLE IF NOT EXISTS Reference (
    ID_achat INT,
    ID_cosmétique INT,
    PRIMARY KEY (ID_achat, ID_cosmétique),
    FOREIGN KEY (ID_achat) REFERENCES Achat(ID_achat),
    FOREIGN KEY (ID_cosmétique) REFERENCES Cosmétique(ID_cosmétique)
);

CREATE TABLE IF NOT EXISTS EstAmi (
    ID_Joueur1 INT,
    ID_Joueur2 INT,
    PRIMARY KEY (ID_Joueur1, ID_Joueur2),
    FOREIGN KEY (ID_Joueur1) REFERENCES Compte(ID_Joueur),
    FOREIGN KEY (ID_Joueur2) REFERENCES Compte(ID_Joueur)
);

CREATE TABLE IF NOT EXISTS Rejoint (
    ID_Joueur INT,
    Id_partie INT,
    PV INT,
    Shield INT,
    nbKill INT,
    Materiaux INT,
    ClassementFinal INT,
    PRIMARY KEY (ID_Joueur, Id_partie),
    FOREIGN KEY (ID_Joueur) REFERENCES Compte(ID_Joueur),
    FOREIGN KEY (Id_partie) REFERENCES Partie(Id_partie)
);

CREATE TABLE IF NOT EXISTS Utilise (
    ID_PNJ INT,
    ID_arme INT,
    PRIMARY KEY (ID_PNJ, ID_arme),
    FOREIGN KEY (ID_PNJ) REFERENCES PNJ(ID_PNJ),
    FOREIGN KEY (ID_arme) REFERENCES Arme(ID_arme)
);

CREATE TABLE IF NOT EXISTS Possede (
    ID_Joueur INT,
    ID_arme INT,
    PRIMARY KEY (ID_Joueur, ID_arme),
    FOREIGN KEY (ID_Joueur) REFERENCES Compte(ID_Joueur),
    FOREIGN KEY (ID_arme) REFERENCES Arme(ID_arme)
);

CREATE TABLE IF NOT EXISTS Contient (
    ID_arme INT,
    ID_coffre INT,
    PRIMARY KEY (ID_arme, ID_coffre),
    FOREIGN KEY (ID_arme) REFERENCES Arme(ID_arme),
    FOREIGN KEY (ID_coffre) REFERENCES Coffre(ID_coffre)
);

CREATE TABLE IF NOT EXISTS EstDans (
    Id_partie INT,
    ID_coffre INT,
    PRIMARY KEY (Id_partie, ID_coffre),
    FOREIGN KEY (Id_partie) REFERENCES Partie(Id_partie),
    FOREIGN KEY (ID_coffre) REFERENCES Coffre(ID_coffre)
);

CREATE TABLE IF NOT EXISTS Spawn (
    Id_partie INT,
    ID_PNJ INT,
    PRIMARY KEY (Id_partie, ID_PNJ),
    FOREIGN KEY (Id_partie) REFERENCES Partie(Id_partie),
    FOREIGN KEY (ID_PNJ) REFERENCES PNJ(ID_PNJ)
);