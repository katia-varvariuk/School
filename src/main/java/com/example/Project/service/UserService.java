package com.example.Project.service;

import com.example.Project.data.UserRepository;
import com.example.Project.data.Users;
import com.example.Project.dto.UserRegistrationDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder;
    private final AuthenticationManager authenticationManager;

    @Autowired
    public UserService(UserRepository userRepository, BCryptPasswordEncoder passwordEncoder,
                       AuthenticationManager authenticationManager) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.authenticationManager = authenticationManager;
    }

    public Users registerUser(UserRegistrationDto registrationDto) {
        if (userRepository.findByUserName(registrationDto.getUsername()) != null) {
            return null;
        }

        String role = determineUserRole(registrationDto);

        Users newUser = new Users(
                registrationDto.getFirstName(),
                registrationDto.getLastName(),
                registrationDto.getUsername(),
                passwordEncoder.encode(registrationDto.getPassword()),
                role
        );

        return userRepository.save(newUser);
    }

    public Users registerUserAndLogin(UserRegistrationDto registrationDto) {
        Users user = registerUser(registrationDto);

        if (user != null) {
            try {
                Authentication authentication = authenticationManager.authenticate(
                        new UsernamePasswordAuthenticationToken(
                                registrationDto.getUsername(),
                                registrationDto.getPassword()
                        )
                );
                SecurityContextHolder.getContext().setAuthentication(authentication);
            } catch (Exception ex) {
                System.err.println("Помилка автоматичного входу: " + ex.getMessage());
            }
        }

        return user;
    }

    public boolean passwordsMatch(String password, String confirmPassword) {
        return password != null && password.equals(confirmPassword);
    }

    public Users findByUsername(String username) {
        return userRepository.findByUserName(username);
    }

    public boolean existsByUsername(String username) {
        return userRepository.findByUserName(username) != null;
    }

    private String determineUserRole(UserRegistrationDto registrationDto) {

        if (registrationDto.getRole() != null && !registrationDto.getRole().isEmpty()) {
            return registrationDto.getRole();
        }

        return "STUDENT";
    }

    public boolean updateUserRole(Long userId, String newRole) {
        try {
            Users user = userRepository.findById(userId).orElse(null);
            if (user != null) {
                user.setRole(newRole);
                userRepository.save(user);
                return true;
            }
        } catch (Exception e) {
            System.err.println("Помилка оновлення ролі користувача: " + e.getMessage());
        }
        return false;
    }

    public boolean hasRole(String username, String role) {
        Users user = findByUsername(username);
        return user != null && role.equals(user.getRole());
    }
}