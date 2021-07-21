package test.toy.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import test.toy.bean.MemberBean;

@Component
public class Authentication {

	@Autowired
	AuthDao dao;
	
	ModelAndView mav;

	public ModelAndView joinCtl(MemberBean mb) {
		
		mav = new ModelAndView();
		mb.setUserMail(mb.getUserMail()+mb.getMailAdd());
		mb.setAdress(mb.getAdress()+ " " +mb.getAdress2()+ " " +mb.getAdress3());
		
		if(dao.insJoin(mb)) {
			mav.setViewName("access");
			//암호화
		} 
		
		
		
		return mav;
	}
}
