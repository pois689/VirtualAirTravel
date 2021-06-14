package airbnb.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import airbnb.spring.dto.Criteria;
import airbnb.spring.dto.ReplyDTO;

public interface ReplyMapper {

	public int insert(ReplyDTO dto);
	
	public ReplyDTO read(int rno);
	
	public int delete(int rno);
	
	public int update(ReplyDTO dto);
	
	public List<ReplyDTO> getList(
			@Param("place_id") String place_id);
	
	public int getCountReply(String place_id);
}
