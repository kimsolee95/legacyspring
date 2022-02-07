package com.card.domain;

import lombok.Data;

@Data
public class RcvapplVO {

	/* 신청 table */
	
	/* 주민번호 */
	private String ssn;
	
	/* 접수일자 */
	private String rcvD;
	
	/* 접수일련번호 */
	private String rcvSeqNo;
	
	/* 신청일자(입회신청서 작성일자), 신청일자가 접수일자보다 클수는 없다 */
	private String applD;
	
	/* 생년월일, 자동생성하나 "19" 또는 "20"은 확인후 입력 */
	private String birthD;
	
	/* 한글성명 */
	private String hgNm;
	
	/* 영문성명 */
	private String engNm;
	
	/* 결제 방법, 1.지로 2,자동이체 3.CMS */
	private String stlMtd;
	
	/* 결제계좌, 결제방법이 1.지로인경우에는 등록안해도 관계없음 */
	private String stlAct;
	
	/* 결제은행(은행코드 참조),  결제방법이 1.지로인경우에는 등록안해도 관계없음 */
	private String bnkCd;
	
	/* 결제일자, 말일자는 99로 등록 */
	private String stlDd;
	
	/* 관리영업점(영업점테이블 참조 */
	private String mgtBbrn;
	
	/* 신청구분(11:최초신규  12:추가신규 , 21:재발급), 자동생성 */
	private String applClas;
	
	/* 청구서발송방법(1:우편 2:E-MAIL 3:청구서사절) */
	private String stmtSndMtd;
	
	/* 청구지부속주소1, 청구서발송방법이 "1"우편인경우 필수 입력 */
	private String billadrAdr1;

	/* 청구지부속주소2, 청구서발송방법이 "1"우편인경우 필수 입력 */
	private String billadrAdr2;

	/* 청구지우편번호(정통부 우편번호 참조), 청구서발송방법이 "1"우편인경우 필수입력 */
	private String billadrZip;

	/* 핸드폰번호 */
	private String hdpNo;

	/* 브랜드(1:MASTER 2.VISA 3.JCB) */
	private String brd;

	/* 비밀번호 */
	private String scrtNo;

	/* E-MAIL, 청구서발송방법이 "2"E-NAIL인경우 필수 입력 */
	private String emailAdr;

	/* 카드 번호, 정상등록된 경우 카드번호 set */
	private String crdNo;

	/* 불능구분(입회신청 자격미달구분), 1,불능 */
	private String impsbClas;

	/* 불능코드(불능사유코드) */
	private String impsbCd;

	/* 최종작업시간 */
	private String lstOprTm;

	/* 최종작업일자 */
	private String lstOprD;
	
	/* 최종작업자사번 */
	private String lstOprtEmpno;
}
