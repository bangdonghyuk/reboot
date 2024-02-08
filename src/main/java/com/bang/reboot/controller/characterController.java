package com.bang.reboot.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.bang.reboot.repository.CharacterDataRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.bang.reboot.model.CharacterDetail;

@Controller
public class characterController {

    @Autowired
    private CharacterDataRepository characterDataRepository;

    @GetMapping("/characterDetail/{userName}")
    public String characterDetail(@PathVariable String userName, Model model) {
        Optional<CharacterDetail> characterDetail = characterDataRepository.findByCharacterName(userName);
        characterDetail.ifPresent(detail -> {
            ObjectMapper objectMapper = new ObjectMapper();
            try {
                String jsonString = objectMapper.writeValueAsString(detail);
                model.addAttribute("characterDetail", jsonString);
            } catch (JsonProcessingException e) {
                // JSON 변환 오류 처리
                e.printStackTrace();
            }
        });
        return "characterDetail";
    }
}
//
//	String API_KEY = "test_b96961210dca92e2c6320b43c6b77b7ec18585c90c7274a8907df801be887e5641c68e7ba77688a5bcd5f13fe4373316";
//
//	// 현재 날짜 구하기
//	LocalDate now = LocalDate.now();
//
//	// 하루를 빼기
//	LocalDate yesterday = now.minusDays(1);
//
//	@GetMapping("/characterDetail")
//	@ResponseBody
//	public String load(String userName) {
//		String inputLine = null;
//		StringBuffer response = new StringBuffer();
//		try {
//			String characterName = URLEncoder.encode(userName, StandardCharsets.UTF_8);
//			String urlString = "https://open.api.nexon.com/maplestory/v1/id?character_name=" + characterName;
//			System.out.println(urlString);
//			URL url = new URL(urlString);
//			// HTTP connection 설정
//			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
//			connection.setRequestMethod("GET");
//			connection.setRequestProperty("x-nxopen-api-key", API_KEY);
//			int responseCode = connection.getResponseCode();
//			BufferedReader in;
//			if (responseCode == 200) {
//				in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
//			} else {
//				in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
//			}
//			while ((inputLine = in.readLine()) != null) {
//				response.append(inputLine);
//			}
//			in.close();
//			System.out.println(response.toString());
//		} catch (Exception exception) {
//			System.out.println(exception);
//		}
//		return response.toString();
//	}
//
//	@Autowired
//	private CharacterDataRepository characterDataRepository;
//
//	@GetMapping("/CharacterBasic")
//	@ResponseBody
//	public String basic(String ocid) {
//		StringBuffer response = new StringBuffer();
//		String ocidText = ocid;
//		try {
//			// 기존에 저장된 데이터 중에서 같은 ocid가 있는지 확인
//			Optional<CharacterDetail> existingCharacter = characterDataRepository.findByOcid(ocidText);
//			if (existingCharacter.isPresent()) {
//	            CharacterDetail characterData = existingCharacter.get();
//	            System.out.println("characterData: " + characterData);
//	            basicFetchDataAndUpdate(ocidText, characterData, responseData -> {
//                    response.append(responseData);
//                });
//			} else {
//				basicFetchDataAndSave(ocidText, responseData -> {
//                    response.append(responseData);
//                });
//			}
//		} catch (Exception exception) {
//			System.out.println(exception);
//		}
//		return response.toString();
//	}
//	
//	private void basicFetchDataAndSave(String ocidText, Consumer<String> callback) {
//		String inputLine = null;
//		StringBuffer response = new StringBuffer();
//		try {
//			// 데이터를 가져오는 API 호출 및 로직
//			String urlString = "https://open.api.nexon.com/maplestory/v1/character/basic?ocid=" + ocidText + "&date="
//					+ yesterday;
//			URL url = new URL(urlString);
//			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
//			connection.setRequestMethod("GET");
//			connection.setRequestProperty("x-nxopen-api-key", API_KEY);
//			int responseCode = connection.getResponseCode();
//			BufferedReader in;
//			if (responseCode == 200) {
//				in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
//			} else {
//				in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
//			}
//			while ((inputLine = in.readLine()) != null) {
//				response.append(inputLine);
//			}
//			in.close();
//			// CharacterNew 엔터티에 데이터 설정
//			CharacterDetail characterData = new CharacterDetail();
//			characterData.setOcid(ocidText);
//			characterData.setResponseData(response.toString());
//			characterDataRepository.save(characterData);
//			 System.out.println("추가된 데이터");
//		} catch (Exception exception) {
//			System.out.println(exception);
//		}
//	    // 비동기 작업 완료 후 콜백 호출
//	    callback.accept(response.toString());
//	}
//	
//	private void basicFetchDataAndUpdate(String ocidText, CharacterDetail existingCharacter, Consumer<String> callback) {
//		String inputLine = null;
//		StringBuffer response = new StringBuffer();
//		try {
//			// 데이터를 가져오는 API 호출 및 로직
//			String urlString = "https://open.api.nexon.com/maplestory/v1/character/basic?ocid=" + ocidText + "&date="
//					+ yesterday;
//			URL url = new URL(urlString);
//			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
//			connection.setRequestMethod("GET");
//			connection.setRequestProperty("x-nxopen-api-key", API_KEY);
//			int responseCode = connection.getResponseCode();
//			BufferedReader in;
//			if (responseCode == 200) {
//				in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
//			} else {
//				in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
//			}
//			while ((inputLine = in.readLine()) != null) {
//				response.append(inputLine);
//			}
//			in.close();
//	        existingCharacter.setOcid(ocidText);
//	        existingCharacter.setResponseData(response.toString());
//	        characterDataRepository.save(existingCharacter);
//	        System.out.println("수정된 데이터");
//		} catch (Exception exception) {
//			System.out.println(exception);
//		}
//	    callback.accept(response.toString());
//	}
//	
//	
////	
////	@GetMapping("/popularity")
////	@ResponseBody
////	public String popularity(String ocid) {
////		StringBuffer response = new StringBuffer();
////		String ocidText = ocid;
////		System.out.println("ocidText :" + ocidText);
////
////		try {
////			Optional<CharacterNew> existingCharacter = characterDataRepository.findByOcid(ocidText);
////
////			if (existingCharacter.isPresent()) {
////	            CharacterNew characterData = existingCharacter.get();
////	            System.out.println("characterData: " + characterData);
////	            popularityFetchDataAndUpdate(ocidText, characterData, responseData -> {
////                    response.append(responseData);
////                });
////			} else {
////				popularityFetchDataAndSave(ocidText, responseData -> {
////                    response.append(responseData);
////                });
////			}
////		} catch (Exception exception) {
////			System.out.println(exception);
////		}
////		return response.toString();
////	}
//
//	private void popularityFetchDataAndSave(String ocidText, Consumer<String> callback) {
//		String inputLine = null;
//		StringBuffer response = new StringBuffer();
//		try {
//			// 데이터를 가져오는 API 호출 및 로직
//			String urlString = "https://open.api.nexon.com/maplestory/v1/character/popularity?ocid=" + ocidText + "&date="
//				+ yesterday;
//		URL url = new URL(urlString);
//			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
//			connection.setRequestMethod("GET");
//			connection.setRequestProperty("x-nxopen-api-key", API_KEY);
//			int responseCode = connection.getResponseCode();
//			BufferedReader in;
//
//			if (responseCode == 200) {
//				in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
//			} else {
//				in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
//		}
//
//			while ((inputLine = in.readLine()) != null) {
//				response.append(inputLine);
//			}
//		in.close();
//
//			// 가져온 데이터를 파싱하여 CharacterNew 엔터티에 저장
//		String jsonString = response.toString();
//			JSONParser jsonParser = new JSONParser();
//			JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonString);
//		
//			Long popularity = (Long) jsonObject.get("popularity");
//			CharacterNew characterData = new CharacterNew();
//			characterData.setPopularity(popularity);
//			characterDataRepository.save(characterData);
//			
//		} catch (Exception exception) {
//			System.out.println(exception);
//		}
//	    // 비동기 작업 완료 후 콜백 호출
//	    callback.accept(response.toString());
//	}
////	
////	private void popularityFetchDataAndUpdate(String ocidText, CharacterNew existingCharacter, Consumer<String> callback) {
////		String inputLine = null;
////		StringBuffer response = new StringBuffer();
////		try {
////			// 데이터를 가져오는 API 호출 및 로직
////			String urlString = "https://open.api.nexon.com/maplestory/v1/character/popularity?ocid=" + ocidText + "&date="
////					+ yesterday;
////			URL url = new URL(urlString);
////			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
////			connection.setRequestMethod("GET");
////			connection.setRequestProperty("x-nxopen-api-key", API_KEY);
////			int responseCode = connection.getResponseCode();
////			BufferedReader in;
////
////			if (responseCode == 200) {
////				in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
////			} else {
////				in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
////			}
////
////			while ((inputLine = in.readLine()) != null) {
////				response.append(inputLine);
////			
////			}
////			in.close();
////			
////			// 가져온 데이터를 파싱하여 CharacterNew 엔터티에 저장
////			String jsonString = response.toString();
////	        JSONParser jsonParser = new JSONParser();
////	        JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonString);
////	        
////			// JSONObject에서 필요한 정보 추출
////			Long popularity = (Long) jsonObject.get("popularity");
////			existingCharacter.setPopularity(popularity);
////
////	        // 수정된 데이터 저장
////	        characterDataRepository.save(existingCharacter);
////	        System.out.println("수정된 데이터");
////			
////		} catch (Exception exception) {
////			System.out.println(exception);
////		}
////	    // 비동기 작업 완료 후 콜백 호출
////	    callback.accept(response.toString());
////	}
////	
////	
////	@GetMapping("/stat")
////	@ResponseBody
////	public String stat(String ocid) {
////		StringBuffer response = new StringBuffer();
////		String ocidText = ocid;
////		System.out.println("ocidText :" + ocidText);
////
////		try {
////			Optional<CharacterNew> existingCharacter = characterDataRepository.findByOcid(ocidText);
////
////			if (existingCharacter.isPresent()) {
////	            CharacterNew characterData = existingCharacter.get();
////	            System.out.println("characterData: " + characterData);
////	            statFetchDataAndUpdate(ocidText, characterData, responseData -> {
////                    response.append(responseData);
////                });
////			} else {
////				statFetchDataAndSave(ocidText, responseData -> {
////                    response.append(responseData);
////                });
////			}
////		} catch (Exception exception) {
////			System.out.println(exception);
////		}
////		return response.toString();
////	}
////	
////	private void statFetchDataAndSave(String ocidText, Consumer<String> callback) {
////		String inputLine = null;
////		StringBuffer response = new StringBuffer();
////		try {
////			// 데이터를 가져오는 API 호출 및 로직
////			String urlString = "https://open.api.nexon.com/maplestory/v1/character/stat?ocid=" + ocidText + "&date="
////					+ yesterday;
////			URL url = new URL(urlString);
////			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
////			connection.setRequestMethod("GET");
////			connection.setRequestProperty("x-nxopen-api-key", API_KEY);
////			int responseCode = connection.getResponseCode();
////			BufferedReader in;
////
////			if (responseCode == 200) {
////				in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
////			} else {
////				in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
////			}
////
////			while ((inputLine = in.readLine()) != null) {
////				response.append(inputLine);
////			}
////			in.close();
////
////	        System.out.println(response.toString());
////			
//////			// 가져온 데이터를 파싱하여 CharacterNew 엔터티에 저장
//////			String jsonString = response.toString();
//////			JSONParser jsonParser = new JSONParser();
//////			JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonString);
//////			
//////			Long popularity = (Long) jsonObject.get("popularity");
//////			CharacterNew characterData = new CharacterNew();
//////			characterData.setPopularity(popularity);
//////			characterDataRepository.save(characterData);
////			
////			
////			
////		} catch (Exception exception) {
////			System.out.println(exception);
////		}
////	    // 비동기 작업 완료 후 콜백 호출
////	    callback.accept(response.toString());
////	}
////	
////	private void statFetchDataAndUpdate(String ocidText, CharacterNew existingCharacter, Consumer<String> callback) {
////		String inputLine = null;
////		StringBuffer response = new StringBuffer();
////		try {
////			// 데이터를 가져오는 API 호출 및 로직
////			String urlString = "https://open.api.nexon.com/maplestory/v1/character/stat?ocid=" + ocidText + "&date="
////					+ yesterday;
////			URL url = new URL(urlString);
////			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
////			connection.setRequestMethod("GET");
////			connection.setRequestProperty("x-nxopen-api-key", API_KEY);
////			int responseCode = connection.getResponseCode();
////			BufferedReader in;
////
////			if (responseCode == 200) {
////				in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
////			} else {
////				in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
////			}
////
////			while ((inputLine = in.readLine()) != null) {
////				response.append(inputLine);
////			}
////			in.close();
////			
//////			// 가져온 데이터를 파싱하여 CharacterNew 엔터티에 저장
//////			String jsonString = response.toString();
//////	        JSONParser jsonParser = new JSONParser();
//////	        JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonString);
//////	        
//////			// JSONObject에서 필요한 정보 추출
//////			Long popularity = (Long) jsonObject.get("popularity");
//////			existingCharacter.setPopularity(popularity);
//////
//////	        // 수정된 데이터 저장
//////	        characterDataRepository.save(existingCharacter);
//////	        System.out.println("수정된 데이터");
////			
////		} catch (Exception exception) {
////			System.out.println(exception);
////		}
////	    // 비동기 작업 완료 후 콜백 호출
////	    callback.accept(response.toString());
////	}
////	
////	@GetMapping("/hyperStat")
////	@ResponseBody
////	public String hyperStat(String ocid) {
////		StringBuffer response = new StringBuffer();
////		String ocidText = ocid;
////		System.out.println("ocidText :" + ocidText);
////
////		try {
////			Optional<CharacterNew> existingCharacter = characterDataRepository.findByOcid(ocidText);
////
////			if (existingCharacter.isPresent()) {
////	            CharacterNew characterData = existingCharacter.get();
////	            System.out.println("characterData: " + characterData);
////	            hyperStatFetchDataAndUpdate(ocidText, characterData, responseData -> {
////                    response.append(responseData);
////                });
////			} else {
////				hyperStatFetchDataAndSave(ocidText, responseData -> {
////                    response.append(responseData);
////                });
////			}
////		} catch (Exception exception) {
////			System.out.println(exception);
////		}
////		return response.toString();
////	}
////	
////	private void hyperStatFetchDataAndSave(String ocidText, Consumer<String> callback) {
////		String inputLine = null;
////		StringBuffer response = new StringBuffer();
////		try {
////			// 데이터를 가져오는 API 호출 및 로직
////			String urlString = "https://open.api.nexon.com/maplestory/v1/character/hyper-stat?ocid=" + ocidText + "&date="
////					+ yesterday;
////			URL url = new URL(urlString);
////			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
////			connection.setRequestMethod("GET");
////			connection.setRequestProperty("x-nxopen-api-key", API_KEY);
////			int responseCode = connection.getResponseCode();
////			BufferedReader in;
////
////			if (responseCode == 200) {
////				in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
////			} else {
////				in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
////			}
////
////			while ((inputLine = in.readLine()) != null) {
////				response.append(inputLine);
////			}
////			in.close();
////
////	        System.out.println(response.toString());
////			
//////			// 가져온 데이터를 파싱하여 CharacterNew 엔터티에 저장
//////			String jsonString = response.toString();
//////			JSONParser jsonParser = new JSONParser();
//////			JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonString);
//////			
//////			Long popularity = (Long) jsonObject.get("popularity");
//////			CharacterNew characterData = new CharacterNew();
//////			characterData.setPopularity(popularity);
//////			characterDataRepository.save(characterData);
////			
////			
////			
////		} catch (Exception exception) {
////			System.out.println(exception);
////		}
////	    // 비동기 작업 완료 후 콜백 호출
////	    callback.accept(response.toString());
////	}
////	
////	private void hyperStatFetchDataAndUpdate(String ocidText, CharacterNew existingCharacter, Consumer<String> callback) {
////		String inputLine = null;
////		StringBuffer response = new StringBuffer();
////		try {
////			// 데이터를 가져오는 API 호출 및 로직
////			String urlString = "https://open.api.nexon.com/maplestory/v1/character/hyper-stat?ocid=" + ocidText + "&date="
////					+ yesterday;
////			URL url = new URL(urlString);
////			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
////			connection.setRequestMethod("GET");
////			connection.setRequestProperty("x-nxopen-api-key", API_KEY);
////			int responseCode = connection.getResponseCode();
////			BufferedReader in;
////
////			if (responseCode == 200) {
////				in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
////			} else {
////				in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
////			}
////
////			while ((inputLine = in.readLine()) != null) {
////				response.append(inputLine);
////			}
////			in.close();
////			
//////			// 가져온 데이터를 파싱하여 CharacterNew 엔터티에 저장
//////			String jsonString = response.toString();
//////	        JSONParser jsonParser = new JSONParser();
//////	        JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonString);
//////	        
//////			// JSONObject에서 필요한 정보 추출
//////			Long popularity = (Long) jsonObject.get("popularity");
//////			existingCharacter.setPopularity(popularity);
//////
//////	        // 수정된 데이터 저장
//////	        characterDataRepository.save(existingCharacter);
//////	        System.out.println("수정된 데이터");
////			
////		} catch (Exception exception) {
////			System.out.println(exception);
////		}
////	    // 비동기 작업 완료 후 콜백 호출
////	    callback.accept(response.toString());
////	}
//	
//}
