<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="ProductOrder.aspx.cs" Inherits="Admin_ProductOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <link href="css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="js/jquery-ui.js" type="text/javascript"></script>
    <script src="../js/Ecom.js" type="text/javascript"></script>
    
    <style>
  #sortable1, #sortable2, #sortable3 { list-style-type: none; margin: 0; float: left; margin-right: 10px;  background: #fff none repeat scroll 0 0;
    border: 2px solid #ccc; padding: 5px; width: 630px; min-height:300px;}
  #sortable1 li, #sortable2 li, #sortable3 li { margin: 5px; padding: 5px; font-size: 1.2em; width: 600px; cursor:pointer }
  span{ margin-left:20px;}
  #progress1,#progress2{ display:none;}
  .ui-dialog-buttonpane{display:none}
  .ui-dialog-titlebar-close{display:none;}
  .ui-dialog
  {
      display: block;
    height: auto;
    left: 136.5px;
    position: fixed;
    top: 77.5px;
    width: 370px !important;
    z-index: 180;
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
              //start: function (event, ui) { debugger; alert($(ui.item[0]).text()); $(ui.item[0]).sortable("cancel"); }
          });

          $("#sortable1").disableSelection();
      });
      $(document).ready(function () {
         
      });
  </script>
  <script>
      $(document).ready(function () {
          //PopulateProducts();
          PopulateProduct();
          $("#ddl_product").change(function () {
              //PopulatePrevTags($("#ddl_product option:selected").val());
          });
          var product = "";
          $("#Update").click(function () {
              $("#progress1").fadeIn();
              $.each($('#sortable1').find('li'), function () {
                  if (product == "") {
                      product = product + $(this).attr("id");
                  }
                  else {
                      product = product + "," + $(this).attr("id");
                  }
              });
              $("#dialog-message").dialog({
                  modal: true,
                  buttons: {
                      Ok: function () {
                          $(this).dialog("close");
                      }
                  }
              });
              ArrengeProduct(product);
          });
      });
      function ArrengeProduct(product) {
          var apikey = getKey("apiKey");
          var url = '<%= ResolveUrl("~/Backend.asmx/ArrengeProduct") %>';
          var parameter = { "product": product, "apiKey": apikey };
          $.ajax({
              type: 'POST',
              url: url,
              data: JSON.stringify(parameter),
              contentType: 'application/json; charset=utf-8',
              dataType: "json",
              success: function (data) {
                  if (data.d == 0) {
                      $("#progress1").fadeOut();
                      $("#progress2").text("Product Arrenged Successfully");
                      $("#progress2").fadeIn();
                      $("#dialog-message").dialog("close");
                      PopulateProduct();

                  }
                  else {
                      $("#progress1").fadeOut();
                      $("#progress2").fadeIn();
                      $("#progress2").text("Something went wrong ! please try again later ..");
                  }
              },
              error: function (error) {
                  alert('error; ' + eval(error));
              }

          });
      }
      function PopulateProduct() {
          var apikey = getKey("apiKey");

          var url = '<%= ResolveUrl("~/Backend.asmx/GetProductInOrder") %>';
          var parameter = { "apiKey": apikey };
          $.ajax({
              type: 'POST',
              url: url,
              data: JSON.stringify(parameter),
              contentType: 'application/json; charset=utf-8',
              dataType: "json",
              success: function (data) {
                  var str = "";
                  for (var i = 0; i < data.d.length; i++) {
                      str = str + "<li id='" + data.d[i].id + "' class='ui-state-default'><img src='http://edilyst.com/" + data.d[i].image + "'/><span>" + data.d[i].name + "</span></li>";
                  }
                  $("#sortable1").html(str);
              },
              error: function (error) {
                  alert('error; ' + eval(error));
              }

          });
      }
      function PopulatePrevTags(productId) {
          var apikey = getKey("apiKey");
          var url = '<%= ResolveUrl("~/Backend.asmx/GetPrevTags") %>';
          var parameter = { "productId": productId, "apiKey": apikey };
          $.ajax({
              type: 'POST',
              url: url,
              data: JSON.stringify(parameter),
              contentType: 'application/json; charset=utf-8',
              dataType: "json",
              success: function (data) {
                  var str = "";
                  if (data.d != "") {
                      var str1 = data.d[0].split(",");
                      for (var i = 0; i < str1.length; i++) {
                          str = str + "<li class='ui-state-default'>" + str1[i] + "</li>";
                      }
                  }
                  $("#sortable3").html(str);
              },
              error: function (error) {
                  alert('error; ' + eval(error));
              }

          });
      }
      function PopulateProducts() {
          var apikey = getKey("apiKey");
          var url = '<%= ResolveUrl("~/Backend.asmx/PProduct") %>';
          var parameter = { "apiKey": apikey };
          $.ajax({
              type: 'POST',
              url: url,
              data: JSON.stringify(parameter),
              contentType: 'application/json; charset=utf-8',
              dataType: "json",
              success: function (data) {
                  var str = "";
                  for (var i = 0; i < data.d.length; i++) {
                      str = str + "<option value='" + data.d[i].id + "'>" + data.d[i].name + "</option>";
                  }
                  $("#ddl_product").html(str);
              },
              error: function (error) {
                  alert('error; ' + eval(error));
              }

          });
      }
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<ul class="breadcrumb">
        <li class="active">Arrenge Product in order</li>
    </ul>
    <div class="well">
    <div id="dialog-message" title="Update in progress"><div id="progress2">Product order updated !!</div>
    <div id="progress1"><img src="../images/loader.GIF" /> <span>Updating product order ...</span></div>
  
</div>
         <ul id="sortable1" class="droptrue">
  
</ul>
  
<br style="clear:both">
<br style="clear:both">
<input type="button" value="Update Order" id="Update" class="btn btn-primary"/>
<br style="clear:both">
    </div>
</asp:Content>

