    package com.example.SchoolManagement.controller;


    import com.example.SchoolManagement.Repository.TeacherRepository;
    import com.example.SchoolManagement.Request.*;
    import com.example.SchoolManagement.entity.AdminDetails;
    import com.example.SchoolManagement.entity.Teacher;
    import com.example.SchoolManagement.schoolServices.Services;
    import jakarta.servlet.http.HttpSession;
    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.stereotype.Controller;
    import org.springframework.ui.Model;
    import org.springframework.web.bind.annotation.*;

    import java.util.Optional;


    @Controller
    public class WebController {

        @Autowired
        private Services service;

        @Autowired
        private TeacherRepository teacherRepository;

        @GetMapping("/index")
        public String loginView(){
            return "adminlogin";
        }

        @PostMapping("/submit-login")
        public String adminlogin(LoginRequest request, HttpSession session, Model map){
            return service.adminLogin(request,session,map);
        }
        @GetMapping("/dashboard")
        public String dashview(HttpSession session,Model map){
            String email=(String)session.getAttribute("email");
            if(email==null){
                return "adminlogin";
            }
            return service.dashboardview(map);
        }
        @GetMapping("/classdisplay")
        public String studentView(HttpSession session){
            String email=(String)session.getAttribute("email");
            if(email==null){
                return "adminlogin";
            }
            return "classdisplay";
        }

        @GetMapping("/department")
        public String departmentView(HttpSession session){
            String email=(String)session.getAttribute("email");
            if(email==null){
                return "adminlogin";
            }
            return "department";
        }
        @GetMapping("/departmentdisplay")
        public String displayDepartment(@RequestParam String departmentName, Model map, Integer id,HttpSession session){
            String email=(String)session.getAttribute("email");
            if(email==null){
                return "adminlogin";
            }
            return service.department(departmentName,map,id);
        }
        @GetMapping("/student-management")
        public String dipslayStudent(@RequestParam int className,Model map,HttpSession session){
            String email=(String)session.getAttribute("email");
            if(email==null){
                return "adminlogin";
            }
            return service.students(className,map);
        }
        @GetMapping("/addStudent")
        public String addview(@RequestParam(name="id",required = false) Integer classId,HttpSession session ,Model map){
            String email=(String)session.getAttribute("email");
            if(email==null){
                return "adminlogin";
            }
            if(classId!=null){
                map.addAttribute("classId", classId);
            }
            return "addstudent";
        }
        @PostMapping("/addNewStudent")
        public String studentAdd(@RequestParam Optional<Integer> id , StudentRequest request, Model map){
            return service.stduentAdd(id,request,map);
        }
        @GetMapping("/teacher")
        public String teachers(Model map,HttpSession session){
            String email=(String)session.getAttribute("email");
            if(email==null){
                return "adminlogin";
            }
            return service.teacherView(map);
        }
        @GetMapping("/resetpasswordview")
        public String resetView(HttpSession session){
            String email=(String)session.getAttribute("email");
            if(email==null){
                return "adminlogin";
            }
            return "resetPassword";
        }
        @PostMapping("/resetpassword")
        public String resetPassword(ResetPassword request, Model map){
            return service.resetPassword(request,map);
        }

        @GetMapping("/confirmpassword/{encodedEmail}")
        public String confirmResetPassword(@PathVariable String encodedEmail,HttpSession session){
            String email=(String)session.getAttribute("email");
            if(email==null){
                return "adminlogin";
            }
            return "confirmpassword";
        }
        @PostMapping("/confirmpassword/{encodedEmail}")
        public String confirmResetPassword(@PathVariable String encodedEmail, String newPassword, Model map) {
            return service.confirmResetPassword(encodedEmail, newPassword, map);
        }
        @GetMapping("/profile")
        public String displayProfile(HttpSession session, Model map) {
            String email=(String)session.getAttribute("email");
            if(email==null){
                return "adminlogin";
            }
            return service.viewProfile(session, map);
        }
        @GetMapping("/updateprofile")
        public String updateProfileView(){
            return "updateprofile";
        }
        @PostMapping("/submitProfileUpdate")
        public String submitUpdatedprofile(AdminDetails adminDetails, HttpSession session, Model map){
            return service.submitProfile(adminDetails,session,map);
        }
        @GetMapping("/addteacher")
        public String addTeacherPage(HttpSession session){
            String email=(String)session.getAttribute("email");
            if(email==null){
                return "adminlogin";
            }
            return "addteacher";
        }
        @PostMapping("/addNewTeacher")
        public String addnewteacher(TeacherRequest teacherRequest,Model map){
            return service.addTeacher(teacherRequest,map);
        }
        @GetMapping("/updatepassword")
        public String updatePasswordview(){
            return "updatepassword";
        }
        @PostMapping("/submitpassword")
        public String updatepass(HttpSession session,UpdatePassword updatePassword, Model map){
            return service.updatePassword(session,updatePassword,map);
        }
        @GetMapping("/logout")
        public String logout(HttpSession session){
            session.invalidate();
            return "adminlogin";
        }
        @PostMapping("/deleteTeacher/{id}")
        public String deleteTeacher(@PathVariable int id, Model map) {
            return service.deleteTeacher(id, map);
        }
        @PostMapping("/deleteStudent/{id}")
        public String deleteStudent(@PathVariable int id,Model map){
            return service.deleteStudent(id,map);
        }
        @GetMapping("/updateteacherprofile/{id}")
        public String updateTeacherView(@PathVariable int id ,Model map){
            Teacher upTeacher = teacherRepository.findById(id);
            if(upTeacher!=null){
                map.addAttribute("teacher",upTeacher);
            }
            return "updateteacherprofile";
        }
        @PostMapping("saveteacherprofile/{id}")
        public String upadteteacher(@PathVariable int id ,UpdateTeacher updateTeacher,Model map){
            return service.updateTeacherProfile(id,updateTeacher,map);
        }

    }
