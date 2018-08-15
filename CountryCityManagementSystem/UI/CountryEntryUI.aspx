<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CountryEntryUI.aspx.cs" Inherits="CountryCityManagementSystem.UI.CountryEntryUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 74px;
        }
        .auto-style2 {
            width: 70px;
        }
        #aboutTextArea {
            width: 565px;
            height: 97px;
        }
        .auto-style3 {
            width: 574px;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="nameTextBox" runat="server" Height="26px" Width="200px"></asp:TextBox>
                </td>
                
                <td>
                    &nbsp;</td>
                
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                
                <td>&nbsp;</td>
                
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label2" runat="server" Text="About"></asp:Label>
                </td>
                <td class="auto-style3">
                    <textarea runat="server" id="aboutTextarea" style="width: 200px;"></textarea>
                </td>
                
                <td>
                    &nbsp;</td>
                
            </tr>
            <tr>
                <td class="auto-style1">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
                
                <td>
                    &nbsp;</td>
                
            </tr>
            <tr>
                <td class="auto-style1">
                    &nbsp;</td>
                <td class="auto-style3">
                    <asp:Button ID="saveButton" runat="server" OnClick="saveButton_Click" Text="Save" Width="145px" Height="30px" />
&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="cancelButton" runat="server" OnClick="cancelButton_Click" Text="Cancel" Width="145px" Height="30px" />
                </td>
                
                <td>
                    &nbsp;</td>
                
            </tr>
            <tr>
                <td class="auto-style1">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
                
                <td>
                    &nbsp;</td>
                
            </tr>
            <tr>
                <td class="auto-style1">
                    &nbsp;</td>
                <td class="auto-style3">
                    <asp:Label ID="alertLabel" runat="server"></asp:Label>
                </td>
                
                <td>
                    &nbsp;</td>
                
            </tr>
            <tr>
                <td class="auto-style1">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
                
                <td>
                    &nbsp;</td>
                
            </tr>
        </table>
    </div>

    <table style="width:100%;">
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:GridView ID="allCountryGridView" runat="server" Width="700px" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" style="text-align: center" AllowPaging="True" OnPageIndexChanging="allCountryGridView_OnPageIndexChanging" PageSize="5" Height="250px" CellSpacing="2">
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
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("Name")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="About">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("About")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    

                </asp:GridView>
            </td>
            <td>&nbsp;</td>
        </tr>
        
    </table>

    </form>
    
    <script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
    <script>
        tinymce.init({
            selector: 'textarea',
            width: 700,
            height: 100,
            theme: 'modern',
            plugins: [
              'advlist autolink lists link image charmap print preview hr anchor pagebreak',
              'searchreplace wordcount visualblocks visualchars code fullscreen',
              'insertdatetime media nonbreaking save table contextmenu directionality',
              'emoticons template paste textcolor colorpicker textpattern imagetools'
            ],
            toolbar1: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
            toolbar2: 'print preview media | forecolor backcolor emoticons',
            image_advtab: true,
            templates: [
              { title: 'Test template 1', content: 'Test 1' },
              { title: 'Test template 2', content: 'Test 2' }
            ],
            content_css: [
              '//fast.fonts.net/cssapi/e6dc9b99-64fe-4292-ad98-6974f93cd2a2.css',
              '//www.tinymce.com/css/codepen.min.css'
            ]
        });
    </script>


    </body>
</html>
