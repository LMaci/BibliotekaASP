<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ksiazki.aspx.cs" Inherits="BibliotekaASP.Ksiazki" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <table class="nav-justified">
            <tr>
                <td style="width: 306px">
                    <asp:GridView ID="gvAutorzy" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvAutorzy_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                            <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
                            <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BibliotekaConnectionString %>" SelectCommand="SELECT * FROM [Autor]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Ksiazka] WHERE [Autor_ID] = @original_ID
DELETE FROM [Autor] WHERE [ID] = @original_ID AND [Imie] = @original_Imie AND [Nazwisko] = @original_Nazwisko" InsertCommand="INSERT INTO [Autor] ([Imie], [Nazwisko]) VALUES (@Imie, @Nazwisko)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Autor] SET [Imie] = @Imie, [Nazwisko] = @Nazwisko WHERE [ID] = @original_ID AND [Imie] = @original_Imie AND [Nazwisko] = @original_Nazwisko">
                        <DeleteParameters>
                            <asp:Parameter Name="original_ID" Type="Int32" />
                            <asp:Parameter Name="original_Imie" Type="String" />
                            <asp:Parameter Name="original_Nazwisko" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Imie" Type="String" />
                            <asp:Parameter Name="Nazwisko" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Imie" Type="String" />
                            <asp:Parameter Name="Nazwisko" Type="String" />
                            <asp:Parameter Name="original_ID" Type="Int32" />
                            <asp:Parameter Name="original_Imie" Type="String" />
                            <asp:Parameter Name="original_Nazwisko" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:Panel ID="Panel1" runat="server">
                        <asp:GridView ID="gvKsiazki" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvKsiazki_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                                <asp:BoundField DataField="Tytul" HeaderText="Tytul" SortExpression="Tytul" />
                                <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
                                <asp:BoundField DataField="Opis" HeaderText="Opis" SortExpression="Opis" />
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
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BibliotekaConnectionString %>" SelectCommand="SELECT ID, Tytul, ISBN, Opis FROM Ksiazka WHERE (Autor_ID = @AutorID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="gvAutorzy" Name="AutorID" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td style="width: 306px">&nbsp;</td>
                <td>
                    <table class="nav-justified">
                        <tr>
                            <td style="width: 437px">
                                <asp:Label ID="Label1" runat="server" Text="Autor:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Książka:"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 306px">&nbsp;</td>
                <td>
                    <table class="nav-justified">
                        <tr>
                            <td class="text-right" style="width: 73px; height: 32px;">
                                <asp:Label ID="Label3" runat="server" Text="Imie: "></asp:Label>
                            </td>
                            <td style="width: 180px; height: 32px;">
                                <asp:TextBox ID="tbImie" runat="server" Height="20px" MaxLength="50" Width="170px"></asp:TextBox>
                            </td>
                            <td style="width: 108px; height: 32px;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbImie" ErrorMessage="*" Font-Bold="True" ForeColor="#CC0000" ValidationGroup="Nowy"></asp:RequiredFieldValidator>
                            </td>
                            <td class="text-right" style="width: 69px; height: 32px;">
                                <asp:Label ID="Label5" runat="server" Text="Tytuł: "></asp:Label>
                            </td>
                            <td style="height: 32px">
                                <asp:TextBox ID="tbTytul" runat="server" Height="20px" MaxLength="100" Width="240px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbTytul" ErrorMessage="*" Font-Bold="True" ForeColor="#CC0000" ValidationGroup="Nowy"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right" style="width: 73px; height: 60px;">
                                <asp:Label ID="Label4" runat="server" Text="Nazwisko: "></asp:Label>
                            </td>
                            <td style="width: 180px; height: 60px;">
                                <asp:TextBox ID="tbNazwisko" runat="server" Height="20px" MaxLength="50" Width="170px"></asp:TextBox>
                            </td>
                            <td style="width: 108px; height: 60px;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbNazwisko" ErrorMessage="*" Font-Bold="True" ForeColor="#CC0000" ValidationGroup="Nowy"></asp:RequiredFieldValidator>
                            </td>
                            <td class="text-right" style="width: 69px; height: 60px;">
                                <asp:Label ID="Label8" runat="server" Text="Gatunek: "></asp:Label>
                            </td>
                            <td style="height: 60px">
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="Nazwa" DataValueField="ID">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BibliotekaConnectionString %>" SelectCommand="SELECT * FROM [Kategoria]"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right" style="width: 73px">&nbsp;</td>
                            <td style="width: 180px">&nbsp;</td>
                            <td style="width: 108px">&nbsp;</td>
                            <td class="text-right" style="width: 69px">
                                <asp:Label ID="Label6" runat="server" Text="ISBN: "></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="tbISBN" runat="server" Height="20px" MaxLength="20" Width="240px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbISBN" ErrorMessage="*" Font-Bold="True" ForeColor="#CC0000" ValidationGroup="Nowy"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right" style="width: 73px">
                                <asp:Button ID="btUsun" runat="server" OnClick="btUsun_Click" OnClientClick="return confirm('Usunąć książkę?');" Text="Usuń" ValidationGroup="Nowy" />
                            </td>
                            <td style="width: 180px" class="text-center">
                                <asp:Button ID="btAktualizuj" runat="server" OnClick="btAktualizuj_Click" Text="Aktualizuj" ValidationGroup="Nowy" />
                            </td>
                            <td style="width: 108px">
                                <asp:Button ID="btDodaj" runat="server" OnClick="btDodaj_Click" Text="Dodaj" ValidationGroup="Nowy" />
                            </td>
                            <td class="text-right" style="width: 69px">
                                <asp:Label ID="Label7" runat="server" Text="Opis: "></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="tbOpis" runat="server" Height="96px" MaxLength="200" TextMode="MultiLine" Width="340px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
