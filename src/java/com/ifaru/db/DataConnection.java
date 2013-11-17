package com.ifaru.db;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.sql.Time;

import com.ifaru.framework.IFaruException;

public abstract class DataConnection {
	public Connection innerConnection;
	
	public boolean open(String driver, String url,String username,String password) throws Exception	{
		Class.forName(driver);
		innerConnection = DriverManager.getConnection(url,username,password);
		if(innerConnection==null) {
			return false;
		}
		return true;
	}
	
  public boolean setConnection(Connection connection) {
    if (innerConnection != null) {
      close();
    }
    innerConnection = connection;
    return (innerConnection != null);
  }
  
	public void close() {
		try {
			innerConnection.close();
			System.out.println("Database Connection Closed Successfully..");
		}
		catch(Exception e) {
		  
		}
	}
	
	public ResultSet executeQuery(String sql) throws IFaruException
	{
	    try {
        return prepareStatement(sql).executeQuery(sql);
      } catch (SQLException e) {
        throw new IFaruException("Exception while executing query: "+sql, e);
      }
	}
	
  public ResultSet executeQuery(String sql, Object[] params) throws IFaruException
  {
      try {
        PreparedStatement stmt = prepareStatement(sql);
        for (int index = 0; index < params.length; index++)
        {
          Object obj = params[index];
          int paramIndex = index+1;
          if(obj instanceof String)
          {
            stmt.setString(paramIndex, obj.toString());
          } else if (obj instanceof Integer) {
            stmt.setInt(paramIndex, ((Integer)obj).intValue());
          } else if (obj instanceof Date) {
            stmt.setDate(paramIndex, (Date)obj);
          } else if (obj instanceof Long) {
            stmt.setLong(paramIndex, (Long)obj);
          } else if (obj instanceof String || obj instanceof StringBuffer) {
            stmt.setString(paramIndex, obj.toString());
          } else if (obj instanceof Double) {
            stmt.setDouble(paramIndex, (Double)obj);
          } else if (obj instanceof BigDecimal) {
            stmt.setBigDecimal(paramIndex, (BigDecimal)obj);
          } else if (obj instanceof Time) {
            stmt.setTime(paramIndex, (Time)obj);
          } else if (obj instanceof Boolean) {
            stmt.setBoolean(paramIndex, (Boolean)obj);
          } else if (obj instanceof Short) {
            stmt.setShort(paramIndex, (Short)obj);
          }
          
       }
        return stmt.executeQuery(sql);
      } catch (SQLException e) {
        throw new IFaruException("Exception while executing query: "+sql, e);
      }
  }	
	
	public PreparedStatement prepareStatement(String sql) throws SQLException {
		return innerConnection.prepareStatement(sql);
	}

	protected void finalize() throws Throwable {
		close();
		super.finalize();
	}
}