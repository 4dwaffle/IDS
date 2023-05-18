/* 2 dotazy vyuzivajici spojeni dvou tabulek */
/* Priradi hodnoceni k uzivatelum a oboji vypise */
SELECT * FROM Hodnoceni
    LEFT OUTER JOIN Uzivatel ON Hodnoceni.uzivatelID = Uzivatel.uzivatelID;
SELECT * FROM Uzivatel
    LEFT OUTER JOIN Hodnoceni ON Uzivatel.uzivatelID = Hodnoceni.uzivatelID;

/* 1 dotaz vyuzivajici spojeni 2 tabulek */
/* Vypise vsechny hlavolamy a prida k nim jejich hodnoty v tabulkach PUZZLE a HODNOCENI, existuji-li */
SELECT * FROM Hlavolam
    LEFT OUTER JOIN PUZZLE P ON Hlavolam.hlavolamID = P.HLAVOLAMID
    LEFT OUTER JOIN Hodnoceni H ON Hlavolam.hodnoceniID = H.hodnoceniID;

/* 2 dotazy vyuzivajici GROUP BY a agragačni funkci */
/* Vypise jmeno uzivatele a pocet hlavolamu, ktere si ve svych zadostech pujcil. */
SELECT U.jmeno, count(Z.hlavolamID) FROM ZadostOVypujcku Z
    LEFT OUTER JOIN Hlavolam H ON Z.hlavolamID = H.HLAVOLAMID
    LEFT OUTER JOIN Uzivatel U ON Z.uzivatelID = U.UZIVATELID
group by U.jmeno;

/* Vybere nazvy hlavolamu s nejnizsi dobou reseni*/
select HLAVOLAM.nazev, min(Hodnoceni.dobaReseni) from HLAVOLAM
    left outer join Hodnoceni on Hlavolam.hlavolamID = Hodnoceni.hlavolamID
group by HLAVOLAM.nazev;

/* 1 dotaz obsahujici predikat EXISTS */
/* Vypise jmena uyivatelu s alespon jednou vypujckou*/
select jmeno from Uzivatel
    where exists(select 1 from ZADOSTOVYPUJCKU where Uzivatel.uzivatelID=zadostID) order by jmeno;

/* 1 dotaz s predikatem IN s vnořenym selectem */
/* Vypise hodnoceni vsech uzivatelu, kteri si pujcili vic nez 3 hlavolamy*/
select * from Hlavolam
    left outer join Hodnoceni on Hlavolam.hlavolamID = Hodnoceni.hlavolamID
    where hodnoceni.uzivatelID in
    (
        select uzivatelID from
        (
            select Uzivatel.uzivatelID, count(v.vypujckaID) as count from Uzivatel
                left outer join VYPUJCKA V on Uzivatel.uzivatelID = V.UZIVATELID
                group by Uzivatel.uzivatelID
        )
        where count > 3
    );
--SELECT vyuzivajici klauzuli WITH a operator CASE
WITH U AS (SELECT * FROM Uzivatel)
SELECT U.jmeno,U.prijmeni,U.bydliste FROM U WHERE U.jmeno LIKE '%Jan'
ORDER BY
    (CASE
         When bydliste IS NULL THEN prijmeni
         ELSE jmeno
        END);