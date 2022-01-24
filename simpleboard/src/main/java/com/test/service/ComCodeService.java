package com.test.service;

import java.util.List;

import com.test.domain.ComCodeVO;

public interface ComCodeService {

	public List<ComCodeVO> selectPhoneCode();
	
	public List<ComCodeVO> selectMenuCode();
}
