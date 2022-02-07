package com.card.domain;

import lombok.Data;

@Data
public class BillVO {

	/* 결제 table */
	
	/* 고객 번호 */
	private String custNo;

	/* 결제계좌 */
	private String stlAct;

	/* 결제은행(은행코드 참조) */
	private String bnkCd;

	/* 예금주명 */
	private String dpsNm;

	/* 결제방법 */
	private String stlMtd;

	/* 결제일자 */
	private String stlDd;

	/* 계좌확인유무, 계좌확인유무 1.확인 2.미확인 */
	private String prcsClas;

	/* 청구서발송방법(1:우편 2:E-MAIL 3:청구서사절) */
	private String stmtSndMtd;

	/* 청구서사절구분(1:청구서 사절) */
	private String stmtDeniClas;

	/* 청구지우편번호 */
	private String billZip;

	/* 청구지주소1 */
	private String billAdr1;

	/* 청구지주소2 */
	private String billAdr2;

	/* EMAIL주소 */
	private String emailAdr;

	/* 최종작업시간 */
	private String lstOprTm;

	/* 최종작업일자 */
	private String lstOprD;

	/* 최종작업자사번 */
	private String lstOprtEmpno;
}
