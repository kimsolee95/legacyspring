package com.card.domain;

import lombok.Data;

@Data
public class CommCodeDtlVO {
	
	/* 그룹코드 */
	private String groupCd;

	/* 그룹코드명 */
	private String groupNm;

	/* 코드 */
	private String code;

	/* 코드명 */
	private String codeNm;

	/* 기타코드1 */
	private String etcCd1;

	/* 기타코드2 */
	private String etcCd2;

	/* 기타코드3 */
	private String etcCd3;

	/* 비고 */
	private String remark;

}