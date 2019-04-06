<%@ Page Title="" Language="C#" MasterPageFile="./MasterPage.master" AutoEventWireup="true" CodeFile="cold-room.aspx.cs" Inherits="cold_room" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<section class="bannersection">
    <img src="images/application/cold-room.jpg" />
</section>
<section class="prodetailpad">
    <div class="container">
        <div class="row">
			<div class="col-md-8">
                <p>Blue Cold provides refrigeration equipment for cold rooms for medium & low temperature suitable for various applications like:</p>
                <table class="table table-bordered">
                    <tr>
                        <th>Application</th>
                        <th>Temperature</th>
                    </tr>
                    <tr>
                        <td>Fruits & Vegetables</td>
                        <td>2 to 4 Deg C</td>
                    </tr>
                    <tr>
                        <td>Dairy</td>
                        <td>0 to 5 Deg C</td>
                    </tr>
                    <tr>
                        <td>Pharmaceutical</td>
                        <td>-15 to 10 Deg C</td>
                    </tr>
                    <tr>
                        <td>Mushroom</td>
                        <td>15 to 18 Deg C</td>
                    </tr>
                    <tr>
                        <td>Blood Bank</td>
                        <td>-20 to 0 Deg C</td>
                    </tr>
                    <tr>
                        <td>Ready to Eat Food Products</td>
                        <td>2 to 10 Deg C</td>
                    </tr>
                    <tr>
                        <td>Flower Storage</td>
                        <td>8 to 12 Deg C</td>
                    </tr>
                </table>
            </div>
            <div class="col-md-4">
                <div class="clientlistdiv">
                    <h2>Customer Testimonial</h2>
                    <div class="clientinpad">
                        <img src="images/client1.jpg" />
                        <img src="images/client2.jpg" />
                        <img src="images/client3.jpg" />
                    </div>
                </div>

            </div>
            <div class="col-md-12 mt-xlg">
                <h2><b>Blue Cold Products</b></h2>
                <div class="col-md-3">
                    <div class="prodiv">
                        <div class="proimgdiv">
                            <a href="air-cooled-condensing-unit.aspx"><img src="images/air-cooled-condensing-unit.jpg"></a>
                        </div>
                        <div class="protxtdiv">
                            <h3 class="mb-none"><a href="air-cooled-condensing-unit.aspx"> Air cooled condensing unit</a></h3>     
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="prodiv">
                        <div class="proimgdiv">
                            <a href="water-cooled-condensing-unit.aspx"><img src="images/water-cooled-condensing-unit.jpg"></a>
                        </div>
                        <div class="protxtdiv">
                            <h3 class="mb-none"><a href="water-cooled-condensing-unit.aspx"> Water cooled condensing unit</a></h3>     
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="prodiv">
                        <div class="proimgdiv">
                            <a href="dual-discharge-evaporator.aspx"><img src="images/slim-line-dual-discharge.jpg"></a>
                        </div>
                        <div class="protxtdiv">
                            <h3 class="mb-none"><a href="dual-discharge-evaporator.aspx"> Slim line dual discharge</a></h3>     
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="prodiv">
                        <div class="proimgdiv">
                            <a href="air-cooler-cubical-unit.aspx"><img src="images/evaporator.jpg"></a>
                        </div>
                        <div class="protxtdiv">
                            <h3 class="mb-none"><a href="air-cooler-cubical-unit.aspx"> Evaporator</a></h3>     
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</asp:Content>

