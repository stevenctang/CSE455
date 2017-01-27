package com.steven.lab3;

import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class MainActivity extends AppCompatActivity {

    EditText editText;
    TextView textView;
    String  jsonString;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void pressButton(View v) {
        editText = (EditText) findViewById(R.id.editText);
        textView = (TextView) findViewById(R.id.textView);
        jsonString = editText.getText().toString();

        //This is how you execute an asynctask. Create a new
        //instance of the async class and call execute().
        new sendGetRequest().execute("http://date.jsontest.com", jsonString);
    }


    public class sendGetRequest extends AsyncTask<String, Void, String> {

        @Override
        protected String doInBackground(String... params) {
            //Now in a background thread. Do all work with the URL
            //here.

            HttpURLConnection connection = null;
            //You will need some String variables
            String data = "";
            String dataLine = "";
            String result = "";

            try {
                URL url = new URL(params[0]);
                connection = (HttpURLConnection) url.openConnection();
                connection.setRequestMethod("GET");
                int code = connection.getResponseCode();

                if (code==200) {
                    InputStream input = new BufferedInputStream(connection.getInputStream());

                    if (input != null) {
                        BufferedReader bReader = new BufferedReader(new InputStreamReader(input));
                        data = "";
                        dataLine = "";
                        result = "";

                        //Append everything from the
                        //BufferedReader into a String variable
                        //to use later. Do this in the while loop
                        while ((dataLine = bReader.readLine()) != null) {
                            data += dataLine;
                        }
                        bReader.close();
                    }
                    input.close();
                }
            } catch (MalformedURLException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                connection.disconnect();
            }

            //Generate a new JSONObject with the data read in
            //from the BufferedReader.
            try {
                JSONObject jsonObject = new JSONObject(data);
                //Get a String from the JSONObject depending on
                // the key being used.
                result = jsonObject.getString(params[1]);
            } catch (JSONException e) {
                e.printStackTrace();
                result = null;
            }
            return result; //You are returning the result to the onPostExecute method following below.
        }

        @Override
        protected void onPostExecute(String result) {
            //This is where you will display the String you got
            //from the JSONObject in the text field on the app
            super.onPostExecute(result);
            textView.setText(result);
        }
    }

}