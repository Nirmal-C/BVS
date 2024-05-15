package bvs.org.repo;

import bvs.org.dto.SlimSelectDTO;
import bvs.org.model.UserType;
import bvs.org.dto.SlimSelectDTO;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserTypeRepo extends CrudRepository<UserType, Integer> {

    @Query("SELECT `id` as `value`,`name` as `text` from `user_type`")
    Iterable<SlimSelectDTO> getIdAndName(@Param("search") String search);

}
