package com.card.service;

import java.util.List;

import com.card.domain.CardListBySsnCrdNoDTO;
import com.card.domain.CardMasterInfoDTO;
import com.card.domain.CrdVO;
import com.card.domain.CustIndexListDTO;
import com.card.domain.CustVO;
import com.card.domain.RcvapplVO;
import com.card.domain.SearchKeywordDTO;

public interface CardService {

	//입회신청서
	public Long signup(RcvapplVO rcvappl);
	
	//회원 입회신청서 최근 내역 조회 (입회신청서 화면과 동일)
	public RcvapplVO selectRecentRcvappl(RcvapplVO rcvappl);
	
	//기간별 입회신청 내역조회 (기간 입력 parameter)
	public List<RcvapplVO> selectRcvapplByPeriod(SearchKeywordDTO searchKeyword);
	
	//소지 카드내역 조회 (카드정보)
	public List<CardListBySsnCrdNoDTO> selectCardListBySsnCrdNo(SearchKeywordDTO searchKeyword);

	/* 카드 소유자 정보 조회 by 주민번호, 카드번호 */
	public CardMasterInfoDTO selectCardMasterBySsnCrdNo(SearchKeywordDTO searchKeyword);
	
	/* 회원 색인 조회 */
	public List<CustIndexListDTO> custIndexSelect(SearchKeywordDTO searchKeyword);

	/* 카드 상세 조회 */
	public CrdVO selectCardDtlBySsnCrdNo(SearchKeywordDTO searchKeyword);

}
