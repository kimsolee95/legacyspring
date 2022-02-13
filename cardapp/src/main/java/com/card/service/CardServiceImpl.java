package com.card.service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.card.domain.BillVO;
import com.card.domain.CardListBySsnCrdNoDTO;
import com.card.domain.CardMasterInfoDTO;
import com.card.domain.CrdVO;
import com.card.domain.CustIndexListDTO;
import com.card.domain.CustVO;
import com.card.domain.RcvapplVO;
import com.card.domain.SearchKeywordDTO;
import com.card.mapper.CardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@AllArgsConstructor
@Slf4j
public class CardServiceImpl implements CardService{

	private CardMapper cardMapper;
	
	@Override
	@Transactional
	public Long signup(RcvapplVO rcvappl) {
		
		//1. 신청서 table insert (무조건)	
		
		//불능 검사 메서드 호출 
		boolean isRcvapplActive = true;
		rcvappl = checkRcvapplPossible(rcvappl);

		if ("1".equals(rcvappl.getImpsbClas())) { //불능 검사 후, 불능 구분코드에 1 세팅되면 불능임.
			isRcvapplActive = false;
		}
		
		if (isRcvapplActive) { // 만약 해당 메서드를 통과하고 유효한 신청서로 판명난다면!..
						
			if ("11".equals(rcvappl.getApplClas())) { //11: 최초신규의 경우
				//1. 최초신규일 경우 (신청구분 -> 최초신규 (신청 -> 고객 -> 결제 -> 카드 isnert)
				//1-1. rcvappl insert
				//todo: 정상등록일 경우, 카드번호 setting
				
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
				String crdNo = makeCardNo(rcvappl);
				String expirationDate = "";
				try {
					expirationDate = makeExpirationDate();
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				crd.setCrdNo(crdNo); //카드번호 앞자리 set
				crd.setCustNo(cust.getCustNo()); //확인 필수
				crd.setMgtBbrn(rcvappl.getMgtBbrn());
				crd.setSsn(rcvappl.getSsn());
				crd.setVldDur(expirationDate); 
				crd.setBrd(rcvappl.getBrd());
				crd.setScrtNo(rcvappl.getScrtNo());
				crd.setEngNm(rcvappl.getEngNm());
				crd.setLstCrdF("1");
				crd.setCrdGrd("1"); //카드 등급 일반 통일 -> 이거 제한 결림;; 1글자만 되는 상태임. 일단 11에서 1로 바꿨음
				result += cardMapper.insertCrd(crd); 
				//카드 insert가 성공적이라면 해당 카드번호를 다시 신청서에도 update해야함
				crd.setRcvSeqNo(rcvappl.getRcvSeqNo());
				result += cardMapper.updateCrdNoInRcvappl(crd); //crdNo crdNo selectKey로 넘기기
				
			} else if ("12".equals(rcvappl.getApplClas())) { //12: 추가신규의 경우
				
				//2-1. rcvappl insert
				//todo: 정상등록일 경우, 카드번호 setting
				cardMapper.insertRcvappl(rcvappl);

				//2-2. crd insert
				CrdVO crd = new CrdVO();
				//custNo는 고객 table에서 찾아와서 setting 한다.
				String custNo = cardMapper.findCustNoBySsn(rcvappl);
				String crdNo = makeCardNo(rcvappl);
				String expirationDate = "";
				try {
					expirationDate = makeExpirationDate();
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				crd.setCrdNo(crdNo); //카드번호 앞자리 set
				crd.setCustNo(custNo);
				crd.setMgtBbrn(rcvappl.getMgtBbrn());
				crd.setSsn(rcvappl.getSsn());
				crd.setVldDur(expirationDate);
				crd.setBrd(rcvappl.getBrd());
				crd.setScrtNo(rcvappl.getScrtNo());
				crd.setEngNm(rcvappl.getEngNm());
				crd.setLstCrdF("1"); //현재 등록하는 카드가 최종 카드가 되어야 함.
				crd.setCrdGrd("1"); //카드 등급은 일반으로 통일  -> 이거 제한 결림;; 1글자만 되는 상태임. 일단 11에서 1로 바꿨음
				int result = cardMapper.insertCrd(crd); //새 카드 값을 insert
				//카드 insert가 성공적이라면 해당 카드번호를 다시 신청서에도 update해야함
				crd.setRcvSeqNo(rcvappl.getRcvSeqNo());
				result += cardMapper.updateCrdNoInRcvappl(crd); //crdNo crdNo selectKey로 넘기기
				
			} else if ("21".equals(rcvappl.getApplClas())) { //21: 재발급의 경우
				
				//2-1. rcvappl insert
				//todo: 정상등록일 경우, 카드번호 setting
				cardMapper.insertRcvappl(rcvappl);

				//2-2. crd insert
				CrdVO crd = new CrdVO();
				//custNo는 고객 table에서 찾아와서 setting 한다.
				String custNo = cardMapper.findCustNoBySsn(rcvappl);
				String originalCardNo = cardMapper.findOriginalCardNo(rcvappl);
				String crdNo = makeCardNo(rcvappl);
				String expirationDate = "";
				try {
					expirationDate = makeExpirationDate();
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				crd.setCrdNo(crdNo); //카드번호 앞자리 set
				crd.setCustNo(custNo);
				crd.setMgtBbrn(rcvappl.getMgtBbrn());
				crd.setSsn(rcvappl.getSsn());
				crd.setVldDur(expirationDate);
				crd.setBrd(rcvappl.getBrd());
				crd.setScrtNo(rcvappl.getScrtNo());
				crd.setEngNm(rcvappl.getEngNm());
				crd.setBfCrdNo(originalCardNo);
				crd.setLstCrdF("1");
				crd.setCrdGrd("1"); //카드 등급은 일반으로 통일  -> 이거 제한 결림;; 1글자만 되는 상태임. 일단 11에서 1로 바꿨음
				int result = cardMapper.insertCrd(crd); //재발급카드 insert
				result += cardMapper.existCardStatusUpdate(crd); //존재하는 카드 최종상태를 ""로 update
				//카드 insert가 성공적이라면 해당 카드번호를 다시 신청서에도 update해야함
				crd.setRcvSeqNo(rcvappl.getRcvSeqNo());
				result += cardMapper.updateCrdNoInRcvappl(crd); //crdNo crdNo selectKey로 넘기기
			}
			
		} else {
			//불능 case
			//1-1. rcvappl insert 해당 table만 집어넣기
			cardMapper.insertRcvappl(rcvappl);
		}
		
		return null;
	}
	
	public RcvapplVO checkRcvapplPossible(RcvapplVO rcvappl) {
		/*
		 * 불능인 경우, check
		 * 1. 당일신청내역존재
		 * 2. 결제계좌오류 -> 이건 그냥 일단 다 맞는 걸로 하기로 함  => 빼자.
		 * 3. 비밀번호오류 -> 프론트에서 거르는 로직 추가하는 게 나을듯
		 * 4. 기존카드존재 -> 신청구분이 최초(11) or 추가신규(12) 일 시,
		 * 5. 기존카드미존재 -> 재발급인데 기존카드가 없을때;;;
		 * */
		/*
		 * 헤당 5가지 에 맞게끔 코드를 set한다.
		 * */
		//1. 당일신청내역존재
		int sameDayCount = cardMapper.sameDayCheck(rcvappl);
		if (sameDayCount > 0) {
			rcvappl.setImpsbCd("01"); //당일신청내역 존재
			rcvappl.setImpsbClas("1"); //불능 flag
			return rcvappl;
		}
		
		//4. 기존카드존재
		if ("11".equals(rcvappl.getApplClas()) || "12".equals(rcvappl.getApplClas())) {
			//신청구분이 최초(11) or 추가신규(12) 일 시,
			int existingCardCount = cardMapper.existingCardCheck(rcvappl);
			if (existingCardCount > 0) {
				rcvappl.setImpsbCd("04"); //기존카드 존재
				rcvappl.setImpsbClas("1"); //불능 flag
			}
		}
		
		//5. 기존카드 미존재
		if ("21".equals(rcvappl.getApplClas())) { //재발급 신청 시, 
			int repeatCardCheckCount = cardMapper.repeatRegisterCardCheck(rcvappl);
			if (repeatCardCheckCount < 1) { //1개 이상 원카드가 있어야 함.
				rcvappl.setImpsbCd("05"); //재발급인데 기존 카드가 미존재.
				rcvappl.setImpsbClas("1"); //불능 flag
			}
		}
		
		return rcvappl;
	}
	
	public String makeCardNo(RcvapplVO rcvappl) {
		
		String crdNo = "";

		if ("1".equals(rcvappl.getBrd())) { //MASTER
			crdNo = "531011";
		}	else if ("2".equals(rcvappl.getBrd())) { //VISA
			crdNo = "490611";
		} else if ("3".equals(rcvappl.getBrd())) { //JCB
			crdNo = "356011";
		}
		
		return crdNo;
	}
	
	public String makeExpirationDate() throws Exception {
		
		LocalDateTime now = LocalDateTime.now(); //JAVA 8의 현재 시간 구하기
		LocalDateTime fiveYearsAfter = now.plusYears(5); //카드 유효기간인 등록시점 + 5년 더하기
		
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyyMM"); //DB 저장될 char6의 형식
		String expirationDate = fiveYearsAfter.format(dateTimeFormatter);
		
		return expirationDate;
	}

	@Override
	public RcvapplVO selectRecentRcvappl(RcvapplVO rcvappl) { 
		//회원 입회신청 검색 시, 가장 최근 입회신청서 select 
		return cardMapper.selectRecentRcvappl(rcvappl);
	}

	@Override
	public List<CardListBySsnCrdNoDTO> selectCardListBySsnCrdNo(SearchKeywordDTO searchKeyword) {
		// 소지 카드내역 조회 ( 주민번호, 카드로 카드목록 조회 )
		return cardMapper.selectCardListBySsnCrdNo(searchKeyword);
	}

	@Override
	public CardMasterInfoDTO selectCardMasterBySsnCrdNo(SearchKeywordDTO searchKeyword) {
		/* 카드 소유자 정보 조회 by 주민번호, 카드번호 */
		return cardMapper.selectCardMasterBySsnCrdNo(searchKeyword);
	}
	
	@Override
	public List<RcvapplVO> selectRcvapplByPeriod(SearchKeywordDTO searchKeyword) {
		//기간별 입회신청 내역조회 시, 입회신청 목록 select 
		return cardMapper.selectRcvapplByPeriod(searchKeyword);
	}

	@Override
	public List<CustIndexListDTO> custIndexSelect(SearchKeywordDTO searchKeyword) {
		/* 회원 색인 조회 */
		return cardMapper.custIndexSelect(searchKeyword);
	}

	@Override
	public CrdVO selectCardDtlBySsnCrdNo(SearchKeywordDTO searchKeyword) {
		//카드 상세 조회 
		return cardMapper.selectCardDtlBySsnCrdNo(searchKeyword);
	}

}
