<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<label id="suc">
    <% if( request.getParameter("success") !=null &&request.getParameter("success").equals("true")){
    out.println("Successful upload");
}%>
</label>
<form action="upload" method="post" enctype="multipart/form-data">
    <input type="text" name="fileName" required />
    <input type="file" name="myfile"  required/>
    <input type="submit" />
</form>
<form action="download" method="get">
    <input type="text" name="fileName" required />
    <input type="submit" />
</form>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        text-align: center;
        padding: 50px;
    }

    h1 {
        color: #333;
    }

    form {
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        max-width: 400px;
        margin: 20px auto;
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    input[type="text"], input[type="file"] {
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
        width: 100%;
    }

    input[type="submit"] {
        background-color: #28a745;
        color: white;
        border: none;
        padding: 10px;
        font-size: 16px;
        cursor: pointer;
        border-radius: 5px;
        transition: 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #218838;
    }

    form:last-of-type input[type="submit"] {
        background-color: #007bff;
    }

    form:last-of-type input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>
</body>
</html>