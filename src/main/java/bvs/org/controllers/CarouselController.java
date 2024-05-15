/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bvs.org.controllers;

import bvs.org.datatable.DataTableRequest;
import bvs.org.datatable.DataTablesResponse;
import bvs.org.dto.CarouselDataTable;
import bvs.org.model.Carousel;
import bvs.org.model.Carousel;

import bvs.org.service.CarouselService;
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
@RequestMapping("/carousel")
public class CarouselController {

    @Autowired
    CarouselService service;

    @PostMapping("/carousels")
    public DataTablesResponse<CarouselDataTable> getCarousels(@RequestBody DataTableRequest param) throws Exception {
        return service.getCarousels(param);
    }

    @GetMapping("/images")
    public Iterable<Carousel> getAllActiveImages() {
        return service.findAllActiveImages();
    }

    @GetMapping("/details/{id}")
    public ResponseEntity<CommonResponse> details(@PathVariable Integer id) throws Exception {
        CommonResponse response = new CommonResponse("Success!", service.getclasses(id), 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/deactivate-carousel")
    public ResponseEntity<CommonResponse> deactivateCarousel(@RequestParam Integer id) throws Exception {
        service.deactivateCarousel(id);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/reactivate-carousel")
    public ResponseEntity<CommonResponse> reactivateCarousel(@RequestParam Integer id) throws Exception {
        service.reactivateCarousel(id);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/save")
    @ResponseBody
    public Carousel upload(MultipartHttpServletRequest req) throws Exception {
        String heading = req.getParameter("heading");
        String para = req.getParameter("para");
        MultipartFile file = req.getFile("file");
        return service.save(heading, para, file);
    }

    @PostMapping("/update")
    @ResponseBody
    public Carousel update(MultipartHttpServletRequest req) throws Exception {
        Integer id = Integer.parseInt(req.getParameter("id"));
        String heading = req.getParameter("heading");
        String para = req.getParameter("para");
        MultipartFile file = req.getFile("file");
        return service.update(id, heading, para, file);
    }

    @GetMapping("/path/carousels/{name}")
    @ResponseBody
    public void view(@PathVariable String name, HttpServletResponse resp) throws IOException {

        File file = new File("BVS-ORG\\Carousel\\" + name);

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
