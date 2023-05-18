--Procedury
--1) Procedura vypise prumernou obtiznost hlavolamu, prumerne hodnoceni a jejich celkovy pocet
CREATE OR REPLACE PROCEDURE "statistikyHlavolamu"
AS
    "prumernaObtiznost" NUMBER;
    "prumerneHodnoceni" NUMBER;
    "celkovyPocetHlavolamu" NUMBER;

BEGIN
    SELECT COUNT(*) INTO "celkovyPocetHlavolamu" from Hlavolam;
    SELECT AVG(mira) INTO "prumernaObtiznost" from Obtiznost;
    SELECT AVG(celkovyZazitek) INTO "prumerneHodnoceni" from Hodnoceni;
    DBMS_OUTPUT.put_line (' Dohromady je ' || "celkovyPocetHlavolamu" || ' Hlavolamu ');
    DBMS_OUTPUT.put_line(' S prumernou obtiznosti ' || "prumernaObtiznost" || ' a s prumernym hodnocenim ' || "prumerneHodnoceni");
EXCEPTION WHEN ZERO_DIVIDE THEN
    BEGIN
        IF "celkovyPocetHlavolamu" = 0 THEN
            DBMS_OUTPUT.put_line('Neexistuji zadne hlavolamy!');
        END IF;
    END;
END;
--Demonstrace
BEGIN "statistikyHlavolamu"; End;

--2) Procedura vypise statistiky vypujcek
CREATE OR REPLACE PROCEDURE "statistikyVypujcek"
AS
    "pocetUzivatelu" NUMBER;
    "pocetNevyrizenychZadosti" NUMBER;
    "pocetVypujcek" NUMBER;

BEGIN
    SELECT COUNT(*) INTO "pocetUzivatelu" FROM Uzivatel;
    SELECT (SELECT COUNT(*) FROM ZadostOVypujcku) - (SELECT COUNT(*) FROM Vypujcka) INTO "pocetNevyrizenychZadosti"
            from ZadostOVypujcku WHERE ROWNUM = 1;
    SELECT COUNT(*) INTO "pocetVypujcek" FROM Vypujcka;
    DBMS_OUTPUT.PUT_LINE( "pocetUzivatelu" || ' uzivatelu si celkem vypujcilo ' || "pocetVypujcek" ||
                          ' hlavolámu a ceka na vypujceni dalsích' || "pocetNevyrizenychZadosti" || 'hlavolamu');
END;

--Demonstrace
BEGIN "statistikyVypujcek"; END;
