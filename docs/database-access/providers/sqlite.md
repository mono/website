---
title: SQLite
redirect_from:
  - /SQLite/
  - /SQL_Lite/
  - /SQLit/
---

O assembly Mono.Data.SqliteClient contém um provedor de dados ADO.NET para o banco de dados [SQLite](http://www.sqlite.org/) (tanto para a versão 2 quanto para a versão 3).

É importante observar que o SQLite possui uma peculiaridade importante: a célula da tabela de dados não registra a informação referente à qual era o tipo de dado que estava contido nela. Na versão atual do SQLite (versão 3), os dados são armazenados como long, double, string, ou como blob (de "Binary Large Object"), enquanto que na versão 2 do SQLite, todo dado é armazenado como string. Portanto, você precisa tomar cuidado para evitar o uso de casting de valores retornados pelo SQLite, sem antes verificar o tipo de dado retornado. Veja as observações abaixo sobre armazenamento de Data/Hora.

(o último mantenedor do Mono.Data.SqliteClient foi [Josh Tauberer](http://razor.occams.info).)

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Sumário</h2>
<ul>
<li><a href="#new-style-assembly-shipped-with-mono-124">1 O Assembly no novo formato empacotado com o Mono a partir da versão 1.2.4</a></li>
<li><a href="#prerequisites">2 Pré-requisitos</a></li>
<li><a href="#connection-string-format">3 Formato da string de conexão</a></li>
<li><a href="#storing-datetimes">4 Armazenamento de Data/Hora</a></li>
<li><a href="#character-encodings">5 Codificação de caracteres</a></li>
<li><a href="#c-example-11-profile-of-the-new-assembly-and-the-old-assembly">6 Exemplo em C# (com o perfil 1.1 do novo assembly e com o assembly antigo)</a></li>
</ul></td>
</tr>
</tbody>
</table>

O Assembly no novo formato empacotado com o Mono a partir da versão 1.2.4
-------------------------------------------------------------------------

A partir da versão 1.2.4, o Mono vem com um novo assembly do SQLite - Mono.Data.Sqlite. Esse novo assembly prevê suporte **somente para a versão 3 do SQLite** e não é 100% compatível em termos binários e de API com o assembly antigo. O novo assembly é baseado no código do Robert Simpson [http://sqlite.phxsoftware.com/](http://sqlite.phxsoftware.com/) e disponibiliza uma API ADO.NET 2.0 completa. O código binário do assembly antigo está contido no novo, mas está disponível **somente no perfil 1.1**. O perfil 2.0 não consegue acessar o binário antigo se o novo assembly for referenciado. Nós escolhemos essa forma para que houvesse uma opção de migração para desenvolvedores que utilizem SQLite em suas aplicações .NET - ambos assemblies serão disponibilizados com as futuras versões do Mono e, em algum momento (ainda não determinado), o assembly antigo será removido da distribuição. Sendo assim, encorajamos todos os desenvolvedores à iniciar o processo de migração de seu código para o novo assembly - tanto para o perfil 1.1 quanto para o perfil 2.0.

Uma desvantagem do novo assembly é a incompatibilidade binária do formato de dado. Ou seja, se sua aplicação utiliza o formato de dados da versão 2 do banco de dados SQLite você **não** não será capaz de acessar os dados através do novo assembly. Para resolver este problema você precisará extrair seus dados através de utilitários específicos do SQLite v2 e depois restaurá-los através de utilitários específicos do SQLite v3.

Pré-requisitos
--------------

Se você não possuir o [SQLite](http://www.sqlite.org/), faça o download do mesmo. Existem instaladores para Windows e Linux. Você pode instalar as .dll ou .so junto dos arquivos binários da sua aplicação, ou em algum caminho padrão de bibliotecas de seu sistema operacional.

Formato da string de conexão
----------------------------

O formato da string de conexão é:

``` text
[perfil 1.1 e o assembly antigo]
URI=file:/caminho/para/o/arquivo

[perfil 2.0 e o novo assembly]
Data Source=file:/caminho/para/o/arquivo
Data Source=|DataDirectory|filename
```

A última linha acima no caso do perfil 2.0 ao diretório App_Data (ou qualquer outro diretório que esteja configurado para receber os arquivos de dado de uma aplicação ASP.NET 2.0).

Por exemplo:

``` text
[perfil 1.1 e o assembly antigo]
URI=file:SqliteTest.db

[perfil 2.0 e o novo assembly]
Data Source=file:SqliteTest.db
```

O exemplo acima irá utilizar o arquivo SqliteTest.db localizado no diretório atual. Esse arquivo será criado, caso não exista.

Ou se preferir, você pode utilizar o SQLite como uma base de dados carregada na memória:

``` text
URI=file::memory:,version=3
```

A `version=3` também é suportada, mas não necessariamente com o novo assembly.

Com o assembly antigo, o adaptador ADO.NET irá utilizar o SQLite versão 2 por padrão, mas caso a versão 2 não for encontrada e a versão 3 estiver disponível, ele irá automaticamente carregar a versão 3. Você também pode forçar o adaptador para utilizar a versão 3 adicionando o parâmetro "version=3" à string de conexão:

``` text
URI=file:SqliteTest.db,version=3
```

O novo assembly, conforme descrito anteriormente, somente trabalha com formato de base de dados na versão 3.

-   Parâmetros da string de conexão:

**Para o perfil 1.1 e o assembly antigo**

|Definição do Parâmetro|Descrição|Exemplo|
|:-------------------|:----------|:------|
|URI|um arquivo do tipo Universal Resource Identifier|URI=file:SqliteTest.db|
|versão|versão do SQL Lite à ser utilizada: versão 2 ou 3|versão=3|
|busy_timeout|um tempo de espera, em milisegundos, quando a base de dados está ocupada, antes de ocorrer uma SqliteBusyException (a partir do Mono 1.1.14)|busy_timeout=3000|

O parâmetro busy_timeout está implementado como uma chamada para o [sqlite(3)_busy_timeout](http://sqlite.org/capi3ref.html#sqlite3_busy_timeout). O valor padrão é 0, que corresponde a enviar uma SqliteBusyException imediatamente, caso a base de dados esteja ocupada.

**Para o perfil 2.0 no novo assembly**

|Definição do Parâmetro|Descrição|Exemplo|
|:-------------------|:----------|:------|
|Data Source|um arquivo do tipo Universal Resource Identifier|Data Source=file:SqliteTest.db|
|versão|versão do SQL Lite à ser utilizada: versão 3|versão=3|

Armazenamento de Data/Hora
--------------------------

A forma com que Data/Hora são armazenados e lidos de uma base de dados SQLite infelizmente varia bastante, pois o SQLite não possui uma forma nativa de armazenar este tipo de dado. Além disso, existem duas versões de SQLite (2 e 3), que trabalham de formas diferentes com esses tipos de dados. A recomendação ao se trabalhar com Data/Hora no SQLite é codificar/decodificar esse tipo de dado através de sua própria lógica, como por exemplo associando com algum conjunto específico de tipo de inteiro e string definido por você, mas *não* inserí-los em colunas do tipo DATE ou DATETIME.

Internamente, o SQLite 2 somente suporta strings. Independentemente em qual tipo de coluna a variável foi definida, Data/Hora serão convertidos em strings. Se você utilizar parâmetros, por exemplo, Data/Hora poderão ser convertidos em algum formato regional (culture-sensitive), mas ao ler o dado da base de dados, uma vez armazenado, não será possível saber que esse dado era um DateTime e não uma string, então o Mono.Data.SqliteClient irá retornar uma string. Utilizando o SQLite 2, de fato você não consegue trabalhar Data/Hora sem codificá-los manualmente de alguma forma.

Se você explicitamente utilizar o SQLite 3, ou o novo assembly (lembrando que você deverá adicionar o parâmetro de versão na string de conexão, exceto se você estiver utilizando o novo assembly), você poderá se beneficiar do comportamento em particular quando conectando à uma base de dados SQLite 3. O SQLite 3 suporta o armazenamento interno dos tipos string, inteiro (64 bits), real e blob. Quando inserimos um tipo Data/Hora em uma base de dados utilizando parâmetros, o Mono.Data.SqliteClient irá codificar a Data/Hora como um inteiro através de uma função ToFileTime(). Porém isso ainda não é útil ao lermos o dado dessa base no sentido de sabermos se esse dado em particular era ou não um dado do tipo Data/Hora. Entretanto, o SQLite 3 também armazena os nomes dos tipos de dados das colunas utilizadas para formar a tabela. Se uma coluna é declarada como DATE ou DATETIME, o SqliteDataReader irá tentar devolver o valor do dado como um dado de tipo Data/Hora. Se o SQLite lê um valor inteiro, ele utiliza o DateTime.FromFileTime, que é o processo inverso de como a Data/Hora são codifcadas se você inseriu dados do tipo Data/Hora via parâmetros. Se o SQLite lê uma string, ele utiliza o DateTime.Parse, embora o método de Parse demanda bastante tempo (é uma operação bastante lenta). Assim sendo, com o SQLite 3, dados do tipo Data/Hora devem ser inseridos em colunas do tipo DATE ou DATETIME na base de dados, quer seja através do uso de parâmetros, quer seja transformando-os em dados do tipo long manualmente através do método ToFileTime(), e assim ele poderão ser lidos novamente como dados do tipo Data/Hora.

Codificação de caracteres
-------------------------

O cliente SQLite também trata a questão de codificação de caracteres diferentemente entre a versão 2 e a versão 3 devido à forma como são tratadas as strings dentro dessas duas versões.

No SQLite 3, o cliente SQLite comunica com o servidor SQLite em Unicode. Portanto, você poderá ler e escrever qualquer caracter na base de dados, mas perceba que se você escrever dados Unicode na base de dados, talvez não seja possível lê-los em outras aplicações que não comuniquem com o SQLite utilizando Unicode.

No SQLite 2, o cliente SQLite comunica com o servidor SQLite utilizando a codificação UTF-8 por padrão. Desta forma, você também poderá ler e escrever qualquer caracter na base de dados. Mas fique atento à duas observações: a primeira é que como caracteres que não são ASCII são codificados como caracteres multi-bytes no padrão UTF-8, e o SQLite 2 não reconhece caracteres multi-bytes (a menos que seja compilado especificamente com suporte à UTF-8), elementos como LIKE, GLOB, LENGTH e SUBSTR terão comportamentos adversos. A segunda observação é que outras aplicações que utilizam a base de dados também deverão, obrigatoriamente, utilizar codificação UTF-8.

Ao utilizar o SQLite 2, você pode forçar o Mono.Data.SqliteClient uma codificação diferente da UTF-8 adicionando, por exemplo, o parâmetro ";encoding=ASCII" à string de conexão. Note que necessariamente precisará ser uma codificação que termine com um único parâmetro (single null terminator).

Exemplo em C# (com o perfil 1.1 do novo assembly e com o assembly antigo)
-------------------------------------------------------------------------

``` csharp
 using System;
 using System.Data;
 using Mono.Data.SqliteClient;
 
 public class SQLiteTest
 {
    public static void Main()
    {
       const string connectionString = "URI=file:SqliteTest.db";
       IDbConnection dbcon = new SqliteConnection(connectionString);
       dbcon.Open();
       IDbCommand dbcmd = dbcon.CreateCommand();
       // este exemplo precisa que seja criada uma tabela
       // com o nome "employee", com uma coluna "firstname"
       // e uma outra, chamada "lastname", como por exemplo:
       //        CREATE TABLE employee (
       //           firstname nvarchar(32),
       //           lastname nvarchar(32));
       const string sql =
          "SELECT firstname, lastname " +
          "FROM employee";
       dbcmd.CommandText = sql;
       IDataReader reader = dbcmd.ExecuteReader();
       while(reader.Read())
       {
            string firstName = reader.GetString(0);
            string lastName = reader.GetString(1);
            Console.WriteLine("Name: {0} {1}",
                firstName, lastName);
       }
       // "zerando" tudo
       reader.Dispose();
       dbcmd.Dispose();
       dbcon.Close();
    }
 }
```

Para compilar este exemplo:

-   Salve o exemplo acima como um arquivo C#, por exemplo, TestExample.cs;
-   Compile o arquivo utilizando o Mono C# compiler:

<!-- -->

``` bash
mcs TestExample.cs -r:System.Data.dll -r:Mono.Data.SqliteClient.dll
```

Para rodar este exemplo:

``` bash
mono TestExample.exe
```
