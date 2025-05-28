@param Iterable<com.example.Project.data.teachers> teachers
@param Iterable<com.example.Project.data.subjects> subjects = null
@param String successMessage = null
@param String errorMessage = null
@param String searchMessage = null
@param String searchValue = null
@param String searchType = null
@param Boolean isSearchResult = false
@param Integer searchResultsCount = null

<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Список викладачів</title>
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
            background-color: #d4edda;
            color: #155724;
            padding: 12px 20px;
            border-radius: 6px;
            margin-bottom: 20px;
            border-left: 4px solid #28a745;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            padding: 12px 20px;
            border-radius: 6px;
            margin-bottom: 20px;
            border-left: 4px solid #dc3545;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .search-message {
            background-color: #d1ecf1;
            color: #0c5460;
            padding: 12px 20px;
            border-radius: 6px;
            margin-bottom: 20px;
            border-left: 4px solid #17a2b8;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .search-container {
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
        }

        .search-form {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            align-items: end;
        }

        .form-group {
            flex: 1;
            min-width: 200px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #1e3c72;
            font-weight: 600;
            font-size: 14px;
        }

        .form-group select,
        .form-group input[type="text"] {
            width: 100%;
            padding: 10px 12px;
            border: 2px solid #e0e0e0;
            border-radius: 6px;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        .form-group select:focus,
        .form-group input[type="text"]:focus {
            outline: none;
            border-color: #2a5298;
        }

        .search-buttons {
            display: flex;
            gap: 10px;
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            flex-wrap: wrap;
        }

        .btn {
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
            display: inline-block;
            text-align: center;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(30, 60, 114, 0.3);
        }

        .btn-success {
            background: linear-gradient(135deg, #28a745, #20c997);
        }

        .btn-success:hover {
            box-shadow: 0 4px 8px rgba(40, 167, 69, 0.3);
        }

        .btn-info {
            background: linear-gradient(135deg, #17a2b8, #138d9e);
        }

        .btn-info:hover {
            box-shadow: 0 4px 8px rgba(23, 162, 184, 0.3);
        }

        .btn-secondary {
            background: linear-gradient(135deg, #6c757d, #5a6268);
        }

        .btn-secondary:hover {
            box-shadow: 0 4px 8px rgba(108, 117, 125, 0.3);
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

        .no-results {
            text-align: center;
            padding: 40px;
            color: #6c757d;
            font-style: italic;
        }

        .results-info {
            background-color: #e7f3ff;
            padding: 10px 15px;
            border-radius: 6px;
            margin-bottom: 20px;
            color: #1e3c72;
            font-weight: 500;
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

            .page-header {
                flex-direction: column;
                text-align: center;
                gap: 15px;
            }

            .search-form {
                flex-direction: column;
            }

            .search-buttons {
                justify-content: center;
            }

            .data-table {
                overflow-x: auto;
                display: block;
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

    @if(successMessage != null)
        <div class="success-message">
            ${successMessage}
        </div>
    @endif

    @if(errorMessage != null)
        <div class="error-message">
            ${errorMessage}
        </div>
    @endif

    @if(searchMessage != null)
        <div class="search-message">
            ${searchMessage}
        </div>
    @endif

    <div class="search-container">
        <form action="/teachers/search" method="get" class="search-form">
            <div class="form-group">
                <label for="searchType">Тип пошуку:</label>
                <select id="searchType" name="searchType" onchange="toggleSearchInput()">
                    @if(searchType != null && searchType.equals("subjectName"))
                        <option value="subjectName" selected>За назвою предмету</option>
                    @else
                        <option value="subjectName">За назвою предмету</option>
                    @endif
                    @if(searchType != null && searchType.equals("subjectId"))
                        <option value="subjectId" selected>Вибрати предмет зі списку</option>
                    @else
                        <option value="subjectId">Вибрати предмет зі списку</option>
                    @endif
                </select>
            </div>

            <div class="form-group" id="searchNameGroup">
                <label for="searchName">Назва предмету:</label>
                @if(searchValue != null && searchType != null && searchType.equals("subjectName"))
                    <input type="text" id="searchName" name="searchValue" value="${searchValue}" placeholder="Введіть назву предмету...">
                @else
                    <input type="text" id="searchName" name="searchValue" value="" placeholder="Введіть назву предмету...">
                @endif
            </div>

            <div class="form-group" id="searchSelectGroup" style="display: none;">
                <label for="searchSelect">Виберіть предмет:</label>
                <select id="searchSelect" name="searchValue">
                    <option value="">-- Виберіть предмет --</option>
                    @if(subjects != null)
                        @for(var subject : subjects)
                            @if(searchValue != null && searchType != null && searchType.equals("subjectId") && searchValue.equals(subject.getSubjectId().toString()))
                                <option value="${subject.getSubjectId()}" selected>${subject.getSubjectName()}</option>
                            @else
                                <option value="${subject.getSubjectId()}">${subject.getSubjectName()}</option>
                            @endif
                        @endfor
                    @endif
                </select>
            </div>

            <div class="search-buttons">
                <button type="submit" class="btn btn-info">🔍 Пошук</button>
                <a href="/teachers" class="btn btn-secondary">Очистити</a>
            </div>
        </form>
    </div>

    @if(isSearchResult != null && isSearchResult && searchResultsCount != null)
        <div class="results-info">
            Знайдено результатів: ${searchResultsCount}
        </div>
    @endif

    <div class="page-header">
        <h1 class="page-title">
            @if(isSearchResult != null && isSearchResult)
                Результати пошуку викладачів
            @else
                Список викладачів
            @endif
        </h1>
        <a href="/teachers/new" class="btn btn-success">+ Додати викладача</a>
    </div>

    @if(teachers != null && teachers.iterator().hasNext())
        <table class="data-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Прізвище</th>
                <th>Ім'я</th>
                <th>По батькові</th>
                <th>Email</th>
                <th>Предмети</th>
                <th>Кількість предметів</th>
            </tr>
            </thead>
            <tbody>
            @for(var teacher : teachers)
                <tr>
                    <td>${teacher.getTeacherId()}</td>
                    <td>${teacher.getLastName()}</td>
                    <td>${teacher.getFirstName()}</td>
                    <td>${teacher.getMiddleName()}</td>
                    <td>${teacher.getEmail()}</td>
                    <td>
                        @if(teacher.getSubjects() != null && !teacher.getSubjects().isEmpty())
                            @for(var subject : teacher.getSubjects())
                                <span style="background-color: #e7f3ff; padding: 2px 6px; border-radius: 3px; margin: 1px; display: inline-block; font-size: 12px;">
                                    ${subject.getSubjectName()}
                                </span>
                            @endfor
                        @else
                            <span style="color: #888; font-style: italic;">Немає предметів</span>
                        @endif
                    </td>
                    <td>
                        @if(teacher.getSubjects() != null)
                            ${teacher.getSubjects().size()}
                        @else
                            0
                        @endif
                    </td>
                </tr>
            @endfor
            </tbody>
        </table>
    @else
        <div class="no-results">
            @if(isSearchResult != null && isSearchResult)
                😔 За вашим запитом викладачів не знайдено. Спробуйте змінити критерії пошуку.
            @else
                📚 Викладачі ще не додані до системи.
            @endif
        </div>
    @endif
</div>

<script>
    function toggleSearchInput() {
        const searchType = document.getElementById('searchType').value;
        const searchNameGroup = document.getElementById('searchNameGroup');
        const searchSelectGroup = document.getElementById('searchSelectGroup');
        const searchName = document.getElementById('searchName');
        const searchSelect = document.getElementById('searchSelect');

        if (searchType === 'subjectName') {
            searchNameGroup.style.display = 'block';
            searchSelectGroup.style.display = 'none';
            searchName.setAttribute('name', 'searchValue');
            searchSelect.removeAttribute('name');
        } else {
            searchNameGroup.style.display = 'none';
            searchSelectGroup.style.display = 'block';
            searchSelect.setAttribute('name', 'searchValue');
            searchName.removeAttribute('name');
        }
    }
    document.addEventListener('DOMContentLoaded', function() {
        toggleSearchInput();
    });
</script>

</body>
</html>