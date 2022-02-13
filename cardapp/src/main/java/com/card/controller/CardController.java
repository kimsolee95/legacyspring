package com.card.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.card.domain.RcvapplVO;
import com.card.domain.SearchKeywordDTO;
import com.card.service.CardService;
import com.card.service.CommCodeService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/card/")
@AllArgsConstructor
public class CardController {

	private CardService cardService;
	private CommCodeService commCodeService;
	
	@GetMapping("/main")
	public void main() {
	}
	
	@GetMapping("/signup")
	public void signup(Model model) {
		model.addAttribute("applClasCode", commCodeService.selectApplClasCode());
		model.addAttribute("brdCode", commCodeService.selectBrdCode());
		model.addAttribute("stlDdCode", commCodeService.selectStlDdCode());
		model.addAttribute("stlMtdCode", commCodeService.selectStlMtdCode());
		model.addAttribute("bnkCdCode", commCodeService.selectBnkCdCode());
		model.addAttribute("stmtSndMtdCode", commCodeService.selectStmtSndMtdCode());
	}
	
	@PostMapping("/signup")
	public String signup(RcvapplVO rcvappl) {
		//입회신청서 등록
		cardService.signup(rcvappl);
		return "redirect:/card/signup";
	}
	
	@GetMapping("/recentrcvappl")
	public void selectRecentRcvappl(Model model, RcvapplVO rcvappl) {
		//회원 입회신청서 최근 내역 조회 (입회신청서 화면과 동일)
		model.addAttribute("selectRecentRcvapplOne", cardService.selectRecentRcvappl(rcvappl));
	}
	
	@GetMapping("/rcvapplbyperiod")
	public void selectRcvapplByPeriod(Model model) {
		model.addAttribute("applClasCode", commCodeService.selectApplClasCode());
	}
	
	@PostMapping("/rcvapplbyperiod")
	public void selectRcvapplByPeriod(SearchKeywordDTO searchKeyword, Model model) {
		//기간별 입회신청 내역조회
		model.addAttribute("applClasCode", commCodeService.selectApplClasCode());
		model.addAttribute("list", cardService.selectRcvapplByPeriod(searchKeyword));
	}
	
	@GetMapping("/custIndex")
	public void custIndexSelect() {
	}
	
	@PostMapping("/custIndex")
	public void custIndexSelect(SearchKeywordDTO searchKeyword, Model model) {
		//회원 색인 조회
		model.addAttribute("list", cardService.custIndexSelect(searchKeyword));
	}

	
	@GetMapping("/cardListBySsnCrdNo")
	public void selectCardListBySsnCrdNo() {
	}
	
	@PostMapping("/cardListBySsnCrdNo")
	public void selectCardListBySsnCrdNo(SearchKeywordDTO searchKeyword, Model model) {
		//소지 카드내역 조회
		//todo: 조회창 1개 추가 -> Bill table 내 정보 (고객 - Bill 간 1:1 관계여서 selectOne 쿼리 추가하여 model에 세팅하기)
		model.addAttribute("list", cardService.selectCardListBySsnCrdNo(searchKeyword)); //카드정보
	}
	
	@GetMapping("/cardDtlBySsnCrdNo")
	public void selectCardDtlBySsnCrdNo() {
	}
	
	@PostMapping("/cardDtlBySsnCrdNo")
	public void selectCardDtlBySsnCrdNo(SearchKeywordDTO searchKeyword, Model model) {
		//카드 상세 조회
		model.addAttribute("list", cardService.selectCardDtlBySsnCrdNo(searchKeyword));
	}	
}
