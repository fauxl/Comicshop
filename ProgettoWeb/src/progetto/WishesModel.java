package progetto;

import java.sql.SQLException;
import java.util.Collection;


public interface WishesModel {

	public boolean doDeleteGadget(String code, String email) throws SQLException;
	public boolean doDelete(String code,String email) throws SQLException;
	
	public boolean doAddGadget(String code,String email)throws SQLException;
	public boolean doAdd(String code,String email)throws SQLException;
	
	public Collection<GadgetBean> doRetrieveAllG(String code) throws SQLException;
	public Collection<ComicsBean> doRetrieveAllC(String code) throws SQLException;

}
