/*
 * The integration developer needs to create the method processData 
 * This method takes Message object of package com.sap.gateway.ip.core.customdev.util
 * which includes helper methods useful for the content developer:
 * 
 * The methods available are:
    public java.lang.Object getBody()

    public void setBody(java.lang.Object exchangeBody)

    public java.util.Map<java.lang.String,java.lang.Object> getHeaders()

    public void setHeaders(java.util.Map<java.lang.String,java.lang.Object> exchangeHeaders)

    public void setHeader(java.lang.String name, java.lang.Object value)

    public java.util.Map<java.lang.String,java.lang.Object> getProperties()

    public void setProperties(java.util.Map<java.lang.String,java.lang.Object> exchangeProperties) 

	public void setProperty(java.lang.String name, java.lang.Object value)
 * 
 */
import com.sap.gateway.ip.core.customdev.util.Message;
import java.util.HashMap;

def Message processData(Message message) {
	
	
	//Properties  
	map = message.getProperties();
	
	def Client_Number_of_Receiver= map.get("Client_Number_of_Receiver");
	def Port_Number_of_Sender= map.get("Port_Number_of_Sender");
	def Partner_Type_of_Sender= map.get("Partner_Type_of_Sender");
	def Partner_Number_of_Sender= map.get("Partner_Number_of_Sender");
	def Port_Number_of_Receiver= map.get("Port_Number_of_Receiver");
	def Partner_Type_of_Receiver= map.get("Partner_Type_of_Receiver");
	def Partner_Number_of_Receiver= map.get("Partner_Number_of_Receiver");
	def External_System= map.get("External_System");
	def Partner_External_Application_ID= map.get("Partner_External_Application_ID");
	
	def output = "true";
	
	if(Client_Number_of_Receiver.trim().isEmpty()){
 		output = "false";
	}else if(Port_Number_of_Sender.trim().isEmpty()){
 		output = "false";
	}else if(Partner_Type_of_Sender.trim().isEmpty()){
 		output = "false";
	}else if(Partner_Number_of_Sender.trim().isEmpty()){
 		output = "false";
	}else if(Port_Number_of_Receiver.trim().isEmpty()){
 		output = "false";
	}else if(Partner_Type_of_Receiver.trim().isEmpty()){
 		output = "false";
	}else if(Partner_Number_of_Receiver.trim().isEmpty()){
 		output = "false";
	}else if(External_System.trim().isEmpty()){
 		output = "false";
	}else if(Partner_External_Application_ID.trim().isEmpty()){
 		output = "false";
	}
	
	message.setHeader("System_Check_Result", output);
	
	return message;
}

