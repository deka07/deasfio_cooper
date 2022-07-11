<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resgate</title>
        
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
        
        <!-- Jquery -->
        <script src="http://code.jquery.com/jquery-1.9.0rc1.js"></script>
        <script src="http://code.jquery.com/jquery-migrate-1.0.0rc1.js"></script>
    </head>
    <body style="background: #fcffcf">
        <nav class="navbar navbar-expand-lg" style="background: #fcfc30">
            <div class="container-fluid">
              <a class="navbar-brand" href="#">
                  <img src="https://cdn.iconscout.com/icon/free/png-256/bank-1850789-1571030.png" width="40" height="34" style="margin-left: 30px">
                  <h4 style="margin-left: 80px; margin-top: -30px">Cooper Bank</h4>
              </a>
            </div>
        </nav>
  
        <div class="container" style="background: #ffffff; margin-top: 20px" class="row g-3">
            
            <h5>DADOS DOS INVESTIMENTOS</h5>
            
            <div class="row g-3">
                <div class="col-auto">
                    <img src="https://icons.veryicon.com/png/o/miscellaneous/two-color-icon-library/user-286.png" width="40" height="34" style="margin-top: 15px">
                    <h6 style="padding-left: 50px; margin-top: -40px">Nome</h6>
                    <label style="padding-left: 50px; margin-bottom: 15px;"><% out.println("Fulano"); %></label>
                </div>
                <div class="col-auto">
                    <img src="https://cdn-icons-png.flaticon.com/512/216/216877.png" width="40" height="34" style="margin-top: 15px; margin-left: 250px;">
                    <h6 style="padding-left: 300px; margin-top: -40px">Objetivo</h6>
                    <label style="padding-left: 300px; margin-bottom: 15px;">Ficar rico</label>
                </div>
                <div class="col-auto">
                    <img src="https://d9hhrg4mnvzow.cloudfront.net/99app.com/99pay-launch-v02/077882d1-icone-troco-v03_107b07d000000000000028.png" width="40" height="34" style="margin-top: 15px; margin-left: 250px;">
                    <h6 style="padding-left: 300px; margin-top: -40px">Saldo total</h6>
                    <label style="padding-left: 300px; margin-bottom: 15px;">R$: 18.000,00</label>
                </div>
            </div>
        </div>
        <div class="container" style="background: #ffffff; margin-top: 20px" class="row g-3">
            
            <h5>RESGATE</h5>
            
            <table class="table table-hover" id="modelTable" style="margin-top: 20px">
                
                <thead>
                    <tr>
                      <th>AÇÃO</th>
                      <th>SALDO ACUMULADO</th>
                      <th>VALOR A RESGATAR</th>
                    </tr>
                </thead>
                <tbody class="table-group-divider">
                    <% 
                    JSONObject resposta = new JSONObject(request.getAttribute("resp").toString());
                    JSONObject base = resposta.getJSONObject("response").getJSONObject("data");
                    JSONArray name = base.getJSONArray("listaInvestimentos");
                    
                    for(int i = 0; i < name.length(); i++){ 
                        JSONObject dados = name.getJSONObject(i);
                        JSONArray nm = dados.getJSONArray("acoes");
                        for(int c = 0; c < nm.length(); c++){
                            JSONObject acs = nm.getJSONObject(c);
                            String acoes = acs.getString("nome");                         
                            
                    %>
                    <tr>
                        <td><% out.println(acoes); %></td>
                      <td><% out.println("verticis"); %></td>
                      <td><% out.println(acoes); %></td>
                      <td><input type="text" class="form-control" placeholder="Digite o valor de resgate"></td>
                      <td><button type="button" class="btn btn-primary">Resgatar</button></td>
                    </tr>
                    <% } } %>
                </tbody>
            </table>
        </div>
        
        <div class="container" style="background: #ffffff; margin-top: 20px">
            <h5 style="padding: 20px">Valor total de regate:</h5>
        </div>
    </body>
</html>
