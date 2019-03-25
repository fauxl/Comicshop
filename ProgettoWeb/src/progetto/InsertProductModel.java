package progetto;

import java.sql.SQLException;

public interface InsertProductModel {

	public void doSaveC(ComicsBean Comic) throws SQLException;
	
	public void doSaveG(GadgetBean Gadget) throws SQLException;
	
	public void doUpdateC(ComicsBean Comic, String comic) throws SQLException;
	
	public void doUpdateG(GadgetBean Gadget, String codgadget) throws SQLException;
	
	public String verifica();
	public String verifica2();


}
