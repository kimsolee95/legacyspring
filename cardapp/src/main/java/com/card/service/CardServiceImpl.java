package com.card.service;

import org.springframework.stereotype.Service;

import com.card.domain.BillVO;
import com.card.domain.CrdVO;
import com.card.domain.CustVO;
import com.card.domain.RcvapplVO;
import com.card.mapper.CardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@AllArgsConstructor
@Slf4j
public class CardServiceImpl implements CardService{

	private CardMapper cardMapper;
	
	@Override
	public int cardRegister(RcvapplVO rcvappl) {
		
		//불능 여부 체크 -> 불능일 경우 신청서만 insert
		
		//이후 신청구분 (최초신규/추가신규/재발급) 에 따라서 각각 table insert
		
		//1. 최초신규일 경우
		rcvappl.setApplClas("11");//신청구분 -> 최초신규 코드
		//1-1. rcvappl insert
		cardMapper.insertRcvappl(rcvappl);
		
		//1-2. cust insert
		CustVO cust = new CustVO();
		cust.setBirthD(rcvappl.getBirthD());
		cust.setHdpNo(rcvappl.getHdpNo());
		cust.setSsn(rcvappl.getSsn());
		cust.setHgNm(rcvappl.getHgNm());
		int result = cardMapper.insertCust(cust);
		
		//1-3. bill insert
		BillVO bill = new BillVO();
		bill.setCustNo(cust.getCustNo()); //확인 필수
		bill.setStlAct(rcvappl.getStlAct());
		bill.setBnkCd(rcvappl.getBnkCd());
		bill.setDpsNm(rcvappl.getHgNm());
		bill.setStlMtd(rcvappl.getStlMtd());
		bill.setStlDd(rcvappl.getStlDd());
		bill.setPrcsClas("1"); //확인으로 우선 통일
		bill.setStmtSndMtd(rcvappl.getStmtSndMtd());
		if ("3".equals(bill.getStmtSndMtd())) {
			bill.setStmtDeniClas("1"); //3은 청구서 사절 -> flag값 1 부여
		}
		bill.setBillZip(rcvappl.getBilladrZip());
		bill.setBillAdr1(rcvappl.getBilladrAdr1());
		bill.setBillAdr2(rcvappl.getBilladrAdr2());
		bill.setEmailAdr(rcvappl.getEmailAdr());
		result += cardMapper.insertBill(bill);
		
		//1-4. crd insert
		CrdVO crd = new CrdVO();
		crd.setCustNo(cust.getCustNo()); //확인 필수
		crd.setMgtBbrn(rcvappl.getMgtBbrn());
		crd.setSsn(rcvappl.getSsn());
		//crd.setVldDur(rcvappl); --5년 추가하는 것 코드 나중에 추가 필요
		crd.setBrd(rcvappl.getBrd());
		crd.setScrtNo(rcvappl.getScrtNo());
		crd.setEngNm(rcvappl.getEngNm());
		crd.setLstCrdF("1");
		crd.setCrdGrd("1"); //카드 등급은 일반으로 통일  -> 이거 제한 결림;; 1글자만 되는 상태임. 일단 11에서 1로 바꿨음
		result += cardMapper.insertCrd(crd);
		
		//2. 추가신규일 경우
		
		//3. 재발급일 경우
		
		
		
		return result;
	}

}
