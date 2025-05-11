
CREATE TABLE Students (
                          StudentID SERIAL PRIMARY KEY,
                          LastName VARCHAR(50),
                          FirstName VARCHAR(50),
                          MiddleName VARCHAR(50),
                          BirthDate DATE
);

CREATE TABLE Teachers (
                          TeacherID SERIAL PRIMARY KEY,
                          LastName VARCHAR(50),
                          FirstName VARCHAR(50),
                          MiddleName VARCHAR(50),
                          Email VARCHAR(100)
);

CREATE TABLE Subjects (
                          SubjectID SERIAL PRIMARY KEY,
                          SubjectName VARCHAR(100),
                          TeacherID INT,
                          FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);

CREATE TABLE GradesJournal (
                               JournalID SERIAL PRIMARY KEY,
                               StudentID INT,
                               SubjectID INT,
                               Grade INT,
                               GradeDate DATE,
                               FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
                               FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
);
