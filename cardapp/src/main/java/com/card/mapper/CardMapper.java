package com.card.mapper;

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
	
	public String findCustNoBySsn(RcvapplVO rcvappl);
	
	public String findOriginalCardNo(RcvapplVO rcvappl);
	
	public int existCardStatusUpdate(CrdVO crd);
}
