package airbnb.spring.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import airbnb.spring.controller.ReplyController;
import airbnb.spring.dto.ReplyDTO;
import airbnb.spring.service.ReplyService;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/replies/")
@Log4j
public class ReplyController {

	@Autowired
	ReplyService service;
	
	//생성
	@PostMapping(value = "/new", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyDTO dto){
		
		log.info("ReplyDTO : "+dto);
		int insertCount = service.register(dto);
		log.info("reply insert count : "+insertCount);
		return insertCount == 1 ? new ResponseEntity<>("success",HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//리스트 조회
	@GetMapping(value="/pages/{place_id}/{page}", produces= {MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>> getList(@PathVariable("page") int page
												  ,@PathVariable("place_id") String place_id){
		
		Map<String, Object> listMap = new HashMap<String, Object>(); 
		listMap.put("List", service.getList(page, place_id));
			log.info("getList.........");
		listMap.put("ReplyCnt", service.getCountReply(place_id));//해당하는 장소의 댓글갯수
		listMap.put("avgStar", service.avgStar(place_id));
		return new ResponseEntity<>(listMap, HttpStatus.OK);
	}
	
	// 댓글 상세보기
	@GetMapping(value="/{rno}", produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyDTO> get(@PathVariable("rno") int rno){
		log.info("get : "+rno);
		
		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
	}
	
	// 댓글 삭제
	@DeleteMapping(value="/{rno}", produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") int rno){
		log.info("remove : "+rno);
		int temp = service.remove(rno);
		
		log.error("temp : " + temp);
		log.error("temp_bool : "+(temp == 1));
		//return "success";
		return (temp == 1) ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 댓글 수정
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value="/{rno}", consumes="application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReplyDTO dto, @PathVariable("rno") int rno){
		dto.setRno(rno);
		
		log.info("rno : "+rno);
		log.info("modify: "+dto);
		
		return service.modify(dto) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); 
	}
}
