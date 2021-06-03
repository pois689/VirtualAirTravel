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
	public String test1(@Nullable @RequestParam String search_category, @Nullable @RequestParam String search_name, Model model) {
		model.addAttribute("category",search_category);
		model.addAttribute("name",search_name);
		return "tiles/map.tiless";
	}
	@GetMapping("/map2")
	public void test4(@Nullable @RequestParam String search_category, @Nullable @RequestParam String search_name, Model model) {
		model.addAttribute("category",search_category);
		model.addAttribute("name",search_name);
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
