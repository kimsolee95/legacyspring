package com.test.service;

import com.test.domain.UserInfoVO;

public interface UserInfoService {
	
	public int joinUser(UserInfoVO userInfo);

	public UserInfoVO login(UserInfoVO userInfo);

}
