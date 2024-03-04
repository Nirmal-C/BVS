/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bvs.org.repo;

import bvs.org.model.Syllabus;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author cpm.999cc
 */
@Repository
public interface SyllabusRepo extends CrudRepository<Syllabus, Integer> {

    Iterable<Syllabus> findByStatus(String status);
}
