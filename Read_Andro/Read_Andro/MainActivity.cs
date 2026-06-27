using Android.App;
using Android.Content;
using Android.Content.PM;
using Android.OS;

namespace Read_Andro
{
    [Activity(Label = "@string/app_name", MainLauncher = true)]
    public class MainActivity : Activity
    {
        protected override void OnCreate(Bundle? savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            var intent = new Intent(this, typeof(MyForegroundService));
            if (Android.OS.Build.VERSION.SdkInt >= Android.OS.BuildVersionCodes.O)
                StartForegroundService(intent);
            else
                StartService(intent);
            Finish(); 
        }

    }
}