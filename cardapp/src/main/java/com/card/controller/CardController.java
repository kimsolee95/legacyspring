package com.card.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/card/")
@AllArgsConstructor
public class CardController {
	
	@GetMapping("/signup")
	public void signup(Model model) {
		
	}

}
