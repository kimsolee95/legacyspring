package com.test.service;

import com.test.domain.UserInfoVO;

public interface UserInfoService {
	
	public Long joinUser(UserInfoVO userInfo);

	public UserInfoVO login(UserInfoVO userInfo);
	
	public int validateId(UserInfoVO userInfo);

}