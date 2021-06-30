package airbnb.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MapController {

	/*
	 * @Autowired ReplyService service;
	 */
	
	//html desu
	@GetMapping("/map")
	public String test1(@Nullable @RequestParam String search_category, @Nullable @RequestParam String search_name, Model model) {
		model.addAttribute("category",search_category);
		model.addAttribute("name",search_name);
		return "tiles/map.tiles";
	}
	
	/*
	 * @ResponseBody
	 * 
	 * @getMapping("/getStar") public String getStar()
	 */
}
