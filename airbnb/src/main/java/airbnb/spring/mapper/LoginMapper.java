package airbnb.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import airbnb.spring.dto.User;

public interface LoginMapper { //crud create,read,delete,update
	//매개변수 유저정보를 받아와서 User를 리턴
	public User login(User user);
	public List<String> userRole(int uno); //유저권한목록
	
	public int updateSessionKey(User user);
	public User loginSessionKey(String sessionkey);
	
	public User checkId(String id);
	public User checkemail(String email);
	
	public int insertUser(User user);
	public int insertUserRole(@Param("uno")int uno, @Param("role_uno")String role_uno);
	
	public User searchId(User user);
	public User searchPwd(User user);
	public int updatePwd(User user);
	public User get(String id);
	
	public User snslogin(User user);
	public int snsinsertUser(User user);

	public int update(User vo);
	
}
