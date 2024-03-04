/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bvs.org.repo;

import bvs.org.model.DhammaContent;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author cpm.999cc
 */
@Repository
public interface DhammaContentRepo extends CrudRepository<DhammaContent, Integer> {

    Iterable<DhammaContent> findByStatus(String status);

    Iterable<DhammaContent> findByHeading(Integer id);

//    List<DhammaContent> findByDhammaVideoAndStatus(Integer id, String status);
}
