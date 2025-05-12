package com.example.Project.data;

import com.example.Project.data.gradeJournal;
import com.example.Project.data.subjects;
import jakarta.persistence.*;

import java.util.Set;

@Entity
@Table(name = "subjects")
public class subjects {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "subjectid")
    private Long subjectId;

    @Column(name = "subjectname")
    private String subjectName;

    @ManyToOne
    @JoinColumn(name = "teacherid", referencedColumnName = "teacherid")
    private com.example.Project.data.teachers teacher;

    @OneToMany(mappedBy = "subject")
    private Set<gradeJournal> gradeJournals;

    public Long getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Long subjectId) {
        this.subjectId = subjectId;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public com.example.Project.data.teachers getTeacher() {
        return teacher;
    }

    public void setTeacher(teachers teacher) {
        this.teacher = teacher;
    }

    public Set<gradeJournal> getGradeJournals() {
        return gradeJournals;
    }

    public void setGradeJournals(Set<gradeJournal> gradeJournals) {
        this.gradeJournals = gradeJournals;
    }
}