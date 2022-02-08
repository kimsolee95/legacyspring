package com.card.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.card.domain.RcvapplVO;
import com.card.service.CardService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/card/")
@AllArgsConstructor
public class CardController {
	
	CardService cardService;
	
	@GetMapping("/signup")
	public void signup(Model model) {
		//todo:  공통 코드 입력박스 사용 시, 뿌릴 data 가져오기
	}
	
	@PostMapping("/signup")
	public String signup(RcvapplVO rcvappl) {
		cardService.signup(rcvappl);
		return "redirect:/card/signup";
	}

}
