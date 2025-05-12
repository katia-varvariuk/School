package com.example.Project.data;

import com.example.Project.data.students;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface studentRepository extends CrudRepository<students, Long> {
}