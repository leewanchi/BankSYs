package com.teamone.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import Decoder.BASE64Encoder;

/**
 * @author vnbuser
 * MD5加密
 */
public class MD5Utils {

	 public static String encryptPassword(String password) throws NoSuchAlgorithmException, UnsupportedEncodingException {

	        MessageDigest md5 = MessageDigest.getInstance("MD5");
	        BASE64Encoder base64Encoder = new BASE64Encoder();
	        String result = base64Encoder.encode(md5.digest(password.getBytes("utf-8")));

	        return result;
	    }

}
