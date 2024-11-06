package com.example.SchoolManagement.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;


@Data
@Entity
@Table(name = "admindetails")
public class AdminDetails {
    @Id
    @GeneratedValue
    private int id;
    private String name;
    private String mobile;
    private String address;
    private String password;
    private String email;
}