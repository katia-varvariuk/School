package com.example.Project.data;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface subjectRepository extends CrudRepository<subjects, Long> {
}