package com.card.domain;

import lombok.Data;

@Data
public class CardMasterInfoDTO {
	
	/*한글성명*/
	private String hgNm;

	/* 핸드폰번호 */
	private String hdpNo;
	
	/* 등록일자 */
	private String regD;

	/* 결제방법 */
	private String stlMtd;
	
	/* 결제은행 */
	private String bnkCd;

	/* 결제계좌 */
	private String stlAct;
	
	/* 결제일자 */
	private String stlDd;

	/* 청구서발송방법 */
	private String stmtSndMtd;

	/* 이메일 주소 */
	private String emailAdr;

	/* 우편번호 */
	private String billZip;
}
