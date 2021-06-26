package airbnb.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import airbnb.spring.dto.*;
import airbnb.spring.mapper.ReplyMapper;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	ReplyMapper mapper;
	
	@Override
	public int register(ReplyDTO dto) {
		log.info("register ......"+dto);
		return mapper.insert(dto);
	}

	@Override
	public ReplyDTO get(int rno) {
		log.info("get......."+rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyDTO dto) {
		log.info("modify........"+dto);
		return mapper.update(dto);
	}

	@Override
	public int remove(int rno) {
		log.info("remove......."+rno);
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyDTO> getList(int page,String place_id) {
		log.info("get reply list of a board "+ place_id);
		log.error(mapper.getList(page, place_id).get(0));
		return mapper.getList(page, place_id);
	}

	@Override
	public int getCountReply(String place_id) {
		// TODO Auto-generated method stub
		return mapper.getCountReply(place_id);
	}

	@Override
	public float avgStar(String place_id) {
		float result = mapper.avgStar(place_id);
		result = (float) (Math.round(result*10)/10.0);
		return result;
	}
	
	@Override
	public ArrayList<RankDTO> getRank() {
		return mapper.getRank();
	}
}
