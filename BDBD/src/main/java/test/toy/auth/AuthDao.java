package test.toy.auth;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.toy.bean.AccessInfo;
import test.toy.bean.MemberBean;

@Repository
public class AuthDao {
	@Autowired
	SqlSessionTemplate sql;
	
	
	boolean insJoin(MemberBean mb) {
		return convert(sql.insert("insJoin", mb));
	}
	
	//아이디 유무
	boolean isDup(MemberBean mb) {
		return this.convert(sql.selectOne("isDup", mb)); // 1true(중복) 0false(가능) 
	}
	
	String getPass(MemberBean mb) {
		return sql.selectOne("getPass",mb);
	}
	
	boolean insLog(MemberBean mb) {
		return this.convert(sql.insert("insLog",mb)); // 1이면 들어감
	}
	
	List<MemberBean> getUserInfo(MemberBean mb){
		//System.out.println(mb);
		return sql.selectList("getUserInfo",mb);
	}
	
	public boolean convert(int value) {
	return (value>0)?true:false;
	}
}
