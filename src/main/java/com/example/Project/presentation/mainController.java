package com.example.Project.presentation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class mainController {

    @GetMapping("/main")
    public String index() {
        return "index";
    }
}