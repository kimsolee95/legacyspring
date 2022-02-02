package com.test.service;

import java.util.List;

import com.test.domain.BoardListVO;
import com.test.domain.BoardVO;
import com.test.domain.Criteria;

public interface BoardService {

	public List<BoardListVO> selectBoardList(String searchCode);
	
	public List<BoardListVO> selectBoardListWithPaging(Criteria cri);
	
	public int totalBoardList(String searchCode);
	
	public Integer totalBoardListWithPaging(Criteria cri);
	
	public int createPosts(BoardVO board);
	
	public BoardVO selectBoardOne(Long boardNum);
	
	public int updatePosts(BoardVO board);
	
	public int deletePosts(BoardVO board);
}