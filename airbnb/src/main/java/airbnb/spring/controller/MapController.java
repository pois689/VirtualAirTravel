package airbnb.spring.controller;

import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MapController {
	//html desu
	@GetMapping("/map")
	public void test1() {
		
	}
	//sample desu
	@GetMapping("/NewFile")
	public void test2() {
		
	}
	//honntou no map
	@GetMapping("/practice")
	public void test3(@Nullable @RequestParam String category, @Nullable @RequestParam String name, Model model) {
		model.addAttribute("category",category);
		model.addAttribute("name",name);
	}
}
