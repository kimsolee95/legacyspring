package com.test.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.domain.BoardVO;
import com.test.domain.Criteria;
import com.test.domain.PageDTO;
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
	public void list (String searchCode
						, Model model
						, HttpSession session
						, Criteria cri) { //@RequestParam("searchCode")String searchCode, , Criteria cri
		
		log.info("list");
		
		int total = boardService.totalBoardList(searchCode);
		
		//model.addAttribute("list", boardService.selectBoardList(searchCode));
		model.addAttribute("list", boardService.selectBoardListWithPaging(cri));
		model.addAttribute("total", boardService.totalBoardList(searchCode));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/createposts")
	public void createPosts(Model model) {
		log.info("�Է� ������ get������� ���");
		model.addAttribute("menuCode", comCodeService.selectMenuCode());
	}
	
	@PostMapping("/createposts")
	public String createPosts (BoardVO board, HttpSession session) { //RedirectAttributes rttr,
				
		board.setCreator((String)session.getAttribute("userId"));
		log.info("create posts==>"  + board);
		
		boardService.createPosts(board);
		//rttr.addFlashAttribute("result", board.getBoardNum());
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/posts")
	public void list (@RequestParam("boardNum")Long boardNum
						, Model model
						, @ModelAttribute("cri") Criteria cri
						, HttpSession session) {
		log.info("select boardOne");
		model.addAttribute("posts", boardService.selectBoardOne(boardNum));
	}
	
	@GetMapping("/updateposts")
	public void updatePosts(@RequestParam("boardNum")Long boardNum
								, BoardVO board
								, Model model
								, @ModelAttribute("cri") Criteria cri
								, RedirectAttributes rttr
								,  HttpSession session) { 
		board.setCreator((String)session.getAttribute("userId")); 
		model.addAttribute("menuCode", comCodeService.selectMenuCode());  
		model.addAttribute("posts", boardService.selectBoardOne(boardNum));
	}
	
	@PostMapping("/updateposts")
	public String updatePosts(@RequestParam("boardNum")Long boardNum
								, BoardVO board
								, @ModelAttribute("cri") Criteria cri
								, RedirectAttributes rttr
								, HttpSession session) {
		
		board.setModifier((String) session.getAttribute("userId"));
		//�۹�ȣ �Ѱܹޱ� 
		board.setBoardNum(boardNum);
		
		boardService.updatePosts(board);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/board/list";
	}
	

}