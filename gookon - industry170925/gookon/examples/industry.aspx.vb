Imports System.Data.Sql
Imports System.Data.SqlClient

Public Class industry
    Inherits System.Web.UI.Page
    Dim icount As Integer = 0
    Dim str As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles btnQry.Click

        str = "SELECT * FROM [ic] "

        If icount = 0 Then
            If a1.Checked Then
                Addcondwhere(a1)
                icount = icount + 1
                Clearchk(a1)
            End If
            If a2.Checked Then
                If icount = 0 Then
                    Addcondwhere(a2)
                Else
                    AddcondOr(a2)
                End If
                icount = icount + 1
                Clearchk(a2)
            End If
            If a3.Checked Then
                If icount = 0 Then
                    Addcondwhere(a3)
                Else
                    AddcondOr(a3)
                End If
                icount = icount + 1
                Clearchk(a3)
            End If
            If a4.Checked Then
                If icount = 0 Then
                    Addcondwhere(a4)
                Else
                    AddcondOr(a4)
                End If
                icount = icount + 1
                Clearchk(a4)
            End If

            If b1.Checked Then
                If icount = 0 Then
                    Addcondwhere(b1)
                Else
                    AddcondOr(b1)
                End If
                icount = icount + 1
                Clearchk(b1)
            End If
            'If b2.Checked Then
            '    If icount = 0 Then
            '        Addcondwhere(b2)
            '    Else
            '        AddcondOr(b2)
            '    End If
            '    icount = icount + 1
            '    Clearchk(b2)
            'End If
            'If b3.Checked Then
            '    If icount = 0 Then
            '        Addcondwhere(b3)
            '    Else
            '        AddcondOr(b3)
            '    End If
            '    icount = icount + 1
            '    Clearchk(b3)
            'End If

            If c1.Checked Then
                If icount = 0 Then
                    Addcondwhere(c1)
                Else
                    AddcondOr(c1)
                End If
                icount = icount + 1
                Clearchk(c1)
            End If
            If c2.Checked Then
                If icount = 0 Then
                    Addcondwhere(c2)
                Else
                    AddcondOr(c2)
                End If
                icount = icount + 1
                Clearchk(c2)
            End If
            'If c3.Checked Then
            '    If icount = 0 Then
            '        Addcondwhere(c3)
            '    Else
            '        AddcondOr(c3)
            '    End If
            '    icount = icount + 1
            '    Clearchk(c3)
            'End If

            If d1.Checked Then
                If icount = 0 Then
                    Addcondwhere(d1)
                Else
                    AddcondOr(d1)
                End If
                icount = icount + 1
                Clearchk(d1)
            End If
            'If d2.Checked Then
            '    If icount = 0 Then
            '        Addcondwhere(d2)
            '    Else
            '        AddcondOr(d2)
            '    End If
            '    icount = icount + 1
            '    Clearchk(d2)
            'End If
            'If d3.Checked Then
            '    If icount = 0 Then
            '        Addcondwhere(d3)
            '    Else
            '        AddcondOr(d3)
            '    End If
            '    icount = icount + 1
            '    Clearchk(d3)
            'End If
            'If d4.Checked Then
            '    If icount = 0 Then
            '        Addcondwhere(d4)
            '    Else
            '        AddcondOr(d4)
            '    End If
            '    icount = icount + 1
            '    Clearchk(d4)
            'End If
            'If d5.Checked Then
            '    If icount = 0 Then
            '        Addcondwhere(d5)
            '    Else
            '        AddcondOr(d5)
            '    End If
            '    icount = icount + 1
            '    Clearchk(d5)
            'End If
            'If d6.Checked Then
            '    If icount = 0 Then
            '        Addcondwhere(d6)
            '    Else
            '        AddcondOr(d6)
            '    End If
            '    icount = icount + 1
            '    Clearchk(d6)
            'End If
            'If d7.Checked Then
            '    If icount = 0 Then
            '        Addcondwhere(d7)
            '    Else
            '        AddcondOr(d7)
            '    End If
            '    icount = icount + 1
            '    Clearchk(d7)
            'End If

            If e1.Checked Then
                If icount = 0 Then
                    Addcondwhere(e1)
                Else
                    AddcondOr(e1)
                End If
                icount = icount + 1
                Clearchk(e1)
            End If
            'If e2.Checked Then
            '    If icount = 0 Then
            '        Addcondwhere(e2)
            '    Else
            '        AddcondOr(e2)
            '    End If
            '    icount = icount + 1
            '    Clearchk(e2)
            'End If
            'If e3.Checked Then
            '    If icount = 0 Then
            '        Addcondwhere(e3)
            '    Else
            '        AddcondOr(e3)
            '    End If
            '    icount = icount + 1
            '    Clearchk(e3)
            'End If

            If f1.Checked Then
                If icount = 0 Then
                    Addcondwhere(f1)
                Else
                    AddcondOr(f1)
                End If
                icount = icount + 1
                Clearchk(f1)
            End If
            'If f2.Checked Then
            '    If icount = 0 Then
            '        Addcondwhere(f2)
            '    Else
            '        AddcondOr(f2)
            '    End If
            '    icount = icount + 1
            '    Clearchk(f2)
            'End If
            'If f3.Checked Then
            '    If icount = 0 Then
            '        Addcondwhere(f3)
            '    Else
            '        AddcondOr(f3)
            '    End If
            '    icount = icount + 1
            '    Clearchk(f3)
            'End If
            'If f4.Checked Then
            '    If icount = 0 Then
            '        Addcondwhere(f4)
            '    Else
            '        AddcondOr(f4)
            '    End If
            '    icount = icount + 1
            '    Clearchk(f4)
            'End If
            'If f5.Checked Then
            '    If icount = 0 Then
            '        Addcondwhere(f5)
            '    Else
            '        AddcondOr(f5)
            '    End If
            '    icount = icount + 1
            '    Clearchk(f5)
            'End If

            If g1.Checked Then
                If icount = 0 Then
                    Addcondwhere(g1)
                Else
                    AddcondOr(g1)
                End If
                icount = icount + 1
                Clearchk(g1)
            End If
            'If g2.Checked Then
            '    If icount = 0 Then
            '        Addcondwhere(g2)
            '    Else
            '        AddcondOr(g2)
            '    End If
            '    icount = icount + 1
            '    Clearchk(g2)
            'End If
            'If g3.Checked Then
            '    If icount = 0 Then
            '        Addcondwhere(g3)
            '    Else
            '        AddcondOr(g3)
            '    End If
            '    icount = icount + 1
            '    Clearchk(g3)
            'End If

            If h1.Checked Then
                If icount = 0 Then
                    Addcondwhere(h1)
                Else
                    AddcondOr(h1)
                End If
                icount = icount + 1
                Clearchk(h1)
            End If
            'If h2.Checked Then
            '    If icount = 0 Then
            '        Addcondwhere(h2)
            '    Else
            '        AddcondOr(h2)
            '    End If
            '    icount = icount + 1
            '    Clearchk(h2)
            'End If

            'If i1.Checked Then
            '    If icount = 0 Then
            '        Addcondwhere(i1)
            '    Else
            '        AddcondOr(i1)
            '    End If
            '    icount = icount + 1
            '    Clearchk(i1)
            'End If
            'If i2.Checked Then
            '    If icount = 0 Then
            '        Addcondwhere(i2)
            '    Else
            '        AddcondOr(i2)
            '    End If
            '    icount = icount + 1
            '    Clearchk(i2)
            'End If
            'If i3.Checked Then
            '    If icount = 0 Then
            '        Addcondwhere(i3)
            '    Else
            '        AddcondOr(i3)
            '    End If
            '    icount = icount + 1
            '    Clearchk(i3)
            'End If

            'If j1.Checked Then
            '    If icount = 0 Then
            '        Addcondwhere(j1)
            '    Else
            '        AddcondOr(j1)
            '    End If
            '    icount = icount + 1
            '    Clearchk(j1)
            'End If
            'If j2.Checked Then
            '    If icount = 0 Then
            '        Addcondwhere(j2)
            '    Else
            '        AddcondOr(j2)
            '    End If
            '    icount = icount + 1
            '    Clearchk(j2)
            'End If
            If icount = 0 Then
                str = "SELECT * FROM [ic] where kind=''"
            Else
                str = str + " order by kind"
                If chkAll.Checked Then Clearchk(chkAll)
            End If
        End If

        Dim strSQLconnection As String = "Data Source=CHIAHUISHIH-PC\sqlexpress;Initial Catalog=industry;Integrated Security=True"
        Dim sqlConnection As New SqlConnection(strSQLconnection)
        Dim sqlCommand As New SqlCommand(str, sqlConnection)


        SqlDataSource1.SelectCommand = str
        SqlDataSource1.ConnectionString = strSQLconnection
        sqlConnection.Open()

        GridView1.DataBind()
        sqlConnection.Close()

    End Sub

    Sub Addcondwhere(number As CheckBox)
        str = str + " where kind='" + number.Text + "'"
    End Sub

    Sub AddcondOr(number As CheckBox)
        str = str + " or kind='" + number.Text + "'"
    End Sub

    Sub Clearchk(number As CheckBox)
        number.Checked = False
    End Sub
    Sub Addchk(number As CheckBox)
        number.Checked = True
    End Sub

    Protected Sub a4_CheckedChanged(sender As Object, e As EventArgs) Handles chkAll.CheckedChanged
        If chkAll.Checked Then
            Addchk(a1)
            Addchk(a2)
            Addchk(a3)
            Addchk(a4)
            Addchk(b1)
            'Addchk(b2)
            'Addchk(b3)
            Addchk(c1)
            Addchk(c2)
            'Addchk(c3)
            Addchk(d1)
            'Addchk(d2)
            'Addchk(d3)
            'Addchk(d4)
            'Addchk(d5)
            'Addchk(d6)
            'Addchk(d7)
            Addchk(e1)
            'Addchk(e2)
            'Addchk(e3)
            Addchk(f1)
            'Addchk(f2)
            'Addchk(f3)
            'Addchk(f4)
            'Addchk(f5)
            Addchk(g1)
            'Addchk(g2)
            'Addchk(g3)
            Addchk(h1)
            'Addchk(h2)
            'Addchk(i1)
            'Addchk(i2)
            'Addchk(i3)
            'Addchk(j1)
            'Addchk(j2)
        Else
            Clearchk(a1)
            Clearchk(a2)
            Clearchk(a3)
            Clearchk(a4)
            Clearchk(b1)
            'Clearchk(b2)
            'Clearchk(b3)
            Clearchk(c1)
            Clearchk(c2)
            'Clearchk(c3)
            Clearchk(d1)
            'Clearchk(d2)
            'Clearchk(d3)
            'Clearchk(d4)
            'Clearchk(d5)
            'Clearchk(d6)
            'Clearchk(d7)
            Clearchk(e1)
            'Clearchk(e2)
            'Clearchk(e3)
            Clearchk(f1)
            'Clearchk(f2)
            'Clearchk(f3)
            'Clearchk(f4)
            'Clearchk(f5)
            Clearchk(g1)
            'Clearchk(g2)
            'Clearchk(g3)
            Clearchk(h1)
            'Clearchk(h2)
            'Clearchk(i1)
            'Clearchk(i2)
            'Clearchk(i3)
            'Clearchk(j1)
            'Clearchk(j2)

        End If
    End Sub

    'Private Function a1() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function a2() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function a3() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function b1() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function b2() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function b3() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function c1() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function c2() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function c3() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function d1() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function d2() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function d3() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function d4() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function d5() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function d6() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function d7() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function e1() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function e2() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function e3() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function f1() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function f2() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function f3() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function f4() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function f5() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function g1() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function g3() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function g2() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function chkAll() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function SqlDataSource1() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function GridView1() As Object
    '    Throw New NotImplementedException
    'End Function

    'Private Function h1() As Object
    '    Throw New NotImplementedException
    'End Function

    
End Class