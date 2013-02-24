package com.k2b6s9j.Define;

import android.app.Activity;
import android.os.Bundle;
//import com.flurry.android.FlurryAgent;

public class DefineActivity extends Activity {
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
    }

    /*
    @Override
    protected void onStart()
    {
    	super.onStart();
    	FlurryAgent.onStartSession(this, "B49TJQ5S7ZGHY6FHZMD4");
    }
 
    @Override
    protected void onStop()
    {
    	super.onStop();		
    	FlurryAgent.onEndSession(this);
    }
    */
}