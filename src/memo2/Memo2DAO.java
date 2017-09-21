package memo2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import sqlmap.GetSqlMapClient;
import utility.DBClose;
import utility.DBOpen;

public class Memo2DAO {

	private static SqlMapClient sqlMapClient;

	static {

		sqlMapClient = GetSqlMapClient.get();
	}

	public int total(Map map) throws SQLException {

		return (Integer) sqlMapClient.queryForObject("memo2.total", map);
	}

	public boolean getRefnum(int memono) throws SQLException {

		boolean flag = false;
		int cnt = (Integer)sqlMapClient.queryForObject("memo2.getRefnum", memono);
		if(cnt>0)flag=true;
		return flag;
	}

	public void upAnsnum(Map map) throws SQLException {// ansnum 증가

		sqlMapClient.update("memo2.upAnsnum", map);
	}

	public boolean replyCreate(Memo2DTO dto) throws SQLException {
		boolean flag = false;

		int cnt = sqlMapClient.update("memo2.replyCreate", dto);
		if (cnt > 0)
			flag = true;

		return flag;

	}

	public Memo2DTO replyRead(int memono) throws SQLException {

		return (Memo2DTO) sqlMapClient.queryForObject("memo2.replyRead", memono);

	}

	public boolean delete(int memono) throws SQLException {
		boolean flag = false;
		
		int cnt = sqlMapClient.delete("memo2.delete", memono);
		if(cnt>0)flag=true;

		return flag;

	}

	public boolean update(Memo2DTO dto) throws SQLException {

		boolean flag = false;

		int cnt = sqlMapClient.update("memo2.update", dto);
		if (cnt > 0)
			flag = true;

		return flag;

	}

	public boolean create(Memo2DTO dto) throws SQLException {
		boolean flag = false;

		int cnt = (Integer) sqlMapClient.update("memo2.create", dto);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	public void upviewcnt(int memono) throws SQLException { // 조회수증가
		sqlMapClient.update("memo2.upviewcnt", memono);
	}

	public Memo2DTO read(int memono) throws SQLException {// 하나씩읽어올때

		return (Memo2DTO) sqlMapClient.queryForObject("memo2.read", memono);

	}

	public List<Memo2DTO> list(Map map) throws SQLException {

		return sqlMapClient.queryForList("memo2.list", map);
	}

}
