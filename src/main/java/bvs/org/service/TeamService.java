/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bvs.org.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import bvs.org.datatable.DataTableRepo;
import bvs.org.datatable.DataTableRequest;
import bvs.org.datatable.DataTablesResponse;
import bvs.org.dto.TeamAllDto;
import bvs.org.dto.TeamMembersDto;
import bvs.org.dto.TeamDto;
import bvs.org.model.TeamMembers;
import bvs.org.repo.TeamMembersRepo;
import java.io.File;
import java.nio.file.Path;
import bvs.org.model.Team;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.MultiValueMap;
import org.springframework.web.multipart.MultipartFile;
import static org.springframework.web.servlet.function.RequestPredicates.param;
import static org.springframework.web.servlet.function.RequestPredicates.path;
import bvs.org.repo.TeamRepo;
import java.util.HashMap;
import java.util.Optional;

/**
 *
 * @author L580
 */
@Service
public class TeamService {

    @Autowired
    private DataTableRepo<TeamMembersDto> unitDt;
    @Autowired
    private DataTableRepo<TeamDto> attDt;

    @Autowired
    private TeamMembersRepo memberRepo;
    @Autowired
    private TeamRepo teamRepo;

    public DataTablesResponse<TeamDto> getTeams(DataTableRequest param) throws Exception {
        return attDt.getData(TeamDto.class, param, "SELECT x.`id`, x.`team`, x.`status`,(SELECT d.`name` FROM `users` d WHERE d.`id` = x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id` = x.`mod_by`) AS `mod_by`,`mod_on` FROM `teams` X");

    }

    public Object getTeam(Integer id) throws Exception {
        Team content = teamRepo.findById(id).get();
        List<TeamMembers> videos = memberRepo.findByTeamAndStatus(id, "active");
        Map<String, Object> data = new HashMap<>();
        data.put("content", content);
        data.put("videos", videos);
        return data;
    }

    private final ObjectMapper mapper = new ObjectMapper();

    public Team deactivateTeam(Integer id) throws Exception {
        Team syst = teamRepo.findById(id).get();
        syst.setStatus("deactivate");
        syst = teamRepo.save(syst);
        return syst;
    }

    public Team reactivateTeam(Integer id) throws Exception {
        Team systems = teamRepo.findById(id).get();
        systems.setStatus("active");
        systems = teamRepo.save(systems);
        return systems;
    }

    public Iterable<Team> getAllActiveAttatchments() {
        return teamRepo.findByStatus("active");
    }

    public TeamAllDto getMembers(Integer id) throws Exception {
        Team con = teamRepo.findById(id).get();
        Iterable<TeamMembers> teamMembers = memberRepo.findByTeamAndStatus(id, "active");

        TeamAllDto dto = new TeamAllDto();
        dto.setMembers(teamMembers);
        dto.setTeam(con.getTeam());
        return dto;
    }

    public List<TeamMembers> getActiveMemberssByTeamId(Integer id) throws Exception {
        return memberRepo.findByTeamAndStatus(id, "active");
    }

    public Team saveMembers(String team, String desclist) throws Exception {
        Team system = new Team();
        system.setTeam(team);
        system.setStatus("active");
        system = teamRepo.save(system);

        JsonNode fileList = mapper.readTree(desclist);
        for (int i = 0; i < fileList.size(); i++) {
            JsonNode fileItem = fileList.get(i);

            TeamMembers attachment = new TeamMembers();
            attachment.setTeam(system.getId());
            attachment.setName(fileItem.get("name").asText());
            attachment.setStatus("active");
            attachment = memberRepo.save(attachment);
            System.out.println("attachment - " + attachment.getId());
            memberRepo.save(attachment);
        }

        return teamRepo.save(system);
    }

    public Team updateMembers(Integer id, String team, String desclist, String deleteIds) {
        try {
            Team system = teamRepo.findById(id).orElseThrow(() -> new Exception("TeamMembers not found"));
            system.setTeam(team);

            if (deleteIds != null) {

                JsonNode toBeDeleted = mapper.readTree(deleteIds);
                for (JsonNode jsonNode : toBeDeleted) {
                    Optional<TeamMembers> optionalMembers = (Optional<TeamMembers>) memberRepo.findById(Integer.parseInt(jsonNode.asText()));
                    if (optionalMembers.isPresent()) {
                        TeamMembers attachmentToDelete = optionalMembers.get();
                        attachmentToDelete.setStatus("deactivate");
                        memberRepo.save(attachmentToDelete);
                    } else {
                        // Handle case where attachment with given ID is not found
                        throw new Exception("Members with ID " + jsonNode.asText() + " not found");
                    }
                }
            }

            if (desclist != null && !desclist.isEmpty()) {
                // Parse the description list string to JSON
                JsonNode fileList = mapper.readTree(desclist);

                // Iterate over each item in the description list
                for (int i = 0; i < fileList.size(); i++) {
                    JsonNode fileItem = fileList.get(i);

                    // Extract file information from JSON
                    String fileName = fileItem.get("name").asText();

                    TeamMembers attachment = new TeamMembers();
                    attachment.setTeam(system.getId());
                    attachment.setName(fileName);

                    // Save the new or updated attachment
                    attachment.setStatus("active");
                    memberRepo.save(attachment);
                }
            }

            return teamRepo.save(system);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to update unit with attachments", e);
        }
    }

    private boolean containsMembersId(String desclist, Integer attachmentId) throws JsonProcessingException {
        JsonNode fileList = mapper.readTree(desclist);
        for (int i = 0; i < fileList.size(); i++) {
            JsonNode fileItem = fileList.get(i);
            Integer fileId = fileItem.get("fileId").asInt();
            if (fileId.equals(attachmentId)) {
                return true;
            }
        }
        return false;
    }
//    private boolean containsMembersId(String desclist, Integer attachmentId) throws JsonProcessingException {
//        try {
//            JsonNode fileList = mapper.readTree(desclist);
//            for (int i = 0; i < fileList.size(); i++) {
//                JsonNode fileItem = fileList.get(i);
//
//                // Check if "fileId" exists in the JSON node and is not null
//                JsonNode fileIdNode = fileItem.get("fileId");
//                if (fileIdNode != null && !fileIdNode.isNull()) {
//                    Integer fileId = fileIdNode.asInt();
//                    if (fileId.equals(attachmentId)) {
//                        return true;
//                    }
//                }
//            }
//        } catch (Exception e) {
//            // Handle the exception or log it
//            e.printStackTrace();
//        }
//        return false;
//    }
}
