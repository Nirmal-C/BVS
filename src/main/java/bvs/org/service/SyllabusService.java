/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bvs.org.service;

import bvs.org.datatable.DataTableRepo;
import bvs.org.datatable.DataTableRequest;
import bvs.org.datatable.DataTablesResponse;
import bvs.org.dto.SyllabusDataTable;
import bvs.org.repo.SyllabusRepo;
import bvs.org.model.Syllabus;
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
public class SyllabusService {

    @Autowired
    private DataTableRepo<SyllabusDataTable> userDt;
    @Autowired
    private SyllabusRepo repo;

    public DataTablesResponse<SyllabusDataTable> getSyllabuss(DataTableRequest param) throws Exception {
        return userDt.getData(SyllabusDataTable.class, param, "SELECT x.`id`,x.`grade`,x.`status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `syllabus` X WHERE TRUE");

    }

    public Syllabus getclasses(Integer id) throws Exception {
        Syllabus sys = repo.findById(id).get();
        return sys;
    }

    public Syllabus getSyllabus(Integer id) throws Exception {
        Syllabus sys = repo.findById(id).get();
        return sys;
    }

    public Syllabus deactivateSyllabus(Integer id) throws Exception {
        Syllabus syst = repo.findById(id).get();
        syst.setStatus("deactivate");
        syst = repo.save(syst);
        return syst;
    }

    public Syllabus reactivateSyllabus(Integer id) throws Exception {
        Syllabus systems = repo.findById(id).get();
        systems.setStatus("active");
        systems = repo.save(systems);
        return systems;
    }

    public Syllabus save(String grade, MultipartFile file) throws Exception {
        Syllabus system = new Syllabus();
        system.setGrade(grade);
        system.setStatus("active");
        system = repo.save(system);
        String directoryPath = "BVS-ORG\\Syllabus\\";

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
            File des = new File(directory, system.getGrade() + "." + split[split.length - 1]);
            file.transferTo(Path.of(des.getAbsolutePath()));
            system.setPath(des.getName());
        }
        return repo.save(system);
    }

    public Syllabus update(Integer id, String grade, MultipartFile file) throws Exception {
        Syllabus system = repo.findById(id).get();
        system.setGrade(grade);
        if (file != null) {
            String[] split = file.getOriginalFilename().split("\\.");
            File des = new File("BVS-ORG\\Syllabus\\" + grade + "." + split[split.length - 1]);
            file.transferTo(Path.of(des.getAbsolutePath()));
            system.setPath(des.getName());
        }
        return repo.save(system);
    }

    public Iterable<Syllabus> findAllActiveImages() {
        return repo.findByStatus("active");
    }

}
