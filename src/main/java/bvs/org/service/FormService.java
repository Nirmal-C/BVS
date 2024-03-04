/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bvs.org.service;

import bvs.org.datatable.DataTableRepo;
import bvs.org.datatable.DataTableRequest;
import bvs.org.datatable.DataTablesResponse;
import bvs.org.dto.FormDataTable;
import bvs.org.repo.FormRepo;
import bvs.org.model.Form;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jdbc.core.mapping.AggregateReference;
import org.springframework.stereotype.Service;

/**
 *
 * @author L580
 */
@Service
public class FormService {

    @Autowired
    private DataTableRepo<FormDataTable> userDt;
    @Autowired
    private FormRepo repo;

    public DataTablesResponse<FormDataTable> getForms(DataTableRequest param) throws Exception {
        return userDt.getData(FormDataTable.class, param, "SELECT x.`id`,x.`name`,x.`status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `forms` X WHERE TRUE");

    }

    public Iterable<Form> getAllActiveForm() {
        return repo.findByStatus("active");
    }

    public Form saveForm(String name, String iframe) {

        Form form = new Form();
        form.setName(name);
        form.setIframe(iframe);
        form.setStatus("active");
        form = repo.save(form);

        return form;
    }

    public Form updateForm(Integer id, String name, String iframe) throws Exception {
        Form user = repo.findById(id).get();
        user.setName(name);
        user.setIframe(iframe);
        user = repo.save(user);
        return user;
    }

    public Form getForm(Integer id) throws Exception {
        Form not = repo.findById(id).get();
        return not;
    }

    public Form deactivateForm(Integer id) throws Exception {
        Form notic = repo.findById(id).get();
        notic.setStatus("deactivate");
        notic = repo.save(notic);
        return notic;
    }

    public Form reactivateForm(Integer id) throws Exception {
        Form forms = repo.findById(id).get();
        forms.setStatus("active");
        forms = repo.save(forms);
        return forms;
    }
}
