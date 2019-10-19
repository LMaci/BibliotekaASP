<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Czytelnik.aspx.cs" Inherits="BibliotekaASP.Czytelnik1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
    <asp:Panel ID="Panel1" runat="server">
        <table class="nav-justified">
            <tr>
                <td>
                    <table class="nav-justified">
                        <tr>
                            <td class="text-right" style="width: 84px; height: 24px">
                                <asp:Label ID="Label6" runat="server" Text="Imie: "></asp:Label>
                            </td>
                            <td style="width: 232px; height: 24px">
                                <asp:TextBox ID="tbImie" runat="server" Width="220px" MaxLength="50"></asp:TextBox>
                            </td>
                            <td style="height: 24px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbImie" ErrorMessage="*" Font-Bold="True" ForeColor="#CC0000" ValidationGroup="Nowy"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right" style="height: 22px; width: 84px">
                                <asp:Label ID="Label7" runat="server" Text="Nazwisko: "></asp:Label>
                            </td>
                            <td style="height: 22px; width: 232px">
                                <asp:TextBox ID="tbNazwisko" runat="server" Width="220px" MaxLength="100"></asp:TextBox>
                            </td>
                            <td style="height: 22px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbNazwisko" ErrorMessage="*" Font-Bold="True" ForeColor="#CC0000" ValidationGroup="Nowy"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right" style="width: 84px">
                                <asp:Label ID="Label8" runat="server" Text="PESEL: "></asp:Label>
                            </td>
                            <td style="width: 232px">
                                <asp:TextBox ID="tbPesel" runat="server" Width="220px" MaxLength="11"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbPesel" ErrorMessage="*" Font-Bold="True" ForeColor="#CC0000" ValidationGroup="Nowy"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right" style="width: 84px">
                                <asp:Label ID="Label9" runat="server" Text="Telefon: "></asp:Label>
                            </td>
                            <td style="width: 232px">
                                <asp:TextBox ID="tbTelefon" runat="server" Width="220px" MaxLength="12"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="text-right" style="width: 84px">
                                <asp:Label ID="Label10" runat="server" Text="E-mail: "></asp:Label>
                            </td>
                            <td style="width: 232px">
                                <asp:TextBox ID="tbEmail" runat="server" Width="220px" MaxLength="50"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="text-left" style="width: 84px">
                                <asp:Button ID="btUsun" runat="server" OnClick="btUsun_Click" Text="Usuń" OnClientClick="return confirm('Usunąć tego czytelnika?');" ValidationGroup="Nowy" />
                            </td>
                            <td style="width: 232px">
                                <table class="nav-justified">
                                    <tr>
                                        <td>
                                            <asp:Button ID="btDodaj0" runat="server" OnClick="btDodaj_Click" Text="Dodaj" ValidationGroup="Nowy" />
                                        </td>
                                        <td class="text-right">
                                            <asp:Button ID="btAktualizuj" runat="server" Text="Aktualizuj" OnClick="btAktualizuj_Click" ValidationGroup="Nowy" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td>
                    <asp:GridView ID="gvCzytelnik" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="gvCzytelnik_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                            <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
                            <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
                            <asp:BoundField DataField="PESEL" HeaderText="PESEL" SortExpression="PESEL" />
                            <asp:BoundField DataField="Telefon" HeaderText="Telefon" SortExpression="Telefon" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
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
            </tr>
        </table>
    </asp:Panel>
    <hr />
        <div>
            <asp:Panel ID="Panel2" runat="server" Visible="False">
                <table class="nav-justified">
                    <tr>
                        <td style="width: 273px">
                            <asp:Label ID="lbImie" runat="server"></asp:Label>
                            &nbsp;<asp:Label ID="lbNazwisko" runat="server"></asp:Label>
                        </td>
                        <td style="width: 480px">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 273px">
                            <asp:Label ID="Label11" runat="server" Text="Wypożyczone książki:"></asp:Label>
                        </td>
                        <td style="width: 480px">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 273px">
                            <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource3" DataTextField="Tytul" DataValueField="ID" Rows="10" AutoPostBack="True" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BibliotekaConnectionString %>" SelectCommand="SELECT DISTINCT Ksiazka.ID, Ksiazka.Tytul FROM Ksiazka INNER JOIN Wypozyczenie ON Ksiazka.ID = Wypozyczenie.Ksiazka_ID WHERE (Wypozyczenie.Czytelnik_ID = @CzytelnikID)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="gvCzytelnik" Name="CzytelnikID" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="width: 480px">
                            <asp:Panel ID="pDaty" runat="server">
                                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                                        <asp:BoundField DataField="Wydano" HeaderText="Wydano" SortExpression="Wydano" />
                                        <asp:BoundField DataField="Zwrot" HeaderText="Zwrot" SortExpression="Zwrot" />
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
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BibliotekaConnectionString %>" SelectCommand="SELECT * FROM [Wypozyczenie] WHERE (([Czytelnik_ID] = @Czytelnik_ID) AND ([Ksiazka_ID] = @Ksiazka_ID))">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="gvCzytelnik" Name="Czytelnik_ID" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ListBox1" Name="Ksiazka_ID" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Panel ID="Panel3" runat="server" Visible="False">
                                <table class="nav-justified">
                                    <tr>
                                        <td style="width: 132px">
                                            <asp:Label ID="Label12" runat="server" Text="Wypożyczono: "></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" Format="dd.MM.yyyy" TargetControlID="TextBox1" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 132px">
                                            <asp:Label ID="Label13" runat="server" Text="Zwrócono: "></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" Format="dd.MM.yyyy" TargetControlID="TextBox2" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 132px">&nbsp;</td>
                                        <td>
                                            <asp:Button ID="btAktualizujWypo" runat="server" OnClick="btAktualizujWypo_Click" Text="Aktualizuj" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    <br />
</div>
</asp:Content>
