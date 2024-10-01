package APIFutbol;

import java.io.IOException;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.json.JSONArray;
import org.json.JSONObject;

public class ApiFutbol {

    private JSONArray jsonArrayHomeName;

    public ApiFutbol() {
        this.jsonArrayHomeName = new JSONArray();
    }

    public JSONArray getJsonArrayHomeName() {
        return jsonArrayHomeName;
    }

    public void setJsonArrayHomeName(JSONArray jsonArrayHomeName) {
        this.jsonArrayHomeName = jsonArrayHomeName;
    }

    public void equipoLocal() throws IOException {

        String URL = "https://v3.football.api-sports.io/fixtures?live=all";
        OkHttpClient cliente = new OkHttpClient();

        Request request = new Request.Builder()
                .url(URL)
                .addHeader("x-rapidapi-key", "cd03325a406f7a944dc22064c242f429")
                .addHeader("x-rapidapi-host", "v3.football.api-sports.io")
                .build();

        try (Response response = cliente.newCall(request).execute()) {
            System.out.println("Codigo respuesta: " + response.code());

            if (response.isSuccessful()) {
                String respuesta = response.body().string();

                //Pasar la respuesta a un JsonObject 
                JSONObject jsonObjectResponse = new JSONObject(respuesta);

                //Acceder a la response la cual viene en un JsonArray
                JSONArray jsonArrayResponse = jsonObjectResponse.getJSONArray("response");

                JSONArray jsonArrayHome = new JSONArray();

                //Pasar todos los nombres de los equipos locales a un JSONArray
                for (int i = 0; i < jsonArrayResponse.length(); i++) {
                    JSONObject hometeam = jsonArrayResponse.getJSONObject(i).getJSONObject("teams")
                            .getJSONObject("home");

                    jsonArrayHome.put(hometeam.get("name"));
                }

                setJsonArrayHomeName(jsonArrayHome);


            }

        }
            
        System.out.println(getJsonArrayHomeName());
    }

}
