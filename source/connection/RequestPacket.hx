package connection;

/**
 * ...
 * @author Lokbondo Kung; Celia Zhang
 */
class RequestPacket
{
	
	private var requestCode:RequestCode;
	private var packetData:String;
	private var sessionId:String;

	public function new(
		requestCode:RequestCode,
		packetData:String,
		sessionId:String) 
	{
		this.requestCode = requestCode;
		this.packetData = packetData;
		this.sessionId = sessionId;
	}
	
}