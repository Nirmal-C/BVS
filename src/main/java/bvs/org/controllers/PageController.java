/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bvs.org.controllers;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
//import bvs.org.service.PageService;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

    @GetMapping("/")
    public String dashboard() {
        return "home";
    }

    @GetMapping("/home")
    public String dashboards() {
        return "home";
    }

    @GetMapping("/history")
    public String history() {
        return "aboutUs/history";
    }

    @GetMapping("/What-We-Do")
    public String whatWeDo() {
        return "aboutUs/whatWeDo";
    }

    @GetMapping("/Vision-Mission")
    public String vision() {
        return "aboutUs/vision";
    }

    @GetMapping("/Board-Directors")
    public String directors() {
        return "aboutUs/board-directors";
    }

    @GetMapping("/Religious-Advisors")
    public String advisors() {
        return "aboutUs/religious-advisors";
    }

    @GetMapping("/Audit-Committee")
    public String committee() {
        return "aboutUs/audit-committee";
    }

    @GetMapping("/Resident-Monks")
    public String monks() {
        return "aboutUs/resident-monks";
    }

    @GetMapping("/Dhamma-Videos")
    public String dhammma() {
        return "dhamma_resourses/dhamma_videos";
    }

    @GetMapping("/Admin-Videos")
    public String dhammmaAdd() {
        return "admin/add_dhamma_video";
    }

    @GetMapping("/Admin-Staff")
    public String staffAdd() {
        return "admin/addStaff";
    }

    @GetMapping("/Staff")
    public String staff() {
        return "dhammaSchool/staff";
    }

    @GetMapping("/Classes")
    public String classes() {
        return "dhammaSchool/class";
    }

    @GetMapping("/Admin-Syllabus")
    public String classesadd() {
        return "admin/addsyllabus";
    }

    @GetMapping("/Dana-Request")
    public String danaReq() {
        return "forms/dana_form";
    }

    @GetMapping("/Dana-Calender")
    public String dana() {
        return "schedule/dana_calendar";
    }

    @GetMapping("/Membership")
    public String member() {
        return "forms/membership";
    }

    @GetMapping("/Project-Events")
    public String project() {
        return "communityEngagement/project_events";
    }

    @GetMapping("/Project-Garden")
    public String projectGarden() {
        return "communityEngagement/garden_project";
    }

    @GetMapping("/Event-Calender")
    public String event() {
        return "schedule/event_calendar";
    }

    @GetMapping("/School-Calender")
    public String schoolCalendar() {
        return "dhammaSchool/school_calendar";
    }

    @GetMapping("/bvsAdmin-Login")
    public String login() {
        return "login/login";
    }

    @GetMapping("/Admincontrol")
    public String admin() {
        return "admincontrol";
    }

    @GetMapping("/Admin-Form")
    public String form() {
        return "admin/addForm";
    }

    @GetMapping("/Forms")
    public String formView() {
        return "forms/formView";
    }

    @GetMapping("/Reset-Password")
    public String reset() {
        return "login/reset_password";
    }

    @GetMapping("/otp")
    public String otp() {
        return "login/otp";
    }

    @GetMapping("/changepw")
    public String changepw() {
        return "login/change_password";
    }

    @GetMapping("/Admin-School-Calendar")
    public String schoolCal() {
        return "admin/add_school_calendar";
    }

    @GetMapping("/Admin-User")
    public String user() {
        return "admin/user";
    }

    @GetMapping("/Veg-Order")
    public String veg() {
        return "communityEngagement/vegOrder";
    }

    @GetMapping("/NewsLetter")
    public String news() {
        return "communityEngagement/news_letter";
    }

    @GetMapping("/Support-Us")
    public String support() {
        return "supportUs";
    }

    @GetMapping("/Admin-NewsLetters")
    public String newsAdd() {
        return "admin/add_newsLetter";
    }

    @GetMapping("/Admin-OurTeam")
    public String teamAdd() {
        return "admin/add_team";
    }

    @GetMapping("/Admin-Carousel")
    public String carouselAdd() {
        return "admin/addCarousel";
    }

    @GetMapping("/Admin-UserTpe")
    public String UserTypeAdd() {
        return "admin/usertype";
    }
}
