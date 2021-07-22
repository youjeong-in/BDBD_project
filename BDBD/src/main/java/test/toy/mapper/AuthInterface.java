package test.toy.mapper;

import java.util.List;

import test.toy.bean.AccessInfo;
import test.toy.bean.MemberBean;

public interface AuthInterface {

	int insJoin(MemberBean mb);
	int isDup(MemberBean mb);
	String getPass(MemberBean mb);
	int insLog(MemberBean mb);
	List<MemberBean> getUserInfo(MemberBean mb);
}
