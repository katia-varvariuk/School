package com.example.Project.data;

import jakarta.persistence.*;

import java.util.Set;

@Entity
@Table(name = "students")
public class students {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "studentid")
    private Long studentId;

    @Column(name = "lastname")
    private String lastName;

    @Column(name = "firstname")
    private String firstName;

    @Column(name = "middlename")
    private String middleName;

    @Column(name = "birthdate")
    private java.sql.Date birthDate;

    @OneToMany(mappedBy = "student")
    private Set<gradeJournal> gradeJournals;

    public Long getStudentId() {
        return studentId;
    }

    public void setStudentId(Long studentId) {
        this.studentId = studentId;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public java.sql.Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(java.sql.Date birthDate) {
        this.birthDate = birthDate;
    }

    public Set<gradeJournal> getGradeJournals() {
        return gradeJournals;
    }

    public void setGradeJournals(Set<gradeJournal> gradeJournals) {
        this.gradeJournals = gradeJournals;
    }
}