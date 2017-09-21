package img_hp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import img_hp.Img_hpDTO;
import utility.DBClose;
import utility.DBOpen;

public class Img_hpDAO {
	
	public boolean passwdCheck(Map map) {
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		
		int imgno = (Integer)map.get("imgno");
		String passwd = (String)map.get("passwd");

		sql.append(" select count(imgno) ");
		sql.append(" from img_hp ");
		sql.append(" where imgno = ? and passwd = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imgno);
			pstmt.setString(2, passwd);

			rs = pstmt.executeQuery();

			rs.next();
			int cnt = rs.getInt(1);

			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);

		}

		return flag;
	}

	
	public boolean update(Img_hpDTO dto){
		
		boolean flag = false;
		
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update img_hp ");
		sql.append(" set ");
		sql.append(" wname = ?, ");
		sql.append(" title = ?, ");
		sql.append(" content = ?, ");
		sql.append(" fname = ? ");
		sql.append(" where imgno = ? ");

		try {
			pstmt=con.prepareStatement(sql.toString());
			
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getFname());
			pstmt.setInt(5, dto.getImgno());
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0)flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
		
		return flag;
		
	}
	public List imgRead(int imgno){
		List list = new ArrayList();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT * FROM  ");
		sql.append("   (  ");
		sql.append("      select    ");
		sql.append("          lag(imgno,2)     over (order by imgno) pre_imgno2,    ");
		sql.append("          lag(imgno,1)     over (order by imgno ) pre_imgno1,   ");
		sql.append("          imgno,  ");
		sql.append("          lead(imgno,1)    over (order by imgno) nex_imgno1,    ");
		sql.append("          lead(imgno,2)    over (order by imgno) nex_imgno2,    ");
		sql.append("          lag(fname,2)  over (order by imgno) pre_file2,     ");
		sql.append("          lag(fname,1)  over (order by imgno ) pre_file1,  ");
		sql.append("          fname,   ");
		sql.append("          lead(fname,1) over (order by imgno) nex_file1,  ");
		sql.append("          lead(fname,2) over (order by imgno) nex_file2   ");
		sql.append("          from (  ");
		sql.append("               SELECT imgno, fname   ");
		sql.append("               FROM img_hp ");
		sql.append("               ORDER BY imgno DESC  ");
		sql.append("          )  ");
		sql.append("   )  ");
		sql.append("   WHERE imgno = ? ");
		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imgno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				int[] noArr = 
					   {
						rs.getInt("pre_imgno2"),
						rs.getInt("pre_imgno1"),
						rs.getInt("imgno"),
						rs.getInt("nex_imgno1"),
						rs.getInt("nex_imgno2")
					    };
				String[] files = 
					    {
						rs.getString("pre_file2"),
						rs.getString("pre_file1"),
						rs.getString("fname"),
						rs.getString("nex_file1"),
						rs.getString("nex_file2")
						};
				
				list.add(files);
				list.add(noArr);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(pstmt, con);
		}
				
		return list;
	}	

	public Img_hpDTO read(int imgno) {
		Img_hpDTO dto = null;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" select imgno, wname, title, content, wdate, fname from img_hp ");
		sql.append(" where imgno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imgno);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new Img_hpDTO();
				dto.setImgno(rs.getInt("imgno"));
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setWdate(rs.getString("wdate"));
				dto.setFname(rs.getString("fname"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return dto;
	}

	public int total(Map map) {
		String col = (String) map.get("col");
		String word = (String) map.get("word");
		int total = 0;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" select count(*) ");
		sql.append(" from img_hp ");
		if (word.trim().length() > 0) {
			sql.append(" where " + col + " like '%'||?||'%' ");
		}

		try {
			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0) {
				pstmt.setString(1, word);
			}
			rs = pstmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return total;
	}

	public List<Img_hpDTO> list(Map map) {

		List<Img_hpDTO> list = new ArrayList<Img_hpDTO>();

		String col = (String) map.get("col");
		String word = (String) map.get("word");
		int sno = (Integer) map.get("sno");
		int eno = (Integer) map.get("eno");

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" select imgno, wname, title, wdate, fname, r ");
		sql.append(" from( ");
		sql.append(" 	select imgno, wname, title, wdate, fname, rownum as r  ");
		sql.append(" 	from( ");
		sql.append(" 	 select imgno, wname, title, wdate, fname ");
		sql.append("	 from img_hp ");
		if (word.trim().length() > 0)
			sql.append(" where " + col + " like '%'||?||'%' ");
		sql.append(" order by imgno desc ");
		sql.append(" 	) ");
		sql.append(" )where r >=? and r <= ? ");

		try {
			int i = 0;
			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0)
				pstmt.setString(++i, word);

			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				Img_hpDTO dto = new Img_hpDTO();
				dto.setImgno(rs.getInt("imgno"));
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getString("title"));
				dto.setWdate(rs.getString("wdate"));
				dto.setFname(rs.getString("fname"));

				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return list;
	}

	public boolean create(Img_hpDTO dto) {
		boolean flag = false;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" INSERT INTO img_hp(imgno, wname, title, content, passwd, wdate,fname)   ");
		sql.append(" VALUES((SELECT NVL(MAX(imgno), 0) + 1 as imgno FROM img_hp),  ");
		sql.append(" ?, ?, ?, ?, sysdate,?)  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getFname());

			int cnt = pstmt.executeUpdate();

			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return flag;
	}

}
