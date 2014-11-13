---
title: Oracle
redirect_from:
  - /Oracle/
  - /Oracle_fix/
---
Mono vem com um cliente Oracle o assembly System.Data.OracleClient que acompanha a biblioteca Microsoft System.Data.OracleClient. Esta biblioteca foi descontinuada pela Microsoft e não é mais mantida.

A Oracle produz um cliente para Windows, mas este não é suportado pelo Mono.

Alguns providers comerciais para Mono estão disponíveis:

-   [http://www.devart.com/dotconnect/oracle/](http://www.devart.com/dotconnect/oracle/)
-   [http://www.datadirect.com/products/net/net%5Ffor%5Foracle/index.ssp](http://www.datadirect.com/products/net/net%5Ffor%5Foracle/index.ssp)

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Índice</h2>
<ul>
<li><a href="#info">1 Informações</a></li>
<li><a href="#current-status-for-systemdataoracleclient">2 Status atual para System.Data.OracleClient</a></li>
<li><a href="#action-plan">3 Plano de Ação</a></li>
<li><a href="#testing">4 Testando</a></li>
<li><a href="#examples">5 Examples</a></li>
<li><a href="#building-c-examples">6 Construindo exemplos C#</a></li>
</ul></td>
</tr>
</tbody>
</table>

Informações
-----------

-   ADO.NET Data Provider para banco de dados [Oracle](http://www.oracle.com/)

-   Está no namespace System.Data.OracleClient e assembly System.Data.OracleClient.dll

-   Funciona no Windows, Linux x86, e Solaris x86. Você pode nos ajudar a fazê-lo funcionar em outros sistemas, tais como, Solaris SPARC e Mac OS X?

-   Funciona com as versões do Oracle 8i, 9i, 10g, and 11g

-   Utilize OCI (Oracle call-level interface) que é uma biblioteca C para acessar bancos de dados Oracle

-   System.Data.OracleClient foi descontinuado pela Microsoft na versão .Net 4.0

-   Outras alternativas que funcionam no Mono, porém não estão inclusos como o Mono - [dotConnect for Oracle](http://www.devart.com/dotconnect/oracle/)

Status atual para System.Data.OracleClient
-------------------------------------------

-   Existem duas maneiras para conectar-se com o Oracle: utilizando o Usuário e Senha ou utilizando uma autenticação externa, usando "Integrated Security=true" em sua string de conexão

-   OracleCommandBuilder foi implementado e permite você fazer Inserts/Updates/Deletes com DataSet e OracleDataAdapter. No entando o OracleDataReader necessita de maiores implementações para permitir que seja utilizado KeyInfo para recuperar alguns metadaos da consulta executada. O analisador de consultas Oracle SQL é muito simples e não será capaz de lidar com consultas complexas. Neste sentido, você necessitará de um analisador Oracle SQL real, utilizando o compilador jay. Jay é usado por mcs para analisar arquivos c# e para o System.Data analisar expressões em um DataColumn. 

-   REF CURSOR podem ser retornados por stored procedures com um OracleDataReader através de um parâmetro de output definido como OracleType.Cursor

-   Pool de conexões estão funcionando

-   OracleConnection pode conectar-se em Oracle 8i, 9i e 10g através de OCI (Oracle Call Level Interface)

-   Parâmetros de input e output (char, varchar2, number, date, raw, long varchar, blob, clob and timestamp) pode agora ser utilizado na instruções SQL, blocos PL/SQL e stored procedures.

-   Parâmetros Input/Output e Return não foram testados.

-   OracleException and tratamento de erros existentes.

-   Tratamento de mensagens precisam ser adicionados para mensagens não críticas recebidas pelo Oracle (EM ANDAMENTO)

-   Manipuladores de vários tipos de dados precisam ser adicionados (EM ANDAMENTO)

-   DataSet pode ser preenchido por DataAdapter.

-   Pode não funcionar em plataformas não X86 como Mac OS ou Solaris SPARC. Não funciona devido à problemas com byte-ordering e diferenças entre alguns processadores. Nós estas aceitando patches de correção para que funcione nestas plataformas.

Plano de Ação
-------------

-   Suporte à limpeza dos parâmetros (Parâmetros de Input e Output FUNCIONANDO). Parâmetros de Input/Output e Return precisam FAZER)

-   Suporte para Oracle 8i no Linux e Windows (FUNCIONANDO).

-   Suporte para Oracle 9i no Linux e Windows (FUNCIONANDO. Ainda precisa adicionar recursos para 9i).

-   Suporte para Oracle 10g no Linux e Windows (FUNCIONANDO. Ainda precisa adicionar recursos para 10g).

-   Suporte para Oracle 10g no Mac OS X. Exige resolução de problemas de byte-ordering e alinhamento. (PARA FAZER).

-   Suporte para Oracle 10g no Solaris x86. (FUNCIONANDO no Solaris 10 x86 e Solaris Express x86).

-   Suporte para Oracle 10g no Solaris SPARC. Exige resolução de problemas de byte-ordering e alinhamento. (PARA FAZER).

-   Suporte para Oracle 10g Express Edition no Windows e Linux (FUNCIONANDO).

-   Suporte para Oracle 11g no Linux e Windows (FUNCIONANDO).

-   Suporte a grandes objetos como LONG VARCHAR, BLOB, CLOB (FUNCIONANDO).

-   Suporte todos os tipos de dados (AINDA DE EXECUÇÃO). Ainda precisa implementar INTERVAL. Muitos dos tipos Oracle .net, como OracleDateTime utilizam internamente os tipos definidos em .NET como DateTime. Isto é insuficiente para suportar tipos de dados do Oracle como TIMESTAMP.

-   Auditoria de Segurança (PARA FAZER)

-   NLS / Suporte a Unicode / conjunto de caracteres Multi-byte (PRECISAM MELHORAR)

Testando
--------

**Pré-requisitos**

-   Tenha o mono e gmcs funcionando.

-   Ter acesso ao Oracle 8i, 9i, 10g, 10g Express, ou 11g ou realizar o download em [Oracle Downloads](http://www.oracle.com/technology/software/index.html). Se você está se conectando remotamente a um banco de dados Oracle, é necessário o software cliente Oracle. As inscrições para o [Oracle Technology Network](http://www.oracle.com/technology/index.html) é grátis. Se estiver instalando o Linux, sugiro que você pesquise bastante para ver como outros instalaram o Oracle no Linux. [Werner Puschitz's Oracle on Linux page](http://www.puschitz.com/OracleOnLinux.shtml) contém bons guias passo-a-passo pra a instalação do Oracle no Linux.

-   [Oracle Database 10g Express Edition](http://www.oracle.com/technology/software/products/database/xe/index.html) é grátis para download e redistribuição. Ele funciona no Windows e Linux, além disto ele é bem mais fácil de instalar se comparado com as versões Standard e Enterprise.

-   Se você nao tem nenhum Oracle instalado no computador em que você está executando o Mono, mas você precisa acessar o banco de dados Oracle remotamente, sugiro que utilize [Oracle Instant Client](http://www.oracle.com/technology/tech/oci/instantclient/index.html). O Oracle Instant Client é bem mais fácil de instalar do que um cliente Oracle. Você também pode redistribuir o Oracle Instant Client gratuitamente.

-   A instalação do Oracle 10g Express Edition (XE) no Debian/Ubuntu Linux é feita via apt-get.

<!-- -->

Basicamente, você adiciona em seu /etc/apt/sources.list

``` bash
deb http://oss.oracle.com/debian unstable main non-free
```

em então execute o seguinte:

``` bash
sudo apt-get update
sudo apt-get install oracle-xe-universal
sudo /etc/init.d/oracle-xe configure
```

-   No mcs você pode encontrar códigos fontes e teste em mcs/class/System.Data.OracleClient/Test

-   O Data Source está no Oracle TNS Name

**Formato da string de conexão**

-   Segue o formato da string de conexão:

<!-- -->

```
"Data Source=tnsname;User ID=userid;Password=password"
```

**Formato da string de conexão utilizando descrição de rede TNS sem utilizar o arquivo tnsnames.ora**

-   Segue o formato da string de conexão:

<!-- -->

```
"User ID=SCOTT;" +
"Password=TIGER;" +
"Data Source=(" +
"DESCRIPTION=(" +
"ADDRESS=(PROTOCOL=TCP)(HOST=192.168.1.101)(PORT=1521))" +
"(CONNECT_DATA=(SERVER=DEDICATED)" +
"(SERVICE_NAME=TESTDB)))"
```

**Formato da string de conexão para autenticação externa**

-   Segue o formato da string de conexão:

<!-- -->

```
"Data Source=tnsname;Integrated Security=true"
```

-   Parâmetros da string de conexão:

|Definição do parâmetro|Descrição|Exemplo|
|:-------------------|:----------|:------|
|Server or Data Source|TNS Name ou Network Address da instância do Oracle para conectar|Server=TESTDB|
|User ID|nome do usuário de banco de dados Oracle|User ID=scott|
|Password|senha para o usuário de banco de dados Oracle |Password=mypass12|
|Integrated Security|Para conectar utilizando autenticação externa ou não. Valores válidos para Integrated Security são: YES ou TRUE para utilizar autenticação externa. NO ou FALSE para não utilizar autenticação externa. Padrão é false.|Integrated Security=true|
|Min Pool Size|Determina o número mínimo de conexões para o pool de conexões. Padrão é 0.|Min Pool Size=0|
|Max Pool Size|Determina o número máximo de conexões para o pool de conexões. Padrão é 100.|Max Pool Size=100|
|Pooling|Determina se deve ou não utilizar o pool de conexões. Valores válidos são TRUE ou YES para utilizar o pool de conexões ou FALSE ou NOT para não utilizar o pool de conexões. Padrão é TRUE.|Pooling=true|

-   Se você usar a autenticação externa, certifique-se de ter um usuário criado externamente. Além disso, verifique se você sabe o que está fazendo, se você usar a autenticação externa - há implicações de segurança. Leia [Oracle® Database Advanced Security Administrator's Guide](http://download-east.oracle.com/docs/cd/B19306_01/network.102/b14268/asoauth.htm#sthref731) para mais informações sobre a autenticação externa.

-   Como criar um usuário do Windows chamado SomeUser no Windows NT/2000 Domínio MyNTDomain para autenticação externa no Oracle: Se você não estiver em um domínio do Windows, então o Nome da sua Máquina é o domínio. Observe como o usuário do domínio é entre aspas duplas e é maiúsculas.

``` sql
CREATE USER "MYNTDOMAIN\\SOMEUSER" IDENTIFIED EXTERNALLY;
```

-   Como criar um usuário no Linux chamado someuser no Oracle com permissão de autenticação externa:

``` sql
CREATE USER someuser IDENTIFIED EXTERNALLY;
```

Exemplos
--------

**C# Exemplo 1a - Conexão básica e recuperação de dados**

``` csharp
 using System;
 using System.Data;
 using System.Data.OracleClient;
 
 public class Test
 {
    public static void Main (string[] args)
    {
       string connectionString =
          "Data Source=testdb;" +
          "User ID=scott;" +
          "Password=tiger;";
       OracleConnection dbcon = null;
       dbcon = new OracleConnection (connectionString);
       dbcon.Open ();
       OracleCommand dbcmd = dbcon.CreateCommand ();
       string sql = "SELECT ename, job FROM scott.emp";
       dbcmd.CommandText = sql;
       OracleDataReader reader = dbcmd.ExecuteReader ();
       while (reader.Read ()) {
          string employeeName = (string) reader["ename"];
          string job = (string) reader["job"];
          Console.WriteLine ("Employee Name: {0}  Job: {1}",
                            employeeName, job);
       }
       // clean up
       reader.Close ();
       reader = null;
       dbcmd.CommandText = sql;
       dbcmd.ExecuteNonQuery ();
       dbcmd.Dispose ();
       dbcmd = null;
       dbcon.Close ();
       dbcon = null;
    }
 }
```

**C# Exemplo 1b - Conexão básica e recuperação de dados utilizando Integrated Security**

``` csharp
 using System;
 using System.Data;
 using System.Data.OracleClient;
 
 public class Test
 {
    public static void Main (string[] args)
    {
       string connectionString =
          "Data Source=testdb;" +
          "Integrated Security=true";
       OracleConnection dbcon = null;
       dbcon = new OracleConnection (connectionString);
       dbcon.Open ();
       OracleCommand dbcmd = dbcon.CreateCommand ();
       string sql = "SELECT ename, job FROM scott.emp";
       dbcmd.CommandText = sql;
       OracleDataReader reader = dbcmd.ExecuteReader ();
       while (reader.Read ()) {
          string employeeName = (string) reader["ename"];
          string job = (string) reader["job"];
          Console.WriteLine ("Employee Name: {0}  Job: {1}",
                            employeeName, job);
       }
       // clean up
       reader.Close ();
       reader = null;
       dbcmd.CommandText = sql;
       dbcmd.ExecuteNonQuery ();
       dbcmd.Dispose ();
       dbcmd = null;
       dbcon.Close ();
       dbcon = null;
    }
 }
```

**C# Exemplo 2 - Chamando uma Stored Procedure**

``` csharp
 using System;
 using System.Data;
 using System.Data.OracleClient;
 
 public class Test
 {
    public static void Main (string[] args)
    {
       string connectionString =
          "Data Source=testdb;" +
          "User ID=scott;" +
          "Password=tiger;";
       OracleConnection dbcon = null;
       dbcon = new OracleConnection (connectionString);
       dbcon.Open ();
 
       Console.WriteLine("  Drop table MONO_TEST_TABLE2...");
       OracleCommand dbcmd = dbcon.CreateCommand ();
 
       try {
              dbcmd.CommandText = "DROP TABLE MONO_TEST_TABLE2";
              dbcmd.ExecuteNonQuery ();
       }
       catch(OracleException oe1) {
              // ignore if table already exists
       }
 
       Console.WriteLine("  Drop procedure SP_TEST2...");
       try {
              dbcmd.CommandText = "DROP PROCEDURE SP_TEST2";
              dbcmd.ExecuteNonQuery ();
       }
       catch(OracleException oe1) {
              // ignore if table already exists
       }
 
       Console.WriteLine("  Create table MONO_TEST_TABLE2...");
 
       dbcmd.CommandText = "CREATE TABLE MONO_TEST_TABLE2 (" +
              " COL1 VARCHAR2(8), "+
              " COL2 VARCHAR2(32))";
       dbcmd.ExecuteNonQuery ();
 
       Console.WriteLine("  Create stored procedure SP_TEST2...");
       dbcmd.CommandText =
              "CREATE PROCEDURE SP_TEST2(parm1 VARCHAR2,parm2 VARCHAR2) " +
              " IS " +
              " BEGIN " +
              "      INSERT INTO MONO_TEST_TABLE2 (COL1,COL2) VALUES (parm1,parm2);" +
              "      COMMIT;" +
              " END;";
 
              cmd2.ExecuteNonQuery ();
 
       Console.WriteLine("  COMMIT...");
       dbcmd.CommandText = "COMMIT";
       dbcmd.ExecuteNonQuery ();
 
       Console.WriteLine("  Call stored procedure SP_TEST2 with two parameters...");
       OracleCommand dbcmd = con.CreateCommand ();
       dbcmd.CommandType = CommandType.StoredProcedure;
       dbcmd.CommandText = "sp_test2";
 
       OracleParameter myParameter1 = new OracleParameter("parm1", OracleType.VarChar);
       myParameter1.Value = "myval";
       myParameter1.Size = 8;
       myParameter1.Direction = ParameterDirection.Input;
 
       OracleParameter myParameter2 = new OracleParameter("parm2", OracleType.VarChar);
       myParameter2.Value = "another";
       myParameter2.Size = 32;
       myParameter2.Direction = ParameterDirection.Input;
 
       dbcmd.Parameters.Add (myParameter1);
       dbcmd.Parameters.Add (myParameter2);
 
       dbcmd.ExecuteNonQuery ();
 
       dbcmd.CommandText = sql;
       dbcmd.ExecuteNonQuery ();
       dbcmd.Dispose ();
       dbcmd = null;
       dbcon.Close ();
       dbcon = null;
    }
 }
```

**C# Exemplo 3 - Executando um bloco PL/SQL**

Por que eu faria isso? Vamos dizer que eu precise executar uma stored procedure, porém ainda não é suportado o tipo boolean no OCI. Então eu posso fazer isto através de um bloco PL/SQL.

``` csharp
 using System;
 using System.Data;
 using System.Data.OracleClient;
 
 public class Test
 {
    public static void Main (string[] args)
    {
       string connectionString =
          "Data Source=testdb;" +
          "User ID=scott;" +
          "Password=tiger;";
       OracleConnection con = null;
       con = new OracleConnection (connectionString);
       con.Open ();
        OracleCommand cmd = con.CreateCommand();
        Console.WriteLine("  Drop procedure SP_TESTPLSQLBLOCK1...");
        try
        {
            cmd.CommandText = "DROP PROCEDURE SP_TESTPLSQLBLOCK1";
            cmd.ExecuteNonQuery ();
        }
        catch(OracleException oe1)
        {
            // ignore if table already exists
        }
 
        Console.WriteLine("  Create stored procedure SP_TESTPLSQLBLOCK1...");
        // stored procedure add two number depending on a boolean
 
        cmd.CommandText =
            "CREATE OR REPLACE PROCEDURE SP_TESTPLSQLBLOCK1(PARM1 IN NUMBER,PARM2 IN BOOLEAN,PARM3 OUT NUMBER)\n" +
            "IS\n" +
            "BEGIN\n" +
            "   IF PARM2 = TRUE THEN\n" +
            "       PARM3 := PARM1 + 7;\n" +
            "    ELSE\n" +
            "       PARM3 := PARM1 + 13;\n" +
            "   END IF;\n" +
            "END;";
 
        cmd.ExecuteNonQuery ();
 
        Console.WriteLine("  COMMIT...");
        cmd.CommandText = "COMMIT";
        cmd.ExecuteNonQuery ();
 
        Console.WriteLine("  Call stored procedure SP_TESTPLSQLBLOCK1 with 3 parameters...");
        cmd.CommandType = CommandType.Text;
        cmd.CommandText =
            "DECLARE " +
            "   addnum BOOLEAN := sys.diutil.int_to_bool(:P2); " +
            "BEGIN " +
            "    SP_TESTPLSQLBLOCK1(:P1,addnum,:P3); " +
            "END;";
        OracleParameter myParameter1 = new OracleParameter("P1", OracleType.Number);
        myParameter1.Value = 5;
        myParameter1.Direction = ParameterDirection.Input;
 
        OracleParameter myParameter2 = new OracleParameter("P2", OracleType.Number);
        myParameter2.Value = 1;
        myParameter2.Direction = ParameterDirection.Input;
 
        OracleParameter myParameter3 = new OracleParameter("P3", OracleType.Number);
        myParameter3.Direction = ParameterDirection.Output;
 
        cmd.Parameters.Add (myParameter1);
        cmd.Parameters.Add (myParameter2);
        cmd.Parameters.Add (myParameter3);
 
        cmd.ExecuteNonQuery ();
        decimal d = (decimal) myParameter3.Value;
        Console.WriteLine ("    Out Value should be: 12");
        Console.WriteLine ("    Out Value: {0}", d);
        cmd.Dispose();
        cmd = null;
        con.Close();
        con = null;
    }
 }
```

**C# Exemplo 4 - ASP.NET DataGrid Data Binding para uma tabela em um banco de dados Oracle**

Primeiro, você precisará ter certeza que existe a tabela chamada CUSTOMERS com alguns dados.

``` csharp
 CREATE TABLE CUSTOMERS (
    person varchar2(256) NOT NULL,
    email varchar2(256) NOT NULL
 );
 
 INSERT INTO CUSTOMERS
 (PERSON, EMAIL)
 VALUES('Bob Jones','bjones@nowhere.edu');
 
 INSERT INTO CUSTOMERS
 (PERSON, EMAIL)
 VALUES('John Smith','jswmith@somewhere.com');
 
 COMMIT;
```

``` csharp
<%@ Page Language="C#" %>
<%@ import namespace="System.Data" %>
<%@ import namespace="System.Data.Common" %>
<%@ import namespace="System.Data.SqlTypes" %>
<%@ import namespace="System.Data.OracleClient" %>
<%@ import namespace="System.Reflection" %>
<%@ assembly Name="System.Data.OracleClient" %>
 
<html>
<head>
<title>ASP.NET DataGrid Data Binding to an Oracle database table</title>
 
<!-- Source code modified from samples in xsp was originally made by Gonzalo Paniagua Javier -->
 
<script runat="server">
 
    static Type cncType = null;
 
    void GetConnectionData (out string providerAssembly,
                               out string cncTypeName, out string cncString)
    {
        providerAssembly = null;
        cncTypeName = null;
        cncString = null;
        NameValueCollection config =
                       ConfigurationSettings.AppSettings as NameValueCollection;
        if (config != null) {
            foreach (string s in config.Keys) {
                if (0 == String.Compare ("DBProviderAssembly", s, true)) {
                    providerAssembly = config [s];
                } else if (0 == String.Compare ("DBConnectionType", s, true)) {
                    cncTypeName = config [s];
                } else if (0 == String.Compare ("DBConnectionString", s, true)) {
                    cncString = config [s];
                }
            }
        }
 
        if (providerAssembly == null || providerAssembly == "")
            providerAssembly = "System.Data.OracleClient";
 
        if (cncTypeName == null || cncTypeName == "")
            cncTypeName = "System.Data.OracleClient.OracleConnection";
 
        if (cncString == null || cncString == "")
            cncString = "Data Source=TESTDB;User ID=scott;Password=tiger";
    }
 
    IDbConnection cnc;
    void Page_Load (object o, EventArgs e)
    {
        string connectionTypeName;
        string providerAssemblyName;
        string cncString;
 
        GetConnectionData (out providerAssemblyName,
                       out connectionTypeName, out cncString);
        if (cncType == null) {
            Assembly dbAssembly = Assembly.LoadWithPartialName (
                                                      providerAssemblyName);
            cncType = dbAssembly.GetType (connectionTypeName, true);
            if (!typeof (IDbConnection).IsAssignableFrom (cncType))
                throw new ApplicationException (
                                        "The type '" + cncType +
                    "' does not implement IDbConnection.\n" +
                    "Check 'DbConnectionType' in web.config");
        }
 
        cnc = (IDbConnection) Activator.CreateInstance (cncType);
        cnc.ConnectionString = cncString;
 
        cnc.Open ();
 
        OracleCommand cmd = (OracleCommand) cnc.CreateCommand();
        cmd.CommandText = "select * from CUSTOMERS";
        DbDataAdapter adapter = new OracleDataAdapter(cmd);
        DataTable table = new DataTable("CUSTOMERS");
        adapter.Fill(table);
        grid.DataSource = table;
        grid.DataBind ();
 
        cmd.Dispose();
        cmd = null;
        cnc.Close ();
    }
 
    void Page_PreRender (object sender, EventArgs e)
    {
        if (cnc == null)
            return;
    }
 
 </script>
 </head>
 <body>
 <h3>DataGrid sample</h3>
 <form runat="server">
    <asp:datagrid id="grid" border="1"
        EnableViewState="false" runat="server">
    </asp:datagrid>
 </form>
 </body>
 </html>
```

 **C# Exemplo 5 - Retornando um REF CURSOR de uma stored procedures no Oracle utilizando um OracleDataReader para um parâmetro de saída**

``` csharp
 using System;
 using System.Data;
 using System.Data.OracleClient;
 
 public class Test
 {
    public static void Main (string[] args)
    {
        string connectionString =
          "Data Source=testdb;" +
          "User ID=scott;" +
          "Password=tiger;";
        OracleConnection connection = null;
        connection = new OracleConnection (connectionString);
        connection.Open ();
 
    Console.WriteLine("Setup test package and data...");
    OracleCommand cmddrop = connection.CreateCommand();
 
    cmddrop.CommandText = "DROP TABLE TESTTABLE";
    try {
        cmddrop.ExecuteNonQuery();
    }
    catch(OracleException e) {
        Console.WriteLine("Ignore this error: " + e.Message);
    }
    cmddrop.Dispose();
    cmddrop = null;
 
    OracleCommand cmd = connection.CreateCommand();
 
    // create table TESTTABLE
    cmd.CommandText =
        "create table TESTTABLE (\n" +
        " col1 numeric(18,0),\n" +
        " col2 varchar(32),\n" +
        " col3 date)";
    cmd.ExecuteNonQuery();
 
    // insert some rows into TESTTABLE
    cmd.CommandText =
        "insert into TESTTABLE\n" +
        "(col1, col2, col3)\n" +
        "values(45, 'Mono', sysdate)";
    cmd.ExecuteNonQuery();
 
    cmd.CommandText =
        "insert into TESTTABLE\n" +
        "(col1, col2, col3)\n" +
        "values(136, 'Fun', sysdate)";
    cmd.ExecuteNonQuery();
 
    cmd.CommandText =
        "insert into TESTTABLE\n" +
        "(col1, col2, col3)\n" +
        "values(526, 'System.Data.OracleClient', sysdate)";
    cmd.ExecuteNonQuery();
 
    cmd.CommandText = "commit";
    cmd.ExecuteNonQuery();
 
    // create Oracle package TestTablePkg
    cmd.CommandText =
        "CREATE OR REPLACE PACKAGE TestTablePkg\n" +
        "AS\n" +
        "    TYPE T_CURSOR IS REF CURSOR;\n" +
        "\n" +
        "    PROCEDURE GetData(tableCursor OUT T_CURSOR);\n" +
        "END TestTablePkg;";
    cmd.ExecuteNonQuery();
 
    // create Oracle package body for package TestTablePkg
    cmd.CommandText =
        "CREATE OR REPLACE PACKAGE BODY TestTablePkg AS\n" +
        "  PROCEDURE GetData(tableCursor OUT T_CURSOR)\n" +
                "  IS\n" +
        "  BEGIN\n" +
        "    OPEN tableCursor FOR\n" +
        "    SELECT *\n" +
        "    FROM TestTable;\n" +
        "  END GetData;\n" +
        "END TestTablePkg;";
    cmd.ExecuteNonQuery();
 
    cmd.Dispose();
    cmd = null;
 
    Console.WriteLine("Set up command and parameters to call stored proc...");
    OracleCommand command = new OracleCommand("TestTablePkg.GetData", connection);
    command.CommandType = CommandType.StoredProcedure;
    OracleParameter parameter = new OracleParameter("tableCursor", OracleType.Cursor);
    parameter.Direction = ParameterDirection.Output;
    command.Parameters.Add(parameter);
 
    Console.WriteLine("Execute...");
    command.ExecuteNonQuery();
 
    Console.WriteLine("Get OracleDataReader for cursor output parameter...");
    OracleDataReader reader = (OracleDataReader) parameter.Value;
 
    Console.WriteLine("Read data...");
    int r = 0;
    while (reader.Read()) {
        Console.WriteLine("Row {0}", r);
        for (int f = 0; f < reader.FieldCount; f ++) {
            object val = reader.GetValue(f);
            Console.WriteLine("    Field {0} Value: {1}", f, val);
        }
        r ++;
    }
    Console.WriteLine("Rows retrieved: {0}", r);
 
    Console.WriteLine("Clean up...");
    reader.Close();
    reader = null;
    command.Dispose();
    command = null;
 
        connection.Close();
        connection = null;
    }
 }
```

Construindo C# Examples
-----------------------

Salve o exemplo em um arquivo, como, TestExample.cs

-   Compilando com compilador Mono C#:

<!-- -->

``` bash
mcs TestExample.cs /r:System.Data.dll /r:System.Data.OracleClient.dll
```

-   Executando o exemplo:

<!-- -->

``` bash
mono TestExample.exe
```
