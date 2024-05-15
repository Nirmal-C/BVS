/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bvs.org.service;

import bvs.org.config.UserMail;
import bvs.org.datatable.DataTableRepo;
import bvs.org.datatable.DataTableRequest;
import bvs.org.datatable.DataTablesResponse;
import bvs.org.dto.GetPagesAccDTO;
import bvs.org.dto.GetPagesDTO;
import bvs.org.dto.SlimSelectDTO;
import bvs.org.dto.UserDataTable;
import bvs.org.dto.UserTypeDataTable;
import bvs.org.repo.PageRepo;
import bvs.org.repo.UserTypeRepo;
import bvs.org.repo.UserRepo;
import bvs.org.model.UserType;
import bvs.org.model.User;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.Arrays;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jdbc.core.mapping.AggregateReference;
import org.springframework.stereotype.Service;

/**
 *
 * @author L580
 */
@Service
public class UserService {

    @Autowired
    private DataTableRepo<UserDataTable> userDt;
    @Autowired
    private DataTableRepo<UserTypeDataTable> userTypeDt;
    @Autowired
    private UserRepo repo;
    @Autowired
    PageRepo pageRepo;

    @Autowired
    UserTypeRepo userTypeRepo;

    public DataTablesResponse<UserDataTable> getUsers(DataTableRequest param) throws Exception {
        return userDt.getData(UserDataTable.class, param, "SELECT x.`id`,x.`name`,x.`status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `users` X WHERE TRUE");

    }

    public Iterable<User> getAllActiveUser() {
        return repo.findByStatus("active");
    }

    public User saveUser(String name, String username, String usertype, String email) {
        // Generate a random password
        String password = generateRandomPassword();

        // Create the user entity
        User user = new User();
        user.setName(name);
        user.setUsername(username);
        user.setUsertype(usertype);
        user.setEmail(email);
        user.setPassword(password); // Set the plaintext password
        user.setStatus("active");

        // Save the user entity
        user = repo.save(user);

        // Send email with user credentials
        boolean emailSent = UserMail.sendUserCredentials(email, username, password);

        if (emailSent) {
            return user;
        } else {
            // If email fails to send, delete the user and throw an exception
            repo.delete(user);
            throw new RuntimeException("Failed to send email. User creation rolled back.");
        }
    }

    private String generateRandomPassword() {
        // Define characters allowed in the password
        String allowedChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

        // Generate a random password of length 8
        StringBuilder password = new StringBuilder();
        for (int i = 0; i < 8; i++) {
            int index = (int) (Math.random() * allowedChars.length());
            password.append(allowedChars.charAt(index));
        }

        return password.toString();
    }

    public User updateUser(Integer id, String name, String username, String usertype, String email) throws Exception {
        User user = repo.findById(id).get();
        user.setName(name);
        user.setUsername(username);
        user.setUsertype(usertype);
        user.setEmail(email);
        user = repo.save(user);
        return user;
    }

    public User getUser(Integer id) throws Exception {
        User not = repo.findById(id).get();
        return not;
    }

    public User deactivateUser(Integer id) throws Exception {
        User notic = repo.findById(id).get();
        notic.setStatus("deactivate");
        notic = repo.save(notic);
        return notic;
    }

    public User reactivateUser(Integer id) throws Exception {
        User staffs = repo.findById(id).get();
        staffs.setStatus("active");
        staffs = repo.save(staffs);
        return staffs;
    }

    public DataTablesResponse<UserTypeDataTable> getUserType(DataTableRequest param) throws Exception {
        return userTypeDt.getData(UserTypeDataTable.class, param, "SELECT x.`id`,x.`name`,x.`status`,(SELECT d.`username` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `user_type` X WHERE TRUE ");
    }

    public UserType saveUserType(String name, String pages) throws Exception {

        List<Integer> pageNumbers = Arrays.asList(new ObjectMapper().readValue(pages, Integer[].class));

        String pagesJson = new ObjectMapper().writeValueAsString(pageNumbers);

        UserType page = new UserType();
        page.setName(name);
        page.setPages(pagesJson);
        page.setStatus("active");

        page = userTypeRepo.save(page);

        return page;

    }

    public UserType updateUserType(Integer id, String name, String pages) throws Exception {

        List<Integer> pageNumbers = Arrays.asList(new ObjectMapper().readValue(pages, Integer[].class));

        String pagesJson = new ObjectMapper().writeValueAsString(pageNumbers);

        UserType page = userTypeRepo.findById(id).get();
        page.setName(name);
        page.setPages(pagesJson);
        page.setStatus("active");

        page = userTypeRepo.save(page);

        return page;

    }

    public UserType deactivateUserType(Integer id) throws Exception {
        UserType utype = userTypeRepo.findById(id).get();
        utype.setStatus("deactivate");
        utype = userTypeRepo.save(utype);
        return utype;
    }

    public UserType reactivateUserType(Integer id) throws Exception {
        UserType utype = userTypeRepo.findById(id).get();
        utype.setStatus("active");
        utype = userTypeRepo.save(utype);
        return utype;
    }

    public GetPagesDTO getPage() {
//    public Iterable<Page> getPage() {
        return pageRepo.getPage();
    }

    public Iterable<GetPagesAccDTO> getPageAccess(Integer uid) {
//    public Iterable<Page> getPage() {
        return pageRepo.getPageAccess(uid);
    }

    public GetPagesDTO getSelectedPage(Integer id) {
//    public Iterable<Page> getPage() {
        return pageRepo.getSelectedPage(id);
    }

    public Iterable<SlimSelectDTO> getUserTypeIdAndName(String search) {
        return userTypeRepo.getIdAndName("%" + search.trim() + "%");
    }

}
