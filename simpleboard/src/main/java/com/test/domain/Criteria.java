package com.test.domain;

import java.util.List;

import lombok.Data;

@Data
public class Criteria {
	
	private int pageNum;
	
	private int amount;
	
	private String searchCode;
	//private String[] searhCode;
	//private List<String> searchCode;
	
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
