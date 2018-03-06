package com.teamone.sevice;


import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import com.teamone.dto.AjaxResult;


public interface IUserService {
	AjaxResult<Integer> TellerLogin(String userId,String password) throws NoSuchAlgorithmException, UnsupportedEncodingException;
}
