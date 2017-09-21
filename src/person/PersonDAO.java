package person;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utility.DBClose;
import utility.DBOpen;

public class PersonDAO {

	public String getFname(String id) {

		String filename = null;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" select filename "); // 현재 로그인한 사람의 fname를 뽑아오는작업
		sql.append(" from person ");
		sql.append(" where id = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {// 읽어왔을때 데이터가 있을경우
				filename = rs.getString("filename");

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			DBClose.close(rs, pstmt, con);
		}

		return filename;

	}

	public boolean passwdCheck(Map map) {
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" select count(id) ");
		sql.append(" from person ");
		sql.append(" where id = ? and passwd = ? ");

		String id = (String) map.get("id"); // 매개변수에 object값을 받으므로 형변환해줘야한다.
		String passwd = (String) map.get("passwd");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
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

	public boolean delete(String id) {
		boolean flag = false;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append("DELETE FROM person  ");
		sql.append("WHERE id=?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);

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

	public int total(Map map) {

		int total = 0;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String col = (String) map.get("col");
		String word = (String) map.get("word");
		StringBuffer sql = new StringBuffer();

		sql.append(" select count(*) ");
		sql.append(" from person ");
		if (word.trim().length() > 0)
			sql.append(" where " + col + " like '%'||?||'%'");

		try {
			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0) // 검색이 있을경우
				pstmt.setString(1, word);

			rs = pstmt.executeQuery();

			rs.next();

			total = rs.getInt(1); // 카운트값

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return total;

	}

	public boolean update(PersonDTO dto) {
		boolean flag = false;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append("UPDATE person   ");
		sql.append("SET email=?,phone=?,zipcode=?,   ");
		sql.append("  address1=?, address2=?  ");
		sql.append("WHERE id = ?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getEmail());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getZipcode());
			pstmt.setString(4, dto.getAddress1());
			pstmt.setString(5, dto.getAddress2());
			pstmt.setString(6, dto.getId());

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

	public boolean updatePw(Map map) {
		boolean flag = false;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		String passwd = (String) map.get("passwd");
		String id = (String) map.get("id");
		StringBuffer sql = new StringBuffer();

		sql.append(" update person ");
		sql.append(" set passwd = ? ");
		sql.append(" where id = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, passwd);
			pstmt.setString(2, id);

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

	public boolean updateFile(Map map) {
		boolean flag = false;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		String filename = (String) map.get("filename");
		String id = (String) map.get("id");
		StringBuffer sql = new StringBuffer();

		sql.append(" update person ");
		sql.append(" set filename = ? ");
		sql.append(" where id = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, filename);
			pstmt.setString(2, id);

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

	public String getGrade(String id) {// 관리자와 일반회원을 구분지어지는 grade(String타입) -
		// 구분짓기위해 id를 확인함으로 매개변수를id로받는다.

		String grade = null;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" select grade "); // 현재 로그인한 사람의 grade를 뽑아오는작업
		sql.append(" from person ");
		sql.append(" where id = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {// 읽어왔을때 데이터가 있을경우
				grade = rs.getString("grade");

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			DBClose.close(rs, pstmt, con);
		}

		return grade;
	}

	public boolean loginCheck(Map map) {
		boolean flag = false;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String id = (String) map.get("id");
		String passwd = (String) map.get("passwd");
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) ");
		sql.append(" from person ");
		sql.append(" where id = ? ");
		sql.append(" and passwd = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
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

	public PersonDTO read(String id) {
		PersonDTO dto = null;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select * from person ");
		sql.append(" where id = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new PersonDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				dto.setMdate(rs.getString("mdate"));
				dto.setFilename(rs.getString("filename"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return dto;
	}

	public List<PersonDTO> list(Map map) {

		List<PersonDTO> list = new ArrayList<PersonDTO>();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String col = (String) map.get("col");
		String word = (String) map.get("word");
		int sno = (Integer) map.get("sno");
		int eno = (Integer) map.get("eno");
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT id, name, phone, email, mdate, filename, r ");
		sql.append("from( ");
		sql.append("	SELECT id, name, phone, email, mdate, filename, rownum as r ");
		sql.append("	from( ");
		sql.append("		SELECT id, name, phone, email, mdate, filename ");
		sql.append("		FROM member  ");
		if (word.trim().length() > 0)
			sql.append("		where " + col + " like '%'||?||'%' ");
		sql.append("		ORDER BY mdate DESC ");
		sql.append("	) ");
		sql.append(" )where r >= ? and r <=? ");

		try {
			int i = 0;
			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0)
				pstmt.setString(++i, word);
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				PersonDTO dto = new PersonDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				dto.setMdate(rs.getString("mdate"));
				dto.setFilename(rs.getString("filename"));
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

	public boolean idCheck(String id) {

		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT COUNT(id) as cnt   ");
		sql.append(" FROM person   ");
		sql.append(" WHERE id=?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			rs.next();

			int cnt = rs.getInt("cnt");// as명으로 가져와도된다.

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

	public boolean emailCheck(String email) {
		boolean flag = false;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append("  SELECT COUNT(email) as cnt   ");
		sql.append("   FROM person   ");
		sql.append("   WHERE email=?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			rs.next();

			int cnt = rs.getInt("cnt");// as명으로 가져와도된다.

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

	public boolean create(PersonDTO dto) {
		boolean flag = false;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO person(id, passwd, name, phone, email, zipcode,   ");
		sql.append("address1,address2, mdate, filename, grade)  ");
		sql.append("VALUES(?, ?, ?, ?, ?,   ");
		sql.append("?,?,?,sysdate, ?, 'A') ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getPhone());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getAddress1());
			pstmt.setString(8, dto.getAddress2());
			pstmt.setString(9, dto.getFilename());

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
