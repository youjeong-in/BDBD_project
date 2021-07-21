package test.toy.auth;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.toy.bean.MemberBean;

@Repository
public class AuthDao {
	@Autowired
	SqlSessionTemplate sql;
	
	
	boolean insJoin(MemberBean mb) {
		return convert(sql.insert("insJoin", mb));
	}
	
	public boolean convert(int value) {
	return (value>0)?true:false;
	}
}
