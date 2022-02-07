package com.card.mapper;

import com.card.domain.BillVO;
import com.card.domain.CrdVO;
import com.card.domain.CustVO;
import com.card.domain.RcvapplVO;

public interface CardMapper {
	
	public int insertRcvappl(RcvapplVO rcvappl);
	
	public int insertCust(CustVO cust);
	
	public int insertBill(BillVO bill);
	
	public int insertCrd(CrdVO crd);

}
