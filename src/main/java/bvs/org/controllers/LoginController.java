package bvs.org.controllers;

import bvs.org.config.PasswordMail;
import bvs.org.model.User;
import bvs.org.service.LoginService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import static java.lang.System.out;
import java.util.Hashtable;
import java.util.Random;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.naming.ldap.InitialLdapContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LoginController {

    @Autowired
    LoginService loginService;

    @PostMapping("/login")
    public String checkLogin(@RequestParam String username, @RequestParam String password, HttpSession session) {

        User user = loginService.checkLogin(username, password);

        if (user == null) {
            return "error";
        } else {
            session.setAttribute("uid", user.getId());
            session.setAttribute("username", username);
            return "ok";
        }
    }

    @GetMapping("/reset")
    public void reset(HttpSession session, HttpServletResponse resp, @RequestParam String username) throws Exception {
        User user = loginService.checkUser(username);

        if (user == null) {
            // Display an error message
            String errorMessage = "User not found. Please try again.";
            session.setAttribute("errorMessage", errorMessage);

            // JavaScript code to show an alert and redirect
            String redirectScript = "<script type=\"text/javascript\">"
                    + "alert('User not found. Please try again.');"
                    + "window.location.href = 'Reset-Password';"
                    + "</script>";

            // Write the script to the response
            resp.setContentType("text/html");
            resp.getWriter().println(redirectScript);
        } else {
            // Generate and store the reset code
            Random random = new Random();
            String code = random.nextInt(10) + "" + random.nextInt(10) + "" + random.nextInt(10) + "" + random.nextInt(10);
            session.setAttribute("code", code);
            session.setAttribute("resetuser", username);

            // Send OTP via email
            String email = user.getEmail();
            boolean otpSent = PasswordMail.sendOtp(email, code);

            if (otpSent) {
                // Redirect to OTP page
                resp.sendRedirect("otp");
            } else {
                // Handle error if OTP sending failed
                String errorMessage = "Failed to send OTP. Please try again.";
                session.setAttribute("errorMessage", errorMessage);
                resp.sendRedirect("Reset-Password"); // Redirect to the reset password page
            }
        }
    }

    @GetMapping("/reset-validate")
    public void validate(HttpSession session, @RequestParam String code, HttpServletResponse resp) throws Exception {

        Object attribute = session.getAttribute("code");
        System.out.println(attribute);
        System.out.println(session.getAttribute("resetuser"));
        System.out.println(code);
        if (attribute == null || !attribute.equals(code)) {
            String errorMessage = "OTP is Incorrect. Please try again.";
            session.setAttribute("errorMessage", errorMessage);

            // JavaScript code to show an alert and redirect
            String redirectScript = "<script type=\"text/javascript\">"
                    + "alert('OTP is Incorrect. Please try again.');"
                    + "window.location.href = 'Reset-Password';"
                    + "</script>";

            // Write the script to the response
            resp.setContentType("text/html");
            resp.getWriter().println(redirectScript);

//            resp.sendRedirect("otp?error=1");
        } else {

            session.setAttribute("code", null);
            session.setAttribute("changepw", true);
            resp.sendRedirect("changepw");
        }

    }

//    @PostMapping("/changepw")
    @PostMapping("/changepw")
    public void changePassword(HttpSession session, @RequestParam String password, HttpServletResponse resp) throws Exception {
        String resetUser = (String) session.getAttribute("resetuser");

        if (resetUser != null) {
            // Update password for the user
            loginService.updatePassword(resetUser, password);

            // Set a session attribute to indicate password change success
            session.setAttribute("passwordChanged", true);
            resp.sendRedirect("bvsAdmin-Login");
        } else {
            resp.sendRedirect("Reset-Password");
        }

    }

}
