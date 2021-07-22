package test.toy.auth;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import test.toy.bean.AccessInfo;
import test.toy.bean.MemberBean;
import test.toy.util.Encryption;

@Component
public class Authentication {

	@Autowired
	AuthDao dao;

	@Autowired
	Gson gson;

	@Autowired
	Encryption enc;

	ModelAndView mav;

	public ModelAndView joinCtl(MemberBean mb) {

		mav = new ModelAndView();
		mb.setUserMail(mb.getUserMail()+mb.getMailAdd());
		mb.setAdress(mb.getAdress()+ " " +mb.getAdress2()+ " " +mb.getAdress3());

		//암호화
		try {

			mb.setUserPass(enc.encode(mb.getUserPass()));// 패스워드암호화
			mb.setUserPhone(enc.aesEncode(mb.getUserPhone(), mb.getUserId()));// 폰암호화
			mb.setUserName(enc.aesEncode(mb.getUserName(), mb.getUserId()));// 이름
			mb.setUserMail(enc.aesEncode(mb.getUserMail(), mb.getUserId()));// 메일
			mb.setAdress(enc.aesEncode(mb.getAdress(), mb.getUserId()));// 주소

		} catch (Exception e) {
			e.printStackTrace();
		} 

		if(dao.insJoin(mb)) {
			mav.setViewName("access");


		} 
		return mav;
	}

	public boolean isDupCtl(MemberBean mb) {
		// 1true(중복) 0false(가능) 
		boolean check;
		if(dao.isDup(mb)) {
			check = true;
		}else { //가능 
			check = false;
		}

		return check;
	}

	public ModelAndView logInCtl(MemberBean mb) {

		mav = new ModelAndView();
		String encPwd = dao.getPass(mb); // 암호화 비번
		
		mb.setMethod(1);
		
		if(encPwd!=null) {
		
			if(enc.matches(mb.getUserPass(), encPwd)) {
				if(dao.insLog(mb)) {
					
					try {
						mav.setViewName("mainPage");
						
						mav.addObject("userName" , enc.aesDecode(dao.getUserInfo(mb).get(0).getUserName(), mb.getUserId()));
						mav.addObject("userPhone", enc.aesDecode(dao.getUserInfo(mb).get(0).getUserPhone(), mb.getUserId()));
						
						mav.addObject("userId", enc.aesEncode(mb.getUserId(), "innew"));
					} catch (Exception e) {
						
						e.printStackTrace();
					} 
				}
			}
		}

		return mav;
	}
}
