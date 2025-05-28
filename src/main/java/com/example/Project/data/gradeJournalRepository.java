package com.example.Project.data;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface gradeJournalRepository extends CrudRepository<gradeJournal, Long> {

    @Query("SELECT g FROM gradeJournal g JOIN g.student s ORDER BY s.lastName ASC")
    List<gradeJournal> findAllOrderByStudentLastNameAsc();

    @Query("SELECT g FROM gradeJournal g JOIN g.student s ORDER BY s.lastName DESC")
    List<gradeJournal> findAllOrderByStudentLastNameDesc();
}