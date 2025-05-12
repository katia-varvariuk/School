package com.example.Project.presentation;

import com.example.Project.data.gradeJournalRepository;
import com.example.Project.data.gradeJournal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.text.SimpleDateFormat;

@Controller
public class gradeJournalController {

    private final gradeJournalRepository gradeJournalRepo;
    private final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    @Autowired
    public gradeJournalController(gradeJournalRepository gradeJournalRepo) {
        this.gradeJournalRepo = gradeJournalRepo;
    }

    @GetMapping("/grades")
    public String getAllGrades(Model model) {
        Iterable<gradeJournal> grades = gradeJournalRepo.findAll();

        model.addAttribute("grades", grades);
        return "grades";
    }
}