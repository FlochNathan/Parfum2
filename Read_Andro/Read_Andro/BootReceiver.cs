using Android.App;
using Android.Content;
using Android.OS;

namespace Read_Andro
{
    [BroadcastReceiver(Enabled = true, Exported = true, DirectBootAware = true)]
    [IntentFilter(new[] { Intent.ActionBootCompleted, Intent.ActionLockedBootCompleted })]
    public class BootReceiver : BroadcastReceiver
    {
        public override void OnReceive(Context context, Intent intent)
        {
            try
            {
                
                var svcIntent = new Intent(context, typeof(MyForegroundService));
                svcIntent.AddFlags(ActivityFlags.NewTask);
                if (Build.VERSION.SdkInt >= BuildVersionCodes.O)
                    context.StartForegroundService(svcIntent);
                else
                    context.StartService(svcIntent);
            }
            catch
            {

                
            }
        }
    }
}
