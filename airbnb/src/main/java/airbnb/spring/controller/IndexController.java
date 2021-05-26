package airbnb.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

	@GetMapping("/index")
	public void index() {
	}
	
	@GetMapping("/test")
	public String test() {
		return "tiles/body.tiles";
	}
}
