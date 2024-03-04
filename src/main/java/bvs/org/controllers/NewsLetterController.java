/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bvs.org.controllers;

import bvs.org.datatable.DataTableRequest;
import bvs.org.datatable.DataTablesResponse;
import bvs.org.dto.NewsLetterDataTable;
import bvs.org.model.NewsLetter;
import bvs.org.model.NewsLetter;

import bvs.org.service.NewsLetterService;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@RestController
@RequestMapping("/letter")
public class NewsLetterController {

    @Autowired
    NewsLetterService service;

    @PostMapping("/letters")
    public DataTablesResponse<NewsLetterDataTable> getNewsLetters(@RequestBody DataTableRequest param) throws Exception {
        return service.getNewsLetters(param);
    }

    @GetMapping("/newsletter")
    public Iterable<NewsLetter> getAllActiveImages() {
        return service.findAllActiveImages();
    }

    @GetMapping("/details/{id}")
    public ResponseEntity<CommonResponse> details(@PathVariable Integer id) throws Exception {
        CommonResponse response = new CommonResponse("Success!", service.getclasses(id), 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/deactivate-letter")
    public ResponseEntity<CommonResponse> deactivateNewsLetter(@RequestParam Integer id) throws Exception {
        service.deactivateNewsLetter(id);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/reactivate-letter")
    public ResponseEntity<CommonResponse> reactivateNewsLetter(@RequestParam Integer id) throws Exception {
        service.reactivateNewsLetter(id);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/save")
    @ResponseBody
    public NewsLetter upload(MultipartHttpServletRequest req) throws Exception {
        String month = req.getParameter("month");
        MultipartFile file = req.getFile("file");
        return service.save(month, file);
    }

    @PostMapping("/update")
    @ResponseBody
    public NewsLetter update(MultipartHttpServletRequest req) throws Exception {
        Integer id = Integer.parseInt(req.getParameter("id"));
        String month = req.getParameter("month");
        MultipartFile file = req.getFile("file");
        return service.update(id, month, file);
    }

    @GetMapping("/path/letters/{name}")
    @ResponseBody
    public void view(@PathVariable String name, HttpServletResponse resp) throws IOException {

        File file = new File("BVS-ORG\\NewsLetter\\" + name);

        if (!file.exists()) {
            resp.sendError(404, "file not found");
            return;
        }

        OutputStream out = resp.getOutputStream();
        FileInputStream in = new FileInputStream(file);
        byte[] buffer = new byte[4096];
        int length;
        while ((length = in.read(buffer)) > 0) {
            out.write(buffer, 0, length);
        }
        in.close();
        out.flush();

    }
}
