package lhs3.cs262.calvin.edu.homework2;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    private EditText input;
    private TextView player;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        input = findViewById(R.id.number_input);
        player = findViewById(R.id.first_result);
    }

    public void searchPlayers(View view) {
        String mQueryString = input.getText().toString();
        new FetchPlayer(player).execute(mQueryString);
    }
}
