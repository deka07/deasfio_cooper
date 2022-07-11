
package model;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class GetDados {
    private String nome;
    private String objetivo;
    private String saldototal;
    private String indicadorCarencia;
    private String acoes;
    
    List lista = new ArrayList();

    public String getIndicadorCarencia() {
        return indicadorCarencia;
    }

    public void setIndicadorCarencia(String indicadorCarencia) {
        this.indicadorCarencia = indicadorCarencia;
    }

    public String getAcoes() {
        return acoes;
    }

    public void setAcoes(String acoes) {
        this.acoes = acoes;
    }

    public List getLista() {
        return lista;
    }

    public void setLista(List lista) {
        this.lista = lista;
    }
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(String objetivo) {
        this.objetivo = objetivo;
    }

    public String getSaldototal() {
        return saldototal;
    }

    public void setSaldototal(String saldototal) {
        this.saldototal = saldototal;
    }
    
    
    public GetDados() {
     
        try {
            String url = "https://run.mocky.io/v3/ca4ec77d-b941-4477-8a7f-95d4daf7a653";
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            int responseCode = con.getResponseCode();
            System.out.println("\nSending 'GET' request to URL : " + url);
            System.out.println("Response Code : " + responseCode);
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();
            
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            
            in.close();
            
            JSONObject resposta = new JSONObject(response.toString());
            JSONObject base = resposta.getJSONObject("response").getJSONObject("data");
            JSONArray name = base.getJSONArray("listaInvestimentos");
                  
            for(int i = 0; i < name.length(); i++){
                JSONObject dados = name.getJSONObject(i);
                this.nome = dados.getString("nome");
                this.nome = (String) dados.get("nome");
                this.objetivo = (String) dados.get("objetivo");
                this.saldototal = (String) dados.get("saldoTotal");
                
                //this.lista.add(this.nome);
                System.out.println(this.nome);
                
            }
                        
        } catch (Exception e) {
            e.printStackTrace();
        }
       
    }

}
