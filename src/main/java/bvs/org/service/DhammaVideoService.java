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
import bvs.org.dto.DhammaAllDto;
import bvs.org.dto.DhammaVideoDto;
import bvs.org.dto.DhammaContentDto;
import bvs.org.model.DhammaVideo;
import bvs.org.repo.DhammaVideoRepo;
import java.io.File;
import java.nio.file.Path;
import bvs.org.model.DhammaContent;
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
import bvs.org.repo.DhammaContentRepo;
import java.util.HashMap;
import java.util.Optional;

/**
 *
 * @author L580
 */
@Service
public class DhammaVideoService {

    @Autowired
    private DataTableRepo<DhammaVideoDto> unitDt;
    @Autowired
    private DataTableRepo<DhammaContentDto> attDt;

    @Autowired
    private DhammaVideoRepo videoRepo;
    @Autowired
    private DhammaContentRepo conRepo;

    public DataTablesResponse<DhammaContentDto> getDhammaContents(DataTableRequest param) throws Exception {
        return attDt.getData(DhammaContentDto.class, param, "SELECT x.`id`, x.`heading`, x.`status`,(SELECT d.`name` FROM `users` d WHERE d.`id` = x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id` = x.`mod_by`) AS `mod_by`,`mod_on` FROM `dhamma_content` X");

    }

    public Object getDhammaContent(Integer id) throws Exception {
        DhammaContent content = conRepo.findById(id).get();
        List<DhammaVideo> videos = videoRepo.findByContentAndStatus(id, "active");
        Map<String, Object> data = new HashMap<>();
        data.put("content", content);
        data.put("videos", videos);
        return data;
    }

    private final ObjectMapper mapper = new ObjectMapper();

    //attatchment
//    public DataTablesResponse<DhammaVideoDto> getAttatchemnts(DataTableRequest param) throws Exception {
//        String data = param.getData();
//        JsonNode node = mapper.readTree(data);
//        System.out.println(node);
//        return videoRepo.getData(DhammaVideoDto.class, param, "SELECT x.`id`, x.`att_path` AS 'filename', x.`status`,(SELECT d.`name` FROM `users` d WHERE d.`id` = x.`ent_by`) AS `ent_by`,`ent_on`,(SELECT d.`name` FROM `users` d WHERE d.`id` = x.`mod_by`) AS `mod_by`,`mod_on` FROM `attatchments` X WHERE x.`course` =? and x.`unit`=?", node.get("courseId").asText(), node.get("filter").asText());
//
//    }
    public DhammaContent deactivateDhammaContent(Integer id) throws Exception {
        DhammaContent syst = conRepo.findById(id).get();
        syst.setStatus("deactivate");
        syst = conRepo.save(syst);
        return syst;
    }

    public DhammaContent reactivateDhammaContent(Integer id) throws Exception {
        DhammaContent systems = conRepo.findById(id).get();
        systems.setStatus("active");
        systems = conRepo.save(systems);
        return systems;
    }

    public Iterable<DhammaContent> getAllActiveAttatchments() {
        return conRepo.findByStatus("active");
    }

    public DhammaAllDto getAttachment(Integer id) throws Exception {
        DhammaContent con = conRepo.findById(id).get();
        Iterable<DhammaVideo> dhammaVideo = videoRepo.findByContentAndStatus(id, "active");

        DhammaAllDto dto = new DhammaAllDto();
        dto.setVideos(dhammaVideo);
        dto.setContent(con.getHeading());
        return dto;
    }

    public List<DhammaVideo> getActiveAttachmentsByDhammaContentId(Integer id) throws Exception {
        return videoRepo.findByContentAndStatus(id, "active");
    }

    public DhammaContent saveAttachment(String heading, String desclist) throws Exception {
        DhammaContent system = new DhammaContent();
        system.setHeading(heading);
        system.setStatus("active");
        system = conRepo.save(system);

        JsonNode fileList = mapper.readTree(desclist);
        for (int i = 0; i < fileList.size(); i++) {
            JsonNode fileItem = fileList.get(i);

            DhammaVideo attachment = new DhammaVideo();
            attachment.setContent(system.getId());
            attachment.setName(fileItem.get("name").asText());
            attachment.setLink(fileItem.get("link").asText());
            attachment.setStatus("active");
            attachment = videoRepo.save(attachment);
            System.out.println("attachment - " + attachment.getId());
            videoRepo.save(attachment);
        }

        return conRepo.save(system);
    }

    public DhammaContent updateAttachment(Integer id, String heading, String desclist, String deleteIds) {
        try {
            DhammaContent system = conRepo.findById(id).orElseThrow(() -> new Exception("DhammaVideo not found"));
            system.setHeading(heading);

            if (deleteIds != null) {

                JsonNode toBeDeleted = mapper.readTree(deleteIds);
                for (JsonNode jsonNode : toBeDeleted) {
                    Optional<DhammaVideo> optionalAttachment = (Optional<DhammaVideo>) videoRepo.findById(Integer.parseInt(jsonNode.asText()));
                    if (optionalAttachment.isPresent()) {
                        DhammaVideo attachmentToDelete = optionalAttachment.get();
                        attachmentToDelete.setStatus("deactivate");
                        videoRepo.save(attachmentToDelete);
                    } else {
                        // Handle case where attachment with given ID is not found
                        throw new Exception("Attachment with ID " + jsonNode.asText() + " not found");
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
                    String fileLink = fileItem.get("link").asText();

                    DhammaVideo attachment = new DhammaVideo();
                    attachment.setContent(system.getId());
                    attachment.setName(fileName);
                    attachment.setLink(fileLink);

                    // Save the new or updated attachment
                    attachment.setStatus("active");
                    videoRepo.save(attachment);
                }
            }

            return conRepo.save(system);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to update unit with attachments", e);
        }
    }

    private boolean containsAttachmentId(String desclist, Integer attachmentId) throws JsonProcessingException {
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
//    private boolean containsAttachmentId(String desclist, Integer attachmentId) throws JsonProcessingException {
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
