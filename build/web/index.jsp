<%-- 
    Document   : index
    Created on : 24/06/2022, 10:35:56
    Author     : sala303b
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.css">
        <link rel="stylesheet" type="text/css" href="css/tempusdominus-bootstrap-4.css">

        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>

        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <div class="input-group date" id="datetimepicker1" data-target-input="nearest">
                            <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker1"/>
                            <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
                                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-2">
                    <button id="btnBuscar">Buscar</button>
                </div>
                

            </div>
        </div>



        <script src="js/jquery.js" ></script>
        <script src="js/bootstrap.js" ></script>
        <script src="js/jquery.mask.js" ></script>
        <script src="js/popper.js" ></script>
        <script src="js/moment.js" ></script>
        <script src="js/locale/pt-br.js" ></script>
        <script src="js/tempusdominus-bootstrap-4.js" ></script>


        <script type="text/javascript">
            $(function () {
                $('#datetimepicker1').datetimepicker({
                    format: 'L',
                    defaultDate: "2022-06-24",
                    disabledDates: [
                        moment("2022-06-16")
                    ],
                    daysOfWeekDisabled: [0, 1]
                });
                
                
                $("#btnBuscar").on("click",function(e){
                    
                    $.ajax({
                        url: "",
                        method: "POST",
                        success: function (resp) {
                            if (resp.erro) {
                                alert("Erro ao buscar o CEP!");
                                return;
                            }
                            
                        },
                        error: function (err) {
                            alert("Erro ao buscar o CEP" + err.toString());
                        }
                    });

                    
                    
                })
                
                
            });
            
            
            
        </script>
    </body>
</html>
