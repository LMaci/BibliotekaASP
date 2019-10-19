<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wypozyczenie.aspx.cs" Inherits="BibliotekaASP.Wypozyczenie1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:Panel ID="Panel1" runat="server">
            <table class="nav-justified">
                <tr>
                    <td style="width: 475px">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                                <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
                                <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
                                <asp:BoundField DataField="PESEL" HeaderText="PESEL" SortExpression="PESEL" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BibliotekaConnectionString %>" SelectCommand="SELECT * FROM [Czytelnik]"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 475px">
                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                                <asp:BoundField DataField="Tytul" HeaderText="Tytul" SortExpression="Tytul" />
                                <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BibliotekaConnectionString %>" SelectCommand="SELECT * FROM [Ksiazka]"></asp:SqlDataSource>
                    </td>
                    <td>
                        <table class="nav-justified">
                            <tr>
                                <td class="text-right" style="width: 78px">
                                    <asp:Label ID="Label1" runat="server" Text="Imie: "></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbImie" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-right" style="width: 78px">
                                    <asp:Label ID="Label2" runat="server" Text="Nazwisko: "></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbNazwisko" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-right" style="width: 78px">
                                    <asp:Label ID="Label3" runat="server" Text="Książka: "></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbKsiazka" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-right" style="width: 78px">
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Wypożycz" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
</asp:Content>
