package com.example.Project.presentation;
import com.example.Project.data.teacherRepository;
import com.example.Project.data.subjectRepository;
import com.example.Project.data.teachers;
import com.example.Project.data.subjects;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.util.List;

@Controller
public class teacherController {

    private final teacherRepository teacherRepo;
    private final subjectRepository subjectRepo;

    @Autowired
    public teacherController(teacherRepository teacherRepo, subjectRepository subjectRepo) {
        this.teacherRepo = teacherRepo;
        this.subjectRepo = subjectRepo;
    }

    @GetMapping("/teachers")
    public String getAllTeachers(Model model) {
        Iterable<teachers> teachers = teacherRepo.findAll();
        Iterable<subjects> subjects = subjectRepo.findAll();

        model.addAttribute("teachers", teachers);
        model.addAttribute("subjects", subjects);
        model.addAttribute("isSearchResult", false);
        return "teacher";
    }

    @GetMapping("/teachers/search")
    public String searchTeachers(@RequestParam("searchType") String searchType,
                                 @RequestParam("searchValue") String searchValue,
                                 Model model) {

        List<teachers> searchResults;
        String searchMessage;

        try {
            if ("subjectName".equals(searchType)) {
                searchResults = teacherRepo.findBySubjectNameContainingIgnoreCase(searchValue);
                searchMessage = "Результати пошуку викладачів за предметом: \"" + searchValue + "\"";
            } else if ("subjectId".equals(searchType)) {
                Long subjectId = Long.parseLong(searchValue);
                searchResults = teacherRepo.findBySubjectId(subjectId);

                subjects subject = subjectRepo.findById(subjectId).orElse(null);
                String subjectName = subject != null ? subject.getSubjectName() : "ID: " + subjectId;
                searchMessage = "Результати пошуку викладачів за предметом: \"" + subjectName + "\"";
            } else {
                searchResults = List.of();
                searchMessage = "Невірний тип пошуку";
            }
            Iterable<subjects> subjects = subjectRepo.findAll();

            model.addAttribute("teachers", searchResults);
            model.addAttribute("subjects", subjects);
            model.addAttribute("searchMessage", searchMessage);
            model.addAttribute("searchValue", searchValue);
            model.addAttribute("searchType", searchType);
            model.addAttribute("isSearchResult", true);
            model.addAttribute("searchResultsCount", searchResults.size());

        } catch (Exception e) {
            Iterable<subjects> subjects = subjectRepo.findAll();
            model.addAttribute("teachers", List.of());
            model.addAttribute("subjects", subjects);
            model.addAttribute("errorMessage", "Помилка пошуку: " + e.getMessage());
            model.addAttribute("isSearchResult", true);
            model.addAttribute("searchResultsCount", 0);
        }

        return "teacher";
    }

    @GetMapping("/teachers/new")
    public String showCreateTeacherForm(Model model) {
        Iterable<subjects> subjects = subjectRepo.findAll();
        model.addAttribute("subjects", subjects);
        return "create-teacher";
    }

    @PostMapping("/teachers/create")
    public String createTeacher(
            @RequestParam("firstName") String firstName,
            @RequestParam("lastName") String lastName,
            @RequestParam("middleName") String middleName,
            @RequestParam("email") String email,
            @RequestParam(value = "subjectIds", required = false) Long[] subjectIds,
            RedirectAttributes redirectAttributes) {

        try {
            teachers newTeacher = new teachers();
            newTeacher.setFirstName(firstName);
            newTeacher.setLastName(lastName);
            newTeacher.setMiddleName(middleName);
            newTeacher.setEmail(email);

            teachers savedTeacher = teacherRepo.save(newTeacher);
            if (subjectIds != null && subjectIds.length > 0) {
                for (Long subjectId : subjectIds) {
                    subjects subject = subjectRepo.findById(subjectId).orElse(null);
                    if (subject != null) {
                        subject.setTeacher(savedTeacher);
                        subjectRepo.save(subject);
                    }
                }
            }

            redirectAttributes.addFlashAttribute("successMessage",
                    "Викладача " + firstName + " " + lastName + " успішно створено!");

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage",
                    "Помилка при створенні викладача: " + e.getMessage());
        }

        return "redirect:/teachers";
    }
}