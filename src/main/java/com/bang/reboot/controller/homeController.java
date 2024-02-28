package com.bang.reboot.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.util.Optional;
import java.util.function.Consumer;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bang.reboot.model.CharacterDetail;
import com.bang.reboot.repository.CharacterDataRepository;

@Controller
public class homeController {

	@Autowired
	private CharacterDataRepository characterDataRepository;

	@GetMapping("/")
	public String home() {
		return "home";
	}
	
	String API_KEY = "test_b96961210dca92e2c6320b43c6b77b7ec18585c90c7274a8907df801be887e5641c68e7ba77688a5bcd5f13fe4373316";

	// 현재 날짜 구하기
	LocalDate now = LocalDate.now();

	// 하루를 빼기
	LocalDate yesterday = now.minusDays(1);

	@GetMapping("/characterName")
	@ResponseBody
	public String characterOcid(String name) throws ParseException {
		String inputLine = null;
		StringBuffer response = new StringBuffer();
		try {
			System.out.println(name);
			String characterName = URLEncoder.encode(name, StandardCharsets.UTF_8);
			String urlString = "https://open.api.nexon.com/maplestory/v1/id?character_name=" + characterName;
			System.out.println(urlString);
			URL url = new URL(urlString);
			// HTTP connection 설정
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("x-nxopen-api-key", API_KEY);
			int responseCode = connection.getResponseCode();
			BufferedReader in;
			if (responseCode == 200) {
				in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			} else {
				in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
			}
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			System.out.println(response.toString());
		} catch (Exception exception) {
			System.out.println(exception);
		}
		System.out.println(response.toString());

		// 가져온 데이터를 파싱하여 CharacterNew 엔터티에 저장
		String jsonString = response.toString();
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonString);
		
		String ocid = (String) jsonObject.get("ocid");
		System.out.println(ocid);
		
		return CharacterBasic(ocid);
	}

	public String CharacterBasic(String ocid) {
		StringBuffer response = new StringBuffer();
		String ocidText = ocid;
		try {
			// 기존에 저장된 데이터 중에서 같은 ocid가 있는지 확인
			Optional<CharacterDetail> existingCharacter = characterDataRepository.findByOcid(ocidText);
			if (existingCharacter.isPresent()) {
				CharacterDetail characterData = existingCharacter.get();
				System.out.println("characterData: " + characterData);
				CharacterBasicUpdate(ocidText, characterData, responseData -> {
					response.append(responseData);
				});
			} else {
				CharacterBasicSave(ocidText, responseData -> {
					response.append(responseData);
				});
			}
		} catch (Exception exception) {
			System.out.println(exception);
		}
		
		return response.toString();
	}

	private void CharacterBasicSave(String ocidText, Consumer<String> callback) {
		String inputLine = null;
		StringBuffer response = new StringBuffer();
		try {
			// 데이터를 가져오는 API 호출 및 로직
			String urlString = "https://open.api.nexon.com/maplestory/v1/character/basic?ocid=" + ocidText + "&date="
					+ yesterday;
			URL url = new URL(urlString);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("x-nxopen-api-key", API_KEY);
			int responseCode = connection.getResponseCode();
			BufferedReader in;
			if (responseCode == 200) {
				in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			} else {
				in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
			}
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			// CharacterNew 엔터티에 데이터 설정
			String jsonString = response.toString();
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonString);
		
			String characterName = (String) jsonObject.get("character_name");
			
			CharacterDetail characterData = new CharacterDetail();
			characterData.setOcid(ocidText);
			characterData.setCharacterName(characterName);
			characterData.setCharacterBasic(response.toString());
			characterDataRepository.save(characterData);
			System.out.println("추가된 데이터");
		} catch (Exception exception) {
			System.out.println(exception);
		}
		// 비동기 작업 완료 후 콜백 호출
		callback.accept(CharacterStat(ocidText));
	}

	private void CharacterBasicUpdate(String ocidText, CharacterDetail existingCharacter, Consumer<String> callback) {
		String inputLine = null;
		StringBuffer response = new StringBuffer();
		try {
			// 데이터를 가져오는 API 호출 및 로직
			String urlString = "https://open.api.nexon.com/maplestory/v1/character/basic?ocid=" + ocidText + "&date="
					+ yesterday;
			URL url = new URL(urlString);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("x-nxopen-api-key", API_KEY);
			int responseCode = connection.getResponseCode();
			BufferedReader in;
			if (responseCode == 200) {
				in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			} else {
				in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
			}
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			
			String jsonString = response.toString();
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonString);

			String characterName = (String) jsonObject.get("character_name");
		
			existingCharacter.setCharacterName(characterName);
			existingCharacter.setCharacterBasic(response.toString());
			characterDataRepository.save(existingCharacter);
			System.out.println("수정된 데이터");
		} catch (Exception exception) {
			System.out.println(exception);
		}
		callback.accept(CharacterStat(ocidText));
		System.out.println("실행");
	}

	

	public String CharacterStat(String ocid) {
		StringBuffer response = new StringBuffer();
		String ocidText = ocid;
		try {
			// 기존에 저장된 데이터 중에서 같은 ocid가 있는지 확인
			Optional<CharacterDetail> existingCharacter = characterDataRepository.findByOcid(ocidText);
			if (existingCharacter.isPresent()) {
				CharacterDetail characterData = existingCharacter.get();
				System.out.println("characterData: " + characterData);
				CharacterStatUpdate(ocidText, characterData, responseData -> {
					response.append(responseData);
				});
			} else {
				CharacterStatSave(ocidText, responseData -> {
					response.append(responseData);
				});
			}
		} catch (Exception exception) {
			System.out.println(exception);
		}
		return response.toString();
	}
	
	private void CharacterStatSave(String ocidText, Consumer<String> callback) {
		String inputLine = null;
		StringBuffer response = new StringBuffer();
		try {
			// 데이터를 가져오는 API 호출 및 로직
			String urlString = "https://open.api.nexon.com/maplestory/v1/character/stat?ocid=" + ocidText + "&date="
					+ yesterday;
			URL url = new URL(urlString);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("x-nxopen-api-key", API_KEY);
			int responseCode = connection.getResponseCode();
			BufferedReader in;
			if (responseCode == 200) {
				in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			} else {
				in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
			}
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			CharacterDetail characterData = new CharacterDetail();
			characterData.setCharacterStat(response.toString());
			characterDataRepository.save(characterData);
		} catch (Exception exception) {
			System.out.println(exception);
		}
		// 비동기 작업 완료 후 콜백 호출
		callback.accept(CharacterHyperStat(ocidText));
	}

	private void CharacterStatUpdate(String ocidText, CharacterDetail existingCharacter, Consumer<String> callback) {
		String inputLine = null;
		StringBuffer response = new StringBuffer();
		try {
			// 데이터를 가져오는 API 호출 및 로직
			String urlString = "https://open.api.nexon.com/maplestory/v1/character/stat?ocid=" + ocidText + "&date="
					+ yesterday;
			URL url = new URL(urlString);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("x-nxopen-api-key", API_KEY);
			int responseCode = connection.getResponseCode();
			BufferedReader in;
			if (responseCode == 200) {
				in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			} else {
				in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
			}
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();

			existingCharacter.setCharacterStat(response.toString());
			characterDataRepository.save(existingCharacter);
		} catch (Exception exception) {
			System.out.println(exception);
		}
		callback.accept(CharacterHyperStat(ocidText));
	}
	
	
	public String CharacterHyperStat(String ocid) {
		StringBuffer response = new StringBuffer();
		String ocidText = ocid;
		try {
			Optional<CharacterDetail> existingCharacter = characterDataRepository.findByOcid(ocidText);
			if (existingCharacter.isPresent()) {
				CharacterDetail characterData = existingCharacter.get();
				CharacterHyperStatUpdate(ocidText, characterData, responseData -> {
					response.append(responseData);
				});
			} else {
				CharacterHyperStatSave(ocidText, responseData -> {
					response.append(responseData);
				});
			}
		} catch (Exception exception) {
			System.out.println(exception);
		}
		return response.toString();
	}
	
	private void CharacterHyperStatSave(String ocidText, Consumer<String> callback) {
		String inputLine = null;
		StringBuffer response = new StringBuffer();
		try {
			// 데이터를 가져오는 API 호출 및 로직
			String urlString = "https://open.api.nexon.com/maplestory/v1/character/hyper-stat?ocid=" + ocidText + "&date="
					+ yesterday;
			URL url = new URL(urlString);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("x-nxopen-api-key", API_KEY);
			int responseCode = connection.getResponseCode();
			BufferedReader in;
			if (responseCode == 200) {
				in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			} else {
				in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
			}
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			CharacterDetail characterData = new CharacterDetail();
			characterData.setCharacterHyperStat(response.toString());
			characterDataRepository.save(characterData);
		} catch (Exception exception) {
			System.out.println(exception);
		}
		// 비동기 작업 완료 후 콜백 호출
		callback.accept(CharacterAbility(ocidText));
	}

	private void CharacterHyperStatUpdate(String ocidText, CharacterDetail existingCharacter, Consumer<String> callback) {
		String inputLine = null;
		StringBuffer response = new StringBuffer();
		try {
			// 데이터를 가져오는 API 호출 및 로직
			String urlString = "https://open.api.nexon.com/maplestory/v1/character/hyper-stat?ocid=" + ocidText + "&date="
					+ yesterday;
			URL url = new URL(urlString);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("x-nxopen-api-key", API_KEY);
			int responseCode = connection.getResponseCode();
			BufferedReader in;
			if (responseCode == 200) {
				in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			} else {
				in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
			}
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();

			existingCharacter.setCharacterHyperStat(response.toString());
			characterDataRepository.save(existingCharacter);
		} catch (Exception exception) {
			System.out.println(exception);
		}
		callback.accept(CharacterAbility(ocidText));
	}
	
	
	
	public String CharacterAbility(String ocid) {
		StringBuffer response = new StringBuffer();
		String ocidText = ocid;
		try {
			Optional<CharacterDetail> existingCharacter = characterDataRepository.findByOcid(ocidText);
			if (existingCharacter.isPresent()) {
				CharacterDetail characterData = existingCharacter.get();
				CharacterAbilityUpdate(ocidText, characterData, responseData -> {
					response.append(responseData);
				});
			} else {
				CharacterAbilitySave(ocidText, responseData -> {
					response.append(responseData);
				});
			}
		} catch (Exception exception) {
			System.out.println(exception);
		}
		return response.toString();
	}
	
	private void CharacterAbilitySave(String ocidText, Consumer<String> callback) {
		String inputLine = null;
		StringBuffer response = new StringBuffer();
		try {
			// 데이터를 가져오는 API 호출 및 로직
			String urlString = "https://open.api.nexon.com/maplestory/v1/character/ability?ocid=" + ocidText + "&date="
					+ yesterday;
			URL url = new URL(urlString);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("x-nxopen-api-key", API_KEY);
			int responseCode = connection.getResponseCode();
			BufferedReader in;
			if (responseCode == 200) {
				in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			} else {
				in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
			}
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			CharacterDetail characterData = new CharacterDetail();
			characterData.setCharacterAbility(response.toString());
			characterDataRepository.save(characterData);
		} catch (Exception exception) {
			System.out.println(exception);
		}
		// 비동기 작업 완료 후 콜백 호출
		callback.accept(CharacterItem(ocidText));
	}

	private void CharacterAbilityUpdate(String ocidText, CharacterDetail existingCharacter, Consumer<String> callback) {
		String inputLine = null;
		StringBuffer response = new StringBuffer();
		try {
			// 데이터를 가져오는 API 호출 및 로직
			String urlString = "https://open.api.nexon.com/maplestory/v1/character/ability?ocid=" + ocidText + "&date="
					+ yesterday;
			URL url = new URL(urlString);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("x-nxopen-api-key", API_KEY);
			int responseCode = connection.getResponseCode();
			BufferedReader in;
			if (responseCode == 200) {
				in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			} else {
				in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
			}
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();

			existingCharacter.setCharacterAbility(response.toString());
			characterDataRepository.save(existingCharacter);
		} catch (Exception exception) {
			System.out.println(exception);
		}
		callback.accept(CharacterItem(ocidText));
	}
	

	public String CharacterItem(String ocid) {
		StringBuffer response = new StringBuffer();
		String ocidText = ocid;
		try {
			Optional<CharacterDetail> existingCharacter = characterDataRepository.findByOcid(ocidText);
			if (existingCharacter.isPresent()) {
				CharacterDetail characterData = existingCharacter.get();
				CharacterItemUpdate(ocidText, characterData, responseData -> {
					response.append(responseData);
				});
			} else {
				CharacterItemSave(ocidText, responseData -> {
					response.append(responseData);
				});
			}
		} catch (Exception exception) {
			System.out.println(exception);
		}
		return response.toString();
	}
	
	private void CharacterItemSave(String ocidText, Consumer<String> callback) {
		String inputLine = null;
		StringBuffer response = new StringBuffer();
		try {
			// 데이터를 가져오는 API 호출 및 로직
			String urlString = "https://open.api.nexon.com/maplestory/v1/character/item-equipment?ocid=" + ocidText + "&date="
					+ yesterday;
			URL url = new URL(urlString);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("x-nxopen-api-key", API_KEY);
			int responseCode = connection.getResponseCode();
			BufferedReader in;
			if (responseCode == 200) {
				in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			} else {
				in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
			}
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			CharacterDetail characterData = new CharacterDetail();
			characterData.setCharacterItem(response.toString());
			characterDataRepository.save(characterData);
		} catch (Exception exception) {
			System.out.println(exception);
		}
		// 비동기 작업 완료 후 콜백 호출
		callback.accept(CharacterAndroid(ocidText));
	}

	private void CharacterItemUpdate(String ocidText, CharacterDetail existingCharacter, Consumer<String> callback) {
		String inputLine = null;
		StringBuffer response = new StringBuffer();
		try {
			// 데이터를 가져오는 API 호출 및 로직
			String urlString = "https://open.api.nexon.com/maplestory/v1/character/item-equipment?ocid=" + ocidText + "&date="
					+ yesterday;
			URL url = new URL(urlString);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("x-nxopen-api-key", API_KEY);
			int responseCode = connection.getResponseCode();
			BufferedReader in;
			if (responseCode == 200) {
				in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			} else {
				in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
			}
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();

			existingCharacter.setCharacterItem(response.toString());
			characterDataRepository.save(existingCharacter);
		} catch (Exception exception) {
			System.out.println(exception);
		}
		callback.accept(CharacterAndroid(ocidText));
	}
	
	public String CharacterAndroid(String ocid) {
		StringBuffer response = new StringBuffer();
		String ocidText = ocid;
		try {
			Optional<CharacterDetail> existingCharacter = characterDataRepository.findByOcid(ocidText);
			if (existingCharacter.isPresent()) {
				CharacterDetail characterData = existingCharacter.get();
				CharacterAndroidUpdate(ocidText, characterData, responseData -> {
					response.append(responseData);
				});
			} else {
				CharacterAndroidSave(ocidText, responseData -> {
					response.append(responseData);
				});
			}
		} catch (Exception exception) {
			System.out.println(exception);
		}
		return response.toString();
	}
	
	private void CharacterAndroidSave(String ocidText, Consumer<String> callback) {
		String inputLine = null;
		StringBuffer response = new StringBuffer();
		try {
			// 데이터를 가져오는 API 호출 및 로직
			String urlString = "https://open.api.nexon.com/maplestory/v1/character/android-equipment?ocid=" + ocidText + "&date="
					+ yesterday;
			URL url = new URL(urlString);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("x-nxopen-api-key", API_KEY);
			int responseCode = connection.getResponseCode();
			BufferedReader in;
			if (responseCode == 200) {
				in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			} else {
				in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
			}
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			CharacterDetail characterData = new CharacterDetail();
			characterData.setCharacterAndroid(response.toString());
			characterDataRepository.save(characterData);
		} catch (Exception exception) {
			System.out.println(exception);
		}
		// 비동기 작업 완료 후 콜백 호출
		callback.accept(CharacterSymbol(ocidText));
	}

	private void CharacterAndroidUpdate(String ocidText, CharacterDetail existingCharacter, Consumer<String> callback) {
		String inputLine = null;
		StringBuffer response = new StringBuffer();
		try {
			// 데이터를 가져오는 API 호출 및 로직
			String urlString = "https://open.api.nexon.com/maplestory/v1/character/android-equipment?ocid=" + ocidText + "&date="
					+ yesterday;
			URL url = new URL(urlString);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("x-nxopen-api-key", API_KEY);
			int responseCode = connection.getResponseCode();
			BufferedReader in;
			if (responseCode == 200) {
				in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			} else {
				in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
			}
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();

			existingCharacter.setCharacterAndroid(response.toString());
			characterDataRepository.save(existingCharacter);
		} catch (Exception exception) {
			System.out.println(exception);
		}
		callback.accept(CharacterSymbol(ocidText));
	}
	
	
	public String CharacterSymbol(String ocid) {
		StringBuffer response = new StringBuffer();
		String ocidText = ocid;
		try {
			Optional<CharacterDetail> existingCharacter = characterDataRepository.findByOcid(ocidText);
			if (existingCharacter.isPresent()) {
				CharacterDetail characterData = existingCharacter.get();
				CharacterSymbolUpdate(ocidText, characterData, responseData -> {
					response.append(responseData);
				});
			} else {
				CharacterSymbolSave(ocidText, responseData -> {
					response.append(responseData);
				});
			}
		} catch (Exception exception) {
			System.out.println(exception);
		}
		return response.toString();
	}
	
	private void CharacterSymbolSave(String ocidText, Consumer<String> callback) {
		String inputLine = null;
		StringBuffer response = new StringBuffer();
		try {
			// 데이터를 가져오는 API 호출 및 로직
			String urlString = "https://open.api.nexon.com/maplestory/v1/character/symbol-equipment?ocid=" + ocidText + "&date="
					+ yesterday;
			URL url = new URL(urlString);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("x-nxopen-api-key", API_KEY);
			int responseCode = connection.getResponseCode();
			BufferedReader in;
			if (responseCode == 200) {
				in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			} else {
				in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
			}
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			CharacterDetail characterData = new CharacterDetail();
			characterData.setCharacterSymbol(response.toString());
			characterDataRepository.save(characterData);
		} catch (Exception exception) {
			System.out.println(exception);
		}
		// 비동기 작업 완료 후 콜백 호출
		callback.accept(response.toString());
	}

	private void CharacterSymbolUpdate(String ocidText, CharacterDetail existingCharacter, Consumer<String> callback) {
		String inputLine = null;
		StringBuffer response = new StringBuffer();
		try {
			// 데이터를 가져오는 API 호출 및 로직
			String urlString = "https://open.api.nexon.com/maplestory/v1/character/symbol-equipment?ocid=" + ocidText + "&date="
					+ yesterday;
			URL url = new URL(urlString);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("x-nxopen-api-key", API_KEY);
			int responseCode = connection.getResponseCode();
			BufferedReader in;
			if (responseCode == 200) {
				in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			} else {
				in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
			}
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();

			existingCharacter.setCharacterSymbol(response.toString());
			characterDataRepository.save(existingCharacter);
		} catch (Exception exception) {
			System.out.println(exception);
		}
		callback.accept(response.toString());
	}
	
}