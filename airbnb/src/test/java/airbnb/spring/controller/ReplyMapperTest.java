package airbnb.spring.controller;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import airbnb.spring.dto.Criteria;
import airbnb.spring.dto.ReplyDTO;
import airbnb.spring.mapper.ReplyMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTest {

	@Setter(onMethod_ = @Autowired)
	ReplyMapper mapper;
	
	@Test
	public void testList() {
		
		//List<ReplyDTO> replies = mapper.getList("서울");
		
		//replies.forEach(reply -> log.info(reply));
	}
	
	@Test
	public void testUpdate() {
		int targetrno = 2;
		ReplyDTO dto = mapper.read(targetrno);
		dto.setContent("수정후");
		int count = mapper.update(dto);
		log.info("update count : "+count);
	}
	
	@Test
	public void testDelete() {
		int targetrno = 1;
		log.error(mapper.delete(targetrno));
	}
	
	@Test
	public void testRead() {
		int targetRno = 1;
		
		ReplyDTO dto = mapper.read(targetRno);
		
		log.info(dto);
	}
	
	@Test
	public void testCreate() {
		
			ReplyDTO dto = new ReplyDTO();
			
			dto.setPlace_id("SEOUL");
			dto.setContent("내용");
			dto.setName("이름");
			dto.setRno(1);
			mapper.insert(dto);
	}
	
	@Test
	public void testMapper() {
		
		log.info(mapper);
	}
}
