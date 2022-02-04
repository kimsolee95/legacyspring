package com.card.domain;

import lombok.Data;

@Data
public class commCodeVO {

	/*공통코드 table*/
	
	/* 그룹코드 */
	private String groupCd;

	/* 그룹코드명 */
	private String groupNm;

	/* 기타코드1 */
	private String etcCd1;

	/* 기타코드2 */
	private String etcCd2;

	/* 기타코드3 */
	private String etcCd3;

	/* 비고 */
	private String remark;
}
