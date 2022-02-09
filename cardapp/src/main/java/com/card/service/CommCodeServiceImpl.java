package com.card.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.card.domain.CommCodeDtlVO;
import com.card.mapper.CommCodeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@AllArgsConstructor
public class CommCodeServiceImpl implements CommCodeService {

	private CommCodeMapper commCodeMapper;
	
	@Override
	public List<CommCodeDtlVO> selectApplClasCode() {
		return commCodeMapper.selectApplClasCode();
	}

	@Override
	public List<CommCodeDtlVO> selectBrdCode() {
		return commCodeMapper.selectBrdCode();
	}

	@Override
	public List<CommCodeDtlVO> selectStlDdCode() {
		return commCodeMapper.selectStlDdCode();
	}

	@Override
	public List<CommCodeDtlVO> selectStlMtdCode() {
		return commCodeMapper.selectStlMtdCode();
	}

	@Override
	public List<CommCodeDtlVO> selectBnkCdCode() {
		return commCodeMapper.selectBnkCdCode();
	}

	@Override
	public List<CommCodeDtlVO> selectStmtSndMtdCode() {
		return commCodeMapper.selectStmtSndMtdCode();
	}

}