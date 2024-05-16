/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bvs.org.service;

import bvs.org.datatable.DataTableRepo;
import bvs.org.datatable.DataTableRequest;
import bvs.org.datatable.DataTablesResponse;
import bvs.org.dto.CarouselDataTable;
import bvs.org.repo.CarouselRepo;
import bvs.org.model.Carousel;
import java.io.File;
import java.nio.file.Path;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jdbc.core.mapping.AggregateReference;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author L580
 */
@Service
public class CarouselService {

    @Autowired
    private DataTableRepo<CarouselDataTable> userDt;
    @Autowired
    private CarouselRepo repo;

    public DataTablesResponse<CarouselDataTable> getCarousels(DataTableRequest param) throws Exception {
        return userDt.getData(CarouselDataTable.class, param, "SELECT x.`id`,x.`heading`,x.`status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `carousel` X WHERE TRUE");

    }

    public Carousel getclasses(Integer id) throws Exception {
        Carousel sys = repo.findById(id).get();
        return sys;
    }

    public Carousel getCarousel(Integer id) throws Exception {
        Carousel sys = repo.findById(id).get();
        return sys;
    }

    public Carousel deactivateCarousel(Integer id) throws Exception {
        Carousel syst = repo.findById(id).get();
        syst.setStatus("deactivate");
        syst = repo.save(syst);
        return syst;
    }

    public Carousel reactivateCarousel(Integer id) throws Exception {
        Carousel systems = repo.findById(id).get();
        systems.setStatus("active");
        systems = repo.save(systems);
        return systems;
    }

    public Carousel save(String heading, String para, MultipartFile file) throws Exception {
        Carousel system = new Carousel();
        system.setHeading(heading);
        system.setPara(para);
        system.setStatus("active");
        system = repo.save(system);
        String directoryPath = "BVS-ORG\\Carousel\\";

        File directory = new File(directoryPath);
        if (!directory.exists()) {
            if (directory.mkdirs()) {
                System.out.println("Directory created successfully");
            } else {
                throw new Exception("Failed to create directory");
            }
        }
        if (file != null) {
            String[] split = file.getOriginalFilename().split("\\.");
            File des = new File(directory, system.getHeading() + "." + split[split.length - 1]);
            file.transferTo(Path.of(des.getAbsolutePath()));
            system.setPath(des.getName());
        }
        return repo.save(system);
    }

    public Carousel update(Integer id, String heading, String para, MultipartFile file) throws Exception {
        Carousel system = repo.findById(id).get();
        system.setHeading(heading);
        system.setPara(para);
        if (file != null) {
            String[] split = file.getOriginalFilename().split("\\.");
            File des = new File("BVS-ORG\\Carousel\\" + heading + "." + split[split.length - 1]);
            file.transferTo(Path.of(des.getAbsolutePath()));
            system.setPath(des.getName());
        }
        return repo.save(system);
    }

    public Iterable<Carousel> findAllActiveImages() {
        return repo.findByStatus("active");
    }

}
