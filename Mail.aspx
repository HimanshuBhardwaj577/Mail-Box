<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mail.aspx.cs" EnableEventValidation="false" ValidateRequest="false" Inherits="Video.Mail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mail Page</title>
      <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <style>
        body {
            background-image: url('https://payload.cargocollective.com/1/18/588617/12052439/Clutter_plane7.gif');
            position: center;
        }

        .card {
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            transition: 0.3s;
            width: 100%;
        
        }

            .card:hover {
                box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
            }

        .container {
            padding: 2px 16px;
            position:center;
            
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="modal fade" id="successs" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="position: absolute; top: 8px; right: 16px; font-size: 18px;" role="document">
                <div class="modal-content">
                    <div class="modal-body" style="background-color: aquamarine; color: blue;">
                        <i class='fas fa-bell' style='font-size: 24px'>&nbsp;&nbsp;Mail sent</i>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="errorr" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="position: absolute; top: 8px; right: 16px; font-size: 18px;" role="document">
                <div class="modal-content">
                    <div class="modal-body" style="background-color: antiquewhite; color: blue">
                        <i class='fas fa-bell' style='font-size: 24px'>&nbsp;&nbsp;Sorry Something Issue</i>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="mailbutton" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="position: absolute; top: 8px; right: 16px; font-size: 18px;" role="document">
                <div class="modal-content">
                    <div class="modal-body" style="background-color: antiquewhite; color: blue">
                         <asp:Button ID="Button3" OnClick="gmail_Click" class="form-control" CssClass="btn btn-primary" runat="server" Text="Gmail" />
                    <asp:Button ID="Button4" OnClick="outlook_Click" class="form-control" CssClass="btn btn-danger" runat="server" Text="Outlook" />
                    <br />
                    <hr />
                    </div>
                </div>
            </div>
        </div>
         <div class="modal fade" id="fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="position: absolute; top: 8px; right: 16px; font-size: 18px;" role="document">
                <div class="modal-content">
                    <div class="modal-body" style="background-color: antiquewhite; color: blue">
                        <i class='fas fa-bell' style='font-size: 24px'>&nbsp;&nbsp;Click Clear Text Button</i>
                    </div>
                </div>
            </div>
        </div>
        <div class="container" >
            <div class="card">
                <div class="card-body">
                    <br />
                    <hr />
                    <h4>Mail Box</h4>
                    <hr />
                    <form>
                    <div class="form-group">
                        <asp:TextBox ID="TextBox1" class="form-control" AutoComplete="off" Placeholder="Send To Email Id!" runat="server"></asp:TextBox>
                    </div>
                    <hr />
                    <div class="form-group">
                        <asp:TextBox ID="TextBox2" class="form-control" AutoComplete="off" Placeholder="Mail Subject!" runat="server"></asp:TextBox>
                    </div>
                    <hr />
                    <div class="form-group">
                        <asp:TextBox ID="TextBox4" Height="100px" TextMode="MultiLine" class="form-control" AutoComplete="off" Placeholder="Message !" runat="server"></asp:TextBox>
                    </div>
                    <hr />
                    <div class="form-group">
                        <asp:TextBox ID="TextBox5" ReadOnly="true" Height="100px" Visible="false" Text="Clear Text Than Refresh Your Page" TextMode="MultiLine" class="form-control" AutoComplete="off" Placeholder="Message !" runat="server"></asp:TextBox>
                    </div>
                    <hr />
                    <div class="form-group">
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </div>
                    <hr />
                    <div class="form-group">
                        <asp:TextBox ID="TextBox6" Height="100px" TextMode="MultiLine" class="form-control" AutoComplete="off" Placeholder="Enter Policy Id Here!" runat="server"></asp:TextBox>
                    </div>
                    <hr />
                    <asp:Button ID="Button2" OnClick="lbEdit_Click" class="form-control" CssClass="btn btn-primary" runat="server" Text="send" />
                    <asp:Button ID="Button1" OnClick="lbEdi_Click" class="form-control" CssClass="btn btn-danger" runat="server" Text="Clear Text" />
                    <br />
                    <hr />
                </div>
                </form>
                <div class="modal fade" id="U" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" style="position: absolute; top: 8px; right: 16px; font-size: 18px;" role="document">
                        <div class="modal-content">
                            <div class="modal-body" style="background-color: darkcyan; color: whitesmoke;">
                                <div class="container">
                                    <div class="card" id="example2" runat="server" style="width: 100%; scroll-behavior: auto">
                                        <asp:Repeater ID="Repeater1" runat="server">
                                            <HeaderTemplate>
                                                <table id="customers" style="font-family: Arial, Helvetica, sans-serif; border-collapse: collapse; width: 100%;">
                                                    <thead>
                                                        <tr>
                                                            <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Segment</th>
                                                            <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Country</th>
                                                            <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Product</th>
                                                            <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Sale Price</th>
                                                            <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Gross Sales</th>
                                                            <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Sales</th>
                                                            <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Profit</th>
                                                            <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Date</th>
                                                            <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Policy Id</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                            </HeaderTemplate>

                                            <ItemTemplate>
                                                <tr>
                                                    <td style="border: 1px solid #ddd; padding: 8px; text-align: center;"><%# Eval("Segment") %></td>
                                                    <td style="border: 1px solid #ddd; padding: 8px; text-align: center;"><%# Eval("Country") %></td>
                                                    <td style="border: 1px solid #ddd; padding: 8px; text-align: center;"><%# Eval("Product") %></td>
                                                    <td style="border: 1px solid #ddd; padding: 8px; text-align: center;"><%# Eval("Sale_Price") %></td>
                                                    <td style="border: 1px solid #ddd; padding: 8px; text-align: center;"><%# Eval("Gross_Sales") %></td>
                                                    <td style="border: 1px solid #ddd; padding: 8px; text-align: center;"><%# Eval("sales") %></td>
                                                    <td style="border: 1px solid #ddd; padding: 8px; text-align: center;"><%# Eval("Profit") %></td>
                                                    <td style="border: 1px solid #ddd; padding: 8px; text-align: center;"><%# Eval("Date_") %></td>
                                                    <td style="border: 1px solid #ddd; padding: 8px; text-align: center;"><%# Eval("Policy_Id") %></td>
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </tbody>
                                                            <tfoot>
                                                                <tr>
                                                                    <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Segment</th>
                                                                    <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Country</th>
                                                                    <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Product</th>
                                                                    <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Sale Price</th>
                                                                    <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Gross Sales</th>
                                                                    <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Sales</th>
                                                                    <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Profit</th>
                                                                    <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Date</th>
                                                                    <th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #4CAF50; color: white;">Policy Id</th>
                                                                </tr>
                                                            </tfoot>
                                                </table>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                        <hr />
                                        <p style="text-align: center">&copy;&nbsp;Himanshu Bhardwaj</p>
                                        <hr />
                                        <br />

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="emptyy" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="position: absolute; top: 8px; right: 16px; font-size: 18px;" role="document">
                <div class="modal-content">
                    <div class="modal-body" style="background-color: antiquewhite; color: blue">
                        <i class='fas fa-bell' style='font-size: 24px'>&nbsp;&nbsp;Please Fill All Textboxes</i>
                    </div>
                </div>
            </div>
        </div>
        
        <script>
            function emtytext() {
                $('#emptyy').modal('show');
            }

            setTimeout(function () {
                $('#emptyy').modal('hide')
            }, 5000);

        </script>
        <script>
            function fadee() {
                $('#fade').modal('show');
            }

            setTimeout(function () {
                $('#fade').modal('hide')
            }, 5000);

        </script>
        <script>
            function sending() {
                $('#successs').modal('show');
            }

            setTimeout(function () {
                $('#successs').modal('hide')
            }, 5000);

        </script>
        <script>
            function catching() {
                $('#errorr').modal('show');
            }

            setTimeout(function () {
                $('#errorr').modal('hide')
            }, 5000);


        </script>
         <script>
             function mailing() {
                 $('#mailbutton').modal('show');
             }
             

         </script>
    </form>
</body>
</html>
