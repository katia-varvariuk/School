@param com.example.Project.data.students student
@param java.util.Set<com.example.Project.data.gradeJournal> grades

<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Деталі студента - ${student.getLastName()} ${student.getFirstName()}</title>
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
            max-width: 1200px;
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

        .nav-menu a::after {
            content: '';
            position: absolute;
            width: 0;
            height: 3px;
            bottom: 0;
            left: 50%;
            background-color: #1e3c72;
            transition: all 0.3s;
            transform: translateX(-50%);
        }

        .nav-menu a:hover::after {
            width: 70%;
        }

        .student-info {
            background-color: white;
            border-radius: 12px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
        }

        .student-info h2 {
            color: #1e3c72;
            margin-bottom: 20px;
            font-size: 24px;
            text-align: center;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 20px;
        }

        .info-item {
            display: flex;
            flex-direction: column;
        }

        .info-label {
            font-weight: 600;
            color: #2a5298;
            margin-bottom: 5px;
        }

        .info-value {
            font-size: 16px;
            color: #333;
            padding: 8px 12px;
            background-color: #f8f9fa;
            border-radius: 6px;
        }

        .grades-section {
            background-color: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
        }

        .section-title {
            text-align: center;
            color: #1e3c72;
            margin-bottom: 25px;
            font-size: 22px;
            position: relative;
            padding-bottom: 10px;
        }

        .section-title::after {
            content: '';
            position: absolute;
            width: 80px;
            height: 3px;
            background-color: #1e3c72;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
        }

        .data-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }

        .data-table th {
            background-color: #1e3c72;
            color: white;
            padding: 15px;
            text-align: left;
            font-weight: 600;
        }

        .data-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #e0e0e0;
        }

        .data-table tr:last-child td {
            border-bottom: none;
        }

        .data-table tr:hover {
            background-color: #f5f9ff;
        }

        .grade-cell {
            font-weight: bold;
            text-align: center;
        }

        .high-grade {
            color: #27ae60;
        }

        .medium-grade {
            color: #f39c12;
        }

        .low-grade {
            color: #e74c3c;
        }

        .back-button {
            display: inline-block;
            background-color: #2a5298;
            color: white;
            padding: 12px 24px;
            text-decoration: none;
            border-radius: 6px;
            margin-bottom: 20px;
            transition: background-color 0.3s;
        }

        .back-button:hover {
            background-color: #1e3c72;
        }

        .no-grades {
            text-align: center;
            color: #666;
            font-style: italic;
            padding: 40px;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 15px;
            margin-top: 20px;
        }

        .stat-card {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            text-align: center;
            border-left: 4px solid #2a5298;
        }

        .stat-value {
            font-size: 24px;
            font-weight: bold;
            color: #1e3c72;
        }

        .stat-label {
            font-size: 12px;
            color: #666;
            margin-top: 5px;
        }

        @media (max-width: 768px) {
            .nav-menu ul {
                flex-direction: column;
            }

            .nav-menu a {
                text-align: center;
            }

            .data-table {
                overflow-x: auto;
                display: block;
            }

            .info-grid {
                grid-template-columns: 1fr;
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

    <a href="/students" class="back-button">← Повернутись до списку студентів</a>

    <div class="student-info">
        <h2>Інформація про студента</h2>
        <div class="info-grid">
            <div class="info-item">
                <span class="info-label">ID студента:</span>
                <span class="info-value">${student.getStudentId()}</span>
            </div>
            <div class="info-item">
                <span class="info-label">Прізвище:</span>
                <span class="info-value">${student.getLastName()}</span>
            </div>
            <div class="info-item">
                <span class="info-label">Ім'я:</span>
                <span class="info-value">${student.getFirstName()}</span>
            </div>
            <div class="info-item">
                <span class="info-label">По батькові:</span>
                <span class="info-value">${student.getMiddleName()}</span>
            </div>
            <div class="info-item">
                <span class="info-label">Дата народження:</span>
                <span class="info-value">${student.getBirthDate() != null ? student.getBirthDate().toString() : "Не вказано"}</span>
            </div>
        </div>

        @if(grades != null && !grades.isEmpty())
            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-value">${grades.size()}</div>
                    <div class="stat-label">Всього оцінок</div>
                </div>
                <div class="stat-card">
                    <div class="stat-value">${String.format("%.1f", grades.stream().mapToInt(g -> g.getGrade()).average().orElse(0.0))}</div>
                    <div class="stat-label">Середній бал</div>
                </div>
                <div class="stat-card">
                    <div class="stat-value">${grades.stream().mapToInt(g -> g.getGrade()).max().orElse(0)}</div>
                    <div class="stat-label">Найвища оцінка</div>
                </div>
                <div class="stat-card">
                    <div class="stat-value">${grades.stream().mapToInt(g -> g.getGrade()).min().orElse(0)}</div>
                    <div class="stat-label">Найнижча оцінка</div>
                </div>
            </div>
        @endif
    </div>

    <div class="grades-section">
        <h2 class="section-title">Журнал оцінок студента</h2>

        @if(grades != null && !grades.isEmpty())
            <table class="data-table">
                <thead>
                <tr>
                    <th>ID запису</th>
                    <th>Предмет</th>
                    <th>Викладач</th>
                    <th>Оцінка</th>
                    <th>Дата</th>
                </tr>
                </thead>
                <tbody>
                @for(var grade : grades)
                    <tr>
                        <td>${grade.getJournalId()}</td>
                        <td>
                            @if(grade.getSubject() != null)
                                ${grade.getSubject().getSubjectName()}
                            @else
                                Невідомий предмет
                            @endif
                        </td>
                        <td>
                            @if(grade.getSubject() != null && grade.getSubject().getTeacher() != null)
                                ${grade.getSubject().getTeacher().getLastName()} ${grade.getSubject().getTeacher().getFirstName()}
                            @else
                                Не призначено
                            @endif
                        </td>
                        <td class="grade-cell ${grade.getGrade() >= 90 ? "high-grade" : (grade.getGrade() >= 75 ? "medium-grade" : "low-grade")}">
                            ${grade.getGrade()}
                        </td>
                        <td>${grade.getGradeDate() != null ? grade.getGradeDate().toString() : "Не вказано"}</td>
                    </tr>
                @endfor
                </tbody>
            </table>
        @else
            <div class="no-grades">
                <p>У цього студента ще немає оцінок в системі.</p>
            </div>
        @endif
    </div>
</div>
</body>
</html>