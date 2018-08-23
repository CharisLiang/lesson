package test.org.javareview.thread.communication.notify;

public class WaitThread extends Thread {

	private Object lock;

	public WaitThread(Object lock) {
		this.lock = lock;
	}

	@Override
	public void run() {
		System.out.println("WaitThread starts!");
		try {
			//Both WaitThread and NotifyThread are locked.
			//So if WaitThread get the lock ,
			//the NotifyThread will be blocked.
			//After lock.wait() has been executed,
			//the NotifyThread will Be continue.
			//Because the wait() method will release the lock.
			synchronized (lock) {
				System.out.println("Ready to download");
				lock.wait();
				System.out.println(Thread.currentThread().getName()
						+ "finished!");
				lock.notify();
			}
		} catch (InterruptedException e) {
			System.out.println("WaitThread error!");
		}
	}
}
