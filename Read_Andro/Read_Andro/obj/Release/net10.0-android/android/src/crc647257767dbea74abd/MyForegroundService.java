package crc647257767dbea74abd;


public class MyForegroundService
	extends android.app.Service
	implements
		mono.android.IGCUserPeer
{

	public MyForegroundService ()
	{
		super ();
		if (getClass () == MyForegroundService.class) {
			mono.android.TypeManager.Activate ("Read_Andro.MyForegroundService, Read_Andro", "", this, new java.lang.Object[] {  });
		}
	}

	public void onCreate ()
	{
		n_onCreate ();
	}

	private native void n_onCreate ();

	public int onStartCommand (android.content.Intent p0, int p1, int p2)
	{
		return n_onStartCommand (p0, p1, p2);
	}

	private native int n_onStartCommand (android.content.Intent p0, int p1, int p2);

	public void onDestroy ()
	{
		n_onDestroy ();
	}

	private native void n_onDestroy ();

	public android.os.IBinder onBind (android.content.Intent p0)
	{
		return n_onBind (p0);
	}

	private native android.os.IBinder n_onBind (android.content.Intent p0);

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}
