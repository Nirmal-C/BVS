/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bvs.org.controllers;

import bvs.org.datatable.DataTableRequest;
import bvs.org.datatable.DataTablesResponse;
import bvs.org.dto.SchoolCalDataTable;
import bvs.org.model.SchoolCalendar;

import bvs.org.service.SchoolCalendarService;
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
@RequestMapping("/calendar")
public class SchoolCalendarController {

    @Autowired
    SchoolCalendarService service;

    @PostMapping("/calendars")
    public DataTablesResponse<SchoolCalDataTable> getSchoolCalendars(@RequestBody DataTableRequest param) throws Exception {
        return service.getSchoolCalendars(param);
    }

    @GetMapping("/details-calendar")
    public Iterable<SchoolCalendar> getAllActiveSchoolCalendar() {
        return service.getAllActiveSchoolCalendar();
    }

    @PostMapping("/save-calendar")
    public ResponseEntity<CommonResponse> saveSchoolCalendar(@RequestParam String description, @RequestParam String date) throws Exception {
        service.saveSchoolCalendar(description, date);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @GetMapping("/update-calendar/{id}")
    public SchoolCalendar getUser(@PathVariable Integer id) throws Exception {
        return service.getSchoolCalendar(id);
    }

    @PostMapping("/update-calendar")
    public ResponseEntity<CommonResponse> updateSchoolCalendar(@RequestParam Integer id, @RequestParam String description, @RequestParam String date) throws Exception {
        service.updateSchoolCalendar(id, description, date);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/deactivate-calendar")
    public ResponseEntity<CommonResponse> deactivateSchoolCalendar(@RequestParam Integer id) throws Exception {
        service.deactivateSchoolCalendar(id);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/reactivate-calendar")
    public ResponseEntity<CommonResponse> reactivateSchoolCalendar(@RequestParam Integer id) throws Exception {
        service.reactivateSchoolCalendar(id);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

}
