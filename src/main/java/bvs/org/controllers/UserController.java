/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bvs.org.controllers;

import bvs.org.config.UserMail;
import bvs.org.datatable.DataTableRequest;
import bvs.org.datatable.DataTablesResponse;
import bvs.org.dto.UserDataTable;
import bvs.org.model.User;

import bvs.org.service.UserService;
import java.sql.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService service;

    @PostMapping("/users")
    public DataTablesResponse<UserDataTable> getUsers(@RequestBody DataTableRequest param) throws Exception {
        return service.getUsers(param);
    }

    @GetMapping("/details")
    public Iterable<User> getAllActiveUser() {
        return service.getAllActiveUser();
    }

//    @PostMapping("/save-user")
//    public ResponseEntity<CommonResponse> saveUser(@RequestParam String name, @RequestParam String username, @RequestParam String email) throws Exception {
//        service.saveUser(name, username, email);
//        CommonResponse response = new CommonResponse("Success!", 200);
//        return new ResponseEntity<>(response, HttpStatus.OK);
//    }
    @PostMapping("/save-user")
    public ResponseEntity<String> saveUser(@RequestBody UserDataTable userDataTable) {
        User user = service.saveUser(userDataTable.getName(), userDataTable.getUsername(), userDataTable.getEmail());

        if (user != null) {
            return new ResponseEntity<>("User saved and email sent successfully!", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Failed to save user or send email.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/update-user/{id}")
    public User getUser(@PathVariable Integer id) throws Exception {
        return service.getUser(id);
    }

    @PostMapping("/update-user")
    public ResponseEntity<CommonResponse> updateUser(@RequestParam Integer id, @RequestParam String name, @RequestParam String username, @RequestParam String email) throws Exception {
        service.updateUser(id, name, username, email);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/deactivate-user")
    public ResponseEntity<CommonResponse> deactivateUser(@RequestParam Integer id) throws Exception {
        service.deactivateUser(id);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/reactivate-user")
    public ResponseEntity<CommonResponse> reactivateUser(@RequestParam Integer id) throws Exception {
        service.reactivateUser(id);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

}