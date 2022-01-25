package com.test.domain;

import lombok.Data;

@Data
public class BoardListVO {
	
	/* 공통코드 타입 이름 */
	private String codeName;
	
	/* 게시글 번호 */
	private Long boardNum;
	
	/* 게시글 제목 */
	private String boardTitle;
}
