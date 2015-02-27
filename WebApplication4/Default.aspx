<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication4.Default" ViewStateMode="Disabled"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>2.2 Äverntyrliga Kontakter</title>
    <link rel="stylesheet" type="text/css" href="Scripts/style.css"/>
    <script src="Scripts/script.js"></script>
</head>
<body>
    <div id="page">
        <header>
        </header>
        <div id="main">
            <form id="theForm" runat="server">
            <h1>
                Kontakter
            </h1>
                <asp:placeholder ID="PlaceholderMSG" runat="server" Visible="false">
                <div id="sucessMSG" class="sucessMSG" onclick="removeMSG()">
                    <asp:label ID="SucessMSG" runat="server" text="Användare tillagd!"></asp:label>
                    <div>
                        <asp:Label runat="server" Text="Klicka här för att ta bort meddelandet"></asp:Label>
                    </div>
                </div>
                </asp:placeholder>
                <asp:placeholder ID="Placeholder2" runat="server" Visible="false">
                <div id="removeContactMSG" class="removeContactMSG" onclick="removeContactMSG()">
                    <asp:label ID="Label2" runat="server" text="Användare borttagen!"></asp:label>
                    <div>
                        <asp:Label runat="server" Text="Klicka här för att ta bort meddelandet"></asp:Label>
                    </div>
                </div>
                </asp:placeholder>
            <asp:ValidationSummary ID="ValidationSum" ValidationGroup="ValidationSum" runat="server" />
            <asp:ValidationSummary ID="ValidationSumUpdate" ValidationGroup="ValidationSumUpdate" runat="server" />
            <asp:ListView ID="ContactListView" runat="server"
                ItemType="WebApplication4.Model.Contact"
                SelectMethod="ContactListView_GetData"
                InsertMethod="ContactListView_InsertItem"
                UpdateMethod="ContactListView_UpdateItem"
                DeleteMethod="ContactListView_DeleteItem"
                DataKeyNames="ContactId"
                InsertItemPosition="FirstItem">
                <LayoutTemplate>
                    <table class="grid">
                        <tr>
                            <th>
                                Förnamn
                            </th>
                            <th>
                                Efternamn
                            </th>
                            <th>
                                Emailadress
                            </th>
                            <th>
                            </th>
                        </tr>
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                    </table>
                    <asp:DataPager ID="Datapager" runat="server" PageSize="10000">
                        <Fields>
                            <asp:NextPreviousPagerField />
                            <asp:NumericPagerField />
                            <asp:NextPreviousPagerField />
                        </Fields>
            </asp:DataPager>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <%#: Item.FirstName %>
                        </td>
                        <td>
                            <%#: Item.LastName %>
                        </td>
                        <td>
                            <%#: Item.EmailAddress %>
                        </td>
                        <td class="command">
                            <asp:LinkButton runat="server" CommandName="Delete" Text="Ta bort" CausesValidation="false" OnClientClick='<%# String.Format("return confirm(\"Ta bort namnet {0}?\")", Item.FirstName) %>' />/>
                            <asp:LinkButton runat="server" CommandName="Edit" Text="Redigera" CausesValidation="false" />
                        </td>
                    </tr>
                </ItemTemplate>
                <EmptyDataTemplate>
                    <table class="grid">
                        <tr>
                            <td>
                                Kunduppgifter saknas.
                            </td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                <asp:RequiredFieldValidator ID="Validate1" Display="Dynamic" Text="*" runat="server" ControlToValidate="Förnamn" ErrorMessage="Du måste fylla i förnamn fältet." ValidationGroup="ValidationSum"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="Validate2" Display="Dynamic" Text="*" runat="server" ControlToValidate="Efternamn" ErrorMessage="Du måste fylla i efternamn fältet." ValidationGroup="ValidationSum"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="Validate3" Display="Dynamic" Text="*" runat="server" ControlToValidate="Emailadress" ErrorMessage="Du måste fylla i email fältet." ValidationGroup="ValidationSum"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="Validate4" Display="Dynamic" Text="*" runat="server" ControlToValidate="Emailadress" ErrorMessage="Email innehåller otillåtna tecken." ValidationExpression="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?" ValidationGroup="ValidationSum"></asp:RegularExpressionValidator>
                    <tr>
                        <td>
                            <asp:TextBox ID="Förnamn" runat="server" Text='<%# BindItem.FirstName %>' ValidationGroup="ValidationSum"/>
                        </td>
                        <td>
                            <asp:TextBox ID="Efternamn" runat="server" Text='<%# BindItem.LastName %>' ValidationGroup="ValidationSum"/>
                        </td>
                        <td>
                            <asp:TextBox ID="Emailadress" runat="server" Text='<%# BindItem.EmailAddress %>' ValidationGroup="ValidationSum"/>
                        </td>
                        <td>
                            <asp:LinkButton runat="server" CommandName="Insert" ValidationGroup="ValidationSum" Text="Lägg till" />
                            <asp:LinkButton runat="server" CommandName="Cancel" Text="Rensa" CausesValidation="false" />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <EditItemTemplate>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Förnamn" ErrorMessage="Du måste fylla i förnamn fältet2." ValidationGroup="ValidationSumUpdate"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Efternamn" ErrorMessage="Du måste fylla i efternamn fältet2." ValidationGroup="ValidationSumUpdate"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Emailadress" ErrorMessage="Du måste fylla i email fältet2." ValidationGroup="ValidationSumUpdate"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ControlToValidate="Emailadress" ErrorMessage="Email innehåller otillåtna tecken2." ValidationExpression="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?" ValidationGroup="ValidationSumUpdate"></asp:RegularExpressionValidator>
                    <tr>
                        <td>
                            <asp:TextBox ID="Förnamn" runat="server" Text='<%# BindItem.FirstName %>' ValidationGroup="ValidationSumUpdate" />
                        </td>
                        <td>
                            <asp:TextBox ID="Efternamn" runat="server" Text='<%# BindItem.LastName %>'  ValidationGroup="ValidationSumUpdate"/>
                        </td>
                        <td>
                            <asp:TextBox ID="Emailadress" runat="server" Text='<%# BindItem.EmailAddress %>'  ValidationGroup="ValidationSumUpdate" />
                        </td>
                        <td>
                            <asp:LinkButton runat="server" CommandName="Update" Text="Spara"  ValidationGroup="ValidationSumUpdate"/>
                            <asp:LinkButton runat="server" CommandName="Cancel" Text="Avbryt" CausesValidation="false" />
                        </td>
                    </tr>
                </EditItemTemplate>
            </asp:ListView>
            </form>
        </div>
    </div>
<script src="Scripts/script.js"></script>
 
</body>
</html>