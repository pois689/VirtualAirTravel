package airbnb.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class ViewController {

	@GetMapping("/view")
	public void view() {
		
	}
	

}
