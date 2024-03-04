/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bvs.org.service;

import bvs.org.datatable.DataTableRepo;
import bvs.org.datatable.DataTableRequest;
import bvs.org.datatable.DataTablesResponse;
import bvs.org.dto.NewsLetterDataTable;
import bvs.org.repo.NewsLetterRepo;
import bvs.org.model.NewsLetter;
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
public class NewsLetterService {

    @Autowired
    private DataTableRepo<NewsLetterDataTable> userDt;
    @Autowired
    private NewsLetterRepo repo;

    public DataTablesResponse<NewsLetterDataTable> getNewsLetters(DataTableRequest param) throws Exception {
        return userDt.getData(NewsLetterDataTable.class, param, "SELECT x.`id`,x.`month`,x.`status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `news_letter` X WHERE TRUE");

    }

    public NewsLetter getclasses(Integer id) throws Exception {
        NewsLetter sys = repo.findById(id).get();
        return sys;
    }

    public NewsLetter getNewsLetter(Integer id) throws Exception {
        NewsLetter sys = repo.findById(id).get();
        return sys;
    }

    public NewsLetter deactivateNewsLetter(Integer id) throws Exception {
        NewsLetter syst = repo.findById(id).get();
        syst.setStatus("deactivate");
        syst = repo.save(syst);
        return syst;
    }

    public NewsLetter reactivateNewsLetter(Integer id) throws Exception {
        NewsLetter systems = repo.findById(id).get();
        systems.setStatus("active");
        systems = repo.save(systems);
        return systems;
    }

    public NewsLetter save(String month, MultipartFile file) throws Exception {
        NewsLetter system = new NewsLetter();
        system.setMonth(month);
        system.setStatus("active");
        system = repo.save(system);
        String directoryPath = "BVS-ORG\\NewsLetter\\";

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
            File des = new File(directory, system.getMonth() + "." + split[split.length - 1]);
            file.transferTo(Path.of(des.getAbsolutePath()));
            system.setPath(des.getName());
        }
        return repo.save(system);
    }

    public NewsLetter update(Integer id, String month, MultipartFile file) throws Exception {
        NewsLetter system = repo.findById(id).get();
        system.setMonth(month);
        if (file != null) {
            String[] split = file.getOriginalFilename().split("\\.");
            File des = new File("BVS-ORG\\NewsLetter\\" + month + "." + split[split.length - 1]);
            file.transferTo(Path.of(des.getAbsolutePath()));
            system.setPath(des.getName());
        }
        return repo.save(system);
    }

    public Iterable<NewsLetter> findAllActiveImages() {
        return repo.findByStatus("active");
    }

}
