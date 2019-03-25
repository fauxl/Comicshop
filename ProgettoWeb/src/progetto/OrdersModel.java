package progetto;

import java.sql.SQLException;
import java.util.Collection;

import progetto.OrdersBean;

public interface OrdersModel {

	public Collection<GadgetBean> doRetrieveAllG(String code) throws SQLException;
	public Collection<ComicsBean> doRetrieveAllC(String code) throws SQLException;

	public int QuantityGadget(String code) throws SQLException;
	
	public int QuantityComics(String code) throws SQLException;
	
	public Collection<OrdersBean> doRetrieveAll(String email) throws SQLException;

}
