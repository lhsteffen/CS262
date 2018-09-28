package lhs3.cs262.calvin.edu.homework1;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    private EditText val1;
    private EditText val2;
    private Spinner operation;
    private TextView result;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Spinner spinner = (Spinner) findViewById(R.id.operations);
        // Create an ArrayAdapter using the string array and a default spinner layout
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this,
                R.array.operations, android.R.layout.simple_spinner_item);
        // Specify the layout to use when the list of choices appears
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        // Apply the adapter to the spinner
        spinner.setAdapter(adapter);

        val1 = (EditText) findViewById(R.id.editText_main);
        val2 = (EditText) findViewById(R.id.editText_second);
        operation = (Spinner) findViewById(R.id.operations);
        result = (TextView) findViewById(R.id.textView3);

    }

    public void calculateNumber(View view) {
        int num1;
        int num2;
        Integer num3 = 0;
        String op;
        num1 = Integer.parseInt(val1.getText().toString());
        num2 = Integer.parseInt(val2.getText().toString());
        op = operation.getSelectedItem().toString();
        switch (op) {
            case "+" :
                num3 = num1 + num2;
                break;
            case "-" :
                num3 = num1 - num2;
                break;
            case "*" :
                num3 = num1 * num2;
                break;
            case "/" :
                num3 = num1 / num2;
                break;
        }
        result.setText(num3.toString());
        result.setVisibility(View.VISIBLE);
    }
}
