<%-- 
    Document   : addBargeForm
    Created on : Nov 17, 2011, 8:09:11 PM
    Author     : Pavan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Barge Form</title>
    </head>
    <body>
        <h1>Enter Barge Details</h1>
        <h4>, in microdegrees. Ex. 6.6 deg. is 6600000</h4>
        <br>
        <form name="bargeForm" action="bargeData.jsp" method="POST">
            Barge Name: <input type="text" name="strBargeName" value=""/><br>
            Barge Lat: <input type="text" name="strBargeLat" value="0" /><br>
            Barge Long: <input type="text" name="strBargeLong" value="0" /><br>
            Barge Status: <select name="strBargeStat" >
<option selected value="Transporting">Transporting</option>
<option value="Docked">Docked</option>
<option value="Stopped">Stopped</option>
</select><br>
            <input type="submit" value="Submit" name="btnSubmit" />
        </form>
    </body>
</html>
