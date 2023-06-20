
USE NuMaiPot1;

CREATE TABLE CicluriInvatamant (
    IDCicluri INT PRIMARY KEY,
    Nume VARCHAR(50) NOT NULL
);

INSERT INTO CicluriInvatamant (IDCicluri, Nume)
VALUES
    (1, 'Licenta'),
    (2, 'Master'),
    (3, 'Doctorat');

SELECT * FROM CicluriInvatamant;

CREATE TABLE ProgrameStudiiLicenta (
    IDPrograme INT PRIMARY KEY,
    Nume VARCHAR(100) NOT NULL,
    CicluID INT,
    FOREIGN KEY (CicluID) REFERENCES CicluriInvatamant(IDCicluri)
);

INSERT INTO ProgrameStudiiLicenta(IDPrograme, Nume, CicluID)
VALUES
    (1, 'Electrotehnica', 1),
    (2, 'Inginerie electrica si calculatoare', 1),
    (3, 'Electronica aplicata', 1),
    (4, 'Tehnologii si sisteme de telecomunicatii', 1),
    (5, 'Calculatoare', 1),
    (6, 'Automatica si informatica aplicata', 1),
    (7, 'Tehnologia informatiei', 1),
    (8, 'Robotica', 1);

SELECT * FROM ProgrameStudiiLicenta;

CREATE TABLE AniStudii (
    Anul VARCHAR(10) PRIMARY KEY,
    ProgramStudiiID INT,
    FOREIGN KEY (ProgramStudiiID) REFERENCES ProgrameStudiiLicenta(IDPrograme)
);

-- Adãugarea înregistrãrilor în tabelul AniStudii pentru programul "Automatica si informatica aplicata"
INSERT INTO AniStudii(Anul, ProgramStudiiID)
VALUES
    ('Anul 1', 6),
    ('Anul 2', 6),
    ('Anul 3', 6),
    ('Anul 4', 6);

-- Verificarea înregistrãrilor din tabelul AniStudii pentru programul "Automatica si informatica aplicata"
SELECT * FROM AniStudii;

-- Crearea tabelului Discipline
CREATE TABLE Discipline (
    IDAni INT PRIMARY KEY,
    Nume VARCHAR(100) NOT NULL,
    Acronim VARCHAR(10) NOT NULL,
    NumarCredite INT NOT NULL,
    Semestru INT NOT NULL,
    AnulID INT,
	Profesor VARCHAR(100) NOT NULL,

    FOREIGN KEY (AnulID) REFERENCES ProgrameStudiiLicenta(IDPrograme)
);

INSERT INTO Discipline (IDAni, Nume, Acronim, NumarCredite, Semestru, Profesor, AnulID)
VALUES (1, 'Teoria sistemelor 1', 'TS1', 5, 1, 'COMAN Simona',(SELECT ProgramStudiiID FROM AniStudii WHERE Anul = 'Anul 2'));

INSERT INTO Discipline (IDAni, Nume, Acronim, NumarCredite, Semestru, Profesor, AnulID)
VALUES (2, 'Robotica', 'Robo', 5, 1, 'POZNA Radu', (SELECT ProgramStudiiID FROM AniStudii WHERE Anul = 'Anul 2'));

INSERT INTO Discipline (IDAni, Nume, Acronim, NumarCredite, Semestru, Profesor, AnulID)
VALUES (3, 'Circuite electronice liniare', 'CEL', 5, 1,  'CAMPEANU Radu', (SELECT ProgramStudiiID FROM AniStudii WHERE Anul = 'Anul 2'));

INSERT INTO Discipline (IDAni, Nume, Acronim, NumarCredite, Semestru, Profesor, AnulID)
VALUES (4, 'Metode numerice', 'MN', 5, 1, 'ITU Lucian', (SELECT ProgramStudiiID FROM AniStudii WHERE Anul = 'Anul 2'));

INSERT INTO Discipline (IDAni, Nume, Acronim, NumarCredite, Semestru, Profesor, AnulID)
VALUES (5, 'Proiectarea algoritmilor', 'PA', 4, 1, 'MORARU Sorin',(SELECT ProgramStudiiID FROM AniStudii WHERE Anul = 'Anul 2'));

INSERT INTO Discipline (IDAni, Nume, Acronim, NumarCredite, Semestru, Profesor, AnulID)
VALUES (6, 'Masurari si traductoare', 'MT', 4, 1, 'FLOROIAN Laura',(SELECT ProgramStudiiID FROM AniStudii WHERE Anul = 'Anul 2'));

INSERT INTO Discipline (IDAni, Nume, Acronim, NumarCredite, Semestru, Profesor, AnulID)
VALUES (7, 'Teoria sistemelor 2', 'TS2', 4, 2, 'COMAN Simona',(SELECT ProgramStudiiID FROM AniStudii WHERE Anul = 'Anul 2'));

INSERT INTO Discipline (IDAni, Nume, Acronim, NumarCredite, Semestru, Profesor, AnulID)
VALUES (8, 'Sisteme automate cu esantionare', 'SAE', 5, 2, 'COMAN Simona',(SELECT ProgramStudiiID FROM AniStudii WHERE Anul = 'Anul 2'));

INSERT INTO Discipline (IDAni, Nume, Acronim, NumarCredite, Semestru, Profesor, AnulID)
VALUES (9, 'Analiza si sinteza circuitelor numerice 1', 'ASCN1', 5, 2, 'MOLDOVEANU Florin',(SELECT ProgramStudiiID FROM AniStudii WHERE Anul = 'Anul 2'));

INSERT INTO Discipline (IDAni, Nume, Acronim, NumarCredite, Semestru, Profesor, AnulID)
VALUES (10, 'Programare orientata pe obiecte', 'POO', 4, 2, 'KRISTALY Dominic',(SELECT ProgramStudiiID FROM AniStudii WHERE Anul = 'Anul 2'));

INSERT INTO Discipline (IDAni, Nume, Acronim, NumarCredite, Semestru, Profesor, AnulID)
VALUES (11, 'Electronica digitala', 'ED', 3, 2, 'CAMPEANU Radu',(SELECT ProgramStudiiID FROM AniStudii WHERE Anul = 'Anul 2'));

INSERT INTO Discipline (IDAni, Nume, Acronim, NumarCredite, Semestru, Profesor, AnulID)
VALUES (12, 'Prelucrarea semnalelor', 'PS', 3, 2, 'BOLDISOR Cristian',(SELECT ProgramStudiiID FROM AniStudii WHERE Anul = 'Anul 2'));

CREATE TABLE GrupeStudenti (
    Grupa VARCHAR(10) PRIMARY KEY
);

INSERT INTO GrupeStudenti (Grupa)
VALUES ('4LF411'), ('4LF412'), ('4LF413');

-- Subtabelul Studenti pentru grupa 4LF401
CREATE TABLE Studenti_4LF411 (
NrMatricol INT PRIMARY KEY,
Nume VARCHAR(50) NOT NULL,
Prenume VARCHAR(50) NOT NULL,
InitialaTata CHAR(1) NOT NULL,
CNP VARCHAR(13) NOT NULL,
DataInscriere DATE NOT NULL,
CicluInvatamant VARCHAR(50) NOT NULL,
MediaAdmitere DECIMAL(4, 2) NOT NULL
);

-- Subtabelul Studenti pentru grupa 4LF402
CREATE TABLE Studenti_4LF412 (
NrMatricol INT PRIMARY KEY,
Nume VARCHAR(50) NOT NULL,
Prenume VARCHAR(50) NOT NULL,
InitialaTata CHAR(1) NOT NULL,
CNP VARCHAR(13) NOT NULL,
DataInscriere DATE NOT NULL,
CicluInvatamant VARCHAR(50) NOT NULL,
MediaAdmitere DECIMAL(4, 2) NOT NULL
);

-- Subtabelul Studenti pentru grupa 4LF403
CREATE TABLE Studenti_4LF413 (
NrMatricol INT PRIMARY KEY,
Nume VARCHAR(50) NOT NULL,
Prenume VARCHAR(50) NOT NULL,
InitialaTata CHAR(1) NOT NULL,
CNP VARCHAR(13) NOT NULL,
DataInscriere DATE NOT NULL,
CicluInvatamant VARCHAR(50) NOT NULL,
MediaAdmitere DECIMAL(4, 2) NOT NULL
);

INSERT INTO Studenti_4LF413 (NrMatricol, Nume, Prenume, InitialaTata, CNP, DataInscriere, CicluInvatamant, MediaAdmitere)
VALUES ('4124565', 'Popescu', 'Vlad-Andrei', 'F', '502061406344', '2021-10-01', 'AIA', 9.45);

INSERT INTO Studenti_4LF413 (NrMatricol, Nume, Prenume, InitialaTata, CNP, DataInscriere, CicluInvatamant, MediaAdmitere)
VALUES ('4124335', 'Pop', 'Maria', 'G', '602121406344', '2021-10-01', 'AIA', 10);


SELECT *
FROM Studenti_4LF413
ORDER BY Nume ASC;

CREATE TABLE Note (
    IDNote INT PRIMARY KEY,
    StudentiID INT,
    DisciplineID INT,
    Nota DECIMAL(4, 2),
    FOREIGN KEY (StudentiID) REFERENCES Studenti_4LF413(NrMatricol),
    FOREIGN KEY (DisciplineID) REFERENCES Discipline(IDAni)
);




