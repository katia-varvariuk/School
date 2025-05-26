package com.example.Project.presentation;

import com.example.Project.data.Users;
import com.example.Project.dto.UserRegistrationDto;
import com.example.Project.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class userController {

    private final UserService userService;

    @Autowired
    public userController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new Users());
        model.addAttribute("registrationDto", new UserRegistrationDto());
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute UserRegistrationDto registrationDto,
                               Model model,
                               RedirectAttributes redirectAttributes) {

        if (!isValidRegistrationData(registrationDto, model)) {
            Users userWithData = createUserFromDto(registrationDto);
            model.addAttribute("user", userWithData);
            return "register";
        }

        if (!userService.passwordsMatch(registrationDto.getPassword(), registrationDto.getConfirmPassword())) {
            model.addAttribute("error", "Паролі не співпадають");
            Users userWithData = createUserFromDto(registrationDto);
            model.addAttribute("user", userWithData);
            return "register";
        }

        Users registeredUser = userService.registerUser(registrationDto);
        if (registeredUser == null) {
            model.addAttribute("error", "Користувач з таким ім'ям вже існує");
            Users userWithData = createUserFromDto(registrationDto);
            model.addAttribute("user", userWithData);
            return "register";
        }

        redirectAttributes.addFlashAttribute("successMessage",
                "Ви успішно зареєструвались! Тепер ви можете увійти в систему.");
        return "redirect:/login";
    }

    private boolean isValidRegistrationData(UserRegistrationDto dto, Model model) {
        boolean isValid = true;
        StringBuilder errorMessage = new StringBuilder();

        if (dto.getFirstName() == null || dto.getFirstName().trim().isEmpty()) {
            errorMessage.append("Ім'я не може бути порожнім. ");
            isValid = false;
        }

        if (dto.getLastName() == null || dto.getLastName().trim().isEmpty()) {
            errorMessage.append("Прізвище не може бути порожнім. ");
            isValid = false;
        }

        if (dto.getUsername() == null || dto.getUsername().trim().isEmpty()) {
            errorMessage.append("Ім'я користувача не може бути порожнім. ");
            isValid = false;
        } else if (dto.getUsername().length() < 3) {
            errorMessage.append("Ім'я користувача повинно містити мінімум 3 символи. ");
            isValid = false;
        }

        if (dto.getPassword() == null || dto.getPassword().trim().isEmpty()) {
            errorMessage.append("Пароль не може бути порожнім. ");
            isValid = false;
        } else if (dto.getPassword().length() < 6) {
            errorMessage.append("Пароль повинен містити мінімум 6 символів. ");
            isValid = false;
        }

        if (!isValid) {
            model.addAttribute("error", errorMessage.toString().trim());
        }

        return isValid;
    }

    private Users createUserFromDto(UserRegistrationDto dto) {
        Users user = new Users();
        user.setFirstName(dto.getFirstName() != null ? dto.getFirstName() : "");
        user.setLastName(dto.getLastName() != null ? dto.getLastName() : "");
        user.setUserName(dto.getUsername() != null ? dto.getUsername() : "");
        return user;
    }
}