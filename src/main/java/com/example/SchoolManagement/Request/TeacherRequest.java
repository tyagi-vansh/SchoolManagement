package com.example.SchoolManagement.Request;

import lombok.Data;

@Data
public class TeacherRequest {
    private String name;
    private String mobile;
    private String email;
    private int departmentId;
}
