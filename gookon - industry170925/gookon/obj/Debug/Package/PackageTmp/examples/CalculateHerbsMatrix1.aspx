<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CalculateHerbsMatrix1.aspx.vb" Inherits="gookon.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <asp:Button ID="btnCal" runat="server" Height="51px" Text="Calculate" 
        Width="80px" /><br />
        <asp:Label ID="Label1" runat="server"></asp:Label>
    <br />
    </div>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" EmptyDataText="沒有資料錄可顯示。">
        <Columns>
            <asp:BoundField DataField="mid" HeaderText="mid" SortExpression="mid" />
            <asp:BoundField DataField="scount" HeaderText="scount" 
                SortExpression="scount" />
            <asp:BoundField DataField="mname" HeaderText="mname" SortExpression="mname" />
            <asp:BoundField DataField="s1" HeaderText="s1" SortExpression="s1" />
            <asp:BoundField DataField="s2" HeaderText="s2" SortExpression="s2" />
            <asp:BoundField DataField="s3" HeaderText="s3" SortExpression="s3" />
            <asp:BoundField DataField="s4" HeaderText="s4" SortExpression="s4" />
            <asp:BoundField DataField="s5" HeaderText="s5" SortExpression="s5" />
            <asp:BoundField DataField="img" HeaderText="img" SortExpression="img" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:medicineConnectionString1 %>" 
        ProviderName="<%$ ConnectionStrings:medicineConnectionString1.ProviderName %>" 
        SelectCommand="SELECT [mid], [scount], [mname], [s1], [s2], [s3], [s4], [s5], [img] FROM [distinctMed]">
    </asp:SqlDataSource>
    </form>
</body>
</html>
