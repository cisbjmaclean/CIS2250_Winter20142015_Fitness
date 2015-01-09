package info.hccis.fitness.activity;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import info.hccis.fitness.R;

//test

/**
 * Created by Joel on 16/01/14.
 */
public class SettingsActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_settings);

        Button backButton = (Button)findViewById(R.id.backButton);
        backButton.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view) {
                // Return user to the Main Menu
                Intent intent = new Intent(SettingsActivity.this, MainMenuActivity.class);
                startActivity(intent);
                finish();
            }
        });
    }
}
