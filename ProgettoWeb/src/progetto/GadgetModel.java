package progetto;

import java.sql.SQLException;
import java.util.Collection;

import progetto.GadgetBean;

public interface GadgetModel {
	
	
	public Collection<GadgetBean> doRetrieveAll(String sort) throws SQLException;

	public Collection<GadgetBean> doRetrieveAll(String tipo,String  publisher) throws SQLException;
}