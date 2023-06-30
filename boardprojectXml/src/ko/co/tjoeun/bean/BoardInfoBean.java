package ko.co.tjoeun.bean;

import lombok.Data;

//게시판 정보 테이블board_info_table
//롬복을 사용하여 getter, setter, 생성자 생성
@Data
public class BoardInfoBean {
	//데이터 보호를 위해 객체는 private 설정
	private int boardInfoIdx;
	private String boardInfoName;
	
}
