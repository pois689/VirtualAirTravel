package airbnb.spring.controller;

import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class ViewController {

	
	@GetMapping("/view")
	public void view(@Nullable @RequestParam String name, Model model) {
		// 네임에 null 값이 넘어오면 404 에러 페이지 연결
		// name 값이 넘어오면 받아오기
		model.addAttribute("name", name);
	}
	

}
