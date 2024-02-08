package com.bang.reboot.test;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

// 사용자가 요청 -> 응답(html 파일)
// @Controller

// 사용자가 요청 -> 응답(Data)
@RestController
public class HttpControllerTest {
	
	private static final String TAG = "HttpControllerTest : ";
	
	@GetMapping("/http/lombok")
	public String lombokTest() {
		Member m = Member.builder().username("ssar").password("1234").email("sss").build(); //빌더는 순서가 상관없음
		System.out.println(TAG+ "getter : " + m.getUsername());
		m.setUsername("cos");
		System.out.println(TAG+ "setter : " + m.getUsername());
		return "lombok test 완료";
	}
	// 인터넷 브라우저 요청은 무조건 get요청만 가능하다.
	@GetMapping("/http/get")
	public String getTest(Member m) {

		return "get 요청 : " + m.getId() +", "+m.getUsername() +", " + m.getPassword()+", " + m.getEmail();
	}
	
	@PostMapping("/http/post") //text/plain, application/json 
	public String postTest(@RequestBody Member m) {
		return "post 요청 : " + m.getId() +", "+m.getUsername() +", " + m.getPassword()+", " + m.getEmail();
	}
	
	@PutMapping("/http/put")
	public String putTest(@RequestBody Member m) {
		return "post 요청 : " + m.getId() +", "+m.getUsername() +", " + m.getPassword()+", " + m.getEmail();
	}
	@DeleteMapping("/http/delete")
	public String deleteTest(@RequestBody Member m) {
		return "post 요청 : " + m.getId() +", "+m.getUsername() +", " + m.getPassword()+", " + m.getEmail();
	}
}
