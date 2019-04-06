<%@ Page Title="" Language="C#" MasterPageFile="./MasterPage.master" AutoEventWireup="true" CodeFile="documentation.aspx.cs" Inherits="documentation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="heading1">Documentation</h2>
                    <p>Here you can find the documentation for all our products.</p>
                     <div class="col-md-10 p-none">
                    <div class="docfordiv">
                        <div class="col-md-5">
                            <label>Product</label>
                            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                                <asp:ListItem>Air - cooled Condensing Unit</asp:ListItem>
							    <asp:ListItem>Water - cooled Condensing unit</asp:ListItem>
							    <asp:ListItem>Rack Refrigeration System</asp:ListItem>
                                <asp:ListItem>Screw Refrigeration System</asp:ListItem>
                                <asp:ListItem>Dry Cooler</asp:ListItem>
                                <asp:ListItem>Air Cooled Cubical Unit</asp:ListItem>
							    <asp:ListItem>Dual Discharge Evaporator</asp:ListItem>
							    <asp:ListItem>Angular type Unit Cooler</asp:ListItem>
							    <asp:ListItem>Air Cooler Glycol Evaporator</asp:ListItem>
							    <asp:ListItem>Blast Freezer</asp:ListItem>
							    <asp:ListItem>Blast Ciller</asp:ListItem>
                                <asp:ListItem>Product Cooler</asp:ListItem>
							    <asp:ListItem>Down Throw Product Cooler</asp:ListItem>
							    <asp:ListItem>Blast Freezer</asp:ListItem>
							    <asp:ListItem>Blast Ciller</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-5">
                            <label>Type of Brochure</label>
                            <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server">
                                <asp:ListItem>Brochure</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-2 mt-xs">
                            <a class="btn btn1 btn-primary mt-lg" href="#" style="width: 100%">Search</a>
                        </div>
                    </div>
                    </div>
                    <div class="doclist">
                        <div>
                            <i class="fa fa-file-pdf-o"></i>
                            <span class="mt-sm">File Name: Air - cooled Condensing Unit</span><br>
                            <span>File Type: PDF</span>
                            <a href="#" class="btn btn1 btn-primary">Download</a>
                        </div>
                        <div>
                            <i class="fa fa-file-pdf-o"></i>
                            <span class="mt-sm">File Name: Air - cooled Condensing Unit</span><br>
                            <span>File Type: PDF</span>
                            <a href="#" class="btn btn1 btn-primary">Download</a>
                        </div>
                        <div>
                            <i class="fa fa-file-pdf-o"></i>
                            <span class="mt-sm">File Name: Air - cooled Condensing Unit</span><br>
                            <span>File Type: PDF</span>
                            <a href="#" class="btn btn1 btn-primary">Download</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

