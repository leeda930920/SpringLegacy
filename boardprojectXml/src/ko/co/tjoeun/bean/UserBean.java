package ko.co.tjoeun.bean;

import lombok.Data;

//사용자정보테이블(user_table)
@Data
public class UserBean {
	private int userIdx;
	private String userName;
	private String userId;
	private String userPw;
}
