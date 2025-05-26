package com.example.Project.presentation;
import com.example.Project.data.studentRepository;
import com.example.Project.data.students;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Optional;

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

    @GetMapping("/students/{id}")
    public String getStudentDetails(@PathVariable Long id, Model model) {
        Optional<students> studentOptional = studentRepo.findById(id);

        if (studentOptional.isPresent()) {
            students student = studentOptional.get();
            model.addAttribute("student", student);
            model.addAttribute("grades", student.getGradeJournals());
            return "student-details";
        } else {
            // Якщо студента не знайдено, перенаправляємо на загальний список
            return "redirect:/students";
        }
    }
}