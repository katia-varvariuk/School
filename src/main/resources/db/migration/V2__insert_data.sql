
INSERT INTO Teachers (LastName, FirstName, MiddleName, Email) VALUES
                                                                  ('Іваненко', 'Ольга', 'Петрівна', 'ivanenko@school.edu'),
                                                                  ('Петренко', 'Сергій', 'Миколайович', 'petrenko@school.edu'),
                                                                  ('Коваленко', 'Ірина', 'Андріївна', 'kovalenko@school.edu');


INSERT INTO Students (LastName, FirstName, MiddleName, BirthDate) VALUES
                                                                      ('Шевченко', 'Андрій', 'Васильович', '2007-03-15'),
                                                                      ('Мельник', 'Олена', 'Ігорівна', '2006-11-02'),
                                                                      ('Козак', 'Юрій', 'Анатолійович', '2007-07-29');


INSERT INTO Subjects (SubjectName, TeacherID) VALUES
                                                  ('Математика', 1),
                                                  ('Українська мова', 2),
                                                  ('Історія', 3);


INSERT INTO GradesJournal (StudentID, SubjectID, Grade, GradeDate) VALUES
                                                                       (1, 1, 10, '2024-09-15'),
                                                                       (1, 2, 9,  '2024-09-16'),
                                                                       (2, 1, 12, '2024-09-15'),
                                                                       (2, 3, 8,  '2024-09-17'),
                                                                       (3, 2, 7,  '2024-09-16'),
                                                                       (3, 3, 11, '2024-09-17');
