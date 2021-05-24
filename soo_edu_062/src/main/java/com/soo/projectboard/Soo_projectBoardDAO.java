package com.soo.projectboard;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.soo.projectuser.Soo_Edu_UserVO;


@Repository("Soo_projectBoardDAO")
public class Soo_projectBoardDAO {

	@Autowired
	private SqlMapClient sql;
	//리스트
	/*
	@SuppressWarnings("unchecked")
	public List<Soo_projectBoardVO> selectBoardList(Map<String, Object> map) throws Exception {
		
		return sql.queryForList("soo_progect1.selectBoardList",map);
	}
	*/
	/*
	 * public void board_insert(Soo_projectBoardVO boardvo) throws SQLException {
	 * 
	 * sql.insert("soo_progect1", boardvo); }
	 */
	
	//@SuppressWarnings("unchecked")
//	public List<Soo_projectBoardVO> boardList(Soo_projectBoardVO vo) throws Exception {
//
//		System.out.println("리스트 DAO!!!!!");
//		
//		return sql.queryForList("boardList");
//	}

//	public List<Soo_projectBoardVO> BoardList() throws Exception {
//
//		System.out.println("리스트 DAO!!!!!!!!!!!!!!!!!");
//		
//		return sql.queryForList("boardList");
//	}
	/*

	@SuppressWarnings("unchecked")
	public List<Soo_projectBoardVO> getBoardlist(Map<String, Integer> hashmap) throws Exception{
		// TODO Auto-generated method stub
		return sql.queryForList("soo_progect1.boardlist", hashmap);
	}
	*/
	// 공지 리스트 
	/*
	@SuppressWarnings("unchecked")
	public List<Soo_projectBoardVO> getBoardlist() throws Exception {
			
		return sql.queryForList("soo_progect1.boardlist");
	}
		*/
	
	@SuppressWarnings("unchecked")
	/*
	private List<Map<String, Object>> selectList(String string, Criteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return sql.queryForList("soo_progect1.boardlist");
	}
	
	*/
	public List<Map<String, Object>> selectBoardList(Criteria cri) throws Exception {
	    
		return (List<Map<String, Object>>)sql.queryForList("soo_progect1.boardlist", cri);
	}
	


	public int getListCount() throws Exception{
		
		//Object aa = sql.queryForObject("soo_progect1.getListCount");
		
		//return Integer.valueOf(String.valueOf(aa));
		
		return (int)sql.queryForObject("soo_progect1.getListCount");
	}
	/*
	public int boardInsert(Soo_projectBoardVO boardvo) throws SQLException {
		
		Object result = sql.queryForObject("soo_progect1.boardinsert", boardvo);
		
		return Integer.valueOf(String.valueOf(result));
	}
	*/
	
	// 공지 글쓰기
	public void boardInsert(Soo_projectBoardVO boardvo) throws SQLException {
		
		sql.insert("soo_progect1.boardinsert", boardvo);
		
	}
	
	// 공지 상세보기
	public Soo_projectBoardVO boardView(int boardseq) throws SQLException {
		
		Soo_projectBoardVO view = (Soo_projectBoardVO)sql.queryForObject("soo_progect1.view", boardseq);
		
		return view;
	}
	
	// 공지 수정
	public int boardUpdate(Soo_projectBoardVO boardvo) throws SQLException {
		
		//sql.update("soo_progect1.boardupdate", boardvo);
		
		return sql.update("soo_progect1.boardupdate", boardvo);
	
	}
	
	public int boardDelete(int board_seq) throws SQLException {
		
		
		return sql.update("soo_progect1.boardDelete", board_seq);
	}
}
