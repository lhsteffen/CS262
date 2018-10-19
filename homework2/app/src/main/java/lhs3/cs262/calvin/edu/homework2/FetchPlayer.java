package lhs3.cs262.calvin.edu.homework2;

import android.os.AsyncTask;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONObject;

public class FetchPlayer extends AsyncTask<String, Void, String> {
    private TextView playerId;

    public FetchPlayer(TextView playerId) {
        this.playerId = playerId;
    }

    @Override
    protected String doInBackground(String... strings) {
        return NetworkUtils.getPlayerInfo(strings[0]);
    }

    @Override
    protected void onPostExecute(String s) {
        super.onPostExecute(s);
        try {
            JSONObject jsonObject = new JSONObject(s);
            JSONArray itemsArray = jsonObject.getJSONArray("items");
            //Iterate through the results
            for(int i = 0; i<itemsArray.length(); i++){
                JSONObject player = itemsArray.getJSONObject(i); //Get the current item
                String emailAddress=null;
                String name=null;

                try {
                    emailAddress = player.getString("emailAddress");
                    name = player.getString("name");
                } catch (Exception e){
                    e.printStackTrace();
                }

                //If both a title and author exist, update the TextViews and return
                if (emailAddress != null && name != null){
                    String entry = i + ", " + emailAddress + ",  " + name;
                    playerId.setText(entry);
                    return;
                }
            }
            playerId.setText("No results found");

        } catch (Exception e) {
            playerId.setText("No results found");
            e.printStackTrace();
        }
    }
}
