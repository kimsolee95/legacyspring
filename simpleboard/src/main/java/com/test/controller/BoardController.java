package com.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	private  BoardService boardService;
	
	@GetMapping("/list")
	public void list (Model model) {
		log.info("list");
		model.addAttribute("list", boardService.selectBoardList());
	}

}
