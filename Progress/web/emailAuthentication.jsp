<%@ page language="java" import="javax.naming.*,java.io.*,javax.mail.*,
javax.mail.internet.*,com.sun.mail.smtp.*, java.util.*,
javax.activation.*"%>
<%
String host="", user="", pass="";
host = "smtp.gmail.com"; user = "noreplyrsdryclean@gmail.com"; //"" // email id to send the emails
pass = "Faltu452"; //Your gmail password
String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
String to = "faltu452@gmail.com"; // out going email id
String from = "kohliishan@hotmail.com"; //Email id of the recipient
String subject = "Testing Email";
String messageText = "Hello Dude \r\n How are you.";//messageString;
boolean WasEmailSent ;
boolean sessionDebug = true;
Properties props = System.getProperties();
props.put("mail.host", host);
props.put("mail.transport.protocol.", "smtp");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.", "true");
props.put("mail.smtp.port", "465");
props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
props.put("mail.smtp.socketFactory.fallback", "false");
props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
Session mailSession = Session.getDefaultInstance(props, null);
mailSession.setDebug(sessionDebug);
Message msg = new MimeMessage(mailSession);
msg.setFrom(new InternetAddress(from));
InternetAddress[] address = {new InternetAddress(to)};
msg.setRecipients(Message.RecipientType.TO, address);
msg.setSubject(subject);
msg.setContent(messageText, "text/html"); // use setText if you want to send text
Transport transport = mailSession.getTransport("smtp");
transport.connect(host, user, pass);
out.println("Message sent");
try {
transport.sendMessage(msg, msg.getAllRecipients());
WasEmailSent = true; // assume it was sent
}
catch (Exception err) {
WasEmailSent = false; // assume it's a fail
}
transport.close();
%>