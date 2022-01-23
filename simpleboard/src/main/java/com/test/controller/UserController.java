package com.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.domain.UserInfoVO;
import com.test.service.UserInfoService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {
	
	UserInfoService userInfoService;

	@GetMapping("/join")
	public void joinUser() {
		log.info("가입페이지 get방식 출력");
	}
	
	@PostMapping("/join")
	public String joinUser(UserInfoVO userInfo) {
		userInfoService.joinUser(userInfo);
		//todo : 세션에 id 저장
		return "redirect:/board/list";
	}
}
