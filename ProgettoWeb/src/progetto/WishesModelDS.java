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


public class WishesModelDS implements WishesModel {

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
	public  synchronized boolean doAddGadget(String code,String email)throws SQLException {

	Connection connection = null;
	PreparedStatement preparedStatement = null;

	int result = 0;
			
	if (!(email.equals("noemail"))) {
	
	String deleteSQL = "INSERT Wishlist_Gadget VALUES (?,?);";

	try {
		connection = ds.getConnection();
		preparedStatement = connection.prepareStatement(deleteSQL);
		preparedStatement.setString(1, code);
		preparedStatement.setString(2, email);
	
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
	
	return false;
}

	
	@Override
	public synchronized boolean doAdd(String code, String email)throws SQLException {

	Connection connection = null;
	PreparedStatement preparedStatement = null;

	int result = 0;
	
	if (!(email.equals("noemail"))) {

	String deleteSQL = "INSERT Wishlist_Fumetto VALUES (?,?);";

	try {
		connection = ds.getConnection();
		preparedStatement = connection.prepareStatement(deleteSQL);
		preparedStatement.setString(1, code);
		preparedStatement.setString(2, email);
	
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
	else return false;
	
}

	
	@Override
	public synchronized boolean doDelete(String code, String email) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM  Wishlist_Fumetto  WHERE COD_FUMETTO = ?  and E_MAIL = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, code);
			preparedStatement.setString(2, email);

			
		
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
	public synchronized boolean doDeleteGadget(String code, String email) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM  Wishlist_Gadget  WHERE COD_Gadget = ? and E_MAIL = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, code);
			preparedStatement.setString(2, email);
		
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
	public synchronized Collection<ComicsBean> doRetrieveAllC(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<ComicsBean> comics = new LinkedList<ComicsBean>();
		String selectSQL = "select * from Fumetto, Cliente, Wishlist_Fumetto where Cliente.E_MAIL =  Wishlist_Fumetto.E_MAIL and  Fumetto.COD_FUMETTO = Wishlist_Fumetto.COD_FUMETTO and Cliente.E_MAIL = ?";

		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, code);

			ResultSet rs = preparedStatement.executeQuery();
			

			while (rs.next()) {
				ComicsBean bean = new ComicsBean();

				bean.settitle(rs.getString("TITOLO"));
				bean.setcode(rs.getString("COD_FUMETTO"));
				bean.setgender(rs.getString("GENERE"));
				bean.setnumber(rs.getString("NUMERO"));
				bean.setprice(rs.getFloat("COSTO"));
				bean.setavailability(rs.getInt("DISPONIBILITA"));
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
	public synchronized Collection<GadgetBean> doRetrieveAllG(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<GadgetBean> gadget = new LinkedList<GadgetBean>();
		String selectSQL = "select * from Gadget, Cliente, Wishlist_Gadget where Cliente.E_MAIL =  Wishlist_Gadget.E_MAIL and  Gadget.COD_GADGET = Wishlist_Gadget.COD_GADGET and Cliente.E_MAIL = ?"; 
	
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, code);
			
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				
					GadgetBean bean = new GadgetBean();
					
						bean.setname(rs.getString("NOME"));
						bean.settype(rs.getString("TIPO"));
						bean.setcode(rs.getString("COD_GADGET"));
						bean.setprice(rs.getFloat("COSTO"));
						bean.setavailability(rs.getInt("DISPONIBILITA"));
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
