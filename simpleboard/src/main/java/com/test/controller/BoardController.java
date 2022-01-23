package com.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.domain.BoardVO;
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
	
	@GetMapping("/createposts")
	public void createPosts() {
		log.info("입력 페이지 get방식으로 출력");
	}
	
	@PostMapping("/createposts")
	public String createPosts (BoardVO board, RedirectAttributes rttr) {
		
		log.info("create posts==>"  + board);
		
		boardService.createPosts(board);
		rttr.addFlashAttribute("result", board.getBoardNum());
		
		return "redirect:/board/list";
	}

}
