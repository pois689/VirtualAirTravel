package airbnb.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	
	@GetMapping("/")
	public String init() {
		return "tiles/index.tiles";
	}
	
	@GetMapping("/index")
	public String index() {
		return "tiles/index.tiles";
	}
	
	@GetMapping("/test")
	public void test() {
		
	}
}
