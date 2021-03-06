package com.test.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.test.domain.BoardListVO;
import com.test.domain.BoardVO;
import com.test.domain.ComCodeVO;
import com.test.domain.Criteria;
import com.test.mapper.BoardMapper;
import com.test.mapper.ComCodeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@AllArgsConstructor
@Slf4j
public class BoardServiceImpl implements BoardService{

	private BoardMapper boardMapper;
	
	@Override
	public List<BoardListVO> selectBoardList(String searchCode) {
		return boardMapper.selectBoardList(searchCode);
	}

	@Override
	public int totalBoardList(String searchCode) {
		return boardMapper.totalBoardList(searchCode);
	}	

	@Override
	public Integer totalBoardListWithPaging(Criteria cri) {
		return boardMapper.totalBoardListWithPaging(cri);
	}
	
	@Override
	public int createPosts(BoardVO board) {
		return boardMapper.createPosts(board);
	}

	@Override
	public BoardVO selectBoardOne(Long boardNum) {
		return boardMapper.selectBoardOne(boardNum);
	}

	@Override
	public int updatePosts(BoardVO board) {		
		return boardMapper.updatePosts(board);
	}

	@Override
	public int deletePosts(BoardVO board) {
		return boardMapper.deletePosts(board);
	}
	
	@Override
	public List<BoardListVO> selectBoardListWithPaging(Criteria cri) {
		return boardMapper.selectBoardListWithPaging(cri);
	}


}