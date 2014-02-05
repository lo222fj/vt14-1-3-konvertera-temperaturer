<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="vt14_1_3_temperaturer.Default" ViewStateMode="Disabled" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Konvertera temperaturer</title>
    <link href="Content/Style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="main">
            <h1>
                <asp:Literal ID="header" runat="server">Konvertera temperaturer</asp:Literal></h1>
            <div id="content">
                <%--Temperaturfält--%>
                <div id=" tempDiv">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                    <%--Starttemperatur--%>
                    <asp:Panel ID="Panel1" CssClass="tempInputs" runat="server">
                        <asp:Label ID="StartTempLabel" runat="server"
                            CssClass="labels" Text="Starttemperatur:"
                            AssociatedControlID="StarttempTextBox"></asp:Label><br />
                        <asp:TextBox ID="StartTempTextBox" CssClass="inputs"
                            runat="server"></asp:TextBox>
                        <%--Validering--%>
                        <%--Ifyllda fält--%>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                            runat="server" ErrorMessage="Fyll i en starttemperatur"
                            ControlToValidate="StartTempTextBox" Text="*"
                            Display="Dynamic" CssClass="errorMessages">

                        </asp:RequiredFieldValidator>
                        <%--Heltal--%>
                        <asp:CompareValidator ID="CompareValidator1" runat="server"
                            ErrorMessage="Fyll i ett heltal lägre än sluttemperaturen."
                            Type="Integer" ControlToValidate="StartTempTextBox" Text="*"
                            ControlToCompare="StopTempTextBox" Operator="LessThan"
                            Display="Dynamic" CssClass="errorMessages"></asp:CompareValidator>
                    </asp:Panel>
                    <%--Sluttemperatur--%>
                    <asp:Panel ID="Panel2" CssClass="tempInputs" runat="server">
                        <asp:Label ID="StopTempLabel" runat="server"
                            CssClass="labels" Text="Sluttemperatur:"
                            AssociatedControlID="StopTempTextBox"></asp:Label><br />
                        <asp:TextBox ID="StopTempTextBox" CssClass="inputs"
                            runat="server"></asp:TextBox>
                        <%--Validering--%>
                        <%--Ifyllda fält--%>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                            runat="server" ErrorMessage="Fyll i en sluttemperatur"
                            ControlToValidate="StopTempTextBox" Text="*"
                            Display="Dynamic" CssClass="errorMessages">

                        </asp:RequiredFieldValidator>
                        <%--Heltal--%>
                        <asp:CompareValidator ID="CompareValidator2" runat="server"
                            ErrorMessage="Fyll i ett heltal högre än starttemperaturen" Text="*"
                            ControlToValidate="StopTempTextBox" ControlToCompare="StartTempTextBox"
                            Operator="GreaterThan" Type="Integer" Display="Dynamic"
                            CssClass="errorMessages"></asp:CompareValidator>
                    </asp:Panel>

                    <%--Temperatursteg--%>
                    <asp:Panel ID="Panel3" CssClass="tempInputs" runat="server">
                        <asp:Label ID="TempDifferenceLabel" runat="server"
                            CssClass="labels" Text="Temperatursteg:"
                            AssociatedControlID="TempDifferenceTextBox"></asp:Label><br />
                        <asp:TextBox ID="TempDifferenceTextBox" CssClass="inputs"
                            runat="server"></asp:TextBox>
                        <%--Validering--%>
                        <%--Ifyllda fält--%>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                            runat="server" ErrorMessage="Fyll i ett temperatursteg"
                            ControlToValidate="TempDifferenceTextBox" Text="*"
                            Display="Dynamic" CssClass="errorMessages"></asp:RequiredFieldValidator>
                        <%--Intervall 1-100--%>
                        <asp:RangeValidator ID="RangeValidator1" runat="server"
                            ErrorMessage="Mata in ett temperatursteg mellan 1 och 100"
                            ControlToValidate="TempDifferenceTextBox" Display="Dynamic"
                            Text="*" CssClass="errorMessages" MaximumValue="100"
                            MinimumValue="1" Type="Integer"></asp:RangeValidator>
                    </asp:Panel>
                </div>
                <%--Konvertering, radioknappar--%>
                <div id="convertingDiv">
                    <asp:Label ID="convertingLabel" runat="server" Text="Typ av konvertering"></asp:Label>
                    <asp:RadioButton ID="RadioButton1" CssClass="radioButtons"
                        runat="server" Text="Celcius till Farenheit" GroupName="ChooseTempScale" Checked="True" />
                    <asp:RadioButton ID="RadioButton2" CssClass="radioButtons"
                        runat="server" Text="Farenheit to Celcius" GroupName="ChooseTempScale" />
                </div>
                <p>
                    <asp:Button ID="sendButton" runat="server" Text="Konvertera" ViewStateMode="Enabled" OnClick="sendButton_Click" />
                </p>
            </div>
            <asp:Panel ID="TempPresentationPanel" runat="server">
                <asp:Table ID="Table1" runat="server" Visible="true">
                </asp:Table>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
