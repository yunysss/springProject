package com.br.spring.notice.model.service;

import java.util.ArrayList;

import com.br.spring.common.model.vo.PageInfo;
import com.br.spring.notice.model.vo.Notice;

public interface NoticeService {

	int selectListCount();
	ArrayList<Notice> selectList(PageInfo pi);
	
	int insertNotice(Notice n);
	
	Notice selectNotice(int noticeNo);
	
	int deleteNotice(int noticeNo);
}
