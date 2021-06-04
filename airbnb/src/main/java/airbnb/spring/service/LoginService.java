package airbnb.spring.service;


import airbnb.spring.dto.User;

public interface LoginService {
	public User login(User vo);
	
	public int updateSessionKey(User user);
	
	public User loginSessionKey(String sessionkey);

	public User checkId(String id);
	public User checkemail(String email);
	
	public int insertUser(User user);
	
	public User searchId(User user);
	public User searchPwd(User user);

	public int updatePwd(User user);

	public User get(String id);

	public User snslogin(User user);

	public int update(User vo);

}
