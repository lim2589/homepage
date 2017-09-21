package guest;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import sqlmap.GetSqlMapClient;

public class GuestDAO {
	
	private static SqlMapClient sqlMapClient;
	
	static {
		sqlMapClient = GetSqlMapClient.get();
		
	}
	
	public int total(Map map) throws SQLException{
		return (Integer)sqlMapClient.queryForObject("guest.total", map);
	}
	
	public List<GuestDTO> list(Map map) throws SQLException{
		
		return sqlMapClient.queryForList("guest.list", map);
		
	}
	   
	public GuestDTO read(int gno) throws SQLException{
		return (GuestDTO)sqlMapClient.queryForObject("guest.read", gno);
	}
	
	public boolean create(GuestDTO dto) throws SQLException{
		boolean flag = false;
		
		
		int cnt = (Integer)sqlMapClient.update("guest.create",dto);
		if(cnt>0) flag = true;
		return flag;
		
	}

}
