package com.test.mapper;

import java.util.List;

import com.test.domain.ComCodeVO;

public interface ComCodeMapper {

	public List<ComCodeVO> selectPhoneCode();
	
	public List<ComCodeVO> selectMenuCode();
}
