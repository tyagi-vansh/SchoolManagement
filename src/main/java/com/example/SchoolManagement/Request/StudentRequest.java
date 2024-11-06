package com.example.SchoolManagement.Request;

import lombok.Data;

@Data
public class StudentRequest {
    private String name ;
    private int standard;
    private String fathers_name;
    private String contact_number;
}
