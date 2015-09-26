package connection;

import sys.io.File;
import sys.net.Host;
import sys.net.Socket;
import haxe.Json;
import haxe.crypto.Md5;

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
		tcpSocket = null;
	}
	
	public function requestSession()
	{
		sessionId = null;
		if (tcpSocket != null)
		{
			tcpSocket.close();
			tcpSocket = null;
		}
		
		requestPacket = new RequestPacket(
			RequestCode.Session, null, sessionId);
		var jsonPacket = Json.stringify(requestPacket);
		
		tcpSocket = new Socket();
		tcpSocket.setTimeout(10);
		tcpSocket.connect(new Host(hostName), port);
		
		tcpSocket.output.writeString(jsonPacket + "\n");
		tcpSocket.output.flush();
		
		sessionId = tcpSocket.input.readLine();
		trace(sessionId);
	}
	
	public function requestLogin(Username:String, Password:String):Bool
	{
		if (sessionId == null || tcpSocket == null)
			return false;
			
		// Encode password.
		var firstEncode = Md5.encode(Password);
		var secondEncode = sessionId + firstEncode + sessionId;
		var encodedPass = Md5.encode(secondEncode);
		
		// Get json for LoginInfo
		var loginInfo = new LoginData(Username, encodedPass);
		var loginPacket = Json.stringify(loginInfo);
		
		requestPacket = new RequestPacket(
			RequestCode.Login, loginPacket, sessionId);
		var jsonPacket = Json.stringify(requestPacket);
		
		tcpSocket.output.writeString(jsonPacket + "\n");
		tcpSocket.output.flush();
		
		tcpSocket.input.readLine();
		var serverReply = tcpSocket.input.readLine();
		trace(serverReply);
		if (serverReply == "true")
			return true;
		return false;
	}
	
}