package com.card.mapper;

import java.util.List;

import com.card.domain.CommCodeDtlVO;

public interface CommCodeMapper {
	
	/* 신청구분 코드 */
	public List<CommCodeDtlVO> selectApplClasCode();
	
	/* 브랜드 구분 코드 */
	public List<CommCodeDtlVO> selectBrdCode();	

	/* 결제일자 구분 코드 */
	public List<CommCodeDtlVO> selectStlDdCode();
	
	/* 결제방법 구분 코드 */
	public List<CommCodeDtlVO> selectStlMtdCode();

	/* 결제은행코드 구분 코드 */
	public List<CommCodeDtlVO> selectBnkCdCode();
	
	/* 청구서발송방법 구분 코드 */
	public List<CommCodeDtlVO> selectStmtSndMtdCode();
}
