package com.example.SchoolManagement.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name = "teachers")
public class Teacher {
    private int departmentId;
    @Id
    @GeneratedValue
    private int id;
    private String name;
    private String mobile;
    private String email;
}
