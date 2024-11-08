package com.example.SchoolManagement.Request;

import lombok.Data;

@Data
public class UpdateTeacher {
    private int id;
    private String name;
    private String email;
    private String mobile;
}
