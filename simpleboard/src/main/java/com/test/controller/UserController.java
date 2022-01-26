package com.test.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.test.domain.ComCodeVO;
import com.test.domain.UserInfoCheckVO;
import com.test.domain.UserInfoVO;
import com.test.service.ComCodeService;
import com.test.service.UserInfoService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {
	
	UserInfoService userInfoService;
	ComCodeService comCodeService;
	
	@GetMapping("/join")
	public void joinUser(Model model) {
		
		model.addAttribute("phoneCode", comCodeService.selectPhoneCode());
	}
	
	@PostMapping("/join")
	public String joinUser(UserInfoVO userInfo) {
		userInfoService.joinUser(userInfo);
		return "redirect:/board/list";
	}
	
	@GetMapping("/login")
	public void loginUser() {
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
				return "redirect:/board/list";
			}
		
		}
	
	}
	
	@PostMapping("/check-login")
	@ResponseBody
	public int checkLogin(@RequestBody UserInfoCheckVO userInfo) {
		int cnt = userInfoService.checkLogin(userInfo);
		return cnt;
	}
	
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mv = new ModelAndView("redirect:/board/list");
		return mv;
	}
	
	@PostMapping("/validateId")
	@ResponseBody
	public int validateId(@RequestBody String id) {
		
		UserInfoVO userInfo = new UserInfoVO();
		userInfo.setUserId(id);
		
		int cnt = userInfoService.validateId(userInfo);
		
		return cnt;
	}
	
}