package com.bang.reboot.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.json.simple.JSONObject;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder // 빌더 패턴!!
//ORM -> Java(다른언어) Object -> 테이블로 매핑해주는 기술
@Entity // User 클래스가 MySQL에 테이블이 생성이 된다.
// @DynamicInsert // insert시에 null인 필드를 제외시켜준다.
public class CharacterDetail {

	@Id // Primary key
	@GeneratedValue(strategy = GenerationType.IDENTITY) // 프로젝트에서 연결된 DB의 넘버링 전략을 따라간다.
	private Long id; // 시퀀스, auto_increment

	@Column(nullable = false, unique = true)
	private String ocid;

	public String getOcid() {
		return ocid;
	}

	public void setOcid(String ocid) {
		this.ocid = ocid;
	}
	
	@Column(length = 50)
    private String characterName;
	
    public String getCharacterName() {
        return characterName;
    }
   
	public void setCharacterName(String characterName) {
		this.characterName = characterName;
	}
	
	
	@Column(columnDefinition = "TEXT")
    private String characterBasic;
	
    public String getCharacterBasic() {
        return characterBasic;
    }
    
	public void setCharacterBasic(String characterBasic) {
		this.characterBasic = characterBasic;
	}
	
	@Column(columnDefinition = "TEXT")
    private String characterStat;
    public String getCharacterStat() {
        return characterStat;
    }
	public void setCharacterStat(String characterStat) {
		this.characterStat = characterStat;
	}
	
	@Column(columnDefinition = "TEXT")
    private String characterHyperStat;
    public String getCharacterHyperStat() {
        return characterHyperStat;
    }
	public void setCharacterHyperStat(String characterHyperStat) {
		this.characterHyperStat = characterHyperStat;
	}
	
	
	@Column(columnDefinition = "TEXT")
    private String characterAbility;
    public String getCharacterAbility() {
        return characterAbility;
    }
	public void setCharacterAbility(String characterAbility) {
		this.characterAbility = characterAbility;
	}
	
	@Column(columnDefinition = "LONGTEXT")
    private String characterItem;
    public String getCharacterItem() {
        return characterItem;
    }
	public void setCharacterItem(String characterItem) {
		this.characterItem = characterItem;
	}
	
	@Column(columnDefinition = "LONGTEXT")
    private String characterAndroid;
    public String getCharacterAndroid() {
        return characterAndroid;
    }
	public void setCharacterAndroid(String characterAndroid) {
		this.characterAndroid = characterAndroid;
	}
	
}