package com.kh.doit.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.doit.notice.model.vo.Notice;
import com.kh.doit.notice.model.vo.PageInfo_no;

@Repository("nDao")
public class NoticeDao {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	public int getNoListCount() {
		return sqlsession.selectOne("boardMapper.getNoListCount");
	}

	public ArrayList<Notice> selectNoList(PageInfo_no pi_n) {

		int offset = (pi_n.getCurrentPage() - 1) * pi_n.getNoticeLimit();
		RowBounds rowBounds = new RowBounds(offset,pi_n.getNoticeLimit());
		
		return (ArrayList)sqlsession.selectList("boardMapper.selectNoList",null,rowBounds);
	}

	public int insertNotice(Notice n) {
		return sqlsession.insert("boardMapper.insertNotice",n);
	}

	public int updateCount(int n_no) {
		return sqlsession.update("boardMapper.updateNoCount",n_no);
	}

	public Notice selectNotice(int n_no) {
		return sqlsession.selectOne("boardMapper.selectNotice",n_no);
	}

	public int updateNotice(Notice n) {
		return sqlsession.update("boardMapper.updateNotice",n);
	}

	public int deleteNotice(int n_no) {
		return sqlsession.update("boardMapper.deleteNotice",n_no);
	}

}
