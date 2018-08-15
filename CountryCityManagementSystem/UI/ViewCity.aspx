<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCity.aspx.cs" Inherits="CountryCityManagementSystem.UI.ViewCity" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 137px;
        }
        .auto-style2 {
            width: 180px;
        }
        .auto-style3 {
            width: 240px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style1">
                    <asp:RadioButton ID="cityRadioButton" Checked="true" AutoPostBack="True" GroupName="CitySearch" runat="server" Text="City Name" />
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="cityTextBox" runat="server" Height="26px" Width="200px"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="alertLabel" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style1">
                    <asp:RadioButton ID="countryRadioButton" AutoPostBack="True" GroupName="CitySearch" runat="server" Text="Country" />
                </td>
                <td class="auto-style3">
                    <asp:DropDownList ID="countryDropDownList" runat="server" Height="26px" Width="207px">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Button ID="searchButton" runat="server" Height="35px" OnClick="searchButton_Click" Text="Search" Width="100px" />
                </td>
                <td>&nbsp;</td>
            </tr>
            
        </table>
    
        <table style="width:100%;">
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
        
            <asp:GridView ID="viewCityGridView" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1200px" style="text-align: center" AllowPaging="True" PageSize="5" OnPageIndexChanging="viewCityGridView_OnPageIndexChanging">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                
                <Columns>
                            <asp:TemplateField HeaderText="#SL">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("SerialNo")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="City Name">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("Name")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        <asp:TemplateField HeaderText="About">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("About")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                            <asp:TemplateField HeaderText="No. of Dwellers">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("Dwellers")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Location">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("Location")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    <asp:TemplateField HeaderText="Weather">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("Weather")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    <asp:TemplateField HeaderText="Country">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("CountryName")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    <asp:TemplateField HeaderText="About Country">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("AboutCountry")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
            </asp:GridView>
        
    
                </td>
                
            </tr>
        </table>
        
    
    </div>
    </form>
</body>
</html>
