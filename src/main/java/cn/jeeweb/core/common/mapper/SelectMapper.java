package cn.jeeweb.core.common.mapper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import cn.jeeweb.core.utils.PropertiesUtil;
import cn.jeeweb.modules.sys.entity.Dict;

public class SelectMapper {
	String properiesName = "dbconfig.properties";
	PropertiesUtil propertiesUtil = new PropertiesUtil(properiesName);
	
	@SuppressWarnings("finally")
	public List<Dict>  selectBySql(String sql){
		Connection connection = null;
        Statement statement = null;
        ResultSet rs = null;
        List<Dict> resList = new ArrayList();
        try {
        	connection = this.getConnection();
        	statement = connection.createStatement();
        	rs = statement.executeQuery(sql);
        	 while(rs.next()){
                 //rs.get+数据库中对应的类型+(数据库中对应的列别名)
        		 Dict dict = new Dict();
                 String label = rs.getString("label");
                 String value = rs.getString("value");
                 dict.setLabel(label);
                 dict.setValue(value);
                 
                 resList.add(dict);
                 
             }
  
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}finally{
			   try {
		            if(rs !=null)rs.close();
		        } catch (Exception e) {
		        	e.printStackTrace();
		        }

		        try {
		            if(statement !=null)statement.close();
		        } catch (Exception e) {
		        	e.printStackTrace();
		        }

		        try {
		            if(connection !=null)connection.close();
		        } catch (Exception e) {
		        	e.printStackTrace();
		        }
               return resList;
		}
		
	} ;
	private Connection getConnection() {
		try {
			Connection conn = null;
			String dbType = propertiesUtil.getString("connection.dbType");
			String url = propertiesUtil.getString("connection.url");
			String username = propertiesUtil.getString("connection.username");
			String password = propertiesUtil.getString("connection.password");
			String driverClassName = "com.mysql.jdbc.Driver";
			Properties props = new Properties();
			if (username != null) {
				props.put("user", username);
			}
			if (password != null) {
				props.put("password", password);
			}
			if (dbType.equals("sqlserver")) {
				driverClassName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
			} else if (dbType.equals("mysql")) {
				driverClassName = "com.mysql.jdbc.Driver";
			} else if (dbType.equals("oracle")) {
				driverClassName = "oracle.jdbc.driver.OracleDriver";
				props.put("remarksReporting", "true");
			}
			// 初始化JDBC驱动并让驱动加载到jvm中
			Class.forName(driverClassName);
			conn = DriverManager.getConnection(url, props);
			conn.setAutoCommit(true);
			return conn;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 
	 * @title: executeSql
	 * @description: 执行sql
	 * @param sql
	 * @return: void
	 */
	public void executeSql(String sql) {
		Connection connection = getConnection();
		Statement stmt = null;
		try {
			connection.setAutoCommit(false);
			stmt = connection.createStatement();
			String[] sqls=sql.split(";");
			if (sqls.length>1){
				for (String sqlItem:sqls) {
					stmt.addBatch(sqlItem);
				}
				stmt.executeBatch();
			}else {
				stmt.execute(sql);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException(ex);
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	}
}
