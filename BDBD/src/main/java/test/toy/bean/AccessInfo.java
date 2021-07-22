package test.toy.bean;

import lombok.Data;

@Data
public class AccessInfo {
	
	private String userId;
	private String userPass;
	private String publicIp;
	private String privateIp;
	private String browser;
	private int method;
	
}
