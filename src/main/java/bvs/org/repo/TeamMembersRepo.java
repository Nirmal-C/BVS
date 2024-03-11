/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bvs.org.repo;

import bvs.org.model.TeamMembers;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author cpm.999cc
 */
@Repository
public interface TeamMembersRepo extends CrudRepository<TeamMembers, Integer> {

    Iterable<TeamMembers> findByStatus(String status);

    Iterable<TeamMembers> findByTeam(Integer id);

    List<TeamMembers> findByTeamAndStatus(Integer id, String status);

    public Object findById(String deleteId);
}
