/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bvs.org.controllers;

import bvs.org.datatable.DataTableRequest;
import bvs.org.datatable.DataTablesResponse;
import bvs.org.dto.FormDataTable;
import bvs.org.model.Form;

import bvs.org.service.FormService;
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
@RequestMapping("/form")
public class FormController {

    @Autowired
    FormService service;

    @PostMapping("/forms")
    public DataTablesResponse<FormDataTable> getForms(@RequestBody DataTableRequest param) throws Exception {
        return service.getForms(param);
    }

    @GetMapping("/details")
    public Iterable<Form> getAllActiveForm() {
        return service.getAllActiveForm();
    }

    @GetMapping("/details/{id}")
    public Form getForm(@PathVariable Integer id) throws Exception {
        return service.getForm(id);
    }

    @PostMapping("/save-form")
    public ResponseEntity<CommonResponse> saveForm(@RequestParam String name, @RequestParam String iframe) throws Exception {
        service.saveForm(name, iframe);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @GetMapping("/update-form/{id}")
    public Form getUser(@PathVariable Integer id) throws Exception {
        return service.getForm(id);
    }

    @PostMapping("/update-form")
    public ResponseEntity<CommonResponse> updateForm(@RequestParam Integer id, @RequestParam String name, @RequestParam String iframe) throws Exception {
        service.updateForm(id, name, iframe);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/deactivate-form")
    public ResponseEntity<CommonResponse> deactivateForm(@RequestParam Integer id) throws Exception {
        service.deactivateForm(id);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/reactivate-form")
    public ResponseEntity<CommonResponse> reactivateForm(@RequestParam Integer id) throws Exception {
        service.reactivateForm(id);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

}
