package com.test.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.domain.BoardVO;
import com.test.service.BoardService;
import com.test.service.ComCodeService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	private BoardService boardService;
	private ComCodeService comCodeService;
	
	@GetMapping("/list")
	public void list (Model model) {
		
		log.info("list");
		model.addAttribute("list", boardService.selectBoardList());
	}
	
	@GetMapping("/createposts")
	public void createPosts(Model model) {
		log.info("입력 페이지 get방식으로 출력");
		model.addAttribute("menuCode", comCodeService.selectMenuCode());
	}
	
	@PostMapping("/createposts")
	public String createPosts (BoardVO board, RedirectAttributes rttr, HttpSession session) {
				
		board.setCreator((String)session.getAttribute("userId"));
		log.info("create posts==>"  + board);
		
		boardService.createPosts(board);
		rttr.addFlashAttribute("result", board.getBoardNum());
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/updateposts")
	public void updatePosts(Model model) {
		log.info("입력 페이지 get방식으로 출력");
		model.addAttribute("menuCode", comCodeService.selectMenuCode());
	}
	
	@PostMapping("/updateposts")
	public String updatePosts (BoardVO board, Model model, HttpSession session) {
		
		board.setModifier((String)session.getAttribute("userId"));
		boardService.updatePosts(board);
		
		return "redirect:/board/list";	
	}
	

}
