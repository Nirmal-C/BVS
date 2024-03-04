package bvs.org.dto;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import lombok.Getter;
import lombok.Setter;

import lombok.AllArgsConstructor;

import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class SyllabusDataTable {

    public Integer id;
    public String grade;
    public String path;
    public String ent_by;
    public String ent_on;

    public String mod_by;
    public String mod_on;
    public String status;

}
