<%@page import="sdpd.bargeproject.web.MessageUtil"%>
<%@page import="sdpd.bargeproject.web.AuthenticationUtil"%>
<%@page import="java.io.File"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.io.FileNotFoundException"%>

<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="javax.net.ssl.HttpsURLConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Barge Data</title>
    </head>
    <body>
       
      
        <%
        //add the necessary calculation script to convert degrees to microdegrees. accept input in degrees
       if(request.getParameter("strBargeName")=="" || Integer.valueOf(request.getParameter("strBargeLat")).intValue()>90000000 || (Integer.valueOf(request.getParameter("strBargeLat")).intValue()<-90000000 || Integer.valueOf(request.getParameter("strBargeLong")).intValue()>180000000 || Integer.valueOf(request.getParameter("strBargeLong")).intValue()<-180000000))
        {

            %> <h1>Invalid Values!</h1>
        <br><br><br>Invalid barge values entered<br><br>
            <a href="/addBargeForm.jsp">Go Back</a>
            <%
        }
        else
        {
            %><h1>Data Submitted!</h1>
        <br><br>
        <!--<a href="/addBargeForm.jsp">Confirm and Go Back</a><br><br>-->
                <jsp:useBean id="bargeDetails" scope="session" class="sdpd.bargeproject.web.ProcessBargeData" />
                <jsp:setProperty name="bargeDetails" property="strBargeName" />
                <jsp:setProperty name="bargeDetails" property="strBargeLat" />
                <jsp:setProperty name="bargeDetails" property="strBargeLong" />
                <jsp:setProperty name="bargeDetails" property="strBargeStat" />
                Barge Name: <jsp:getProperty name="bargeDetails" property="strBargeName" /><br>
                Barge Lat:  <jsp:getProperty name="bargeDetails" property="strBargeLat" /><br>
                Barge Long: <jsp:getProperty name="bargeDetails" property="strBargeLong" /><br>
                Barge Stat: <jsp:getProperty name="bargeDetails" property="strBargeStat" /><br>
                TimeStamp:  <% out.println(System.currentTimeMillis()/60000); %>
                <br>
               
            <%
            // c2dm
            

            //bargedata.jsp dump text file code below
            //everything below is for json file read and write..
                ArrayList<String> bargeNames=new ArrayList<String>();
                ArrayList<String> bargeLats=new ArrayList<String>();
                ArrayList<String> bargeLongs=new ArrayList<String>();
                ArrayList<String> bargeStats=new ArrayList<String>();
                ArrayList<String> bargeTimes=new ArrayList<String>();
                JSONParser parser = new JSONParser();
                //out.println(getServletContext().getRealPath("/"));%><br><%
                int index;
                try {
                    JSONArray barges = (JSONArray) parser.parse(new FileReader("c:\\Users\\Pavan\\Documents\\NetBeansProjects\\BargeProjectWeb\\web\\test.json"));
                    //JSONArray barges = (JSONArray) parser.parse(new FileReader(getServletContext().getRealPath("/") + File.separator + "WEB-INF" + File.separator + "test.json"));

                    Iterator<JSONObject> latiterator = barges.iterator();
                    Iterator<JSONObject> statiterator = barges.iterator();
                    Iterator<JSONObject> nameiterator = barges.iterator();
                    Iterator<JSONObject> longiterator = barges.iterator();
                    Iterator<JSONObject> timeiterator = barges.iterator();
                    index=0;
                     while (nameiterator.hasNext()) {
                       bargeNames.add((String)nameiterator.next().get("name"));
                        //out.println(bargeNames.get(index));
                        index++;

                       
                      }
                    index=0;
                    while (latiterator.hasNext()){
                        bargeLats.add((String)latiterator.next().get("lat"));
                        //out.println(bargeLats.get(index));
                        index++;

                        
                    }
                    index=0;
                    while (longiterator.hasNext()){
                        bargeLongs.add((String)longiterator.next().get("long"));
                        //out.println(bargeLongs.get(index));
                        index++;

                        
                    }
                    index=0;
                    while (statiterator.hasNext()){
                        bargeStats.add((String)statiterator.next().get("stat"));
                        //out.println(bargeStats.get(index));
                        index++;

                        
                    }
                    index=0;
                    while (timeiterator.hasNext()){
                        bargeTimes.add((String)timeiterator.next().get("time"));
                        //out.println(bargeTimes.get(index));
                        index++;

                       
                    }
                    index=0;
                } catch (FileNotFoundException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
               }
                //end of json parser code.

                //match barge name from the beans above,
                //if(match==true)
                //{
                //  replace item in the respective arraylist,
                //}
                //else
                //{
                //  add another entry in the array list.
                //}
                //String inputName = request.getParameter("strBargeName");
                boolean found=false;
                for(int i=0;i<bargeNames.size();i++)
                    {

                        if(request.getParameter("strBargeName").equalsIgnoreCase(bargeNames.get(i))==true)
                        {
                                    found=true;
                                    bargeLats.set(i, request.getParameter("strBargeLat"));
                                    bargeLongs.set(i, request.getParameter("strBargeLong"));
                                    bargeStats.set(i, request.getParameter("strBargeStat"));
                                    bargeTimes.set(i, String.valueOf(System.currentTimeMillis()/60000));
                                    AuthenticationUtil authUtil = new AuthenticationUtil();
                                    String authToken = authUtil.getToken("sdpdbargeproject@gmail.com","bargeproject623678");
                                    if(bargeStats.get(i).equals("Stopped")==true)

                                    if(authToken.isEmpty()==false)
                                    {   out.println("Notifying Android Device.....");
                                            out.println("C2DM successfully authenticated.....");
                                            //out.println(authToken);
                                            FileWriter tokenStore = new FileWriter("c:\\Users\\Pavan\\Documents\\NetBeansProjects\\BargeProjectWeb\\web\\c2dmtokens.txt",true);
                                            //tokenStore.write(authToken);    //string matching algo.... to update authtokens
                                            //get registration ID from logcat of app on device...
                                            int responseCode=MessageUtil.sendMessage(authToken, "APA91bGDUscOcmb5fVWOfwB6nA8DWAehEVXMXCCQrpUUzsV9r8n3vX-j6M3CvI12O49_tFADAfLPQwW2uCoMJgaAg1e1jLBzV6wu2SrzD41hmPHMTU-EhhjwuMEO8CMBLnvw1Ks0I7l0t356jpkU07vNJH7AHTyWNw", "Message from Server: "+bargeNames.get(i)+"has Stopped!");//get registration ID from logcat of app on device...
                                            if(responseCode==200)
                                                out.println("successfully sent message to device....");
                                            else out.println("error.....");

                                     }
                                    //out.println(bargeNames.get(i));
                                    //out.println("Matched!");
                                    break;
                         }
                             
                             
                        
                      }
                if(found==false){
                bargeNames.add(request.getParameter("strBargeName"));
                                    bargeLats.add(request.getParameter("strBargeLat"));
                                    bargeLongs.add(request.getParameter("strBargeLong"));
                                    bargeStats.add(request.getParameter("strBargeStat"));
                                    bargeTimes.add(String.valueOf(System.currentTimeMillis()/60000));
                                    AuthenticationUtil authUtil = new AuthenticationUtil();
                                    String authToken = authUtil.getToken("sdpdbargeproject@gmail.com","bargeproject623678");

                                    if(bargeStats.get(bargeStats.size()-1).equals("Stopped")==true)
                                    if(authToken.isEmpty()==false)

                                    {   out.println("Notifying Android Device....");
                                            out.println("C2DM successfully authenticated.....");
                                            //out.println(authToken);
                                            FileWriter tokenStore = new FileWriter("c:\\Users\\Pavan\\Documents\\NetBeansProjects\\BargeProjectWeb\\web\\c2dmtokens.txt",true);
                                            //tokenStore.write(authToken);    //string matching algo.... to update authtokens
                                            //get registration ID from logcat of app on device...
                                            int responseCode=MessageUtil.sendMessage(authToken, "APA91bGDUscOcmb5fVWOfwB6nA8DWAehEVXMXCCQrpUUzsV9r8n3vX-j6M3CvI12O49_tFADAfLPQwW2uCoMJgaAg1e1jLBzV6wu2SrzD41hmPHMTU-EhhjwuMEO8CMBLnvw1Ks0I7l0t356jpkU07vNJH7AHTyWNw", "Message from Server: "+bargeNames.get(bargeNames.size()-1)+"has Stopped!");//get registration ID from logcat of app on device...
                                            if(responseCode==200)
                                                out.println("successfully sent message to device....");
                                            else out.println("error...");

                                     }
                                    //out.println("Added new Entry!");
                                 }
                     
                        //out.println(bargeNames.size());
                //string matching complete. now to display the update on screen
                //and to update the json...

                //now write the updated array list into the json file.
                JSONArray barges = new JSONArray();
                JSONObject barge = new JSONObject();
                for(int i=0;i<bargeNames.size();i++)
                {
                    barge.put("name", bargeNames.get(i));
                    barge.put("lat", bargeLats.get(i));
                    barge.put("long", bargeLongs.get(i));
                    barge.put("stat", bargeStats.get(i));
                    barge.put("time", bargeTimes.get(i));
                    
                }
                barges.add(barge);




                
                    FileWriter file = new FileWriter("c:\\Users\\Pavan\\Documents\\NetBeansProjects\\BargeProjectWeb\\web\\test.json");
                    //FileWriter file = new FileWriter(getServletContext().getRealPath("/") + File.separator + "WEB-INF" + File.separator + "test.json");
                    file.write("[");
                    for(int i=0;i<bargeNames.size();i++)
                    {

                        file.append("{");
                        file.append("\"name\":"+"\""+bargeNames.get(i)+"\",");
                        file.append("\"lat\":"+"\""+bargeLats.get(i)+"\",");
                        file.append("\"long\":"+"\""+bargeLongs.get(i)+"\",");
                        file.append("\"stat\":"+"\""+bargeStats.get(i)+"\",");
                        file.append("\"time\":"+"\""+bargeTimes.get(i)+"\"");

                        if(i==bargeNames.size()-1)
                            file.append("}");
                        else
                            file.append("},");
                    }

                    file.append("]");
                    //file.write(barges.toJSONString());
                    file.flush();
                    file.close();

                 

                //out.println(barges);

                }

       //c2dm coding....

//AuthenticationUtil authUtil = new AuthenticationUtil();
//String authToken = authUtil.getToken("sdpdbargeproject@gmail.com","bargeproject623678");
//if(authToken.isEmpty()==false)
//{        out.println("C2DM successfully authenticated");
//        out.println(authToken);
//        FileWriter tokenStore = new FileWriter("c:\\Users\\Pavan\\Documents\\NetBeansProjects\\BargeProjectWeb\\web\\c2dmtokens.txt",true);
//        //tokenStore.write(authToken);    //string matching algo.... to update authtokens
//        //get registration ID from logcat of app on device...
//        int responseCode=MessageUtil.sendMessage(authToken, "registrationId", "C2M Message from BargeProjectWeb server!");//get registration ID from logcat of app on device...
//        if(responseCode==200)
//            out.println("successfully sent message to device");
//        else out.println("error");

 
      

                        %><br><br><%
                        
            %>
    </body>
</html>