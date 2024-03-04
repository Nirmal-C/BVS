/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bvs.org.controllers;

import bvs.org.datatable.DataTableRequest;
import bvs.org.datatable.DataTablesResponse;
import bvs.org.dto.StaffDataTable;
import bvs.org.model.Staff;

import bvs.org.service.StaffService;
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
@RequestMapping("/staff")
public class StaffController {

    @Autowired
    StaffService service;

    @PostMapping("/staffs")
    public DataTablesResponse<StaffDataTable> getStaffs(@RequestBody DataTableRequest param) throws Exception {
        return service.getStaffs(param);
    }

    @GetMapping("/details")
    public Iterable<Staff> getAllActiveStaff() {
        return service.getAllActiveStaff();
    }

    @PostMapping("/save-staff")
    public ResponseEntity<CommonResponse> saveStaff(@RequestParam String grade, @RequestParam String teacher, @RequestParam String sub_teacher) throws Exception {
        service.saveStaff(grade, teacher, sub_teacher);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @GetMapping("/update-staff/{id}")
    public Staff getUser(@PathVariable Integer id) throws Exception {
        return service.getStaff(id);
    }

    @PostMapping("/update-staff")
    public ResponseEntity<CommonResponse> updateStaff(@RequestParam Integer id, @RequestParam String grade, @RequestParam String teacher, @RequestParam String sub_teacher) throws Exception {
        service.updateStaff(id, grade, teacher, sub_teacher);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/deactivate-staff")
    public ResponseEntity<CommonResponse> deactivateStaff(@RequestParam Integer id) throws Exception {
        service.deactivateStaff(id);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/reactivate-staff")
    public ResponseEntity<CommonResponse> reactivateStaff(@RequestParam Integer id) throws Exception {
        service.reactivateStaff(id);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

}
