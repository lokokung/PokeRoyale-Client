package connection;

import sys.io.File;
import sys.net.Host;
import sys.net.Socket;
import haxe.Json;

/**
 * ...
 * @author Lokbondo Kung; Celia Zhang
 */
class RequestHandler
{
	private var sessionId:String;
	private var hostName:String;
	private var port:Int;
	private var tcpSocket:Socket;
	private var requestPacket:RequestPacket;

	public function new() 
	{
		sessionId = null;
		
		hostName = File.getContent(AssetPaths.ServerHost__txt);
		port = Std.parseInt(File.getContent(AssetPaths.ServerPort__txt));
	}
	
	public function requestSession()
	{
		sessionId = null;
		
		requestPacket = new RequestPacket(
			RequestCode.Session, null, sessionId);
		var jsonPacket = Json.stringify(requestPacket);
		
		tcpSocket = new Socket();
		tcpSocket.setTimeout(3);
		tcpSocket.connect(new Host(hostName), port);
		
		tcpSocket.output.writeString(jsonPacket + "\n");
		tcpSocket.output.flush();
		
		sessionId = tcpSocket.input.readLine();
		
		tcpSocket.close();
		tcpSocket = null;
	}
	
}