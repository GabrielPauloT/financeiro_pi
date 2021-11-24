<?php

    header("Access-Control-Allow-Origin: *");

   $cn = pg_connect("host=localhost port=5432 dbname=contasApagar user=postgres password=2531");

   $action = $_POST["acao"];



   if("GET_ALL" == $action){
	   $db_data = array();
	   $result = pg_query("SELECT * FROM contas;");
	   if(pg_num_rows($result) > 0){
		   while($row = pg_fetch_assoc($result)){
               $db_data[] = $row;
           }
           echo json_encode($db_data);

	   }
	    pg_close($cn);
		return;

   }

    if("ADD_EMP" == $action){
	   $cliente = $_POST['cliente'];
       $vencimento = $_POST['vencimento'];
       $pagoem = $_POST['pagoem'];
       $statu = $_POST['statu'];
       $valor = $_POST['valor'];
       $apagar = $_POST['apagar'];
       $valorpago = $_POST['valorpago'];
       $titulo = $_POST['titulo'];
	   $result = pg_query("INSERT INTO contas (cliente, vencimento, pagoem, statu, valor, apagar, valorpago, titulo) VALUES ('$cliente', '$vencimento', '$pagoem',  '$statu', '$valor', '$apagar', '$valorpago', '$titulo')");
	   echo"sucesso";

	    pg_close($cn);
		return;
   }

   if("DELETE_EMP" == $action){
	   $emp_id = $_POST['id'];
	   $result = pg_query("DELETE FROM contas WHERE id = $emp_id");
	   echo"sucesso";
	   pg_close($cn);
	   return;

   }

   if("UPDATE_EMP" == $action){
    $cliente = $_POST['cliente'];
    $vencimento = $_POST['vencimento'];
    $pagoem = $_POST['pagoem'];
    $statu = $_POST['statu'];
    $valor = $_POST['valor'];
    $apagar = $_POST['apagar'];
    $valorpago = $_POST['valorpago'];
    $titulo = $_POST['titulo'];
    $emp_id = $_POST['id'];
    $result = pg_query("UPDATE contas SET cliente = '$cliente' , vencimento = '$vencimento', pagoem = '$pagoem', statu = '$statu', valor = '$valor', apagar = '$apagar', valorpago = '$valorpago', titulo = '$titulo' WHERE id = $emp_id");
    echo"sucesso";
    pg_close($cn);
    return;

}

if("SEARCH_EMP" == $action){
    $cliente = $_POST['cliente'];
    $vencimento = $_POST['vencimento'];
    $pagoEm = $_POST['pagoem'];
    $stats = $_POST['stats'];
    $valor = $_POST['valor'];
    $aPagar = $_POST['apagar'];
    $valorPago = $_POST['valorpago'];
    $titulo = $_POST['titulo'];

    $result = pg_query("SELECT * FROM contas WHERE  cliente LIKE '%$cliente%' OR vencimento LIKE '%$vencimento%' OR pagoem LIKE '%$pagoem%' OR statu LIKE '%$statu%' OR valor LIKE '%$valor%' OR apagar LIKE '%$apagar%' OR valorpago LIKE '%$valorpago%' OR titulo LIKE '%$titulo%',");
    echo"sucesso";
    pg_close($cn);
    return;
}

?>