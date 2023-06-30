package ko.co.tjoeun.bean;

import lombok.Data;

//게시글 테이블(content_table)
@Data
public class ContentBean {
	private int contentIdx;
	private String contentSubject;
	private String contentText;
	private String contentFile;
	private int contentWriterIdx;
	private int contentBoardIdx;
	private String contentDate;
}
