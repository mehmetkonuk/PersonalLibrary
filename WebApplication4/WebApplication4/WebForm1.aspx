<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication4.WebForm1" %>

<%@ Register assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Data.Linq" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="style.css" rel="stylesheet" />
    <title>Kitaplık</title>
    
    <style type="text/css">
        .auto-style1 {
            height: 25px;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
     
    <div class="sag">
        <div class="sag-üst">
            <%--data girişleri--%>
            <table>
                <tr>
                    <td>
                        Ad:
                    </td>
                    <td>
                        <asp:TextBox ID="txtAd" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        Sayfa Sayısı:
                    </td>
                    <td>
                        <asp:TextBox ID="txtSSayisi" runat="server" TabIndex="3"></asp:TextBox>
                    </td>
                    <td>
                        Son Okunan Sayfa:
                    </td>
                    <td>
                        <asp:TextBox ID="txtSonOkunan" runat="server" OnTextChanged="txtSonOkunan_TextChanged" TabIndex="6"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        Yazar Ad:
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtYazar" runat="server" TabIndex="1"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        Alım Tarihi
                    </td>
                    <td class="auto-style1">
                        <dx:ASPxDateEdit ID="ASPxDateAlim" runat="server" Theme="PlasticBlue" TabIndex="4">
                            <ClearButton DisplayMode="OnHover"></ClearButton>
                        </dx:ASPxDateEdit>
                    </td>
                    <td class="auto-style1">
                        Bitiş Tarihi:
                    </td>
                    <td class="auto-style1">
                        <dx:ASPxDateEdit ID="ASPxDateBitis" runat="server" Theme="PlasticBlue" OnDateChanged="ASPxDateBitis_DateChanged" TabIndex="7">
                            <ClearButton DisplayMode="OnHover"></ClearButton>
                        </dx:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Fiyatı:</td>
                    <td class="auto-style1"><asp:TextBox ID="txtFiyati" runat="server" TabIndex="2"></asp:TextBox></td>
                    <td class="auto-style1">
                        Başlama Tarihi:
                    </td>
                    <td class="auto-style1">
                        <dx:ASPxDateEdit ID="ASPxDateBaslama" runat="server" Theme="PlasticBlue" TabIndex="5">
                            <ClearButton DisplayMode="OnHover"></ClearButton>
                        </dx:ASPxDateEdit>
                    </td>
                    <td class="auto-style1">
                        ISBN:
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtISBN" runat="server" TabIndex="8"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Button ID="btnNewSave" CssClass="btn" runat="server" Text="Yeni" OnClick="btnNewSave_Click" />
                        <asp:Button ID="btnEdit" CssClass="btn" runat="server" Text="Güncelle" />
                        <asp:Button ID="btnDelete" CssClass="btn" runat="server" Text="Sil"/>
                        <asp:Button ID="btnClear" CssClass="btn" runat="server" Text="Temizle" OnClick="btnClear_Click"/>
                    </td>
                    <td>Durum:</td>
                    <td>
                        <asp:CheckBox ID="ChcDurum" runat="server" Text="Okundu" TextAlign="Left" TabIndex="9" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="sag-alt">
            <%--//veritabanındaki datalar listelenecek--%>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnRowCommand="GridView1_RowCommand" Width="800px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="ad" HeaderText="ad" SortExpression="ad" />
                    <asp:BoundField DataField="Yazar" HeaderText="Yazar" SortExpression="Yazar" />
                    <asp:BoundField DataField="Fiyat" HeaderText="Fiyat" SortExpression="Fiyat" />
                    <asp:BoundField DataField="Sayfa_Sayisi" HeaderText="Sayfa_Sayisi" SortExpression="Sayfa_Sayisi" />
                    <asp:BoundField DataField="Alim_Tarihi" HeaderText="Alim_Tarihi" SortExpression="Alim_Tarihi" DataFormatString="{0:dd/MM/yyyy}"/>
                    <asp:BoundField DataField="Okuma_Tarihi" HeaderText="Okuma_Tarihi" SortExpression="Okuma_Tarihi" DataFormatString="{0:dd/MM/yyyy}"/>
                    <asp:BoundField DataField="Son_Okunan_Sayfa" HeaderText="Son_Okunan_Sayfa" SortExpression="Son_Okunan_Sayfa" />
                    <asp:BoundField DataField="Bitiş_Tarihi" HeaderText="Bitiş_Tarihi" SortExpression="Bitiş_Tarihi" DataFormatString="{0:dd/MM/yyyy}"/>
                    <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
                    <asp:CheckBoxField DataField="Durum" HeaderText="Durum" SortExpression="Durum" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" SelectCommand="SELECT * FROM [Kitaplar]"></asp:SqlDataSource>
        </div>
        
    </div>
    </form>
</body>
</html>
