package net.ktds.drink.support;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface QueryAndResult extends Query {

	
	public Object makeObject(ResultSet rs) throws SQLException;
	
}
