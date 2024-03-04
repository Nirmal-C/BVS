/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bvs.org.service;

import bvs.org.datatable.DataTableRepo;
import bvs.org.datatable.DataTableRequest;
import bvs.org.datatable.DataTablesResponse;
import bvs.org.dto.SchoolCalDataTable;
import bvs.org.model.SchoolCalendar;
import bvs.org.model.SchoolCalendar;
import bvs.org.repo.SchoolCalRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jdbc.core.mapping.AggregateReference;
import org.springframework.stereotype.Service;

/**
 *
 * @author L580
 */
@Service
public class SchoolCalendarService {

    @Autowired
    private DataTableRepo<SchoolCalDataTable> userDt;
    @Autowired
    private SchoolCalRepo repo;

    public DataTablesResponse<SchoolCalDataTable> getSchoolCalendars(DataTableRequest param) throws Exception {
        return userDt.getData(SchoolCalDataTable.class, param, "SELECT x.`id`,x.`description`,x.`status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `school_calendar` X WHERE TRUE");

    }

    public Iterable<SchoolCalendar> getAllActiveSchoolCalendar() {
        return repo.findByStatus("active");
    }

    public SchoolCalendar saveSchoolCalendar(String description, String date) {

        SchoolCalendar staff = new SchoolCalendar();
        staff.setDescription(description);
        staff.setDate(date);
        staff.setStatus("active");
        staff = repo.save(staff);

        return staff;
    }

    public SchoolCalendar updateSchoolCalendar(Integer id, String description, String date) throws Exception {
        SchoolCalendar user = repo.findById(id).get();
        user.setDescription(description);
        user.setDate(date);
        user = repo.save(user);
        return user;
    }

    public SchoolCalendar getSchoolCalendar(Integer id) throws Exception {
        SchoolCalendar not = repo.findById(id).get();
        return not;
    }

    public SchoolCalendar deactivateSchoolCalendar(Integer id) throws Exception {
        SchoolCalendar notic = repo.findById(id).get();
        notic.setStatus("deactivate");
        notic = repo.save(notic);
        return notic;
    }

    public SchoolCalendar reactivateSchoolCalendar(Integer id) throws Exception {
        SchoolCalendar staffs = repo.findById(id).get();
        staffs.setStatus("active");
        staffs = repo.save(staffs);
        return staffs;
    }
}
