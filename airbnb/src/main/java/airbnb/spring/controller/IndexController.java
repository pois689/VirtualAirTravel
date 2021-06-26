package airbnb.spring.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import airbnb.spring.dto.RankDTO;
import airbnb.spring.dto.ReplyDTO;
import airbnb.spring.service.ReplyService;

@Controller
public class IndexController {

	@Autowired 
	ReplyService service;
	
	@GetMapping(value = {"/", "/index"})
	public String index(Model model) {
		ArrayList<RankDTO> dto = service.getRank();
		System.err.println(dto);
		model.addAttribute("rank", dto);
		return "tiles/index.tiles";
	}
	
	@GetMapping("/test")
	public void test() {
		
	}
	
	@GetMapping("/hostform")
	public void hostform() {
		
	}
	
}
