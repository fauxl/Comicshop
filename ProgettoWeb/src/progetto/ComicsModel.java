package progetto;

import java.sql.SQLException;
import java.util.Collection;

import progetto.ComicsBean;

public interface ComicsModel {
	
	public Collection<ComicsBean> doRetrieveAll(String genere, String publisher, String tipo) throws SQLException;
	
	public Collection<ComicsBean> doRetrieveAll(String order) throws SQLException;
}