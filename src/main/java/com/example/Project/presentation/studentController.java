package com.example.Project.presentation;

import com.example.Project.data.studentRepository;
import com.example.Project.data.students;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class studentController {

    private final studentRepository studentRepo;

    @Autowired
    public studentController(studentRepository studentRepo) {
        this.studentRepo = studentRepo;
    }

    @GetMapping("/students")
    public String getAllStudents(Model model) {
        Iterable<students> students = studentRepo.findAll();
        model.addAttribute("students", students);
        return "student";
    }
}