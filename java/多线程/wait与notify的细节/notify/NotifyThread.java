package test.org.javareview.thread.communication.notify;

public class NotifyThread extends Thread {
	private Object lock;

	public NotifyThread(Object lock) {
		this.lock = lock;
	}

	@Override
	public void run() {
		System.out.println("NotifyThread start...");
		synchronized (lock) {
			System.out.println("nofity other thread to download");
			lock.notifyAll();
			try {
				lock.wait();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("NotifyThread ended!");
		}
	}
}
