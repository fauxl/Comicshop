package progetto;

import java.sql.SQLException;
import java.util.Collection;

public interface CartModel {
	public Collection<GadgetBean> doRetrieveAllG() throws SQLException;
	public Collection<ComicsBean> doRetrieveAllC() throws SQLException;

	public void Shopgadget(String gadget, String order, int quantity,int availability)throws SQLException;
	public void Shopcomics(String comic, String order, int quantity, int availability)throws SQLException;
	public void Shop(String order, String date,String email, String prezzo) throws SQLException;
}
