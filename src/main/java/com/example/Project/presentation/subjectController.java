package com.example.Project.presentation;
import com.example.Project.data.subjectRepository;
import com.example.Project.data.subjects;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class subjectController {

    private final subjectRepository subjectRepo;

    @Autowired
    public subjectController(subjectRepository subjectRepo) {
        this.subjectRepo = subjectRepo;
    }

    @GetMapping("/subjects")
    public String getAllSubjects(Model model) {
        Iterable<subjects> subjects = subjectRepo.findAll();
        model.addAttribute("subjects", subjects);
        return "subject";
    }
}