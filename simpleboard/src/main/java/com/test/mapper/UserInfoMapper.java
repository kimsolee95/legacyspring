package com.test.mapper;

import com.test.domain.UserInfoVO;

public interface UserInfoMapper {

	public Long joinUser(UserInfoVO userInro);
	
	public int validateId(UserInfoVO userInfo);

	public UserInfoVO login(UserInfoVO userInfo);
}
