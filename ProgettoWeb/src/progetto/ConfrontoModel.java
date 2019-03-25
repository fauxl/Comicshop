package progetto;

import java.sql.SQLException;
import java.util.Collection;


public interface ConfrontoModel {

	public boolean doDeleteGadget(String code) throws SQLException;
	public boolean doDelete(String code) throws SQLException;
	
	public boolean doAddGadget(String code)throws SQLException;
	public boolean doAdd(String code)throws SQLException;
	
	public Collection<GadgetBean> doRetrieveAllG() throws SQLException;
	public Collection<ComicsBean> doRetrieveAllC() throws SQLException;

}
