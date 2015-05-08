import std.stdio;

void main()
{
	
	//auto ex = new SocketExample();
	//ex.run();
	import kerisy.db.database;
	import kerisy.db.driver.mysql;
	import kerisy.db.factory;
	import std.uuid;
	run("donglei");
	writeln("END...");
}


import std.socket;
import std.stdio;
import std.process;

class SocketExample
{
	private{
		Socket server, client;
		int count;
		char[65535] buffer;
		enum header = "HTTP/1.0 200 OK\nContent-Type: text/html; charset=utf-8\n\n";
	}

	this(){
		server = new TcpSocket();
		server.setOption(SocketOptionLevel.SOCKET, SocketOption.KEEPALIVE, true);
		server.bind(new InternetAddress(8080));
		server.listen(4);
		//server.blocking = false;

	}
	void run()
	{

		while(true) {
			client = server.accept();
			//auto received = client.receive(buffer);

		//	writefln("The client said:\n%s", buffer[0.. received]);

			//client.send(buffer[0.. received]);
			import dmagick.Image;
			import dmagick.Geometry;
			auto imgPath = "./ae48a0506ee7b5fdcec80b0f2a673d3febf359c3.png";
			Geometry geo = Geometry("200x150");
			Image img = new Image(imgPath);
			//img.resize(geo);
			img.write("1.png");
			client.send(std.file.read(cast(char[])"1.png"));
			client.close();
		}
	}
}

