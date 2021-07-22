package test.toy.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MemberBean {
	private String userId;
	private String userPass;
	private String userName;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthDay;
	
	private String sex;
	private String userPhone;
	private String userMail;
	private String mailAdd;
	private String adress;
	private String adress2;
	private String adress3;
	private String publicIp;
	private String privateIp;
	private String browser;
	private int method;
	
}
