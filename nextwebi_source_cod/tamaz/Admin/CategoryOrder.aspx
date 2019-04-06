<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="CategoryOrder.aspx.cs" Inherits="Admin_CategoryOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <link href="css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="js/jquery-ui.js" type="text/javascript"></script>
    <script src="../js/Ecom.js" type="text/javascript"></script>
    
    <style>
  #sortable1, #sortable2, #sortable3 { list-style-type: none; margin: 0; float: left; margin-right: 10px;  background: #fff none repeat scroll 0 0;
    border: 2px solid #ccc; padding: 5px; width: 430px; min-height:300px;}
  #sortable1 li, #sortable2 li, #sortable3 li { margin: 5px; padding: 5px; font-size: 1.2em; width: 400px; cursor:pointer }
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
          PopulateCategory();
          $("#ddl_product").change(function () {
              //PopulatePrevTags($("#ddl_product option:selected").val());
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
          var apikey = getKey("apiKey");
          var url = '<%= ResolveUrl("~/Backend.asmx/ArrengeCategory") %>';
          var parameter = { "category": category, "apiKey": apikey };
          $.ajax({
              type: 'POST',
              url: url,
              data: JSON.stringify(parameter),
              contentType: 'application/json; charset=utf-8',
              dataType: "json",
              success: function (data) {
                  if (data.d == 0) {
                      alert("Category Arrenged Successfully");
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
          var url = '<%= ResolveUrl("~/Backend.asmx/GetCategoryInOrder") %>';
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
                      str = str + "<li class='ui-state-default'>" + data.d[i] + "</li>";
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
        <li class="active">Arrenge category in order</li>
    </ul>
    <div class="well">
    
         <ul id="sortable1" class="droptrue">
  
</ul>
  
<br style="clear:both">
<br style="clear:both">
<input type="button" value="Update Order" id="Update" class="btn btn-primary"/>
<br style="clear:both">
    </div>
</asp:Content>

