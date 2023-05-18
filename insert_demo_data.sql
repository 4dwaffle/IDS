INSERT INTO Hlavolam(nazev, zemePuvodu, typID, obtiznostID, reseniID, hodnoceniID, zadostID) VALUES ('Jezek v kleci', 'USA', 1, 2, 1, 2, 4);
INSERT INTO Hlavolam(nazev, zemePuvodu, typID, obtiznostID, reseniID, hodnoceniID, zadostID) VALUES ('Loydova osmička', '', 3, 8, 2, 4, 2);
INSERT INTO Hlavolam(nazev, zemePuvodu, typID, obtiznostID, reseniID, hodnoceniID, zadostID) VALUES ('Bez hlasu plače', '', '', 8, 3, 1, 1);
INSERT INTO Hlavolam(nazev, zemePuvodu, typID, obtiznostID, reseniID, hodnoceniID, zadostID) VALUES ('3 svicny', 'CZE', 2, 3, 4, 5, 6);
INSERT INTO Hlavolam(nazev, zemePuvodu, typID, obtiznostID, reseniID, hodnoceniID, zadostID) VALUES ('Lhařova tvař', 'DEN', 7, 12, 5, 7, 6);
INSERT INTO Hlavolam(nazev, zemePuvodu, typID, obtiznostID, reseniID, hodnoceniID, zadostID) VALUES ('Tleskani jednou rukou', 'CZE', '', 77, 5, 4, 4);

INSERT INTO Autor(jmeno, prijmeni) VALUES ('Petr', 'Juračka');
INSERT INTO Autor(jmeno, prijmeni) VALUES ('Tomaš', 'Třeštik');
INSERT INTO Autor(jmeno, prijmeni) VALUES ('Peter', 'McKinnon');
INSERT INTO Autor(jmeno, prijmeni) VALUES ('Jared', 'Polen');
INSERT INTO Autor(jmeno, prijmeni) VALUES ('Claude', 'Monet');
INSERT INTO Autor(jmeno, prijmeni) VALUES ('Peter', 'Jurajko');
INSERT INTO Autor(jmeno, prijmeni) VALUES ('Thomas', 'Smith');
INSERT INTO Autor(jmeno, prijmeni) VALUES ('Karl', 'Schmitt');
INSERT INTO Autor(jmeno, prijmeni) VALUES ('Victor', 'Hiller');
INSERT INTO Autor(jmeno, prijmeni) VALUES ('Claude', 'Manne');

INSERT INTO Puzzle(hlavolamID, pocetDilku, autorID) VALUES (1, 1000, 1);
INSERT INTO Puzzle(hlavolamID, pocetDilku, autorID) VALUES (2, 10000, 5);
INSERT INTO Puzzle(hlavolamID, pocetDilku, autorID) VALUES (3, 100000, 7);
INSERT INTO Puzzle(hlavolamID, pocetDilku, autorID) VALUES (4, 12000, 4);


INSERT INTO Typ(nazev) VALUES ('kovovy');
INSERT INTO Typ(nazev) VALUES ('dřevěny');
INSERT INTO Typ(nazev) VALUES ('plastovy');
INSERT INTO Typ(nazev) VALUES ('papirovy');
INSERT INTO Typ(nazev) VALUES ('gumovy');
INSERT INTO Typ(nazev) VALUES ('nehmotny');

INSERT INTO VztahHlavolamTyp(hlavolamID, typID) VALUES (1,1);
INSERT INTO VztahHlavolamTyp(hlavolamID, typID) VALUES (2,3);


INSERT INTO Obtiznost(druh, mira) VALUES ('prostorova představivost', 10);
INSERT INTO Obtiznost(druh, mira) VALUES ('slovni zasoba', 5);
INSERT INTO Obtiznost(druh, mira) VALUES ('logické uvazovani', 11);
INSERT INTO Obtiznost(druh, mira) VALUES ('Memorovaci schopnosti', 12);

INSERT INTO  VztahHlavolamObtiznost(hlavolamID, obtiznostID) VALUES (1,1);
INSERT INTO  VztahHlavolamObtiznost(hlavolamID, obtiznostID) VALUES (2,2);
INSERT INTO  VztahHlavolamObtiznost(hlavolamID, obtiznostID) VALUES (2,1);


INSERT INTO Tema(nazev) VALUES ('krajina');
INSERT INTO Tema(nazev) VALUES ('portrét');
INSERT INTO Tema(nazev) VALUES ('ovoce');
INSERT INTO Tema(nazev) VALUES ('nabytek');
INSERT INTO Tema(nazev) VALUES ('hory');
INSERT INTO Tema(nazev) VALUES ('knihy');
INSERT INTO Tema(nazev) VALUES ('zelenina');
INSERT INTO Tema(nazev) VALUES ('lidé');

INSERT INTO Puzzle(pocetDilku, autorID, hlavolamID) VALUES (1000, 1, 1);
INSERT INTO Puzzle(pocetDilku, autorID, hlavolamID) VALUES (5000, 2, 2);
INSERT INTO Puzzle(pocetDilku, autorID, hlavolamID) VALUES (2000, 3, 1);
INSERT INTO Puzzle(pocetDilku, autorID, hlavolamID) VALUES (10000, 4, 2);

INSERT INTO Hadanka(princip, jazyk, nejepsiCasSekundy, lingvistickaNarocnost, hlavolamID) VALUES ('vysvětleni principu hadanky', 'CZ', 367, 7, 3);
INSERT INTO Hadanka(princip, jazyk, nejepsiCasSekundy, lingvistickaNarocnost, hlavolamID) VALUES ('Riddle explanation', 'EN', 5, 10, 4);
INSERT INTO Hadanka(princip, jazyk, nejepsiCasSekundy, lingvistickaNarocnost, hlavolamID) VALUES ('Erklarung des Prinzips des Puzzles', 'DE', 420, 14, 5);


INSERT INTO VztahPuzzleTema(puzzleID, temaID) VALUES (1,3);
INSERT INTO VztahPuzzleTema(puzzleID, temaID) VALUES (2,2);
INSERT INTO VztahPuzzleTema(puzzleID, temaID) VALUES (3,1);


INSERT INTO Reseni(slozitost, casovaNarocnost) VALUES (10, 30);
INSERT INTO Reseni(slozitost, casovaNarocnost) VALUES (1, 10);
INSERT INTO Reseni(slozitost, casovaNarocnost) VALUES (2, 20);
INSERT INTO Reseni(slozitost, casovaNarocnost) VALUES (3, 30);
INSERT INTO Reseni(slozitost, casovaNarocnost) VALUES (4, 40);
INSERT INTO Reseni(slozitost, casovaNarocnost) VALUES (5, 50);
INSERT INTO Reseni(slozitost, casovaNarocnost) VALUES (6, 60);
INSERT INTO Reseni(slozitost, casovaNarocnost) VALUES (11, 33);
INSERT INTO Reseni(slozitost, casovaNarocnost) VALUES (17, 12);
INSERT INTO Reseni(slozitost, casovaNarocnost) VALUES (5, 27);
INSERT INTO Reseni(slozitost, casovaNarocnost) VALUES (7, 31);
INSERT INTO Reseni(slozitost, casovaNarocnost) VALUES (8, 42);
INSERT INTO Reseni(slozitost, casovaNarocnost) VALUES (9, 54);
INSERT INTO Reseni(slozitost, casovaNarocnost) VALUES (18, 69);


INSERT INTO VztahHlavolamReseni(hlavolamID, reseniID) VALUES (1, 3);
INSERT INTO VztahHlavolamReseni(hlavolamID, reseniID) VALUES (1, 4);
INSERT INTO VztahHlavolamReseni(hlavolamID, reseniID) VALUES (2, 3);
INSERT INTO VztahHlavolamReseni(hlavolamID, reseniID) VALUES (1, 5);
INSERT INTO VztahHlavolamReseni(hlavolamID, reseniID) VALUES (3, 6);
INSERT INTO VztahHlavolamReseni(hlavolamID, reseniID) VALUES (2, 7);

INSERT INTO Uzivatel(rodneCislo,jmeno, prijmeni, bydliste, telefON, email) VALUES ('0202063950','Jan', 'Novak', '', '420600900600', 'jannovak@gmailcom');
INSERT INTO Uzivatel(rodneCislo,jmeno, prijmeni, bydliste, telefON, email) VALUES ('0202063961','Samuel', 'Vystrčil', '', 420690110600, 'samvystr@gmailcom');
INSERT INTO Uzivatel(rodneCislo,jmeno, prijmeni, bydliste, telefON, email) VALUES ('0202063972','Patrik', 'Chrabry', '', 420608900610, 'patrik@gmailcom');
INSERT INTO Uzivatel(rodneCislo,jmeno, prijmeni, bydliste, telefON, email) VALUES ('0202063983','Miroslava', 'Černa', '', 420080906030, 'miroslava@gmailcom');
INSERT INTO Uzivatel(rodneCislo,jmeno, prijmeni, bydliste, telefON, email) VALUES ('0202063994','Karel', 'Havliček', '', 420609000460, 'karelhavlicek@gmailcom');
INSERT INTO Uzivatel(rodneCislo,jmeno, prijmeni, bydliste, telefON, email) VALUES ('0202064005','David', 'Novak', '', 420609110460, 'novak123456@gmailcom');
INSERT INTO Uzivatel(rodneCislo,jmeno, prijmeni, bydliste, telefON, email) VALUES ('0202064016','Matěj', 'Hlavak', '', 420679000460, 'hlavak23455@gmailcom');
INSERT INTO Uzivatel(rodneCislo,jmeno, prijmeni, bydliste, telefON, email) VALUES ('0202064027','Robert', 'Nahlik', '', 420609000487, 'nahlik6897@gmailcom');

INSERT INTO Hodnoceni(uspesnost, dobaReseni, celkovyZazitek, uzivatelID, hlavolamID) VALUES (1, 100, 7, 1, 1);
INSERT INTO Hodnoceni(uspesnost, dobaReseni, celkovyZazitek, uzivatelID, hlavolamID) VALUES (1, 32,  4, 2, 1);
INSERT INTO Hodnoceni(uspesnost, dobaReseni, celkovyZazitek, uzivatelID, hlavolamID) VALUES (0, 14,  6, 3, 1);
INSERT INTO Hodnoceni(uspesnost, dobaReseni, celkovyZazitek, uzivatelID, hlavolamID) VALUES (1, 71, 10, 4, 1);
INSERT INTO Hodnoceni(uspesnost, dobaReseni, celkovyZazitek, uzivatelID, hlavolamID) VALUES (0, 1000, 8, 2, 2);
INSERT INTO Hodnoceni(uspesnost, dobaReseni, celkovyZazitek, uzivatelID, hlavolamID) VALUES (0, 321,  5, 2, 2);
INSERT INTO Hodnoceni(uspesnost, dobaReseni, celkovyZazitek, uzivatelID, hlavolamID) VALUES (1, 145,  3, 3, 2);
INSERT INTO Hodnoceni(uspesnost, dobaReseni, celkovyZazitek, uzivatelID, hlavolamID) VALUES (0, 717, 1, 4, 2);

INSERT INTO ZadostOVypujcku(podano, stav, uzivatelID, hlavolamID) VALUES ('20220101', 'vraceno', 1, 1);
INSERT INTO ZadostOVypujcku(podano, stav, uzivatelID, hlavolamID) VALUES ('20220101', 'vraceno', 2, 1);
INSERT INTO ZadostOVypujcku(podano, stav, uzivatelID, hlavolamID) VALUES ('20220101', 'vraceno', 1, 1);
INSERT INTO ZadostOVypujcku(podano, stav, uzivatelID, hlavolamID) VALUES ('20220101', 'půjčeno', 2, 1);
INSERT INTO ZadostOVypujcku(podano, stav, uzivatelID, hlavolamID) VALUES ('20230101', 'půjčeno', 3, 2);
INSERT INTO ZadostOVypujcku(podano, stav, uzivatelID, hlavolamID) VALUES ('20120101', 'vraceno', 2, 1);
INSERT INTO ZadostOVypujcku(podano, stav, uzivatelID, hlavolamID) VALUES ('20210205', 'vraceno', 3, 3);
INSERT INTO ZadostOVypujcku(podano, stav, uzivatelID, hlavolamID) VALUES ('20170101', 'půjčeno', 4, 1);

INSERT INTO Vypujcka(vypujcenoDatum, vracenoDatum, uzivatelId, zadostId) VALUES ('20020505', '20020912', 2, 3);
INSERT INTO Vypujcka(vypujcenoDatum, vracenoDatum, uzivatelId, zadostId) VALUES ('20120101', '20140101', 2, 3);
INSERT INTO Vypujcka(vypujcenoDatum, vracenoDatum, uzivatelId, zadostId) VALUES ('20240116', '', 2, 3);
INSERT INTO Vypujcka(vypujcenoDatum, vracenoDatum, uzivatelId, zadostId) VALUES ('20230507', '20230912', 3, 4);
INSERT INTO Vypujcka(vypujcenoDatum, vracenoDatum, uzivatelId, zadostId) VALUES ('20220101', '20230101', 3, 4);
INSERT INTO Vypujcka(vypujcenoDatum, vracenoDatum, uzivatelId, zadostId) VALUES ('20240116', '', 2, 3);