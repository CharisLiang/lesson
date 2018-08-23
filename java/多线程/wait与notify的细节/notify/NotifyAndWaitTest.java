package test.org.javareview.thread.communication.notify;

public class NotifyAndWaitTest {

	public static void main(String[] args) throws InterruptedException {
		int countOfDownloadThread = 10;
		Object lock = new Object();
		
		for(int i = 0; i < countOfDownloadThread; i++){
			new WaitThread(lock).start();
		}
		
		Thread.sleep(5000);
		System.out.println("--------------------");
		
		new NotifyThread(lock).start();
	}

}
