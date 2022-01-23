package com.test.service;

import org.springframework.stereotype.Service;

import com.test.domain.UserInfoVO;
import com.test.mapper.UserInfoMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@AllArgsConstructor
@Slf4j
public class UserInfoServiceImpl implements UserInfoService {
	
	private UserInfoMapper userInfoMapper;

	@Override
	public int joinUser(UserInfoVO userInfo) {
		return userInfoMapper.joinUser(userInfo);
	}

	@Override
	public UserInfoVO login(UserInfoVO userInfo) {
		return userInfoMapper.login(userInfo);
	}

}
