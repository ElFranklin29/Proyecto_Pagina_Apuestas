package APIFutbol;

import java.io.IOException;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.HashSet;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.json.JSONArray;
import org.json.JSONObject;
import static org.json.JSONObject.NULL;

public class ApiFutbol {

    private JSONArray jsonArrayHomeName;
    private JSONArray jsonArrayAwayName;
    private JSONArray jsonArrayHomeGoals;
    private JSONArray jsonArrayAwayGoals;
    private JSONArray jsonArrayLogoHome;
    private JSONArray jsonArrayLogoAway;
    private JSONArray jsonArrayLeague;
    private JSONArray jsonArrayFecha;
    private String fechaActual;
    String respuesta;

    String URL;

    OkHttpClient cliente;

    Request request;

    JSONObject jsonObjectResponse;

    JSONArray jsonArrayResponse;

    public ApiFutbol() {
        this.jsonArrayHomeName = new JSONArray();
    }

    public String getFechaActual() {
        return fechaActual;
    }

    public void setFechaActual(String fechaActual) {
        this.fechaActual = fechaActual;
    }

    public JSONArray getJsonArrayFecha() {
        return jsonArrayFecha;
    }

    public void setJsonArrayFecha(JSONArray jsonArrayFecha) {
        this.jsonArrayFecha = jsonArrayFecha;
    }

    public JSONArray getJsonArrayLeague() {
        return jsonArrayLeague;
    }

    public void setJsonArrayLeague(JSONArray jsonArrayLeague) {
        this.jsonArrayLeague = jsonArrayLeague;
    }

    public JSONArray getJsonArrayLogoAway() {
        return jsonArrayLogoAway;
    }

    public void setJsonArrayLogoAway(JSONArray jsonArrayLogoAway) {
        this.jsonArrayLogoAway = jsonArrayLogoAway;
    }

    public JSONArray getJsonArrayLogoHome() {
        return jsonArrayLogoHome;
    }

    public void setJsonArrayLogoHome(JSONArray jsonArrayLogoHome) {
        this.jsonArrayLogoHome = jsonArrayLogoHome;
    }

    public JSONArray getJsonArrayAwayGoals() {
        return jsonArrayAwayGoals;
    }

    public void setJsonArrayAwayGoals(JSONArray jsonArrayAwayGoals) {
        this.jsonArrayAwayGoals = jsonArrayAwayGoals;
    }

    public JSONArray getJsonArrayHomeGoals() {
        return jsonArrayHomeGoals;
    }

    public void setJsonArrayHomeGoals(JSONArray jsonArrayHomeGoals) {
        this.jsonArrayHomeGoals = jsonArrayHomeGoals;
    }

    public JSONArray getJsonArrayAwayName() {
        return jsonArrayAwayName;
    }

    public void setJsonArrayAwayName(JSONArray jsonArrayAwayName) {
        this.jsonArrayAwayName = jsonArrayAwayName;
    }

    public JSONArray getJsonArrayHomeName() {
        return jsonArrayHomeName;
    }

    public void setJsonArrayHomeName(JSONArray jsonArrayHomeName) {
        this.jsonArrayHomeName = jsonArrayHomeName;
    }

    public void FechaActual() {

        LocalDate fecha = LocalDate.now();

        DateTimeFormatter formateador = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        fechaActual = fecha.format(formateador);

        System.out.println("fecha actual: " + fechaActual);
    }

    public void llamarEndpoint() {
        //CUENTA franklin
        
        URL = "https://v3.football.api-sports.io/fixtures?date="+fechaActual;

        cliente = new OkHttpClient();

        request = new Request.Builder()
                .url(URL)
                .addHeader("x-rapidapi-key", "cd03325a406f7a944dc22064c242f429")
                .addHeader("x-rapidapi-host", "v3.football.api-sports.io")
                .build();

        
        
    }

    //Obtener nombre equipo local
    public void equipoLocal() throws IOException {
        System.out.println(URL);

        try (Response response = cliente.newCall(request).execute()) {
           

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
        
    }

    //Obtener nombre equipo visitante
    public void equipoVisitante() throws IOException {

        try (Response response = cliente.newCall(request).execute()) {
           

            if (response.isSuccessful()) {
                String respuesta = response.body().string();

                //Pasar la respuesta a un JsonObject 
                JSONObject jsonObjectResponse = new JSONObject(respuesta);

                //Acceder a la response la cual viene en un JsonArray
                JSONArray jsonArrayResponse = jsonObjectResponse.getJSONArray("response");

                JSONArray jsonArrayAway = new JSONArray();

                //Pasar todos los nombres de los equipos visitantes a un JSONArray
                for (int i = 0; i < jsonArrayResponse.length(); i++) {
                    JSONObject awayteam = jsonArrayResponse.getJSONObject(i).getJSONObject("teams")
                            .getJSONObject("away");

                    jsonArrayAway.put(awayteam.get("name"));
                }

                setJsonArrayAwayName(jsonArrayAway);

            }

        }

    }

    //Obtener goles equipo local
    public void goalsEquipoLocal() throws IOException {

        try (Response response = cliente.newCall(request).execute()) {
            

            if (response.isSuccessful()) {
                String respuesta = response.body().string();

                //Pasar la respuesta a un JsonObject 
                JSONObject jsonObjectResponse = new JSONObject(respuesta);

                //Acceder a la response la cual viene en un JsonArray
                JSONArray jsonArrayResponse = jsonObjectResponse.getJSONArray("response");

                JSONArray jsonArrayHome = new JSONArray();

                //Pasar todos los nombres de los equipos locales a un JSONArray
                for (int i = 0; i < jsonArrayResponse.length(); i++) {
                    JSONObject goalshome = jsonArrayResponse.getJSONObject(i).getJSONObject("goals");
                    
                   
         
                        jsonArrayHome.put(goalshome.get("home").toString());
                    
                    
                }

                setJsonArrayHomeGoals(jsonArrayHome);
            }

        }

    }

    public void goalsEquipoVisitante() throws IOException {

        try (Response response = cliente.newCall(request).execute()) {
       

            if (response.isSuccessful()) {
                String respuesta = response.body().string();

                //Pasar la respuesta a un JsonObject 
                JSONObject jsonObjectResponse = new JSONObject(respuesta);

                //Acceder a la response la cual viene en un JsonArray
                JSONArray jsonArrayResponse = jsonObjectResponse.getJSONArray("response");

                JSONArray jsonArrayAway = new JSONArray();

                //Pasar todos los nombres de los equipos locales a un JSONArray
                for (int i = 0; i < jsonArrayResponse.length(); i++) {
                    JSONObject goalsAway = jsonArrayResponse.getJSONObject(i).getJSONObject("goals");

                    jsonArrayAway.put(goalsAway.get("away").toString());
                }

                setJsonArrayAwayGoals(jsonArrayAway);

            }

        }

    }

    public void LogoEquipoLocal() throws IOException {

        try (Response response = cliente.newCall(request).execute()) {
          

            if (response.isSuccessful()) {
                String respuesta = response.body().string();

                //Pasar la respuesta a un JsonObject 
                JSONObject jsonObjectResponse = new JSONObject(respuesta);

                //Acceder a la response la cual viene en un JsonArray
                JSONArray jsonArrayResponse = jsonObjectResponse.getJSONArray("response");

                JSONArray jsonArrayHome = new JSONArray();

                //Pasar todos los nombres de los equipos locales a un JSONArray
                for (int i = 0; i < jsonArrayResponse.length(); i++) {
                    JSONObject homTeam = jsonArrayResponse.getJSONObject(i).getJSONObject("teams")
                            .getJSONObject("home");

                    jsonArrayHome.put(homTeam.get("logo"));
                }

                setJsonArrayLogoHome(jsonArrayHome);

            }

        }

    }

    public void LogoEquipoVisitante() throws IOException {

        try (Response response = cliente.newCall(request).execute()) {
          

            if (response.isSuccessful()) {
                String respuesta = response.body().string();

                //Pasar la respuesta a un JsonObject 
                JSONObject jsonObjectResponse = new JSONObject(respuesta);

                //Acceder a la response la cual viene en un JsonArray
                JSONArray jsonArrayResponse = jsonObjectResponse.getJSONArray("response");

                JSONArray jsonArrayAway = new JSONArray();

                //Pasar todos los nombres de los equipos locales a un JSONArray
                for (int i = 0; i < jsonArrayResponse.length(); i++) {
                    JSONObject awayTeam = jsonArrayResponse.getJSONObject(i).getJSONObject("teams")
                            .getJSONObject("away");

                    jsonArrayAway.put(awayTeam.get("logo"));
                }

                setJsonArrayLogoAway(jsonArrayAway);

            }

        }

    }

    public void obtenerIdLiga() throws IOException {

        try (Response response = cliente.newCall(request).execute()) {
            
            if (response.isSuccessful()) {
                String respuesta = response.body().string();

                //Pasar la respuesta a un JsonObject 
                JSONObject jsonObjectResponse = new JSONObject(respuesta);

                //Acceder a la response la cual viene en un JsonArray
                JSONArray jsonArrayResponse = jsonObjectResponse.getJSONArray("response");

                JSONArray jsonArray = new JSONArray();

                //Pasar todos los nombres de los equipos locales a un JSONArray
                for (int i = 0; i < jsonArrayResponse.length(); i++) {
                    JSONObject awayTeam = jsonArrayResponse.getJSONObject(i).getJSONObject("league");

                    jsonArray.put(awayTeam.get("id").toString());
                }

                setJsonArrayLeague(jsonArray);

            }

        }

    }

    public void fechaPartido() throws IOException {

        try (Response response = cliente.newCall(request).execute()) {
           

            if (response.isSuccessful()) {
                String respuesta = response.body().string();

                //Pasar la respuesta a un JsonObject 
                JSONObject jsonObjectResponse = new JSONObject(respuesta);

                //Acceder a la response la cual viene en un JsonArray
                JSONArray jsonArrayResponse = jsonObjectResponse.getJSONArray("response");

                JSONArray jsonArray = new JSONArray();

                //Pasar todos los nombres de los equipos locales a un JSONArray
                for (int i = 0; i < jsonArrayResponse.length(); i++) {
                    JSONObject fechaJson = jsonArrayResponse.getJSONObject(i).getJSONObject("fixture");

                    jsonArray.put(LocalDateTime.ofInstant(Instant.ofEpochMilli(fechaJson.getLong("timestamp")), ZoneId.systemDefault()));

                }

                setJsonArrayFecha(jsonArray);

            }

        }

    }

    public void idFixture(int id) throws IOException {

        try (Response response = cliente.newCall(request).execute()) {
          

            if (response.isSuccessful()) {
                String respuesta = response.body().string();

                //Pasar la respuesta a un JsonObject 
                JSONObject jsonObjectResponse = new JSONObject(respuesta);

                //Acceder a la response la cual viene en un JsonArray
                JSONArray jsonArrayResponse = jsonObjectResponse.getJSONArray("response");

                JSONArray jsonArray = new JSONArray();

                //Pasar todos los nombres de los equipos locales a un JSONArray
                for (int i = 0; i < jsonArrayResponse.length(); i++) {
                    JSONObject fechaJson = jsonArrayResponse.getJSONObject(i).getJSONObject("fixture");

                    jsonArray.put(LocalDateTime.ofInstant(Instant.ofEpochMilli(fechaJson.getLong("timestamp")), ZoneId.systemDefault()));

                }

                setJsonArrayFecha(jsonArray);

            }

        }

    }

}
