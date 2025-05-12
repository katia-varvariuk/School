package com.example.Project.data;

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
    private com.example.Project.data.students student;

    @ManyToOne
    @JoinColumn(name = "subjectid", referencedColumnName = "subjectid")
    private subjects subject;

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

    public com.example.Project.data.students getStudent() {
        return student;
    }

    public void setStudent(students student) {
        this.student = student;
    }

    public subjects getSubject() {
        return subject;
    }

    public void setSubject(subjects subject) {
        this.subject = subject;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }


    public java.sql.Date getGradeDate() {
        return gradeDate;
    }

    public void setGradeDate(Date gradeDate) {
        this.gradeDate = gradeDate;
    }
}