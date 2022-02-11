package com.card.domain;

import lombok.Data;

@Data
public class CustVO {
	/* 고객 table */
	
	/* 고객번호 */
	private String custNo;

	/* 주민번호 */
	private String ssn;

	/* 등록일자(최초입회일자) */
	private String regD;

	/* 한글성명 */
	private String hgNm;

	/* 생년월일 */
	private String birthD;

	/* 핸드폰번호 */
	private String hdpNo;

	/* 최종작업시간 */
	private String lstOprTm;

	/* 최종작업일자 */
	private String lstOprD;

	/* 최종작업자사번 */
	private String lstOprtEmpno;
}
