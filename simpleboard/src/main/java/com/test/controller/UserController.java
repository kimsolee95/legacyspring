package com.test.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
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
		return "/board/list";
	}
	
	@GetMapping("/login")
	public void loginUser() {
		log.info("로그인 페이지 get 출력");
	}
	
	@PostMapping("/login")
	public String loginUser(UserInfoVO userInfo, Model model, HttpSession session) {

		if (StringUtils.isEmpty(userInfo.getUserId()) || 
				StringUtils.isEmpty(userInfo.getUserPw()))	{
			
			return "/login";
		} else {
			
			UserInfoVO loginResult = userInfoService.login(userInfo);
			
			if (ObjectUtils.isEmpty(loginResult)) {
				//null
				return "/login";
			} else {
				session.setAttribute("userId", loginResult.getUserId());
				return "/board/list";
			}
		
		}
	
	}
}
