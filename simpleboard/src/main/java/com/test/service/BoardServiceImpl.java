package com.test.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.test.domain.BoardVO;
import com.test.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@AllArgsConstructor
@Slf4j
public class BoardServiceImpl implements BoardService{

	private BoardMapper boardMapper;
	
	@Override
	public List<BoardVO> selectBoardList() {
		return boardMapper.selectBoardList();
	}

	@Override
	public int createPosts(BoardVO board) {
		return boardMapper.createPosts(board);
	}

	@Override
	public int updatePosts(BoardVO board) {
		return boardMapper.updatePosts(board);
	}

}
