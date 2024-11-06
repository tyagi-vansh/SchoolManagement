package com.example.SchoolManagement.Repository;

import com.example.SchoolManagement.entity.AdminDetails;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ManagementRepository extends JpaRepository<AdminDetails,Integer> {
    AdminDetails findById(int id);
    AdminDetails findByEmail(String email);
}


