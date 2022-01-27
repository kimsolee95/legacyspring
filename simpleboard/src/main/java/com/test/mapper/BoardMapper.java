package com.test.mapper;

import java.util.List;

import com.test.domain.BoardListVO;
import com.test.domain.BoardVO;
import com.test.domain.Criteria;

public interface BoardMapper {

	public List<BoardListVO> selectBoardList(String searchCode);
	
	public List<BoardListVO> selectBoardListWithPaging(Criteria cri);
	
	public int totalBoardList(String searchCode);
	
	public int createPosts(BoardVO board);
	
	public BoardVO selectBoardOne(Long boardNum);
	
	public int updatePosts(BoardVO board);
}