package com.card.domain;

import lombok.Data;

@Data
public class CrdVO {
	/* 카드 table */
	
	/* 카드번호, 브랜드4자리  + 등급2자리 + 일련번호 9자리 + 체크디지트(1자리), 등급은 일반 11,우량 21 ,골드 31
 ,플레티늄 41 카드번호 9자리는 관리번호 발번테이블에서 +1하여 자동채번한다. */
	private String crdNo;

	/* 고객번호 */
	private String custNo;

	/* 관리영업점, 영업점 정보 테이블 참조 */
	private String mgtBbrn;

	/* 등록일자, 현카드 등록일자 */
	private String regD;

	/* 주민번호 */
	private String ssn;

	/* 유효기한, 유효기간은 해당월 포함 + 5년으로 한다. */
	private String vldDur;

	/* 브랜드(1:MASTER 2.VISA 3.JCB) */
	private String brd;

	/* 브랜드명(1:MASTER 2.VISA 3.JCB) */
	private String brdNm;	
	
	/* 비밀번호, 비밀번호 는 숫자로 암호화 처리 */
	private String scrtNo;

	/* 영문성명 */
	private String engNm;

	/* 전카드번호, 이전카드번호로 최초등록시는 없음(재발급시에만 등록) */
	private String bfCrdNo;

	/* 최종카드여부(최종카드인 경우만 "1" SET) ,현카드번호가 최종카드인경우 */
	private String lstCrdF;

	/* 최초등록일자, 최초카드 등록일자(추가카드,재발급 등록시에도 변경되지 않는다) */
	private String fstRegD;

	/* 카드등급(11: 일반 21:우량 31:골드 41.플레티늄) ,등급은 자동생성되나 현재는1.일반 고정값 SET */
	private String crdGrd;

	/* 카드등급명(11: 일반 21:우량 31:골드 41.플레티늄) ,등급은 자동생성되나 현재는1.일반 고정값 SET */
	private String crdGrdNm;
	
	/* 최종작업시간 */
	private String lstOprTm;

	/* 최종작업일자 */
	private String lstOprD;

	/* 최종작업자사번 */
	private String lstOprtEmpno;
	
	/* rcvSeqNo 해당 카드 신청 시, 신청서 접수 일련번호 -> 신청서 내 카드번호 update시 사용 */
	private String rcvSeqNo;

	/* 카드내역 상세 조회 시, 사용 컬럼 */
	private String hgNm;
}
