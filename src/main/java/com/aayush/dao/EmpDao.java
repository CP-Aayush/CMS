package com.aayush.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.aayush.bean.Emp;

@Service
public class EmpDao {

	@Autowired
	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public int delete(int id) {
		String sql = "delete from Users where id=" + id + "";
		return template.update(sql);
	}

	public Emp getEmpById(int id) {
		String sql = "select * from Users where Id=?";
		return template.queryForObject(sql, new Object[] { id }, new BeanPropertyRowMapper<Emp>(Emp.class));
	}

	public List<Emp> getEmployees() {
		return template.query("select * from request", new RowMapper<Emp>() {
			public Emp mapRow(ResultSet rs, int row) throws SQLException {
				Emp e = new Emp();
				e.setRequestId(rs.getInt(1));
				e.setRequestDate(rs.getDate(2));
				e.setRequestBy(rs.getString(3));
				e.setDescription(rs.getString(4));
				e.setAttachment(rs.getString(5));
				e.setDepartment(rs.getString(6));
				e.setStatus(rs.getString(7));
				e.setPriority(rs.getString(8));
				e.setAssignedTo(rs.getString(9));
				return e;
			}
		});
	}

	public List<Emp> getMyRequests(String username) {
//		System.out.println(username);
		return template.query("select requestId,requestDate,description,attachment,department,status,priority"
				+ " from request where requestBy = '" + username + "'", new RowMapper<Emp>() {
					public Emp mapRow(ResultSet rs, int row) throws SQLException {
						Emp e = new Emp();
						e.setRequestId(rs.getInt(1));
						e.setRequestDate(rs.getDate(2));
						e.setDescription(rs.getString(3));
						e.setAttachment(rs.getString(4));
						e.setDepartment(rs.getString(5));
						e.setStatus(rs.getString(6));
						e.setPriority(rs.getString(7));
						return e;
					}
				});
	}

	public List<Emp> assigned(String name) {
		// TODO Auto-generated method stub
		return template.query("select * from request where assignedTo = '"+ name+"'", new RowMapper<Emp>() {
			public Emp mapRow(ResultSet rs, int row) throws SQLException {
				Emp e = new Emp();
				e.setRequestId(rs.getInt(1));
				e.setRequestDate(rs.getDate(2));
				e.setRequestBy(rs.getString(3));
				e.setDescription(rs.getString(4));
				e.setAttachment(rs.getString(5));
				e.setDepartment(rs.getString(6));
				e.setStatus(rs.getString(7));
				e.setPriority(rs.getString(8));
				return e;
			}
		});
	}

	public void save(Emp emp) {

		String sql = "insert into request(requestBy,description,attachment,department,priority) values(?,?,?,?,?)";

		template.update(sql, new Object[] { emp.getRequestBy(), emp.getDescription(), emp.getAttachment(),
				emp.getDepartment(), emp.getPriority() });

	}

	public int changeStatusOpen(int requestId) {
		// TODO Auto-generated method stub
		String sql = "update request set status='Open' where requestId=" + requestId + "";
		return template.update(sql);
	}

	public int changeStatusClose(int requestId) {
		// TODO Auto-generated method stub
		String sql = "update request set status='Closed' where requestId=" + requestId + "";
		return template.update(sql);
	}

	public void assignManager(Emp emp) {
		// TODO Auto-generated method stub
		String sql = "update request set assignedTo = '"+ emp.getAssignedTo() +"' where requestId=" + emp.getRequestId() + "";
		 template.update(sql);
	}

	public List<Emp> getManagers() {
		// TODO Auto-generated method stub
		return template.query("select username from authorities where authority= 'ROLE_MANAGER' ", new RowMapper<Emp>() {
			public Emp mapRow(ResultSet rs, int row) throws SQLException {
				Emp e = new Emp();
				e.setAssignedTo(rs.getString(1));
				return e;
			}
		});
	}

}
