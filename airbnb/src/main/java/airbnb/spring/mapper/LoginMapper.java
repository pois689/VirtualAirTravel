package airbnb.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import airbnb.spring.dto.User;

public interface LoginMapper { //crud create,read,delete,update
	
	//매개변수 유저정보를 받아와서 User를 리턴
	public User login(User user);
	public List<String> userRole(String id); //유저권한목록
	
	public int updateSessionKey(User user);
	public User loginSessionKey(String sessionkey);
	
	public User checkId(String id);
	
	public int insertUser(User user);
	public int insertUserRole(@Param("id")String id, @Param("role")String role);
	
	public User searchId(User user);
	public User searchPwd(User user);
	public int updatePwd(User user);
	public User get(String id);
	
	
	/*
	 * 자동 로그인을 위한 키값과 유효기간을 저장합니다
	 * -로그인 사용자의 아이디
	 * -세션 ID
	 */
	
	
}
