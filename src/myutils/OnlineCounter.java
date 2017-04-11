package myutils;

public class OnlineCounter {
	private static int onlineCount = 0;
	public static void addCounter(){
		onlineCount++;
	}
	public static void reduceCounter(){
		onlineCount--;
	}
	public static int returnCounter(){
		return onlineCount;
	}
}
