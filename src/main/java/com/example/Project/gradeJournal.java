package com.example.Project;
import jakarta.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "gradesjournal")

public class gradeJournal {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "journalid")
    private Long journalId;

    @ManyToOne
    @JoinColumn(name = "studentid", referencedColumnName = "studentid")
    private student student;

    @ManyToOne
    @JoinColumn(name = "subjectid", referencedColumnName = "subjectid")
    private subject subject;

    @Column(name = "grade")
    private int grade;

    @Column(name = "gradedate")
    private java.sql.Date gradeDate;

    public Long getJournalId() {
        return journalId;
    }

    public void setJournalId(Long journalId) {
        this.journalId = journalId;
    }

    public student getStudent() {
        return student;
    }

    public void setStudent(student student) {
        this.student = student;
    }

    public subject getSubject() {
        return subject;
    }

    public void setSubject(subject subject) {
        this.subject = subject;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public Date getGradeDate() {
        return gradeDate;
    }

    public void setGradeDate(Date gradeDate) {
        this.gradeDate = gradeDate;
    }
}
