<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="OrderSubCategory.aspx.cs" Inherits="Admin_OrderSubCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


    <link href="css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="js/jquery-ui.js" type="text/javascript"></script>
    <script src="../js/Ecom.js" type="text/javascript"></script>

    <style>
        #sortable1, #sortable2, #sortable3 {
            list-style-type: none;
            margin: 0;
            float: left;
            margin-right: 10px;
            background: #fff none repeat scroll 0 0;
            border: 2px solid #ccc;
            padding: 5px;
            width: 430px;
            min-height: 300px;
        }

            #sortable1 li, #sortable2 li, #sortable3 li {
                margin: 5px;
                padding: 5px;
                font-size: 1.2em;
                width: 400px;
                cursor: pointer
            }
    </style>
    <script>
        $(function () {
            $("ul.droptrue").sortable({
                connectWith: "ul"
            });

            $("ul.dropfalse").sortable({
                connectWith: "ul",
                dropOnEmpty: false,


            });

            $("#sortable1").disableSelection();
        });
        $(document).ready(function () {

        });
    </script>
    <script>
        $(document).ready(function () {


            $("[id*=ddl_category]").change(function () {
                PopulateCategory();
            });
            var category = "";
            $("#Update").click(function () {

                $.each($('#sortable1').find('li'), function () {
                    if (category == "") {
                        category = category + $(this).text();
                    }
                    else {
                        category = category + "," + $(this).text();
                    }
                });

                ArrengeCategory(category);
            });
        });
        function ArrengeCategory(category) {
            var subcategory = $('#<%=ddl_category.ClientID %> option:selected').val();
            var apikey = getKey("apiKey");
            var url = '<%= ResolveUrl("~/Backend.asmx/ARRANGESUBCATEGORY") %>';
            var parameter = { "category": category, "apiKey": apikey, "subcategory": subcategory };
            $.ajax({
                type: 'POST',
                url: url,
                data: JSON.stringify(parameter),
                contentType: 'application/json; charset=utf-8',
                dataType: "json",
                success: function (data) {
                    if (data.d == 0) {
                        alert("Sub Category Arranged Successfully");
                        PopulateCategory();

                    }
                    else {
                        alert("Something went wrong ! please try again later ..");
                    }
                },
                error: function (error) {
                    alert('error; ' + eval(error));
                }

            });
        }
        function PopulateCategory() {


            var apikey = getKey("apiKey");
            var subcategory = $('#<%=ddl_category.ClientID %> option:selected').val();
            var url = '<%= ResolveUrl("~/Backend.asmx/SubproductInOrder") %>';
            var parameter = { "subcategory": subcategory, "apiKey": apikey };
            $.ajax({
                type: 'POST',
                url: url,
                data: JSON.stringify(parameter),
                contentType: 'application/json; charset=utf-8',
                dataType: "json",
                success: function (data) {
                    var str = "";
                    for (var i = 0; i < data.d.length; i++) {
                        str = str + "<li class='ui-state-default'>" + data.d[i] + "</li>";
                    }
                    $("#sortable1").html(str);
                },
                error: function (error) {
                    alert('error; ' + eval(error));
                }

            });
        }


    </script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <ul class="breadcrumb">
        <li class="active">Arrange Product in order</li>
    </ul>
    <div class="well">
        <label>
            Select Product Category</label>
        <asp:DropDownList ID="ddl_category" runat="server">
        </asp:DropDownList>

        <br />
        <ul id="sortable1" class="droptrue">
        </ul>

        <br style="clear: both">
        <br style="clear: both">
        <input type="button" value="Update Order" id="Update" class="btn btn-primary" />
        <br style="clear: both">
    </div>

</asp:Content>

