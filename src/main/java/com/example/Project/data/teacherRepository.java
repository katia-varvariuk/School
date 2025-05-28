package com.example.Project.data;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface teacherRepository extends CrudRepository<teachers, Long> {

    @Query("SELECT DISTINCT t FROM teachers t JOIN t.subjects s WHERE LOWER(s.subjectName) LIKE LOWER(CONCAT('%', :subjectName, '%'))")
    List<teachers> findBySubjectNameContainingIgnoreCase(@Param("subjectName") String subjectName);

    @Query("SELECT DISTINCT t FROM teachers t JOIN t.subjects s WHERE LOWER(s.subjectName) = LOWER(:subjectName)")
    List<teachers> findBySubjectNameIgnoreCase(@Param("subjectName") String subjectName);

    @Query("SELECT DISTINCT t FROM teachers t JOIN t.subjects s WHERE s.subjectId = :subjectId")
    List<teachers> findBySubjectId(@Param("subjectId") Long subjectId);
}