/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bvs.org.controllers;

import bvs.org.datatable.DataTableRequest;
import bvs.org.datatable.DataTablesResponse;
import bvs.org.dto.DhammaContentDto;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import bvs.org.model.DhammaContent;
import bvs.org.model.DhammaVideo;
import bvs.org.service.DhammaVideoService;
import java.util.ArrayList;

@RestController
@RequestMapping("/dhamma")
public class DhammaVideoController {

    @Autowired
    DhammaVideoService service;

    @PostMapping("/dhamma-content")
    public DataTablesResponse<DhammaContentDto> getDhammaContents(@RequestBody DataTableRequest param) throws Exception {
        return service.getDhammaContents(param);
    }

    @GetMapping("/content-details/{id}")
    public ResponseEntity<CommonResponse> getDhammaContent(@PathVariable Integer id) throws Exception {
        CommonResponse response = new CommonResponse("Success!", service.getDhammaContent(id), 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/deactivate-content")
    public ResponseEntity<CommonResponse> deactivateDhammaContent(@RequestParam Integer id) throws Exception {
        service.deactivateDhammaContent(id);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/reactivate-content")
    public ResponseEntity<CommonResponse> reactivateDhammaContent(@RequestParam Integer id) throws Exception {
        service.reactivateDhammaContent(id);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @GetMapping("/attach-content")
    public Iterable<DhammaContent> getAllActiveAttatchments() {
        return service.getAllActiveAttatchments();
    }

    @GetMapping("/{id}")
    public ResponseEntity<CommonResponse> getAttachment(@PathVariable Integer id) throws Exception {
        CommonResponse response = new CommonResponse("Success!", service.getAttachment(id), 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @GetMapping("/attachment-details/{id}")
    public ResponseEntity<Map<String, Object>> getAttachmentDetails(@PathVariable Integer id) {
        try {
            List<DhammaVideo> attachments = service.getActiveAttachmentsByDhammaContentId(id);
            Map<String, Object> response = new HashMap<>();
            response.put("data", attachments);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            // Handle exception and return an error response
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @PostMapping("/save-attachment")
    @ResponseBody
    public DhammaContent uploadAttachment(@RequestParam("heading") String heading,
            @RequestParam("desclist") String desclist) throws Exception {
        return service.saveAttachment(heading, desclist);
    }

    @PostMapping("/update-attachment")
    @ResponseBody
    public DhammaContent updateAttachment(String id, String heading, String desclist, @RequestParam(value = "deleteIds", required = false) String deleteIds) throws Exception {
        Integer idd = Integer.parseInt(id);
        // Pass deleteIds to the service method
        System.out.println(deleteIds);
        return service.updateAttachment(idd, heading, desclist, deleteIds);

    }

}
