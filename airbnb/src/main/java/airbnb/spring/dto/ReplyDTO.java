package airbnb.spring.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyDTO {
	
	int rno;
	String place_id;
	String content;
	String name;
	int star;
	Date replyDate;
	Date updateDate;
	
}
