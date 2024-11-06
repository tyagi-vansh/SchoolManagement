package com.example.SchoolManagement.Repository;


import com.example.SchoolManagement.entity.Department;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DepartmentRepository extends JpaRepository<Department,Integer> {
    Department findByName(String departmentnName);
    Department findById(int id);
}
