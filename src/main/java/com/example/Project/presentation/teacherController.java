package com.example.Project.presentation;
import com.example.Project.data.teacherRepository;
import com.example.Project.data.teachers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class teacherController {

    private final teacherRepository teacherRepo;

    @Autowired
    public teacherController(teacherRepository teacherRepo) {
        this.teacherRepo = teacherRepo;
    }

    @GetMapping("/teachers")
    public String getAllTeachers(Model model) {
        Iterable<teachers> teachers = teacherRepo.findAll();
        model.addAttribute("teachers", teachers);
        return "teacher";
    }
}