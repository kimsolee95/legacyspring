package com.test.service;

import java.util.List;

import com.test.domain.BoardVO;

public interface BoardService {

	public List<BoardVO> selectBoardList();
	
	public int createPosts(BoardVO board);
}
