package com.example.SchoolManagement.entity;

import jakarta.persistence.*;
import lombok.Data;


@Entity
@Table(name = "students")
@Data
public class Student {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int id;
    private String name ;
    private int standard;
    private String fathers_name;
    private String contact_number;

}
