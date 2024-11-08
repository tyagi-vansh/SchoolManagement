package com.example.SchoolManagement.Repository;


import com.example.SchoolManagement.entity.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TeacherRepository extends JpaRepository<Teacher,Integer> {
    Teacher findById(int id);
    List<Teacher> findByDepartmentId(int id);
    Teacher deleteById(int id);
    Teacher findByEmail(String email);
}
