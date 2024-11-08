package com.example.SchoolManagement.schoolServices;

import com.example.SchoolManagement.Repository.DepartmentRepository;
import com.example.SchoolManagement.Repository.ManagementRepository;
import com.example.SchoolManagement.Repository.StudentRepository;
import com.example.SchoolManagement.Repository.TeacherRepository;
import com.example.SchoolManagement.Request.*;
import com.example.SchoolManagement.entity.AdminDetails;
import com.example.SchoolManagement.entity.Department;
import com.example.SchoolManagement.entity.Student;
import com.example.SchoolManagement.entity.Teacher;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


import java.util.Base64;
import java.util.List;
import java.util.Optional;

@Service
public class Services {

    @Autowired
    private ManagementRepository repo;
    @Autowired
    private StudentRepository studentRepo;
    @Autowired
    private DepartmentRepository departmentRepository;
    @Autowired
    private TeacherRepository teacherRepository;
    @Autowired
    private JavaMailSender javaMailSender;

    private Base64.Encoder encoder = Base64.getEncoder();
    private Base64.Decoder decoder = Base64.getDecoder();

    public String adminLogin(LoginRequest request, HttpSession session, Model map) {
        String email = request.getEmail();
        AdminDetails admin = repo.findByEmail(email);
        if(admin!=null){
            String oldpassword = admin.getPassword();
            session.setAttribute("email",email);
            if(oldpassword.equals(request.getPassword()) && email.equals(admin.getEmail())){
                session.setAttribute("admin",admin);
                map.addAttribute("success","login Succesfull");
                long t =teacherRepository.count();
                long s =studentRepo.count();
                long d =departmentRepository.count();
                map.addAttribute("studentcount",s);
                map.addAttribute("teachercount",t);
                map.addAttribute("departmentcount",d);
                return"/dashboard";
            }
        }
        map.addAttribute("errorMessage","Inavlid username or password");
        return "/adminlogin";
    }

    public List TeacherList(){
        return teacherRepository.findAll();
    }
    public String department(String departmentName,Model map,Integer id){
        Department department= departmentRepository.findByName(departmentName);
        List <Teacher> teachersList =teacherRepository.findByDepartmentId(id);
        map.addAttribute("teacher",teachersList);
        map.addAttribute("department",department);
        return "/departmentdisplay";
    }

    public String studentsList(int standard, Model map){
        List<Student> studentList = studentRepo.findByStandard(standard);
        map.addAttribute("students",studentList);
        return "/student-management";
    }
    public String stduentAdd(Optional<Integer> id,StudentRequest request, Model map){
        Student newStudent = new Student();
        newStudent.setName(request.getName());
        newStudent.setStandard(request.getStandard());
        newStudent.setContact_number(request.getContact_number());
        newStudent.setFathers_name(request.getFathers_name());
        studentRepo.save(newStudent);
        return "/classdisplay";
    }

    public String teacherView(Model map){
        List<Teacher> teacher = teacherRepository.findAll();
        map.addAttribute("teachers",teacher);
        return "/teacher";
    }
    public String resetPassword(ResetPassword request, Model map) {
        String email = request.getEmail();
        String encodedEmail = encoder.encodeToString(email.getBytes());
        String resetlink = "http://localhost:8080/confirmpassword/" + encodedEmail;
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        message.setSubject("Password Reset Request");
        message.setText("To reset your password, click the link :" + resetlink);
        javaMailSender.send(message);
        return "/adminlogin";
    }
    public String confirmResetPassword(String encodedEmail, String newPassword,Model map){
        byte[] demail =  decoder.decode(encodedEmail);
        String decodedEmail = new String(demail);
        AdminDetails user = repo.findByEmail(decodedEmail);
        if(user== null){
            map.addAttribute("errorMessage","invalid email");
            return "redirect:/confirmpassword";
        }
        user.setPassword(newPassword);
        repo.save(user);
        map.addAttribute("success","password changed succesfully");
        return "/adminlogin";
    }
    public String viewProfile(HttpSession session, Model map){
        String email = (String)session.getAttribute("email");

        if (email != null) {
            AdminDetails user = repo.findByEmail(email);
            map.addAttribute("admin", user);
            return "/profile";
        } else {
            return "/adminlogin";
        }
    }

    public String submitProfile(AdminDetails adminDetails, HttpSession session, Model map) {
        AdminDetails currentAdmin = (AdminDetails) session.getAttribute("admin");
        if (currentAdmin != null) {
            map.addAttribute("admin",currentAdmin);
            currentAdmin.setName(adminDetails.getName());
            currentAdmin.setEmail(adminDetails.getEmail());
            currentAdmin.setMobile(adminDetails.getMobile());
            currentAdmin.setAddress(adminDetails.getAddress());
            repo.save(currentAdmin);
            map.addAttribute("success", "Profile updated successfully");
            return "redirect:/profile";
        } else {
            map.addAttribute("errormessage","profile updation failed");
            return "redirect:/adminlogin";
        }
    }
    public String addTeacher(TeacherRequest teacherRequest,Model map){
        Teacher teacher = new Teacher();
        teacher.setName(teacherRequest.getName());
        teacher.setMobile(teacherRequest.getMobile());
        teacher.setEmail(teacherRequest.getEmail());
        teacher.setDepartmentId(teacherRequest.getDepartmentId());
        teacherRepository.save(teacher);
        return "redirect:/teacher";
    }
    public String updatePassword(HttpSession session,UpdatePassword updatePassword,Model map){
        String email = (String)session.getAttribute("email");
        AdminDetails currentlog = repo.findByEmail(email);
        if(currentlog!=null){
            if(currentlog.getPassword().equals(updatePassword.getOldPassword())){
                currentlog.setPassword(updatePassword.getNewPassword());
                map.addAttribute("success","Password updated succesfully");
                repo.save(currentlog);
                return "profile";
            }else {
                map.addAttribute("errorMessage","invalid password");
                return "/updatepassword";
            }
        }
        return "/updatepassword";
    }
    public String dashboardview(Model map) {
        long t =teacherRepository.count();
        long s =studentRepo.count();
        long d =departmentRepository.count();
        map.addAttribute("studentcount",s);
        map.addAttribute("teachercount",t);
        map.addAttribute("departmentcount",d);
        return "dashboard";
    }

    public String deleteTeacher(int id, Model map) {
        if (teacherRepository.existsById(id)) {
            teacherRepository.deleteById(id);
            map.addAttribute("message", "Teacher deleted successfully.");
        } else {
            map.addAttribute("error", "Teacher not found.");
        }
        map.addAttribute("teachers", teacherRepository.findAll());

        return "teacher";
    }
    public String deleteStudent(int id,Model map){
        if(studentRepo.existsById(id)){
            studentRepo.deleteById(id);
            map.addAttribute("success","Student deleted successfully");
        }else{
            map.addAttribute("error","student not found");

        }
        map.addAttribute("Students",studentRepo.findAll());
        return "/student-management";
    }
    public String updateTeacherProfile(UpdateTeacher updateTeacher,Model map){
        Teacher upteacher = teacherRepository.findById(updateTeacher.getId());
        if(upteacher!=null){
            upteacher.setEmail(updateTeacher.getEmail());
            upteacher.setName(updateTeacher.getName());
            upteacher.setMobile(updateTeacher.getMobile());
            teacherRepository.save(upteacher);
            map.addAttribute("success","teacher updated succesfully");
            return "redirect:/teacher";
        }
        map.addAttribute("errorMessage","teacher not found");
        return "redirect :/teacher";
    }
    public String updateStudentProfile(UpdateStudent updateStudent,Model map){
        Student upStudent = studentRepo.findById(updateStudent.getId());
        if(upStudent!=null){
            upStudent.setName(updateStudent.getName());
            upStudent.setContact_number(updateStudent.getContact_number());
            upStudent.setFathers_name(updateStudent.getFathers_name());
            upStudent.setStandard(updateStudent.getStandard());
            studentRepo.save(upStudent);
            map.addAttribute("success","updated Sucessfully");
            return "redirect:/student-management?className="+updateStudent.getStandard();
        }
        map.addAttribute("errorMessage","Student Data Not Found");
        return "redirect:/classdisplay?className="+updateStudent.getStandard();
    }
}
