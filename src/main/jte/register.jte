@param com.example.Project.data.Users user = null
@param String error = null
@param String successMessage = null

<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Реєстрація</title>
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

        .register-form {
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
            box-shadow: 0 0 0 3px rgba(42, 82, 152, 0.1);
        }

        .form-control.error {
            border-color: #e74c3c;
        }

        .form-group.error .form-control {
            border-color: #e74c3c;
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

        .btn:disabled {
            background: #ccc;
            cursor: not-allowed;
            transform: none;
            box-shadow: none;
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

        .field-error {
            color: #e74c3c;
            font-size: 14px;
            margin-top: 5px;
            display: none;
        }

        .form-group.error .field-error {
            display: block;
        }

        .login-link {
            text-align: center;
            margin-top: 20px;
        }

        .login-link a {
            color: #2a5298;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s;
        }

        .login-link a:hover {
            color: #1e3c72;
            text-decoration: underline;
        }

        .password-requirements {
            font-size: 14px;
            color: #666;
            margin-top: 5px;
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

            .register-form {
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
            <li><a href="/login">Увійти</a></li>
        </ul>
    </nav>

    <h1 class="page-title">Реєстрація нового користувача</h1>

    <div class="register-form">
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

        <form id="registrationForm" action="/register" method="POST">
            <div class="form-group" id="firstNameGroup">
                <label for="firstName">Ім'я *</label>
                <input type="text"
                       id="firstName"
                       name="firstName"
                       class="form-control"
                       placeholder="Введіть ваше ім'я"
                       value="${user != null ? user.getFirstName() : ""}"
                       required>
                <p class="field-error">Ім'я не може бути порожнім</p>
            </div>

            <div class="form-group" id="lastNameGroup">
                <label for="lastName">Прізвище *</label>
                <input type="text"
                       id="lastName"
                       name="lastName"
                       class="form-control"
                       placeholder="Введіть ваше прізвище"
                       value="${user != null ? user.getLastName() : ""}"
                       required>
                <p class="field-error">Прізвище не може бути порожнім</p>
            </div>

            <div class="form-group" id="usernameGroup">
                <label for="username">Ім'я користувача *</label>
                <input type="text"
                       id="username"
                       name="username"
                       class="form-control"
                       placeholder="Введіть ім'я користувача"
                       value="${user != null ? user.getUserName() : ""}"
                       required>
                <div class="password-requirements">Мінімум 3 символи</div>
                <p class="field-error">Ім'я користувача повинно містити мінімум 3 символи</p>
            </div>

            <div class="form-group" id="passwordGroup">
                <label for="password">Пароль *</label>
                <input type="password"
                       id="password"
                       name="password"
                       class="form-control"
                       placeholder="Створіть пароль"
                       required>
                <div class="password-requirements">Мінімум 6 символів</div>
                <p class="field-error">Пароль повинен містити мінімум 6 символів</p>
            </div>

            <div class="form-group" id="confirmPasswordGroup">
                <label for="confirmPassword">Підтвердження пароля *</label>
                <input type="password"
                       id="confirmPassword"
                       name="confirmPassword"
                       class="form-control"
                       placeholder="Підтвердіть пароль"
                       required>
                <p class="field-error">Паролі не співпадають</p>
            </div>

            <button type="submit" class="btn" id="submitBtn">Зареєструватися</button>
        </form>

        <div class="login-link">
            <p>Уже маєте обліковий запис? <a href="/login">Увійти</a></p>
        </div>
    </div>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById('registrationForm');
        const submitBtn = document.getElementById('submitBtn');
        const firstName = document.getElementById('firstName');
        const lastName = document.getElementById('lastName');
        const username = document.getElementById('username');
        const password = document.getElementById('password');
        const confirmPassword = document.getElementById('confirmPassword');

        const firstNameGroup = document.getElementById('firstNameGroup');
        const lastNameGroup = document.getElementById('lastNameGroup');
        const usernameGroup = document.getElementById('usernameGroup');
        const passwordGroup = document.getElementById('passwordGroup');
        const confirmPasswordGroup = document.getElementById('confirmPasswordGroup');
        function validateField(field, group, condition, errorMessage) {
            if (condition) {
                group.classList.remove('error');
                return true;
            } else {
                group.classList.add('error');
                const errorElement = group.querySelector('.field-error');
                if (errorElement && errorMessage) {
                    errorElement.textContent = errorMessage;
                }
                return false;
            }
        }

        firstName.addEventListener('input', function() {
            validateField(firstName, firstNameGroup,
                firstName.value.trim().length > 0,
                'Ім\'я не може бути порожнім');
        });

        lastName.addEventListener('input', function() {
            validateField(lastName, lastNameGroup,
                lastName.value.trim().length > 0,
                'Прізвище не може бути порожнім');
        });

        username.addEventListener('input', function() {
            validateField(username, usernameGroup,
                username.value.trim().length >= 3,
                'Ім\'я користувача повинно містити мінімум 3 символи');
        });

        password.addEventListener('input', function() {
            validateField(password, passwordGroup,
                password.value.length >= 6,
                'Пароль повинен містити мінімум 6 символів');

            if (confirmPassword.value) {
                validateField(confirmPassword, confirmPasswordGroup,
                    confirmPassword.value === password.value,
                    'Паролі не співпадають');
            }
        });

        confirmPassword.addEventListener('input', function() {
            validateField(confirmPassword, confirmPasswordGroup,
                confirmPassword.value === password.value,
                'Паролі не співпадають');
        });

        form.addEventListener('submit', function(e) {
            e.preventDefault();

            let isValid = true;

            isValid &= validateField(firstName, firstNameGroup,
                firstName.value.trim().length > 0,
                'Ім\'я не може бути порожнім');

            isValid &= validateField(lastName, lastNameGroup,
                lastName.value.trim().length > 0,
                'Прізвище не може бути порожнім');

            isValid &= validateField(username, usernameGroup,
                username.value.trim().length >= 3,
                'Ім\'я користувача повинно містити мінімум 3 символи');

            isValid &= validateField(password, passwordGroup,
                password.value.length >= 6,
                'Пароль повинен містити мінімум 6 символів');

            isValid &= validateField(confirmPassword, confirmPasswordGroup,
                confirmPassword.value === password.value,
                'Паролі не співпадають');

            if (isValid) {
                submitBtn.disabled = true;
                submitBtn.textContent = 'Реєстрація...';

                const registrationData = {
                    firstName: firstName.value.trim(),
                    lastName: lastName.value.trim(),
                    username: username.value.trim(),
                    password: password.value,
                    confirmPassword: confirmPassword.value
                };

                fetch('/api/users/register', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(registrationData)
                })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            showSuccessMessage(data.success);
                            setTimeout(() => {
                                window.location.href = '/login';
                            }, 2000);
                        } else {
                            handleErrors(data);
                        }
                    })
                    .catch(error => {
                        console.error('Помилка:', error);
                        showErrorMessage('Сталася помилка при реєстрації. Спробуйте ще раз.');
                    })
                    .finally(() => {
                        submitBtn.disabled = false;
                        submitBtn.textContent = 'Зареєструватися';
                    });
            }
        });

        [firstName, lastName, username, password, confirmPassword].forEach(field => {
            field.addEventListener('focus', function() {
                const group = field.closest('.form-group');
                if (group && group.classList.contains('error')) {
                    group.classList.remove('error');
                }
            });
        });

        username.addEventListener('input', function() {
            const value = username.value.trim();
            const hasValidChars = /^[a-zA-Z0-9_.-]+$/.test(value);

            if (value.length >= 3 && !hasValidChars) {
                validateField(username, usernameGroup, false,
                    'Ім\'я користувача може містити тільки літери, цифри, крапки, тире і підкреслення');
            } else if (value.length < 3) {
                validateField(username, usernameGroup, false,
                    'Ім\'я користувача повинно містити мінімум 3 символи');
            } else {
                validateField(username, usernameGroup, true);
            }
        });

        function addPasswordToggle(passwordInput) {
            const group = passwordInput.parentElement;
            const toggleBtn = document.createElement('button');
            toggleBtn.type = 'button';
            toggleBtn.innerHTML = '👁️';
            toggleBtn.style.cssText = `
                position: absolute;
                right: 12px;
                top: 50%;
                transform: translateY(-50%);
                background: none;
                border: none;
                cursor: pointer;
                font-size: 16px;
            `;

            group.style.position = 'relative';
            passwordInput.style.paddingRight = '40px';
            group.appendChild(toggleBtn);

            toggleBtn.addEventListener('click', function() {
                if (passwordInput.type === 'password') {
                    passwordInput.type = 'text';
                    toggleBtn.innerHTML = '🙈';
                } else {
                    passwordInput.type = 'password';
                    toggleBtn.innerHTML = '👁️';
                }
            });
        }

        addPasswordToggle(password);
        addPasswordToggle(confirmPassword);

        function showSuccessMessage(message) {
            removeMessages();

            const successDiv = document.createElement('div');
            successDiv.className = 'success-message';
            successDiv.textContent = message;

            const form = document.querySelector('.register-form');
            form.insertBefore(successDiv, form.firstChild);
        }

        function showErrorMessage(message) {
            removeMessages();

            const errorDiv = document.createElement('div');
            errorDiv.className = 'error-message';
            errorDiv.textContent = message;

            const form = document.querySelector('.register-form');
            form.insertBefore(errorDiv, form.firstChild);
        }

        function removeMessages() {
            const existingMessages = document.querySelectorAll('.success-message, .error-message');
            existingMessages.forEach(msg => msg.remove());
        }

        function handleErrors(data) {
            document.querySelectorAll('.form-group').forEach(group => {
                group.classList.remove('error');
            });

            if (data.errors) {
                Object.keys(data.errors).forEach(fieldName => {
                    const group = document.getElementById(fieldName + 'Group');
                    if (group) {
                        group.classList.add('error');
                        const errorElement = group.querySelector('.field-error');
                        if (errorElement) {
                            errorElement.textContent = data.errors[fieldName];
                        }
                    }
                });
            } else if (data.error) {
                showErrorMessage(data.error);
            }
        }
    });
</script>
</body>
</html>