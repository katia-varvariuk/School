@param com.example.Project.data.gradeJournal grade
@param Iterable<com.example.Project.data.students> students
@param Iterable<com.example.Project.data.subjects> subjects
@param String error = null

<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Редагування оцінки</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', Arial, sans-serif;
            background-color: #f0f4f8;
            color: #333;
            line-height: 1.6;
            padding: 0;
            margin: 0;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        header {
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            color: white;
            padding: 20px 0;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            text-align: center;
        }

        header h1 {
            font-size: 28px;
            margin-bottom: 5px;
        }

        .nav-menu {
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
        }

        .nav-menu ul {
            display: flex;
            list-style: none;
            justify-content: center;
        }

        .nav-menu li {
            padding: 0;
            transition: background-color 0.3s;
        }

        .nav-menu a {
            display: block;
            text-decoration: none;
            color: #2a5298;
            font-weight: 600;
            padding: 15px 25px;
            transition: all 0.3s;
            position: relative;
        }

        .nav-menu a:hover {
            background-color: #f0f4f8;
            color: #1e3c72;
        }

        .page-title {
            text-align: center;
            color: #1e3c72;
            margin-bottom: 25px;
            font-size: 26px;
            position: relative;
            padding-bottom: 10px;
        }

        .page-title::after {
            content: '';
            position: absolute;
            width: 80px;
            height: 3px;
            background-color: #1e3c72;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
        }

        .form-container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #1e3c72;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 12px;
            border: 2px solid #e0e0e0;
            border-radius: 4px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        .form-group input:focus,
        .form-group select:focus {
            outline: none;
            border-color: #2a5298;
        }

        .btn-group {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin-top: 30px;
        }

        .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s;
            text-align: center;
        }

        .btn-primary {
            background-color: #1e3c72;
            color: white;
        }

        .btn-primary:hover {
            background-color: #2a5298;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }

        .btn-secondary:hover {
            background-color: #545b62;
        }

        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            padding: 12px;
            border-radius: 4px;
            margin-bottom: 20px;
            border-left: 4px solid #721c24;
        }

        .current-info {
            background-color: #e3f2fd;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
            border-left: 4px solid #2196f3;
        }

        .current-info h3 {
            color: #1565c0;
            margin-bottom: 10px;
        }

        @media (max-width: 768px) {
            .nav-menu ul {
                flex-direction: column;
            }

            .nav-menu a {
                text-align: center;
            }

            .btn-group {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
<header>
    <div class="container">
        <h1>Шкільна система управління</h1>
    </div>
</header>

<div class="container">
    <nav class="nav-menu">
        <ul>
            <li><a href="/">Головна</a></li>
            <li><a href="/students">Студенти</a></li>
            <li><a href="/teachers">Викладачі</a></li>
            <li><a href="/subjects">Предмети</a></li>
            <li><a href="/grades">Журнал оцінок</a></li>
        </ul>
    </nav>

    <h1 class="page-title">Редагування оцінки</h1>

    @if(error != null)
        <div class="error-message">
            Помилка при збереженні даних. Спробуйте ще раз.
        </div>
    @endif

    <div class="form-container">
        <div class="current-info">
            <h3>Поточні дані:</h3>
            <p><strong>ID:</strong> ${grade.getJournalId()}</p>
            <p><strong>Студент:</strong>
                @if(grade.getStudent() != null)
                    ${grade.getStudent().getLastName()} ${grade.getStudent().getFirstName()} ${grade.getStudent().getMiddleName()}
                @else
                    Не вказано
                @endif
            </p>
            <p><strong>Предмет:</strong>
                @if(grade.getSubject() != null)
                    ${grade.getSubject().getSubjectName()}
                @else
                    Не вказано
                @endif
            </p>
            <p><strong>Оцінка:</strong> ${grade.getGrade()}</p>
            <p><strong>Дата:</strong> ${grade.getGradeDate() != null ? grade.getGradeDate().toString() : "Не вказано"}</p>
        </div>

        <form method="post" action="/grades/edit/${grade.getJournalId()}">
            <div class="form-group">
                <label for="studentId">Студент:</label>
                <select id="studentId" name="studentId" required>
                    <option value="">Оберіть студента</option>
                    @for(var student : students)
                        <option value="${student.getStudentId()}"
                                selected="${grade.getStudent() != null && grade.getStudent().getStudentId().equals(student.getStudentId())}">
                            ${student.getLastName()} ${student.getFirstName()} ${student.getMiddleName()}
                        </option>
                    @endfor
                </select>
            </div>

            <div class="form-group">
                <label for="subjectId">Предмет:</label>
                <select id="subjectId" name="subjectId" required>
                    <option value="">Оберіть предмет</option>
                    @for(var subject : subjects)
                        <option value="${subject.getSubjectId()}"
                                selected="${grade.getSubject() != null && grade.getSubject().getSubjectId().equals(subject.getSubjectId())}">
                            ${subject.getSubjectName()}
                        </option>
                    @endfor
                </select>
            </div>

            <div class="form-group">
                <label for="grade">Оцінка:</label>
                <input type="number" id="grade" name="grade" min="0" max="100"
                       value="${grade.getGrade()}" required>
            </div>

            <div class="form-group">
                <label for="gradeDate">Дата оцінки:</label>
                <input type="date" id="gradeDate" name="gradeDate"
                       value="${grade.getGradeDate() != null ? grade.getGradeDate().toString() : ""}" required>
            </div>

            <div class="btn-group">
                <button type="submit" class="btn btn-primary">Зберегти зміни</button>
                <a href="/grades" class="btn btn-secondary">Скасувати</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>