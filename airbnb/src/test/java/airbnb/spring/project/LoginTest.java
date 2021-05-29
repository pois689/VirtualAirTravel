package airbnb.spring.project;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import airbnb.spring.dto.User;
import airbnb.spring.mapper.LoginMapper;
import airbnb.spring.service.LoginService;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class LoginTest {
	
	@Autowired
	LoginMapper mapper;
	
	@Autowired
	LoginService service;
	
	@Test
	public void test1() {
		User user = new User();
		user.setId("user01");
		user.setPwd("1234");
		System.out.println("\n\n\n\n\n\n\n\n" + service.login(user));
	}
	@Test
	public void test2() {
		User user = new User();
		user.setId("user01");
		user.setPwd("1234");
		System.out.println("\n\n\n\n\n\n\n\n" + service.login(user));
	}
	@Test
	public void test3() {
		User user = new User();
		user.setId("user10");
		user.setPwd("1234");
		user.setName("이름");
		user.setEmail("1@naver.com");
		user.setTel("01012345678");
		System.out.println("\n\n\n\n\n\n\n\n" + service.insertUser(user));
	}
	@Test
	public void test4() {
		System.out.println("\n\n\n\n\n\n\n\n" + service.get("user01"));
	}
	
	
}
