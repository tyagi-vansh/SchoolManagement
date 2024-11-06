package com.example.SchoolManagement.entity;

import lombok.Data;

@Data
public class EmailDetails {
    private String recipient;
    private String msgBody;
    private String subject;
}
