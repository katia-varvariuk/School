package com.example.Project.presentation;
import com.example.Project.data.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.Optional;

@Controller
public class gradeJournalController {

    private final gradeJournalRepository gradeJournalRepo;
    private final studentRepository studentRepo;
    private final subjectRepository subjectRepo;
    private final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    @Autowired
    public gradeJournalController(gradeJournalRepository gradeJournalRepo,
                                  studentRepository studentRepo,
                                  subjectRepository subjectRepo) {
        this.gradeJournalRepo = gradeJournalRepo;
        this.studentRepo = studentRepo;
        this.subjectRepo = subjectRepo;
    }

    @GetMapping("/grades")
    public String getAllGrades(@RequestParam(value = "updated", required = false) String updated, Model model) {
        Iterable<gradeJournal> grades = gradeJournalRepo.findAll();
        model.addAttribute("grades", grades);
        model.addAttribute("updated", updated);
        return "grades";
    }

    @GetMapping("/grades/edit/{id}")
    public String showEditForm(@PathVariable Long id,
                               @RequestParam(value = "error", required = false) String error,
                               Model model) {
        Optional<gradeJournal> gradeOptional = gradeJournalRepo.findById(id);

        if (gradeOptional.isPresent()) {
            gradeJournal grade = gradeOptional.get();

            model.addAttribute("grade", grade);
            model.addAttribute("students", studentRepo.findAll());
            model.addAttribute("subjects", subjectRepo.findAll());
            model.addAttribute("error", error);

            return "edit-grade";
        } else {
            return "redirect:/grades";
        }
    }

    @PostMapping("/grades/edit/{id}")
    public String updateGrade(@PathVariable Long id,
                              @RequestParam("studentId") Long studentId,
                              @RequestParam("subjectId") Long subjectId,
                              @RequestParam("grade") int gradeValue,
                              @RequestParam("gradeDate") String gradeDateStr,
                              Model model) {

        Optional<gradeJournal> gradeOptional = gradeJournalRepo.findById(id);

        if (gradeOptional.isPresent()) {
            gradeJournal grade = gradeOptional.get();

            Optional<students> studentOptional = studentRepo.findById(studentId);
            Optional<subjects> subjectOptional = subjectRepo.findById(subjectId);

            if (studentOptional.isPresent() && subjectOptional.isPresent()) {
                grade.setStudent(studentOptional.get());
                grade.setSubject(subjectOptional.get());
                grade.setGrade(gradeValue);

                try {
                    java.util.Date utilDate = dateFormat.parse(gradeDateStr);
                    grade.setGradeDate(new Date(utilDate.getTime()));
                } catch (Exception e) {
                    System.err.println("Помилка парсингу дати: " + e.getMessage());
                }
                gradeJournalRepo.save(grade);

                return "redirect:/grades?updated=true";
            }
        }
        return "redirect:/grades/edit/" + id + "?error=true";
    }
}