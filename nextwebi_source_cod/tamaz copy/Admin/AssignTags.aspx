<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.master" AutoEventWireup="true" CodeFile="AssignTags.aspx.cs" Inherits="Admin_AssignTags" %>

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

          $("#sortable1, #sortable2, #sortable3").disableSelection();
      });
      $(document).ready(function () {
         
      });
  </script>
  <script>
      $(document).ready(function () {
          PopulateProducts();
          PopulateTags();
          $("#ddl_product").change(function () {
              PopulateTags();
              PopulatePrevTags($("#ddl_product option:selected").val());
          });
          var tags = "";
          $("#Update").click(function () {

              $.each($('#sortable3').find('li'), function () {
                  if (tags == "") {
                      tags = tags + $(this).text();
                  }
                  else {
                      tags = tags + "," + $(this).text();
                  }
              });

              AddTags(tags, $("#ddl_product option:selected").val());
          });
      });
      function AddTags(tags,productId) {
          var apikey = getKey("apiKey");
          var url = '<%= ResolveUrl("~/Backend.asmx/AssignTags") %>';
          var parameter = { "productId": productId, "tags": tags, "apiKey": apikey };
          $.ajax({
              type: 'POST',
              url: url,
              data: JSON.stringify(parameter),
              contentType: 'application/json; charset=utf-8',
              dataType: "json",
              success: function (data) {
                  if (data.d == 0) {
                      alert("Tags Assigned Successfully");
                      PopulateTags();
                      PopulatePrevTags(productId);
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
      function PopulateTags() {
          var apikey = getKey("apiKey");
          var url = '<%= ResolveUrl("~/Backend.asmx/GetTags") %>';
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
          var parameter = { "productId":productId,"apiKey": apikey };
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
                      str = str + "<option value='"+data.d[i].id+"'>" + data.d[i].name + "</option>";
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
        <li class="active">Assign Tags</li>
    </ul>
    <div class="well">
    <label>Select Product</label>
    <select id="ddl_product">
    </select><br />
         <ul id="sortable1" class="droptrue">
  
</ul>
     <ul id="sortable3" class="dropfalse">
</ul>
<br style="clear:both">
<br style="clear:both">
<input type="button" value="Update Tags" id="Update" class="btn btn-primary"/>
<br style="clear:both">
    </div>
</asp:Content>

