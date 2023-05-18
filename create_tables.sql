DROP TABLE Vypujcka;
DROP TABLE ZadostOVypujcku;
DROP TABLE Hodnoceni;
DROP TABLE VztahHlavolamTyp;
DROP TABLE Typ;
DROP TABLE VztahHlavolamObtiznost;
DROP TABLE Obtiznost;
DROP TABLE VztahHlavolamReseni;
DROP TABLE Reseni;
DROP TABLE VztahPuzzleTema;
DROP TABLE tema;
DROP TABLE puzzle;
DROP TABLE autor;
DROP TABLE uzivatel;
DROP TABLE hadanka;
DROP TABLE hlavolam;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
CREATE TABLE Uzivatel
(
    uzivatelID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    rodneCislo VARCHAR(10),
    CHECK (REGEXP_LIKE(rodneCislo,'^[0-9]{9,}$','')), /* Rodne cislo musi byt alespon 9 znaku dlouhe */
    CHECK (REGEXP_LIKE(SUBSTR(rodneCislo,3,2),'^[0-9][0-9]$|^12$','')), /* Druhe dvoucisli vyjadruje mesic narozeni, tedy nemuze byt vyssi, nez 12 */
    CHECK (REGEXP_LIKE(SUBSTR(rodneCislo,3,2),'^[0-9][0-9]$|^31$','')), /* Treti dvoucisli vyjadruje den narozeni, tedy nemuze byt vyssi, nez 31 */
    CHECK (MOD(CAST(rodneCislo AS INT),11)=0),
    jmeno VARCHAR(100),
    prijmeni VARCHAR(100),
    bydliste VARCHAR(255),
    telefon INT,
    email VARCHAR(255),
    PRIMARY KEY (uzivatelID)
);
CREATE TABLE Hlavolam
(
    hlavolamID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    nazev VARCHAR(100),
    zemePuvodu VARCHAR(100),
    typID INT,
    obtiznostID INT,
    reseniID INT,
    hodnoceniID INT,
    zadostID INT,
    PRIMARY KEY (hlavolamID)
);
CREATE TABLE Autor
(
    autorID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    jmeno VARCHAR(100),
    prijmeni VARCHAR(100),
    PRIMARY KEY (autorID)
);
CREATE TABLE Hadanka
(
    hadankaID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    princip VARCHAR(255),
    jazyk VARCHAR(10),
    nejepsiCasSekundy INT,
    lingvistickaNarocnost INT,
    hlavolamID INT REFERENCES Hlavolam(hlavolamID), /* Generalizace - Hadanka je hlavolam */
    PRIMARY KEY (hadankaID)
);
CREATE TABLE Puzzle
(
    puzzleID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    pocetDilku INT,
    autorID INT,
    PRIMARY KEY (puzzleID),
    hlavolamID INT REFERENCES Hlavolam(hlavolamID), /* Generalizace - Puzzle je hlavolam */
    FOREIGN KEY (autorID) REFERENCES Autor(autorID)
);
CREATE TABLE Tema
(
    temaID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    nazev VARCHAR(100),
    PRIMARY KEY (temaId)
);
CREATE TABLE VztahPuzzleTema
(
    vztahID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    puzzleID INT,
    temaID INT,
    PRIMARY KEY (vztahID),
    FOREIGN KEY (puzzleID) REFERENCES Puzzle(puzzleID),
    FOREIGN KEY (temaID) REFERENCES tema(temaID) 
);
CREATE TABLE Typ
(
    typID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    nazev VARCHAR(100),
    PRIMARY KEY (typID)
);
CREATE TABLE VztahHlavolamTyp
(
    vztahID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    hlavolamID INT,
    typID INT NOT NULL,
    PRIMARY KEY (vztahID),
    FOREIGN KEY (hlavolamID) REFERENCES Hlavolam(hlavolamID),
    FOREIGN KEY (typID) REFERENCES Typ(typID)
);
CREATE TABLE Obtiznost
(
    obtiznostID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    druh VARCHAR(100),
    mira SMALLINT,
    PRIMARY KEY (obtiznostID)
);
CREATE TABLE VztahHlavolamObtiznost
(
    vztahID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    hlavolamID INT,
    obtiznostID INT NOT NULL,
    FOREIGN KEY (hlavolamID) REFERENCES Hlavolam(hlavolamID),
    FOREIGN KEY (obtiznostID) REFERENCES Obtiznost(obtiznostID)
);
CREATE TABLE Reseni
(
    reseniID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    slozitost SMALLINT,
    casovaNarocnost SMALLINT,
    PRIMARY KEY (reseniID)
);
CREATE TABLE VztahHlavolamReseni
(
    vztahID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    hlavolamID INT NOT NULL,
    reseniID INT,
    FOREIGN KEY (hlavolamID) REFERENCES Hlavolam(hlavolamID),
    FOREIGN KEY (reseniID) REFERENCES  Reseni(reseniID)
);
CREATE TABLE Hodnoceni
(
    hodnoceniID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    uspesnost FLOAT,
    dobaReseni INT,
    celkovyZazitek VARCHAR(255),
    uzivatelID INT,
    hlavolamID INT,
    PRIMARY KEY (hodnoceniID),
    FOREIGN KEY (hlavolamID) REFERENCES Hlavolam(hlavolamID),
    FOREIGN KEY (uzivatelID) REFERENCES Uzivatel(uzivatelID)
);

CREATE TABLE ZadostOVypujcku
(
    zadostID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    podano DATE,
    stav VARCHAR(100),
    uzivatelID INT,
    hlavolamID INT,
    PRIMARY KEY (zadostID),
    FOREIGN KEY (uzivatelID) REFERENCES Uzivatel(uzivatelID),
    FOREIGN KEY (hlavolamID) REFERENCES Hlavolam(hlavolamID)
);
CREATE TABLE Vypujcka
(
    vypujckaID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    vypujcenoDatum DATE,
    vracenoDatum DATE,
    uzivatelID INT,
    zadostID INT,
    FOREIGN KEY (uzivatelID) REFERENCES Uzivatel(uzivatelID),
    FOREIGN KEY (zadostID)  REFERENCES ZadostOVypujcku(zadostID)
);