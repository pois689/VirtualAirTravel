package airbnb.spring.service;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import airbnb.spring.mapper.LoginMapper;
import airbnb.spring.dto.User;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	LoginMapper mapper;
	
	@Override
	public User login(User vo) {
		// 로그인
		User loginUser = mapper.login(vo);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		// 로그인 성공시 유저의 권한을 조회 해줍니다
			if(loginUser != null && encoder.matches(vo.getPwd(), loginUser.getPwd())) {
				System.out.println("\n\n\n\n\n\n\n\n\n\n\n"+encoder.matches(vo.getPwd(), loginUser.getPwd()));
			//로그인 유저가 있다면  TODO:비밀번호를 비교하는 로직추가
			//만약 비밀번호가 일치하면 권한 조회해서 유저객체 반환
			//비밀번호가 틀릴경우 ,USER객체 NULL로 반환
			
			//로그인 유저의 권한을 리스트로조회
			List<String> role = mapper.userRole(loginUser.getUno());
			//유저객체리스트에 담아줍니다
			loginUser.setUserRole(role);
		}else {
			return null;
		}
		return loginUser;
	}
	
	@Override
	public int updateSessionKey(User user) {
		// TODO Auto-generated method stub
		return mapper.updateSessionKey(user);
	}

	@Override
	public User loginSessionKey(String sessionkey) {
		// TODO Auto-generated method stub
		User user = loginSessionKey(sessionkey);
		List<String> role = mapper.userRole(user.getUno());
		user.setUserRole(role);
		return user;
	}

	@Override
	public User checkId(String id) {
		return mapper.checkId(id);
	}
	

	@Override
	public User checkemail(String email) {
		// TODO Auto-generated method stub
		return mapper.checkemail(email);
	}
	
	/**
	 * 사용자권한 추가 
	 */
	@Override
	public int insertUser(User user) {
		// TODO: 비밀번호 암호화 작업이 추가
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		//비밀번호 암호화
		String encodePwd = encoder.encode(user.getPwd());
		user.setPwd(encodePwd);
		
		//사용자 추가
		int res = mapper.insertUser(user);
		//권한 추가
		if(res>0) {
			User us = mapper.get(user.getId());
			res = mapper.insertUserRole(us.getUno(),"ROLE_USER");
		}
		return res;
	}
	
	public User searchId(User user) {
		return mapper.searchId(user);
	}

	@Override
	public User searchPwd(User user) {
		return mapper.searchPwd(user);
	}

	@Override
	public int updatePwd(User user) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodePwd = encoder.encode(user.getPwd());
		user.setPwd(encodePwd);

		// TODO Auto-generated method stub
		return mapper.updatePwd(user);
	}

	@Override
	public User get(String id) {
		return mapper.get(id);
	}

	@Override
	public User snslogin(User user) {
		
		
		User loginuser = mapper.snslogin(user);
		
		
		return loginuser;
	}

	@Override
	public int update(User vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public ArrayList<User> selectBoardList() {
		// TODO Auto-generated method stub
		return mapper.selectBoardList();
	}

	@Override
	public int addBoard(User user) {
		// TODO Auto-generated method stub
		return mapper.addBoard(user);
	}

	@Override
	public int updateBoard(User user) throws Exception {
		// 왜 널들어가면 오류나지
		if(user.getJip() == null) {
			user.setJip("");
		}
		if(user.getAddress() == null) {
			user.setAddress("");
		}
		if(user.getDtaddress() == null) {
			user.setDtaddress("");
		}
		return mapper.updateBoard(user);
	}

	@Override
	public int deleteBoard(User user) throws Exception {
		// TODO Auto-generated method stub
		return mapper.deleteBoard(user);
	}









}
