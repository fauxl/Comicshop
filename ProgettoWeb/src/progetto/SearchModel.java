package progetto;

import java.sql.SQLException;
import java.util.Collection;

public interface SearchModel {
	
	public Collection<GadgetBean> doRetrieveAll2(String search) throws SQLException;
	public Collection<ComicsBean> doRetrieveAll(String search) throws SQLException;
}
