package com.example.SchoolManagement.Request;

import lombok.Data;

@Data
public class UpdateProfile {
    private String name;
    private String mobile;
    private String address;
    private String password;
    private String email;
}
