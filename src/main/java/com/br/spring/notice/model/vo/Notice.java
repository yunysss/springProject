package com.br.spring.notice.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Notice {

	private int noticeNo;
	private String noticeTitle;
	private String noticeWriter;
	private String noticeContent;
	private String createDate;
}
