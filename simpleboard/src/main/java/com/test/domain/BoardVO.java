package com.test.domain;

import lombok.Data;

@Data
public class BoardVO {
	
	/* 게시글타입 */
	private String boardType;
	
	/* 게시글 번호 */
	private Long boardNum;
	
	/* 게시글 제목 */
	private String boardTitle;
	
	/* 게시글 내용 */
	private String boardComment;
	
	/* 생성자 */
	private String creator;
	
	/* 생성시간 */
	private String createTime;
	
	/* 수정자 */
	private String modifier;
	
	/* 수정시간 */
	private String modifiredTime;
	
	/* 파일 */
	private String fileRoot;

}
