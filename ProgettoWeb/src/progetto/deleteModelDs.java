package progetto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class deleteModelDs implements deleteModel {

	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/fumetteria");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}
	
	@Override
	public synchronized boolean doDelete(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM Fumetto WHERE COD_FUMETTO = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, code);

			result = preparedStatement.executeUpdate();

			
		} finally {
			try {
				if (preparedStatement != null){
					preparedStatement.close(); 

			}
			} finally {
				if (connection != null ){
					connection.close();
				}
				}
		}
		return (result != 0);
	}
	
	@Override
	public synchronized boolean doDeleteGadget(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM Gadget  WHERE COD_Gadget = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, code);
		
			result = preparedStatement.executeUpdate();

			
		} finally {
			try {
				if (preparedStatement != null){
					preparedStatement.close(); 

			}
			} finally {
				if (connection != null ){
					connection.close();
				}
				}
		}
		return (result != 0);
	}
	
	
	
	
	
	@Override
	public synchronized Collection<ComicsBean> doRetrieveAllC() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<ComicsBean> comics = new LinkedList<ComicsBean>();
		String selectSQL = "select * from Fumetto";

		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();
			

			while (rs.next()) {
				ComicsBean bean = new ComicsBean();

				bean.settitle(rs.getString("TITOLO"));
				bean.setcode(rs.getString("COD_FUMETTO"));
				bean.setgender(rs.getString("GENERE"));
				bean.setnumber(rs.getString("NUMERO"));
				bean.setprice(rs.getFloat("COSTO"));
				comics.add(bean);
			}
		}
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			}
			finally {
				if (connection != null)
					connection.close();
			}
		}
		return comics;
	}
	
	
	@Override
	public synchronized Collection<GadgetBean> doRetrieveAllG() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<GadgetBean> gadget = new LinkedList<GadgetBean>();
		String selectSQL = "select * from Gadget"; 
	
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				
					GadgetBean bean = new GadgetBean();
					
						bean.setname(rs.getString("NOME"));
						bean.settype(rs.getString("TIPO"));
						bean.setcode(rs.getString("COD_GADGET"));
						bean.setprice(rs.getFloat("COSTO"));
						gadget.add(bean);			
				}
			}
		
	finally {
		try {
			if (preparedStatement != null)
				preparedStatement.close();
		}
		finally {
			if (connection != null)
				connection.close();
		}
	}
	return gadget;
	
}
}
