package airbnb.spring.service;


import java.util.ArrayList;
import java.util.List;

import airbnb.spring.dto.PagingVo;
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
	public User searchPwd2(User user);

	public int updatePwd(User user);

	public User get(String id);

	public User snslogin(User user);

	public int update(User vo);

	////////
	public ArrayList<User> selectBoardList();

	public int addBoard(User user);

	public int updateBoard(User user) throws Exception;

	public int deleteBoard(User user) throws Exception;

	public int deleteuser(User user);
	
	
	//////페이징
	// 게시물 총 갯수
	public int countBoard();

	// 페이징 처리 게시글 조회
	public ArrayList<User> selectBoard(PagingVo vo);
	
}
