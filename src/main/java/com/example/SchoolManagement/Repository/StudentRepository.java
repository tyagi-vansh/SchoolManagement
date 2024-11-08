package com.example.SchoolManagement.Repository;

import com.example.SchoolManagement.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StudentRepository extends JpaRepository<Student,Integer> {
    List<Student> findByStandard(int standard);
    Student findById(int id);
}
