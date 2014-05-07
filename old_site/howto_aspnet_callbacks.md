---
layout: obsolete
title: "Howto aspnet Callbacks"
permalink: /old_site/Howto_aspnet_Callbacks/
redirect_from:
  - /Howto_aspnet_Callbacks/
---

Howto aspnet Callbacks
======================

This sample shows how to implement some asp.net callbacks methods and you to get data without to generate a visible postback.

You will need mono runtime, csharp compilers and the minimalistic web server xsp version 2.

Create two files to test this sample.

Default.aspx

``` csharp
<% @Page Language="C#" Inherits="Default" CodeFile="Default.aspx.cs" %>
<html>
<head id="headid" runat="server">
 <title>jacob ASP.NET WebForm_DoCallbacks</title>
</head>
<script type="text/javascript">
 
    function SendValuesToSumatoryOnServer() 
        {     
     var foo_a = document.getElementById("txt_fooa").value;
     var foo_b = document.getElementById("txt_foob").value;    
         SumatoryOnServer(foo_a + ":" + foo_b,"");
    }
 
    function GetDataFromServer(tmpValue)
        {
     var foo_result = document.getElementById("txt_fooresult");     
         foo_result.value = tmpValue;   
    }
 
</script>
<body>
 <form id="frmMain" runat="server">
    Sumatory = <asp:TextBox id="txt_fooa" 
                                runat="server" 
                                style="font:status-bar;border:1px solid lightgray" />
    +
    <asp:TextBox id="txt_foob"
             runat="server"
             style="font:status-bar;border:1px solid lightgray" />
 
    <input type="button" id="btn_sum" value="click here to exec sumatory on server"
           onclick="SendValuesToSumatoryOnServer()" 
           style="font:status-bar;border:1px solid black" />
    <br><br><br>
    Result: <asp:TextBox id="txt_fooresult"
                runat="server"
                style="font:status-bar;border:1px solid lightblue" /> 
    <br>
 
 </form>
</body>
</html>
```

Default.aspx.cs

``` csharp
using System;
using System.Web;
using System.Web.UI;
 
public partial class Default:Page,ICallbackEventHandler {
 
  protected string returnValue;
 
  protected void Page_Load(object o,EventArgs e) 
  {
    string callback_event_reference = this.ClientScript.GetCallbackEventReference(this,"arg","GetDataFromServer","context");
 
    string callback_implementation = "function SumatoryOnServer(arg,context)" + 
                      "{ " + callback_event_reference + ";}";
this.ClientScript.RegisterClientScriptBlock(this.GetType(),"SumatoryOnServer",callback_implementation,true);
  }
 
  public void RaiseCallbackEvent(string eventArguments) 
  {
    char[] sep = {':'};
    string[] values = eventArguments.Split(sep[0]);
    double sum = double.Parse(values[0]) + double.Parse(values[1]);
    returnValue = sum.ToString(); 
  }
 
  public string GetCallbackResult() 
  {
    return returnValue;
  }
}
```

Now only run xsp2 command on a directory where you are editing this sample source files and later open your firefox web browser and pick this url:

[http://0.0.0.0:8080/Default.aspx](http://0.0.0.0:8080/Default.aspx)

