package com.bang.reboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.bang.reboot.model.CharacterDetail;
import java.util.Optional;

public interface CharacterDataRepository extends JpaRepository<CharacterDetail, Long> {
	Optional<CharacterDetail> findByOcid(String ocid);
	Optional<CharacterDetail> findByCharacterName(String characterName);
}
