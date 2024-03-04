/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bvs.org.service;

import bvs.org.config.UserMail;
import bvs.org.datatable.DataTableRepo;
import bvs.org.datatable.DataTableRequest;
import bvs.org.datatable.DataTablesResponse;
import bvs.org.dto.UserDataTable;
import bvs.org.repo.UserRepo;
import bvs.org.model.User;
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
    private UserRepo repo;

    public DataTablesResponse<UserDataTable> getUsers(DataTableRequest param) throws Exception {
        return userDt.getData(UserDataTable.class, param, "SELECT x.`id`,x.`name`,x.`status`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id`=x.`mod_by`) AS `mod_by`,`mod_on` FROM `users` X WHERE TRUE");

    }

    public Iterable<User> getAllActiveUser() {
        return repo.findByStatus("active");
    }

    public User saveUser(String name, String username, String email) {
        // Generate a random password
        String password = generateRandomPassword();

        // Create the user entity
        User user = new User();
        user.setName(name);
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(password); // Set the plaintext password
        user.setStatus("active");

        // Save the user entity
        user = repo.save(user);

        // Send email with user credentials
        boolean emailSent = UserMail.sendUserCredentials(email, username, password);

        return user;
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

    public User updateUser(Integer id, String name, String username, String email) throws Exception {
        User user = repo.findById(id).get();
        user.setName(name);
        user.setUsername(username);
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

}
