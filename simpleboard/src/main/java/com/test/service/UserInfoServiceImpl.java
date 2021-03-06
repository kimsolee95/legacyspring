package com.test.service;

import org.springframework.stereotype.Service;

import com.test.domain.UserInfoCheckVO;
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
	public Long joinUser(UserInfoVO userInfo) {
		
		Long result;
				
		int validateResult = validateId(userInfo);
		
		if (validateResult > 0) {
			result = (long) -1; 
		} else {
			result = userInfoMapper.joinUser(userInfo);
		}
		
		return result;
	}

	@Override
	public UserInfoVO login(UserInfoVO userInfo) {
		return userInfoMapper.login(userInfo);
	}

	@Override
	public int validateId(UserInfoVO userInfo) {
		return userInfoMapper.validateId(userInfo);
	}

	@Override
	public int checkLogin(UserInfoCheckVO userInfo) {
		return userInfoMapper.checkLogin(userInfo);
	}

}