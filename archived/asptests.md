---
title: "ASPTests"
lastmodified: '2007-06-20'
redirect_from:
  - /ASPTests/
---

ASPTests
========

The table below lists the results of executing the System.Web.UI.Controls tests with the net_2_0 profile.

-   Test suite execution: mcs/class/System.Web/make run-test PROFILE=net_2_0
-   Tests Location: mcs/class/System.Web/Test/System.Web.UI.WebControls
-   The table includes informatin only regard the new 2.0 tests that were developed by talk@mainsoft.com, yonik@mainsoft.com meravs@mainsoft.com and hagity@mainsoft.com. There is work to do to validate and integrate into this report the status of the remaining NUnit System.Web 2.0 tests.
-   All failed tests listed belowe are marked with the [NotWorking] attribute and therefore excluded from the standard execution.

<table>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<thead>
<tr class="header">
<th align="left">Class / Feature</th>
<th align="left">Num Tests</th>
<th align="left">Num Failures</th>
<th align="left">Before First Pass</th>
<th align="left">Failures</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">AutoGeneratedField</td>
<td align="left">9</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">BaseCompareValidatorTest</td>
<td align="left">10</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">BoundField</td>
<td align="left">20</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">BulletedList</td>
<td align="left">14</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">ButtonField</td>
<td align="left">8</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">ButtonFieldBase</td>
<td align="left">3</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">ButtonTest</td>
<td align="left">12</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">CallBack</td>
<td align="left">2</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">ChangePassword</td>
<td align="left">13</td>
<td align="left">6</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">CheckBox</td>
<td align="left">13</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">CheckBoxField</td>
<td align="left">19</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">CheckBoxList</td>
<td align="left">25</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">CircleHotSpot</td>
<td align="left">5</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">CommandField</td>
<td align="left">5</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">Content</td>
<td align="left">7</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">CompleteWizardStepTest</td>
<td align="left">2</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">ControlParameterTest</td>
<td align="left">6</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">ControlTest</td>
<td align="left">31</td>
<td align="left">1</td>
<td align="left"></td>
<td align="left"><ul>
<li>ResolveAdapter_2 - the entire ControlAdapter feature is not implemented</li>
</ul></td>
</tr>
<tr class="odd">
<td align="left">CookieParameterTest</td>
<td align="left">4</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">CreateUserWizardStepTest</td>
<td align="left">3</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">CreateUserWizard</td>
<td align="left">11</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">CrossPagePostingTest</td>
<td align="left">2</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">CustomValidatorTest</td>
<td align="left">7</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">DataControlField</td>
<td align="left">8</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">DataControlFieldCollection</td>
<td align="left">13</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">DataKey</td>
<td align="left">1</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">DataKeyArray</td>
<td align="left">5</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">DataSourceControl</td>
<td align="left">12</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">DataSourceView</td>
<td align="left">14</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">DetailsView</td>
<td align="left">59</td>
<td align="left">1</td>
<td align="left"></td>
<td align="left"><ul>
<li>DataSourceChanged event not registered</li>
</ul></td>
</tr>
<tr class="odd">
<td align="left">DetailsViewRowTest</td>
<td align="left">4</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">DetailsViewRowCollectionTest</td>
<td align="left">3</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">DropDownList #2.0</td>
<td align="left">1</td>
<td align="left">1</td>
<td align="left"></td>
<td align="left"><ul>
<li>DataSourceChanged event not registered</li>
</ul></td>
</tr>
<tr class="even">
<td align="left">EditCommandColumnTest</td>
<td align="left">10</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">FontUnit</td>
<td align="left">28</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">FormParameterTest</td>
<td align="left">4</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">FormViewTest</td>
<td align="left">57</td>
<td align="left">1</td>
<td align="left"></td>
<td align="left"><ul>
<li>DataSourceChanged event not registered</li>
</ul></td>
</tr>
<tr class="even">
<td align="left">FormViewRowTest</td>
<td align="left">4</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">GridView</td>
<td align="left">61</td>
<td align="left">1</td>
<td align="left"></td>
<td align="left"><ul>
<li>DataSourceChanged event not registered</li>
</ul></td>
</tr>
<tr class="even">
<td align="left">GridViewRowCollection</td>
<td align="left">6</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">GridViewRowTest</td>
<td align="left">3</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">HotSpot</td>
<td align="left">5</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">HotSpotCollection</td>
<td align="left">4</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">HyperLinkField</td>
<td align="left">10</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">HtmlMeta</td>
<td align="left">10</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">ImageButton</td>
<td align="left">13</td>
<td align="left">1</td>
<td align="left"></td>
<td align="left"><ul>
<li>AppRelativeTemplateSourceDirectory return hardcoded value</li>
</ul></td>
</tr>
<tr class="odd">
<td align="left">ImageField</td>
<td align="left">13</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">ImageMap</td>
<td align="left">18</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">LinkButton</td>
<td align="left">12</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">ListControl</td>
<td align="left">33</td>
<td align="left">1</td>
<td align="left"></td>
<td align="left"><ul>
<li>SetPostDataSelection</li>
</ul>
<p>The method support the .NET Framework infrastructure and is not intended to be used directly from your code.</p></td>
</tr>
<tr class="odd">
<td align="left">Login</td>
<td align="left">28</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">LoginName</td>
<td align="left">13</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">LoginStatus</td>
<td align="left">7</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">LoginView</td>
<td align="left">13</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"><ul>
<li>Reality flow postback test cannot be compleated because of framework possibilities not implemented cookies and redirect options.</li>
</ul></td>
</tr>
<tr class="odd">
<td align="left">MappingUrl</td>
<td align="left">1</td>
<td align="left">1</td>
<td align="left"></td>
<td align="left"><ul>
<li>System.Configuration.ConfigurationErrorsException : Unrecognized configuration section &lt;urlMappings&gt;</li>
</ul></td>
</tr>
<tr class="even">
<td align="left">Master Page</td>
<td align="left">7</td>
<td align="left">1</td>
<td align="left"></td>
<td align="left"><ul>
<li>Include derived MasterPages and MasterType directive.</li>
<li>ContentTemplates property: wrong default value.</li>
</ul></td>
</tr>
<tr class="odd">
<td align="left">MembershipProvider</td>
<td align="left">1</td>
<td align="left">1</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">Menu</td>
<td align="left">25</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">MultiView</td>
<td align="left">16</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">ObjectDataSourceTest</td>
<td align="left">41</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">ObjectDataSourceView</td>
<td align="left">21</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">PageTest</td>
<td align="left">51</td>
<td align="left">4</td>
<td align="left"></td>
<td align="left"><ul>
<li>Async Page processing implemented but not tested.</li>
<li>ViewStateEncryptionModeTest - ViewState Encryption implemented but not tested.</li>
<li>MaxPageStateFieldLength - not implemented.</li>
<li>UniqueFilePathSuffix - not implemented.</li>
</ul></td>
</tr>
<tr class="odd">
<td align="left">PanelTest</td>
<td align="left">11</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">PagerSettingsTest</td>
<td align="left">4</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">PolygonHotSpot</td>
<td align="left">4</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">ParameterTest</td>
<td align="left">9</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">PasswordRecovery</td>
<td align="left">8</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">QueryStringParameterTest</td>
<td align="left">4</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">RadioButton</td>
<td align="left">11</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">RadioButtonList</td>
<td align="left">17</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">RectangleHotSpot</td>
<td align="left">4</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">Repeater</td>
<td align="left">9</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">RolePrincipal</td>
<td align="left">2</td>
<td align="left">1</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">Roles</td>
<td align="left">1</td>
<td align="left">1</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">SessionParameterTest</td>
<td align="left">4</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">SiteMapDataSource</td>
<td align="left">8</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">SiteMapPath</td>
<td align="left">16</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">SqlDataSource</td>
<td align="left">24</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">SqlDataSourceView</td>
<td align="left">9</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">StaticSiteMapProvider</td>
<td align="left">7</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">System.Web.UI.ClientScriptMenager</td>
<td align="left">32</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">TableTest</td>
<td align="left">4</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">TemplateField</td>
<td align="left">13</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">TemplateControl</td>
<td align="left">20</td>
<td align="left">2</td>
<td align="left"></td>
<td align="left"><ul>
<li>ParseControl is not supported</li>
<li>TestDeviceFilter is limitation</li>
</ul></td>
</tr>
<tr class="odd">
<td align="left">TextBox</td>
<td align="left">6</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">Themes and skins</td>
<td align="left">8</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">TreeNodeBindingCollection</td>
<td align="left">8</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">TreeNodeBinding</td>
<td align="left">3</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">TreeNodeCollection</td>
<td align="left">16</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">TreeNodeStyleCollection</td>
<td align="left">8</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">TreeNode</td>
<td align="left">7</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">TreeView</td>
<td align="left">55</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">Unit</td>
<td align="left">1</td>
<td align="left">1</td>
<td align="left"></td>
<td align="left"><ul>
<li>Note: There other 15 1.1 success tests, in addition the test works in Grasshopper environment.</li>
</ul></td>
</tr>
<tr class="even">
<td align="left">View</td>
<td align="left">7</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">VirtualPathUtility</td>
<td align="left">55</td>
<td align="left">1</td>
<td align="left"></td>
<td align="left"><ul>
<li>MakeRelative has a dependency on Uri.MakeRelativeUri which throws an exception.</li>
</ul></td>
</tr>
<tr class="even">
<td align="left">WizardStepCollectionTest</td>
<td align="left">9</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">WizardStepBaseTest</td>
<td align="left">11</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">WizardStepTest</td>
<td align="left">0</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"><ul>
<li>Note :
<ul>
<li>No additional functionality , uses only base inherited possibilities</li>
</ul></li>
</ul></td>
</tr>
<tr class="odd">
<td align="left">WizardTest</td>
<td align="left">46</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">XmlDataSourceTest</td>
<td align="left">13</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">XmlTest</td>
<td align="left">14</td>
<td align="left">0</td>
<td align="left"></td>
<td align="left"></td>
</tr>
</tbody>
</table>
