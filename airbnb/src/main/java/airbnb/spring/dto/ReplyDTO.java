package airbnb.spring.dto;

import lombok.Data;

@Data
public class ReplyDTO {
	
	int rno;
	String place_id;
	String content;
	String name;
	int star;
	String replyDate;
	String updateDate;
	int replyCnt;
	
}
