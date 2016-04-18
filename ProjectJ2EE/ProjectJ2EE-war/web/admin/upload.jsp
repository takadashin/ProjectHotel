<%
response.setContentType("text/html");
response.setHeader("Cache-control","no-cache");
 
String err = "";
String fileOutPath = request.getRealPath("/").replace('\\','/')+"resource/img/";
String lastFileName = "";
 
String contentType = request.getContentType();
String boundary = "";
final int BOUNDARY_WORD_SIZE = "boundary=".length();
if(contentType == null || !contentType.startsWith("multipart/form-data")) {
    err = "Ilegal ENCTYPE : must be multipart/form-data\n";
    err += "ENCTYPE set = " + contentType;
}else{
    boundary = contentType.substring(contentType.indexOf("boundary=") + BOUNDARY_WORD_SIZE);
    boundary = "--" + boundary;
    try {
        javax.servlet.ServletInputStream sis = request.getInputStream();
        byte[] b = new byte[1024];
        int x=0;
        int state=0;
        String name=null,fileName=null,contentType2=null;
        java.io.FileOutputStream buffer = null;
        while((x=sis.readLine(b,0,1024))>-1) {
            String s = new String(b,0,x);
            if(s.startsWith(boundary)) {
                state = 0;
//out.println("name="+name+"<br>");
//out.println(fileName+"<br>");
                 
                name = null;
                contentType2 = null;
                fileName = null;
                 
                 
            }else if(s.startsWith("Content-Disposition") && state==0) {
                state = 1;
                if(s.indexOf("filename=") == -1)
                    name = s.substring(s.indexOf("name=") + "name=".length(),s.length()-2);
                else {
                    name = s.substring(s.indexOf("name=") + "name=".length(),s.lastIndexOf(";"));
                    fileName = s.substring(s.indexOf("filename=") + "filename=".length(),s.length()-2);
                    if(fileName.equals("\"\"")) {
                        fileName = null;
                    }else {
                        String userAgent = request.getHeader("User-Agent");
                        String userSeparator="/";  // default
                        if (userAgent.indexOf("Windows")!=-1)
                            userSeparator="\\";
                        if (userAgent.indexOf("Linux")!=-1)
                            userSeparator="/";
                        fileName = fileName.substring(fileName.lastIndexOf(userSeparator)+1,fileName.length()-1);
                        if(fileName.startsWith( "\""))
                            fileName = fileName.substring( 1);
                    }
                }
                name = name.substring(1,name.length()-1);
                if (name.equals("file")) {
                    if (buffer!=null)
                        buffer.close();
                    lastFileName = fileName;
                    buffer = new java.io.FileOutputStream(fileOutPath+fileName);
                }
            }else if(s.startsWith("Content-Type") && state==1) {
                state = 2;
                contentType2 = s.substring(s.indexOf(":")+2,s.length()-2);
            }else if(s.equals("\r\n") && state != 3) {
                state = 3;
            }else {
                if (name.equals("file"))
                    buffer.write(b,0,x);
            }
        }
        sis.close();
        buffer.close();
    }catch(java.io.IOException e) {
        err = e.toString();
    }
}
boolean ok = err.equals("");
if(!ok) {
    out.println(err);
}else{
%>
<SCRIPT language="javascript">
  //history.back(1)
  alert('Uploaded <%=lastFileName%>');
  //window.location.reload(false)
</SCRIPT>
<%
}
%>
<p>Enter your img name below in textbox image to save</p>
<b><%=lastFileName%></b>
</br>
<img src="<% out.print(request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/resource/img/"+lastFileName);%>
     " width="200px" alt="imgeas"/>