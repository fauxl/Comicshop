package progetto;

import java.sql.SQLException;
import java.util.Collection;

import progetto.GadgetBean;

public interface ObjectgModel {
	
	
	public GadgetBean doRetrieveByKey(String code) throws SQLException;
	public Collection<GadgetBean> doRetrieveAll(String order) throws SQLException;
}
