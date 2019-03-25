package progetto;

import java.sql.SQLException;
import java.util.Collection;

import progetto.ComicsBean;

public interface ObjectModel {
	
	public ComicsBean doRetrieveByKey(String code) throws SQLException;
	public Collection<ComicsBean> doRetrieveAll() throws SQLException;
}
