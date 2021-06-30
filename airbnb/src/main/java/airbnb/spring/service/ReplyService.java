package airbnb.spring.service;

import java.util.ArrayList;
import java.util.List;

import airbnb.spring.dto.*;

public interface ReplyService {
	public int register(ReplyDTO dto);
	
	public ReplyDTO get(int rno);
	
	public int modify(ReplyDTO dto);
	
	public int remove(int rno);
	
	public List<ReplyDTO> getList(int page, String place_id);
	
	public int getCountReply(String place_id);
	
	public float avgStar(String place_id);
	
	public ArrayList<RankDTO> getRank();
}
