package test.toy.icia;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import test.toy.auth.Authentication;
import test.toy.bean.AccessInfo;
import test.toy.bean.MemberBean;

@Controller
public class HomeController {
	@Autowired
	Authentication auth;
	
	ModelAndView mav = null;
	
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
   

   @RequestMapping(value = {"/","accessForm"}, method = RequestMethod.GET)
   public String accessForm () {
      
      return "access";
   }
   
   
   @GetMapping("/joinForm")
   public String joinForm() {
      return "join";
   }
   
   @PostMapping("/Join")
   public ModelAndView join(@ModelAttribute MemberBean mb) {
	  // System.out.println(mb);
	   mav = auth.joinCtl(mb);
	   
	   return mav;
   }
   
   @PostMapping("/logIn")
   public ModelAndView logIn(@ModelAttribute MemberBean mb) {
	   System.out.println(mb.getPublicIp());
	   return auth.logInCtl(mb);
   }
   
   
   
   @GetMapping("/isDup")
   @ResponseBody
   public boolean isDup(@ModelAttribute MemberBean mb) {
	   
	   
	   return auth.isDupCtl(mb);
   }
}