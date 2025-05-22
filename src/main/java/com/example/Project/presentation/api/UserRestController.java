package com.example.Project.presentation.api;

import com.example.Project.data.Users;
import com.example.Project.dto.UserRegistrationDto;
import com.example.Project.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/users")
public class UserRestController {

    private final UserService userService;

    @Autowired
    public UserRestController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/register")
    public ResponseEntity<?> registerUser(@RequestBody UserRegistrationDto registrationDto) {
        Map<String, Object> response = new HashMap<>();

        Map<String, String> errors = validateRegistrationData(registrationDto);
        if (!errors.isEmpty()) {
            response.put("errors", errors);
            return ResponseEntity.badRequest().body(response);
        }

        if (!userService.passwordsMatch(registrationDto.getPassword(), registrationDto.getConfirmPassword())) {
            response.put("error", "Паролі не співпадають");
            return ResponseEntity.badRequest().body(response);
        }

        Users registeredUser = userService.registerUser(registrationDto);
        if (registeredUser == null) {
            response.put("error", "Користувач з таким ім'ям вже існує");
            return ResponseEntity.badRequest().body(response);
        }
        response.put("success", "Користувач успішно зареєстрований");
        response.put("username", registeredUser.getUserName());
        response.put("fullName", registeredUser.getFullName());
        response.put("role", registeredUser.getRole());
        response.put("id", registeredUser.getId());

        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    private Map<String, String> validateRegistrationData(UserRegistrationDto dto) {
        Map<String, String> errors = new HashMap<>();

        if (dto.getFirstName() == null || dto.getFirstName().trim().isEmpty()) {
            errors.put("firstName", "Ім'я не може бути порожнім");
        }

        if (dto.getLastName() == null || dto.getLastName().trim().isEmpty()) {
            errors.put("lastName", "Прізвище не може бути порожнім");
        }

        if (dto.getUsername() == null || dto.getUsername().trim().isEmpty()) {
            errors.put("username", "Ім'я користувача не може бути порожнім");
        } else if (dto.getUsername().length() < 3) {
            errors.put("username", "Ім'я користувача повинно містити мінімум 3 символи");
        }

        if (dto.getPassword() == null || dto.getPassword().trim().isEmpty()) {
            errors.put("password", "Пароль не може бути порожнім");
        } else if (dto.getPassword().length() < 6) {
            errors.put("password", "Пароль повинен містити мінімум 6 символів");
        }

        return errors;
    }
}