<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
  
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>TranslatorX</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
	
	
  </head>
  <body style="background-image: url('https://blusignalsystems.com/wp-content/uploads/2016/12/Savin-NY-Website-Background-Web1.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;)">
<div class="container-fluid">
	<div class="row purple-gradient">
		<div class="col-md-12">
			<h1>
				Welcome To Translator x
			</h1>
			<hr>
			
			<form method="get" action="./translate">
					<input name="in" type="hidden" id="inputLang1" >
					<input name="out" type="hidden" id="inputLang2" >
					
			<div class="row">
				<div class="col-md-5">
					<div class="btn-group" role="group">
						 
						<button class="btn btn-secondary" type="button" onclick="textIn('english')") >
							English
						</button> 
						<button class="btn btn-secondary" type="button" onclick="textIn('french')">
							French
						</button> 
						<button class="btn btn-secondary" type="button" onclick="textIn('espagnol')">
							Espagnol
						</button>
						
					</div>
				</div>
				<div class="col-md-2">
					 
					<input type="submit" class="btn btn-success btn-md" value="Translate Now">
						
				</div>
				<div class="col-md-5">
					<div class="btn-group" role="group">
						 
						<button class="btn btn-secondary" type="button" onclick="textOut('english')">
							English
						</button> 
						<button class="btn btn-secondary" type="button" onclick="textOut('french')">
							French
						</button> 
						<button class="btn btn-secondary" type="button" onclick="textOut('espagnol')">
							Espagnol
						</button>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<h2>
						Type your text here : 
						<span style="color:red;"  id="Lanin">
							<% if(request.getAttribute("Lin")!=null){
								out.println(request.getAttribute("Lin"));
								request.setAttribute("Lin",null);
							}%>	
						</span>
					</h2>
					<textarea style="width:100%;height:100px;font-size: 25px;" name="txtIn">
						<% if(request.getAttribute("resultOf")!=null){
							out.println(request.getAttribute("resultOf"));
						}%>	
					
					</textarea>
				</div>
				<div class="col-md-6">
					<h2>
						Result : 
						<span style="color:red;" id="Lanout">
							<% if(request.getAttribute("Lout")!=null){
								out.println(request.getAttribute("Lout"));
								request.setAttribute("Lout",null);
							}%>	
						</span>
					</h2>
					<textarea style="width:100%;height:100px;font-size: 25px;" name="txtOut" disabled>
						<% if(request.getAttribute("result")!=null){
							out.println(request.getAttribute("result"));
						}%>	
					</textarea>
					
					
				</div>
			</div>
			
			</form>
			
		</div>
	</div>
</div>
	<script>
		function textIn(lang){
			var x=document.getElementById("inputLang1")
			x.value=lang;
			document.getElementById("Lanin").innerHTML=lang
			console.log("after In :",x.value);
			}
		function textOut(lang){
			var x=document.getElementById("inputLang2")
			x.value=lang
			document.getElementById("Lanout").innerHTML=lang
			console.log("after Out:",x.value);
			}
			
    </script>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
  
</body>
</html>