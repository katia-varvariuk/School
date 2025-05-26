@param Iterable<com.example.Project.data.subjects> subjects

<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Створити викладача</title>
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

        .form-container {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            max-width: 600px;
            margin: 0 auto;
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

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #1e3c72;
            font-weight: 600;
            font-size: 14px;
        }

        .form-group input[type="text"],
        .form-group input[type="email"] {
            width: 100%;
            padding: 12px;
            border: 2px solid #e0e0e0;
            border-radius: 6px;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        .form-group input[type="text"]:focus,
        .form-group input[type="email"]:focus {
            outline: none;
            border-color: #2a5298;
        }

        .checkbox-group {
            border: 2px solid #e0e0e0;
            border-radius: 6px;
            padding: 15px;
            max-height: 200px;
            overflow-y: auto;
        }

        .checkbox-item {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .checkbox-item:last-child {
            margin-bottom: 0;
        }

        .checkbox-item input[type="checkbox"] {
            margin-right: 10px;
            transform: scale(1.2);
        }

        .checkbox-item label {
            margin-bottom: 0;
            cursor: pointer;
            font-weight: normal;
        }

        .btn {
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
            margin-right: 10px;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(30, 60, 114, 0.3);
        }

        .btn-secondary {
            background: #6c757d;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }

        .btn-secondary:hover {
            background: #5a6268;
            color: white;
        }

        .form-actions {
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }

        .required {
            color: #dc3545;
        }

        @media (max-width: 768px) {
            .nav-menu ul {
                flex-direction: column;
            }

            .nav-menu a {
                text-align: center;
            }

            .form-container {
                margin: 0 10px;
                padding: 20px;
            }

            .form-actions {
                flex-direction: column;
                align-items: center;
            }

            .btn {
                margin-bottom: 10px;
                margin-right: 0;
                width: 100%;
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

    <div class="form-container">
        <h1 class="page-title">Створити нового викладача</h1>

        <form action="/teachers/create" method="post">
            <div class="form-group">
                <label for="lastName">Прізвище <span class="required">*</span></label>
                <input type="text" id="lastName" name="lastName" required>
            </div>

            <div class="form-group">
                <label for="firstName">Ім'я <span class="required">*</span></label>
                <input type="text" id="firstName" name="firstName" required>
            </div>

            <div class="form-group">
                <label for="middleName">По батькові</label>
                <input type="text" id="middleName" name="middleName">
            </div>

            <div class="form-group">
                <label for="email">Email <span class="required">*</span></label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label>Предмети, які викладає:</label>
                <div class="checkbox-group">
                    @for(var subject : subjects)
                        <div class="checkbox-item">
                            <input type="checkbox"
                                   id="subject_${subject.getSubjectId()}"
                                   name="subjectIds"
                                   value="${subject.getSubjectId()}">
                            <label for="subject_${subject.getSubjectId()}">
                                ${subject.getSubjectName()}
                                @if(subject.getTeacher() != null)
                                    <span style="color: #888; font-size: 12px;">
                                        (зараз: ${subject.getTeacher().getLastName()} ${subject.getTeacher().getFirstName()})
                                    </span>
                                @endif
                            </label>
                        </div>
                    @endfor
                </div>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn">Створити викладача</button>
                <a href="/teachers" class="btn btn-secondary">Скасувати</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>