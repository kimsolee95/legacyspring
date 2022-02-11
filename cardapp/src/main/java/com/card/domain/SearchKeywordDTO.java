package com.card.domain;

import lombok.Data;

@Data
public class SearchKeywordDTO {
	
	/* 검색할 접수일자 시작일 */
	private String startRcvD;
	
	/* 검색할 접수일자 말일 */
	private String endRcvD;

	/* 신청구분(11:최초신규  12:추가신규 , 21:재발급), 자동생성 */
	private String applClas;
	
	/* 주민등록번호 */
	private String ssn;
	
	/* 한글성명 */
	private String hgNm;
	
	/* 생년월일 */
	private String birthD;
	
	/* 핸드폰 번호 */
	private String hdpNo;
	
	/* 카드 번호 */
	private String crdNo;
}
