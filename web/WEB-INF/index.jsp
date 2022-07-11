<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cooper Bank</title>
        
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
        <!-- Jquery -->
        <script src="http://code.jquery.com/jquery-1.9.0rc1.js"></script>
        <script src="http://code.jquery.com/jquery-migrate-1.0.0rc1.js"></script>
        
        <script type="text/javascript">
            $(document).ready(function () {
                $('table tbody tr').click(function () {
                    $(location).attr('href', 'resgate');
                    <!-- $("p").append($(this).text()); -->
                    <!--$('#modal-info').modal('show');-->
                });
                $('table tbody tr').click(function () {
                
                });
                $("button").click(function(){
                    $("p").empty();
             });
         });
        </script>
        
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
  
        <div class="container mb-2" style="background: #ffffff; margin-top: 20px">
            
            <h3 style="padding: 15px">INVESTIMENTOS</h3>
        </div>
        
        <div class="container-sm" style="background: #ffffff; margin-top: 20px">
            <form action="index.jsp" method="post">
                <table class="table table-hover" id="modelTable">
                    <thead>
                        <tr>
                          <th>NOME</th>
                          <th>OBJETIVO</th>
                          <th>SALDO TOTAL</th>
                        </tr>
                    </thead>
                     <tbody class="table-group-divider">
                     <% 
                        JSONObject resposta = new JSONObject(request.getAttribute("resp").toString());
                        JSONObject base = resposta.getJSONObject("response").getJSONObject("data");
                        JSONArray name = base.getJSONArray("listaInvestimentos");

                        for(int i = 0; i < name.length(); i++){ 
                            JSONObject dados = name.getJSONObject(i);
                            String nome = dados.getString("nome");
                            String objetivo = dados.getString("objetivo");
                            Double saldoTotal = dados.getDouble("saldoTotal");

                            request.setAttribute(nome, "nome");
                            request.setAttribute(nome, "objetivo");
                            request.setAttribute(nome, "saldoTotal");
                            %>
                        <tr> 
                           <td name="nome"><%out.println(nome);%></td>
                           <td name="objetivo"><%out.println(objetivo);%></td>
                           <td name="saldo"><%out.println(saldoTotal);%></td>
                        </tr>
                        <% } %>
                      </tbody>
                </table>
            </form>
            <% 
              String nome = request.getParameter("nome");
              String objetivo = request.getParameter("objetivo");
              String saldo = request.getParameter("saldo");
            %>
            <!-- <button onclick="window.location='/copper-desafio/resgate'">Cadastrar</button> -->
        </div>
        
        <!-- Modal -->
        <div class="modal fade" id="modal-info" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <p></p>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" id="fch" data-bs-dismiss="modal">Close</button>
                  <button type="button" class="btn btn-primary">Understood</button>
                </div>
              </div>
            </div>
        </div>
    </body>
</html>
