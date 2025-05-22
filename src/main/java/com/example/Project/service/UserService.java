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

        Users newUser = new Users(
                registrationDto.getFirstName(),
                registrationDto.getLastName(),
                registrationDto.getUsername(),
                passwordEncoder.encode(registrationDto.getPassword()),
                "STUDENT"
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
}