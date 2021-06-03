package airbnb.spring.dto;

import lombok.Data;

@Data
public class Comment {
	
	int rno;
	String content;
	String place_id;
	String replydate;
	String updatedate;
	int star;
}
