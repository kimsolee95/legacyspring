package com.test.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.test.domain.ComCodeVO;
import com.test.mapper.ComCodeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@AllArgsConstructor
public class ComCodeServiceImpl implements ComCodeService {

	private ComCodeMapper comCodeMapper;
	
	@Override
	public List<ComCodeVO> selectPhoneCode() {
		return comCodeMapper.selectPhoneCode();
	}

	@Override
	public List<ComCodeVO> selectMenuCode() {
		return comCodeMapper.selectMenuCode();
	}

}
