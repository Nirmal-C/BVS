/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bvs.org.controllers;

import bvs.org.datatable.DataTableRequest;
import bvs.org.datatable.DataTablesResponse;
import bvs.org.dto.TeamDto;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import bvs.org.model.Team;
import bvs.org.model.TeamMembers;
import bvs.org.service.TeamService;
import java.util.ArrayList;

@RestController
@RequestMapping("/team")
public class TeamController {

    @Autowired
    TeamService service;

    @PostMapping("/team-content")
    public DataTablesResponse<TeamDto> getTeams(@RequestBody DataTableRequest param) throws Exception {
        return service.getTeams(param);
    }

    @GetMapping("/content-details/{id}")
    public ResponseEntity<CommonResponse> getTeam(@PathVariable Integer id) throws Exception {
        CommonResponse response = new CommonResponse("Success!", service.getTeam(id), 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/deactivate-content")
    public ResponseEntity<CommonResponse> deactivateTeam(@RequestParam Integer id) throws Exception {
        service.deactivateTeam(id);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/reactivate-content")
    public ResponseEntity<CommonResponse> reactivateTeam(@RequestParam Integer id) throws Exception {
        service.reactivateTeam(id);
        CommonResponse response = new CommonResponse("Success!", 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @GetMapping("/attach-content")
    public Iterable<Team> getAllActiveAttatchments() {
        return service.getAllActiveAttatchments();
    }

    @GetMapping("/{id}")
    public ResponseEntity<CommonResponse> getMembers(@PathVariable Integer id) throws Exception {
        CommonResponse response = new CommonResponse("Success!", service.getMembers(id), 200);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @GetMapping("/attachment-details/{id}")
    public ResponseEntity<Map<String, Object>> getMembersDetails(@PathVariable Integer id) {
        try {
            List<TeamMembers> attachments = service.getActiveMemberssByTeamId(id);
            Map<String, Object> response = new HashMap<>();
            response.put("data", attachments);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            // Handle exception and return an error response
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @PostMapping("/save-attachment")
    @ResponseBody
    public Team uploadMembers(@RequestParam("team") String team,
            @RequestParam("desclist") String desclist) throws Exception {
        return service.saveMembers(team, desclist);
    }

    @PostMapping("/update-attachment")
    @ResponseBody
    public Team updateMembers(String id, String team, String desclist, @RequestParam(value = "deleteIds", required = false) String deleteIds) throws Exception {
        Integer idd = Integer.parseInt(id);
        // Pass deleteIds to the service method
        System.out.println(deleteIds);
        return service.updateMembers(idd, team, desclist, deleteIds);

    }

}
