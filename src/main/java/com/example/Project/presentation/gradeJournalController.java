package com.example.Project.presentation;
import com.example.Project.data.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
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
    public String getAllGrades(@RequestParam(value = "updated", required = false) String updated,
                               @RequestParam(value = "deleted", required = false) String deleted,
                               @RequestParam(value = "error", required = false) String error,
                               @RequestParam(value = "sort", required = false) String sort,
                               Model model) {

        List<gradeJournal> grades = new ArrayList<>();
        String currentSort = "";

        // Визначаємо тип сортування
        if ("asc".equals(sort)) {
            grades = gradeJournalRepo.findAllOrderByStudentLastNameAsc();
            currentSort = "asc";
        } else if ("desc".equals(sort)) {
            grades = gradeJournalRepo.findAllOrderByStudentLastNameDesc();
            currentSort = "desc";
        } else {
            // За замовчуванням показуємо без сортування
            Iterable<gradeJournal> allGrades = gradeJournalRepo.findAll();
            for (gradeJournal grade : allGrades) {
                grades.add(grade);
            }
        }

        model.addAttribute("grades", grades);
        model.addAttribute("updated", updated);
        model.addAttribute("deleted", deleted);
        model.addAttribute("error", error);
        model.addAttribute("currentSort", currentSort);

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

    // Виправлений метод видалення конкретної оцінки
    @PostMapping("/grades/delete/{id}")
    public String deleteGradeEntry(@PathVariable Long id) {
        try {
            // Перевіряємо чи існує запис з оцінкою
            Optional<gradeJournal> gradeOptional = gradeJournalRepo.findById(id);

            if (gradeOptional.isPresent()) {
                gradeJournal gradeToDelete = gradeOptional.get();

                // Логуємо що саме видаляємо для відладки
                System.out.println("Видаляємо оцінку: ID=" + gradeToDelete.getJournalId()
                        + ", Студент=" + (gradeToDelete.getStudent() != null ?
                        gradeToDelete.getStudent().getFirstName() + " " + gradeToDelete.getStudent().getLastName() : "Невідомий")
                        + ", Предмет=" + (gradeToDelete.getSubject() != null ?
                        gradeToDelete.getSubject().getSubjectName() : "Невідомий")
                        + ", Оцінка=" + gradeToDelete.getGrade());

                // Видаляємо ТІЛЬКИ запис про оцінку, а не студента чи предмет
                gradeJournalRepo.deleteById(id);

                System.out.println("Оцінку успішно видалено з журналу");
                return "redirect:/grades?deleted=true";
            } else {
                System.err.println("Оцінка з ID " + id + " не знайдена");
                return "redirect:/grades?error=notfound";
            }
        } catch (Exception e) {
            System.err.println("Помилка при видаленні оцінки з ID " + id + ": " + e.getMessage());
            e.printStackTrace();
            return "redirect:/grades?deleted=error";
        }
    }

    // Додатковий метод для перевірки чи можна видалити оцінку
    private boolean canDeleteGrade(Long gradeId) {
        try {
            Optional<gradeJournal> gradeOptional = gradeJournalRepo.findById(gradeId);
            return gradeOptional.isPresent();
        } catch (Exception e) {
            System.err.println("Помилка перевірки можливості видалення: " + e.getMessage());
            return false;
        }
    }
}