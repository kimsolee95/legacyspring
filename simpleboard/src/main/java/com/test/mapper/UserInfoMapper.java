package com.test.mapper;

import com.test.domain.UserInfoVO;

public interface UserInfoMapper {

	public int joinUser(UserInfoVO userInro);

	public UserInfoVO login(UserInfoVO userInfo);
}
