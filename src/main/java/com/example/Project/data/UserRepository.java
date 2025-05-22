package com.example.Project.data;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface UserRepository extends CrudRepository<Users, Long> {
    Users findByUserName(String userName);

    default Users findByUsername(String username) {
        return findByUserName(username);
    }
}