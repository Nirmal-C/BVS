/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bvs.org.service;

import bvs.org.datatable.DataTableRepo;
import bvs.org.datatable.DataTableRequest;
import bvs.org.datatable.DataTablesResponse;
import bvs.org.dto.StaffDataTable;
import bvs.org.repo.StaffRepo;
import bvs.org.model.Staff;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jdbc.core.mapping.AggregateReference;
import org.springframework.stereotype.Service;

/**
 *
 * @author L580
 */
@Service
public class StaffService {

    @Autowired
    private DataTableRepo<StaffDataTable> userDt;
    @Autowired
    private StaffRepo repo;

    public DataTablesResponse<StaffDataTable> getStaffs(DataTableRequest param) throws Exception {
        return userDt.getData(StaffDataTable.class, param, "SELECT x.`id`,x.`grade`,x.`status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `staff_school` X WHERE TRUE");

    }

    public Iterable<Staff> getAllActiveStaff() {
        return repo.findByStatus("active");
    }

    public Staff saveStaff(String grade, String teacher, String sub_teacher) {

        Staff staff = new Staff();
        staff.setGrade(grade);
        staff.setTeacher(teacher);
        staff.setSub_teacher(sub_teacher);
        staff.setStatus("active");
        staff = repo.save(staff);

        return staff;
    }

    public Staff updateStaff(Integer id, String grade, String teacher, String sub_teacher) throws Exception {
        Staff user = repo.findById(id).get();
        user.setGrade(grade);
        user.setTeacher(teacher);
        user.setSub_teacher(sub_teacher);
        user = repo.save(user);
        return user;
    }

    public Staff getStaff(Integer id) throws Exception {
        Staff not = repo.findById(id).get();
        return not;
    }

    public Staff deactivateStaff(Integer id) throws Exception {
        Staff notic = repo.findById(id).get();
        notic.setStatus("deactivate");
        notic = repo.save(notic);
        return notic;
    }

    public Staff reactivateStaff(Integer id) throws Exception {
        Staff staffs = repo.findById(id).get();
        staffs.setStatus("active");
        staffs = repo.save(staffs);
        return staffs;
    }
}
