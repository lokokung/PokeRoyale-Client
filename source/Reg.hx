package;

import connection.RequestHandler;
import data.UserData;

class Reg
{
	/**
	 * Setup communicator for server requests.
	 */
	public static var rh:RequestHandler = new RequestHandler();
	
	/**
	 * User data received after logging in.
	 */
	public static var player:UserData = null;
}