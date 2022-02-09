package com.card.mapper;

import java.util.List;

import com.card.domain.BillVO;
import com.card.domain.CrdVO;
import com.card.domain.CustVO;
import com.card.domain.RcvapplVO;

public interface CardMapper {
	
	/* 신청 insert */
	public int insertRcvappl(RcvapplVO rcvappl);
	
	/* 고객 insert */
	public int insertCust(CustVO cust);
	
	/* 결제 insert */
	public int insertBill(BillVO bill);
	
	/* 카드 insert */
	public int insertCrd(CrdVO crd);

	/* 당일 가입신청 중복 체크 */
	public int sameDayCheck(RcvapplVO rcvappl);
	
	/* 최초 or 추가 신청 시, 기존카드 존재 여부 체크 */
	public int existingCardCheck(RcvapplVO rcvappl);
	
	/* 재발급 신청 시, 기존카드 존재여부 체크 */
	public int repeatRegisterCardCheck(RcvapplVO rcvappl);
	
	/* 주민번호로 고객번호 select */
	public String findCustNoBySsn(RcvapplVO rcvappl);
	
	/* 재발급 카드 table에 입력될 이전의 원 카드번호 select */
	public String findOriginalCardNo(RcvapplVO rcvappl);
	
	/* 카드 update 시, 최종카드 flag 1 부여 */
	public int existCardStatusUpdate(CrdVO crd);
	
	/* 회원 입회신청 검색 시, 가장 최근 입회신청서 select */
	public RcvapplVO selectRecentRcvappl(RcvapplVO rcvappl);
	
	/* 기간별 입회신청 내역조회 시, 입회신청 목록 select */
	public List<RcvapplVO> selectRcvapplByPeriod(RcvapplVO rcvappl);
	
	/* 입회신청서 정상일 시, 카드등록 이후 신청서 table에 해당 카드번호 update */
	public int updateCrdNoInRcvappl(CrdVO crd);
}
