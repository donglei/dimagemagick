module kerisy.db.factory;

import kerisy.db.database;
import kerisy.db.driver.mysql;
static Database db;

shared static this(){
	version(Windows)
		db = new MySql("localhost", "root", "", "test");
	else
		db = new MySql("localhost", "root", "123456", "test");
}

void run(string v)
{
	while(true)
		db.query("INSERT INTO user (name) VALUES (?)", v);
}


debug(xxxxx):
import ddbc.all;
static DataSource ds;
shared static this(){
	// MySQL driver - you can use PostgreSQL or SQLite instead as well
    MySQLDriver driver = new MySQLDriver();
	string url = MySQLDriver.generateUrl("localhost", 3306, "test");
	version(Windows)
		auto  params = MySQLDriver.setUserAndPassword("root", "");
	else
		auto  params = MySQLDriver.setUserAndPassword("root", "123456");
	 ds = new ConnectionPoolDataSourceImpl(driver, url, params);
}
static Connection conn ;

void run(){

	// creating Connection
	if(conn is null)
	{
		import std.stdio;
		writeln("xxx");
		conn = ds.getConnection();
	}
	//scope(exit) conn.close();

	// creating Statement
	auto stmt = conn.createStatement();
	//scope(exit) stmt.close();

	// execute simple queries to create and fill table
	//stmt.executeUpdate("CREATE TABLE IF NOT EXISTS ddbct1 (id bigint not null primary key AUTO_INCREMENT, name varchar(250), comment mediumtext, ts datetime)");
	stmt.executeUpdate("SELECT * from ddbct1 limit 1");
	//stmt.executeUpdate("INSERT INTO ddbct1 SET name='name2', comment='comment for line 2 - can be very long'");
}