package airbnb.spring.service;

import java.util.List;

import airbnb.spring.dto.Criteria;
import airbnb.spring.dto.ReplyDTO;

public interface ReplyService {
	public int register(ReplyDTO dto);
	
	public ReplyDTO get(int rno);
	
	public int modify(ReplyDTO dto);
	
	public int remove(int rno);
	
	public List<ReplyDTO> getList(Criteria cri, String place_id);
	
}
