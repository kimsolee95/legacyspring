package com.card.domain;

import lombok.Data;

@Data
public class CustIndexListDTO {
	
	/* 주민번호 */
	private String ssn;

	/* 성명(한글) */
	private String hgNm;

	/* 생년월일 */
	private String birthD;

	/* 핸드폰번호 */
	private String hdpNo;

	/* 결제은행 */
	private String bnkCd;

	/* 결제은행명 */
	private String bnkCdNm;
	
	/* 계좌 */
	private String stlAct;

	/* 주소 */
	private String billAdr1;
}
