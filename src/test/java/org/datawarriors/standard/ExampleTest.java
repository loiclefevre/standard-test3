package org.datawarriors.standard;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import static org.junit.jupiter.api.Assertions.fail;

public class ExampleTest {
	@Test
	void quickTest() {
		System.out.println(System.getProperty("jdbc.url"));
		try (Connection c = DriverManager.getConnection(System.getProperty("jdbc.url"))) {
			try (Statement s = c.createStatement()) {
				try (ResultSet r = s.executeQuery("select 'Hello from database!' from dual")) {
					if (r.next()) {
						try {
							Thread.sleep( 1001L ); // 1 second
						}
						catch (InterruptedException ignored) {
						}
						Assertions.assertEquals("Hello from database!",r.getString(1));
					} else {
						fail();
					}
				}
			}
		}
		catch (SQLException sqle) {
			fail(sqle);
		}
	}
}
