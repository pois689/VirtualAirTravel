package airbnb.spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;


import airbnb.spring.auth.SNS;
import airbnb.spring.auth.SNSLogin;
import airbnb.spring.service.LoginService;
import airbnb.spring.dto.PagingVo;
import airbnb.spring.dto.User;

@Controller
public class LoginController {

	@Autowired
	LoginService service;

	@Autowired
	MailSender sender;
	
	@Autowired
	private SNS naverSns;
	
	@Autowired
	private SNS googleSns;
	
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	
	
	
	@GetMapping("/login")
	public void slogin() {
		
	}
	@GetMapping("/login/callback")
	public String scallback() {
		
		return "tiles/index.tiles";
	}
	
	
	@GetMapping("/login/deleteuser")
	public String deleteuser(HttpSession session,HttpServletRequest request) {
		User user = (User) session.getAttribute("user");
		service.deleteuser(user);
		session.invalidate();

		return "tiles/index.tiles";
	}
	
	@GetMapping("/login/working/adminList/{nowPage}/{cntPerPage}")
	@ResponseBody
	public Map<String, Object> adminstorage3(PagingVo vo, Model model
			,@PathVariable("nowPage") String nowPage
			,@PathVariable("cntPerPage") String cntPerPage
			) {
		int total = service.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		Map<String, Object> map = new HashMap<String, Object>();
		vo = new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", service.selectBoard(vo));
		vo.calcStartEndPage(Integer.parseInt(nowPage), 5);
		vo.calcStartEnd(Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		ArrayList<User> boardList = new ArrayList<User>();
		boardList = service.selectBoard(vo);
		System.out.println(boardList);
		map.put("list", boardList);
		return map;
	}
	
	@GetMapping("/login/working/adminList2")
	public String adminstorage() {
		return "/login/working/adminList";
	}
	
	
	@GetMapping("/login/working/adminList")
	public String adminstorage2(PagingVo vo, Model model
			,@RequestParam(value="nowPage", required=false) String nowPage
			,@RequestParam(value="cntPerPage", required=false) String cntPerPage) {
		int total = service.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", service.selectBoard(vo));
		vo.calcStartEndPage(Integer.parseInt(nowPage), 5);
		vo.calcStartEnd(Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		return "/login/working/adminList";
	}
	
	@GetMapping("/login/updatePwd")
	public String updatePwd() {
		return "/login/updatePwd";
	}
	
	//게시글 리스트 조회
	@RequestMapping(value="/board/selectBoardList2") //맵핑요청(자료 가져오기)
	@ResponseBody
	public ArrayList<User> selectBoardList(HttpServletRequest request) throws Exception{//http으로부터 request를 받음
		ArrayList<User> boardList = new ArrayList<User>();
		
		boardList = service.selectBoardList();
		return boardList; //어레이리스트를 리턴(자료를 리턴)
	}
	
	//게시글 리스트 조회
	@RequestMapping(value="/board/selectBoardList") //맵핑요청(자료 가져오기)
	@ResponseBody
	public ArrayList<User> selectBoardList2(@RequestBody PagingVo vo,HttpServletRequest request,Model model

			) throws Exception{//http으로부터 request를 받음
		System.out.println("\n\n\n\n\n\n\n\n\n\n\n\n\\n\n"+vo.getEnd());
		int nowPage = vo.getNowPage();
		int cntPerPage = vo.getCntPerPage();
		int total = service.countBoard();

		vo = new PagingVo(total, nowPage, cntPerPage);
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", service.selectBoard(vo));
		vo.calcStartEndPage(nowPage, 5);
		vo.calcStartEnd(nowPage, cntPerPage);
		ArrayList<User> boardList = new ArrayList<User>();
		boardList = service.selectBoard(vo);
		return boardList;
		
	}
	//맵, 리스트, 어레이리스트의 차이 - 몇번째에(index)값이있는가, 맵은 이름으로 찾음(문)
	
	//게시글 등록
	@RequestMapping(value="/board/addBoard")
	@ResponseBody
	public Map<String, Object> addBoard(@RequestBody User boardBean, HttpServletRequest request) throws Exception{//http으로부터 request를 받음
		Map<String, Object> resMap = new HashMap<String, Object>();
		String result = "fail";
		String resultMsg = "게시글 등록에 실패하였습니다.";
		int res = service.addBoard(boardBean);  //boardDao == mapper역활
		if(res > 0) {
			result = "ok";
			resultMsg = "게시글 등록에 성공하였습니다.";
		}
		resMap.put("result", result);
		resMap.put("resultMsg", resultMsg);
		
		return resMap; //어레이리스트를 리턴(자료를 리턴)
	}
	
	//게시글 수정
	@RequestMapping(value="/board/updateBoard")
	@ResponseBody
	public Map<String, Object> updateBoard(@RequestBody User boardBean, HttpServletRequest request) throws Exception{//http으로부터 request를 받음
		Map<String, Object> resMap = new HashMap<String, Object>();
		String result = "fail";
		String resultMsg = "게시글 수정에 실패하였습니다.";
		
		try { //원하는 구문
			int res = service.updateBoard(boardBean);  //boardDao == mapper역활
			if(res > 0) {
				result = "ok";
				resultMsg = "게시글 수정에 성공하였습니다.";
			}

		}
		catch(Exception e) { //에러발생할경우(db에서 실패한경우)
			//에러 로그 기록
		}
		 //그후 처리(무조건 처리할것)
		resMap.put("result", result);
		resMap.put("resultMsg", resultMsg);
		return resMap; //어레이리스트를 리턴(자료를 리턴)
	}
	//게시글 삭제
	@RequestMapping(value="/board/removeBoard")
	@ResponseBody
	public Map<String, Object> removeBoard(@RequestBody User boardBean, HttpServletRequest request) throws Exception{//http으로부터 request를 받음
		Map<String, Object> resMap = new HashMap<String, Object>();
		String result = "fail";
		String resultMsg = "게시글 삭제에 실패하였습니다.";
		
		try { //원하는 구문
			int res = service.deleteBoard(boardBean);  //boardDao == mapper역활
			if(res > 0) {
				result = "ok";
				resultMsg = "게시글 삭제에 성공하였습니다.";
			}
			
		}
		catch(Exception e) { //에러발생할경우(db에서 실패한경우)
			//에러 로그 기록
		}
		//그후 처리(무조건 처리할것)
		resMap.put("result", result);
		resMap.put("resultMsg", resultMsg);
		return resMap; //어레이리스트를 리턴(자료를 리턴)
	}

	
//	@RequestMapping(value = "/login/callback2",
//					method = {RequestMethod.GET, RequestMethod.POST})
//	public String snsLoginCallback(Model model, @RequestParam String code) throws Exception {
//		//1. code를 이용하여 access_token받기
//		//2. access_token을 이용하여 사용자 프로필가져오기
//		SNSLogin snslogin = new SNSLogin(naverSns);
//		String profile = snslogin.getUserProfile(code);
//		//System.out.println(profile);
//		//model.addAttribute("result", profile);
//		//3. db에 해당유저가 존재하는지 체크
//		//4. 존재시 강제로그인 ,미존재시 가입페이지로
//		return "/login/callback2";
//	}
	@RequestMapping(value = "/{snsService}/callback2",
			method = {RequestMethod.GET, RequestMethod.POST})
	public String snsLoginCallback(@PathVariable String snsService,
				Model model, @RequestParam String code,HttpSession session) throws Exception {
		SNS sns = null;
		if (StringUtils.equals("naver", snsService))
			sns = naverSns;
		else
			sns = googleSns;
		
		SNSLogin snsLogin = new SNSLogin(sns); //sns로그인부분을 컨트롤러
		//sns회원가입페이지 따로
		User snsUser = snsLogin.getUserProfile(code);// 1,2번 동시 sns유저
		System.out.println("\n\n\n\n\n\n\n\n"+snsUser);
		User user = service.snslogin(snsUser); //기존유저
		if(user != null) {
			session.setAttribute("user", user);
		}
		else if(snsUser.getEnabled()==null){
			session.setAttribute("user", snsUser);
		}
		else {
			session.setAttribute("user", snsUser);

		}
		
//		User user = service.snslogin(snsUser);
//		System.out.println(user);
//		if (user == null) {
//			model.addAttribute("msg", "추가 정보를 입력해주세요.");
//			model.addAttribute("email", snsUser.getEmail());
//			if(snsUser.getName()!=null) {
//				model.addAttribute("name", snsUser.getName());
//			}
//			if(snsUser.getTel()!=null){
//				model.addAttribute("tel", snsUser.getTel());
//			}
//			//미존재시 가입페이지로!!
//			return "/login/snsregister";
//		} else {
//			model.addAttribute("result", user.getName() + "님 반갑습니다.");
//			
//			// 4. 존재시 강제로그인
//			session.setAttribute("user", user);
//			return "tiles/index.tiles";
//		}
		return "tiles/index.tiles";
	}
	
	//네이버 소셜 로그인 콜백가면 회원이 있으면 index페이지로 , 없으면 회원가입페이지로
//	@RequestMapping(value = "/login/callback2",
//			method = {RequestMethod.GET, RequestMethod.POST})
//	public void snsLoginCallback(Model model) throws Exception {
//		
//	}
	
	//네이버 소셜 로그인
//	@RequestMapping(value = "/login/snsloginProcess",
//			method = {RequestMethod.GET, RequestMethod.POST})
//	@ResponseBody  //AJAX후 값을 리턴하기위해 작성
//	public Map<String, Object> snsloginProcess(User vo, Model model, HttpServletRequest request) throws Exception {
//		System.out.println("\n\n\n\n\n\n\n\n\n"+vo);
//		User user = service.snslogin(vo.getEmail());
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		if(user != null) {
//			// user 객체를 세션에 담아줌 - 로그인 처리
//			HttpSession session = request.getSession();
//			session.setAttribute("user", user);
//			System.out.println("\n\n\n\n\n\n\n"+user);
//			map.put("result", "success");
//			return map;
//		}else {
//			map.put("result", "fail");
//			return map;
//
//		}
//	}

	//회원가입처리//
	//네이버 소셜 회원가입
	@GetMapping("/login/snsregister")
	public void snsregister(Model model,HttpSession session,HttpServletRequest request) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("msg", "추가 정보를 입력해주세요.");
		model.addAttribute("email", user.getEmail());
		if(user.getName()!=null) {
			model.addAttribute("name", user.getName());
		}
		if(user.getTel()!=null){
			model.addAttribute("tel", user.getTel());
		}
	}
	
	
	//로그인
	@GetMapping("/login/login")
	public void login(Model model) {
		
		SNSLogin snsLogin = new SNSLogin(naverSns);
		model.addAttribute("naver_url", snsLogin.getNaverAuthURL());
		
//		SNSLogin googleLogin = new SNSLogin(googleSns);
//		model.addAttribute("google_url", googleLogin.getNaverAuthURL());
		
		/* 구글code 발행을 위한 URL 생성 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

		model.addAttribute("google_url", url);
		
	}
	
	@PostMapping("/login/loginProcess") //폼 action경로
	public String loginProcesss(User vo, Model model, HttpServletRequest request) {
		
		User user = service.login(vo);
		
		if(user != null) {
			// user 객체를 세션에 담아줌 - 로그인 처리
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			
			model.addAttribute("res",user.getId()+"님 로그인에 성공하였습니다");
			return "tiles/index.tiles";
			
		}else {
			model.addAttribute("res","로그인 실패 Id,Pwd를 확인하세요");
			return "/login/id_finded";
		}
		
	}
	//로그아웃
	@GetMapping("/login/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		//자동로그인 쿠키를 제거 해줍시다
		//로그아웃을 하게 되면 더이상 자동로그인을 할 수 없습니다
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		
		//널처리 , 로그인 쿠키가 있을때만 처리(없으면 실행안하고 login불러옴), 쿠키 기간0으로
		if(loginCookie != null) {
			loginCookie.setMaxAge(0);
			loginCookie.setPath("/");
			response.addCookie(loginCookie);
		}
		
		return "tiles/index.tiles";
	}
	
	// 아이디 찾기
	@RequestMapping(value = "/login/id_find", method = RequestMethod.GET)
	public String id_find() throws Exception{
		return "/login/id_find";
	}
	
	//아이디 찾기 결과
	@RequestMapping(value = "/login/id_finded", method = RequestMethod.POST)
	public String find_id_res(User user, Model model) throws Exception{
		User us = service.searchId(user);
		if(us != null) {
			model.addAttribute("res", us.getId());
		}else {
			model.addAttribute("res", "입력하신 정보가 없습니다.");
		}
		
		return "/login/id_finded";
	}
	// 비번 찾기
	@RequestMapping(value = "/login/pwd_find", method = RequestMethod.GET)
	public String pwd_find() throws Exception{
		return "/login/pwd_find";
	}
	
	//비번 찾기 결과
	@RequestMapping(value = "/login/pwd_finded", method = RequestMethod.POST)
	public String find_pwd(User user, Model model) throws Exception{
		User us = service.searchPwd(user);
		if(us != null) {
			model.addAttribute("id", us.getId());
		}else {
			model.addAttribute("id", "입력하신 정보가 없습니다.");
		}
		//email.welcomeMailSend();
		return "/login/pwd_finded";
	}
	
	//맵핑가서 처리후 다른사이트를  비밀번호입력
	@RequestMapping(value ="/login/mail", method = RequestMethod.POST)
	public String sendMail(User user, Model model) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	  	String uuid = null;
		 for (int i = 0; i < 5; i++) {
		        uuid = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해 주었다.
		        uuid = uuid.substring(0, 8); //uuid를 앞에서부터 10자리 잘라줌.
		  }
		String encodePwd = encoder.encode(uuid);
		User us = service.searchPwd(user);
		if(us != null) {
			us.setPwd(uuid);
			System.out.println(uuid);
			int updateRes = service.updatePwd(us);
			if(updateRes>0) {
					SimpleMailMessage msg = new SimpleMailMessage();
					msg.setTo("leehjcap1@gmail.com"); //보내는 경로
					msg.setSubject("비밀번호확인해주세요");
					msg.setText("임시비밀번호는"+uuid+"입니다 \n 암호화된비밀번호는" + encodePwd);
					//비밀번호 업데이트 서비스
					msg.setFrom("leehjcap4@gmail.com");
					sender.send(msg);
					model.addAttribute("res", "임시이메일을 전송하였습니다");
				}else {
					model.addAttribute("res", "메일전송에 실패했습니다. 관리자에게 문의해주세요");
				}
		}else {
			model.addAttribute("res", "입력하신 정보가 없습니다.");
		}
		
		return "/login/id_finded";
	}
	@PostMapping("CheckMail") // AJAX와 URL을 매핑시켜줌 
	@ResponseBody  //AJAX후 값을 리턴하기위해 작성
		public Map<String, Object> SendMail2(String mail, HttpSession session) {
			Map<String, Object> map = new HashMap<>();
			//가입된 메일이있으면 null보내줌
			User user = service.checkemail(mail);
			System.out.println("\n\n\n\n\n\n\n\n"+user);
			if(user==null) {
				Random random=new Random();  //난수 생성을 위한 랜덤 클래스
				String key="";  //인증번호 

				SimpleMailMessage msg = new SimpleMailMessage();
				//입력 키를 위한 코드
				for(int i =0; i<3;i++) {
					int index=random.nextInt(25)+65; //A~Z까지 랜덤 알파벳 생성
					key+=(char)index;
				}
				int numIndex=random.nextInt(9999)+1000; //4자리 랜덤 정수를 생성
				key+=numIndex;
				msg.setTo(mail); //보내는 경로
				msg.setSubject("인증번호 입력을 위한 메일 전송");
				msg.setText("인증 번호 : "+key);
				msg.setFrom("leehjcap4@gmail.com");
				sender.send(msg);
				map.put("key", key);
				return map;
			}else {
			map.put("key", "return");
			return map;
			}
		}
	
	//회원가입//
	@GetMapping("/login/register")
	public void register() {
	}
	//회원가입처리//
	@PostMapping("/login/registerMember")
	public String registerMember(User user) {
		System.out.println(user);
		//회원가입
		//회원가입 처리
		try {
			int res = service.insertUser(user);
			if(res>0) {
				return "forward:/login/loginProcess"; //회원가입즉시 로그인
			}else {
				return "/error";
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			return "/error";
		}
	}
	//회원가입시 아이디중복확인
	@GetMapping("/checkId/{id}")
	@ResponseBody
	public boolean checkId(@PathVariable("id") String id) {
		User user = service.checkId(id);
		if(user != null) {
			return false;
		}
		else {
			return true;
		}
	}
	
	//비밀번호중복확인
	@PostMapping("/checkPwd")
	@ResponseBody
	public String checkPw(HttpSession session,HttpServletRequest request)throws Exception {
		String result = null;
		String pw = request.getParameter("pw");
		System.out.println("\n\n\n\n\n"+pw);
		
		//암호화 확인
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		User user = (User) session.getAttribute("user");
		System.out.println(user.getPwd());
		if(encoder.matches(pw, user.getPwd())) {
			result = "Success";
			return result;
		}else {
			result = "fail";
			return result;
		}
		
		
	}
	
	@PostMapping("/pwd_change")
	@ResponseBody
	public Map<String, Object> pwChange(@RequestBody User user, HttpSession session)throws Exception{
		System.out.println(user);
		Map<String, Object> map = new HashMap<>();
		String result = null;
			int res = service.updatePwd(user);
			
			if(res>0) {
				result = "Success";
				map.put("result", result);
				System.out.println("\n\n\n\n\n\n\n\n" + result);
				session.invalidate();
			}else {
				result = "fail";
				map.put("result", result);
			}
			return map;

	}

	//유저정보 페이지
	
	
	//edit,상세페이지
	@GetMapping("/login/member_edit")
	public String member_edit(User vo ,Model model, HttpSession session) {
		//상세정보조회
		//User user = service.get(vo.getId());
		User user = (User) session.getAttribute("user");
		//user = request.getParameter("user");
		if(user != null) {
			model.addAttribute("user", user);
		}else {
			return "/login/login";
		}
			
		//리턴이없으므로 /board/get(URL)로 페이지연결
		
		return "/login/member_edit";
	}
	
	/*
	 * @GetMapping("/login/member_edit") public void edit(User vo ,Model model) {
	 * //상세정보조회 vo = service.get(vo.getId());
	 * 
	 * //모델에 담아서 화면에 전달 model.addAttribute("vo", vo);
	 * 
	 * //리턴이없으므로 /board/get(URL)로 페이지연결
	 * 
	 * }
	 */
	
	
	//에딧(포스트)
	@PostMapping("/login/member_edit")
	public String editExe(User vo, RedirectAttributes rttr, HttpServletRequest request) {
		int res = service.update(vo);
		HttpSession session = request.getSession();
		session.setAttribute("user", vo);
		return "redirect:/index";
	}
	

}
