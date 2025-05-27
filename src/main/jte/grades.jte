@param Iterable<com.example.Project.data.gradeJournal> grades
@param String updated = null
@param String deleted = null

<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Журнал оцінок</title>
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

        .success-message {
            background-color: #e8f5e9;
            color: #2e7d32;
            padding: 12px 20px;
            border-radius: 4px;
            margin-bottom: 20px;
            border-left: 4px solid #2e7d32;
            text-align: center;
        }

        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            padding: 12px 20px;
            border-radius: 4px;
            margin-bottom: 20px;
            border-left: 4px solid #721c24;
            text-align: center;
        }

        .data-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
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

        .action-buttons {
            display: flex;
            gap: 8px;
            justify-content: center;
        }

        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s;
            text-align: center;
        }

        .btn-edit {
            background-color: #007bff;
            color: white;
        }

        .btn-edit:hover {
            background-color: #0056b3;
        }

        .btn-delete {
            background-color: #dc3545;
            color: white;
        }

        .btn-delete:hover {
            background-color: #c82333;
        }

        /* Модальне вікно */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
            animation-duration: 0.3s;
        }

        .modal.show {
            display: block;
            animation-name: fadeIn;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 30px;
            border: none;
            border-radius: 8px;
            width: 90%;
            max-width: 500px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            animation-name: slideIn;
            animation-duration: 0.3s;
        }

        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 2px solid #e0e0e0;
        }

        .modal-title {
            color: #dc3545;
            font-size: 22px;
            font-weight: 600;
            margin: 0;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
            transition: color 0.3s;
        }

        .close:hover,
        .close:focus {
            color: #dc3545;
        }

        .modal-body {
            margin-bottom: 25px;
            font-size: 16px;
            line-height: 1.6;
        }

        .modal-body .grade-info {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 6px;
            margin: 15px 0;
            border-left: 4px solid #dc3545;
        }

        .modal-footer {
            display: flex;
            justify-content: flex-end;
            gap: 15px;
        }

        .btn-modal {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn-confirm {
            background-color: #dc3545;
            color: white;
        }

        .btn-confirm:hover {
            background-color: #c82333;
        }

        .btn-cancel {
            background-color: #6c757d;
            color: white;
        }

        .btn-cancel:hover {
            background-color: #545b62;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideIn {
            from { transform: translateY(-50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #6c757d;
        }

        .empty-state h3 {
            margin-bottom: 10px;
            font-size: 20px;
        }

        footer {
            text-align: center;
            padding: 20px;
            background-color: #1e3c72;
            color: #f0f4f8;
            margin-top: 30px;
            font-size: 14px;
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

            .action-buttons {
                flex-direction: column;
            }

            .modal-content {
                margin: 10% auto;
                width: 95%;
            }

            .modal-footer {
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

    <h1 class="page-title">Журнал оцінок</h1>

    @if(updated != null && updated.equals("true"))
        <div class="success-message">
            ✅ Оцінка успішно оновлена!
        </div>
    @endif

    @if(deleted != null && deleted.equals("true"))
        <div class="success-message">
            ✅ Оцінка успішно видалена!
        </div>
    @endif

    @if(deleted != null && deleted.equals("error"))
        <div class="error-message">
            ❌ Помилка при видаленні оцінки!
        </div>
    @endif

    @if(grades != null && grades.iterator().hasNext())
        <table class="data-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Студент</th>
                <th>Предмет</th>
                <th>Оцінка</th>
                <th>Дата</th>
                <th>Дії</th>
            </tr>
            </thead>
            <tbody>
            @for(var grade : grades)
                <tr>
                    <td>${grade.getJournalId()}</td>
                    <td>
                        @if(grade.getStudent() != null)
                            ${grade.getStudent().getLastName()} ${grade.getStudent().getFirstName()}
                            @if(grade.getStudent().getMiddleName() != null)
                                ${grade.getStudent().getMiddleName()}
                            @endif
                        @else
                            Не вказано
                        @endif
                    </td>
                    <td>
                        @if(grade.getSubject() != null)
                            ${grade.getSubject().getSubjectName()}
                        @else
                            Не вказано
                        @endif
                    </td>
                    <td class="grade-cell
                        @if(grade.getGrade() >= 90)
                            high-grade
                        @elseif(grade.getGrade() >= 70)
                            medium-grade
                        @else
                            low-grade
                        @endif
                    ">
                        ${grade.getGrade()}
                    </td>
                    <td>
                        @if(grade.getGradeDate() != null)
                            ${grade.getGradeDate().toString()}
                        @else
                            Не вказано
                        @endif
                    </td>
                    <td>
                        <div class="action-buttons">
                            <a href="/grades/edit/${grade.getJournalId()}" class="btn btn-edit">
                                ✏️ Редагувати
                            </a>
                            <button class="btn btn-delete" onclick="showDeleteModal(
                                    '${grade.getJournalId()}',
                                    '@if(grade.getStudent() != null)${grade.getStudent().getLastName()} ${grade.getStudent().getFirstName()} @if(grade.getStudent().getMiddleName() != null)${grade.getStudent().getMiddleName()}@endif@else Не вказано@endif',
                                    '@if(grade.getSubject() != null)${grade.getSubject().getSubjectName()}@else Не вказано@endif',
                                    '${grade.getGrade()}'
                                    )">
                                🗑️ Видалити
                            </button>
                        </div>
                    </td>
                </tr>
            @endfor
            </tbody>
        </table>
    @else
        <div class="empty-state">
            <h3>Оцінки відсутні</h3>
            <p>В журналі поки що немає жодної оцінки.</p>
        </div>
    @endif
</div>

<div id="deleteModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h2 class="modal-title">Підтвердження видалення</h2>
            <span class="close" onclick="closeDeleteModal()">&times;</span>
        </div>
        <div class="modal-body">
            <p>Ви дійсно хочете видалити цю оцінку?</p>
            <div class="grade-info">
                <strong>Деталі оцінки:</strong><br>
                <span id="modal-student">Студент: </span><br>
                <span id="modal-subject">Предмет: </span><br>
                <span id="modal-grade">Оцінка: </span>
            </div>
            <p><strong>Увага!</strong> Ця дія є незворотною.</p>
        </div>
        <div class="modal-footer">
            <button class="btn-modal btn-cancel" onclick="closeDeleteModal()">Скасувати</button>
            <form id="deleteForm" method="post" style="display: inline;">
                <button type="submit" class="btn-modal btn-confirm">Видалити</button>
            </form>
        </div>
    </div>
</div>

<script>
    function showDeleteModal(id, student, subject, grade) {
        document.getElementById('modal-student').innerHTML = 'Студент: ' + student;
        document.getElementById('modal-subject').innerHTML = 'Предмет: ' + subject;
        document.getElementById('modal-grade').innerHTML = 'Оцінка: ' + grade;

        document.getElementById('deleteForm').action = '/grades/delete/' + id;
        document.getElementById('deleteModal').classList.add('show');
    }

    function closeDeleteModal() {
        document.getElementById('deleteModal').classList.remove('show');
    }
    window.onclick = function(event) {
        const modal = document.getElementById('deleteModal');
        if (event.target === modal) {
            closeDeleteModal();
        }
    }
    document.addEventListener('keydown', function(event) {
        if (event.key === 'Escape') {
            closeDeleteModal();
        }
    });
</script>

</body>
</html>