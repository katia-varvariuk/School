@param String successMessage = null
@param String error = null

<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Вхід у систему</title>
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

        .login-form {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            padding: 30px;
            max-width: 500px;
            margin: 0 auto 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #333;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        .form-control:focus {
            border-color: #2a5298;
            outline: none;
        }

        .btn {
            display: inline-block;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            text-align: center;
            width: 100%;
        }

        .btn:hover {
            background: linear-gradient(135deg, #2a5298, #1e3c72);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .error-message {
            background-color: #ffebee;
            color: #c62828;
            padding: 10px 15px;
            border-radius: 4px;
            margin-bottom: 20px;
            border-left: 4px solid #c62828;
        }

        .success-message {
            background-color: #e8f5e9;
            color: #2e7d32;
            padding: 10px 15px;
            border-radius: 4px;
            margin-bottom: 20px;
            border-left: 4px solid #2e7d32;
        }

        .register-link {
            text-align: center;
            margin-top: 20px;
        }

        .register-link a {
            color: #2a5298;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s;
        }

        .register-link a:hover {
            color: #1e3c72;
            text-decoration: underline;
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

            .login-form {
                padding: 20px;
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
            <li><a href="/register">Реєстрація</a></li>
        </ul>
    </nav>

    <h1 class="page-title">Вхід у систему</h1>

    <div class="login-form">
        @if(successMessage != null)
            <div class="success-message">
                ${successMessage}
            </div>
        @endif

        @if(error != null)
            <div class="error-message">
                ${error}
            </div>
        @endif

        <form action="/login" method="post">
            <div class="form-group">
                <label for="username">Ім'я користувача</label>
                <input type="text" id="username" name="username" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="password">Пароль</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>
            <button type="submit" class="btn">Увійти</button>
        </form>

        <div class="register-link">
            <p>Немає облікового запису? <a href="/register">Зареєструватися</a></p>
        </div>
    </div>
</div>
</body>
</html>