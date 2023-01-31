$(document).ready(function() {
  var url = 'http://localhost:5000/domains/?query={domains{dname ftname}}';
  $.ajax({
    url: url,
    type: 'GET',
    success: function(response) {
      var dmns = response.data.domains;
      var htmlCode = "<select id='dname' onchange='populateDomain()'>"+
                        "<option id='None'>Select a domain</option>";
      for (var i=0; i<dmns.length; i++)
        htmlCode += "<option value='"+dmns[i].dname+"'>"+dmns[i].dname+"</option>";
      htmlCode += "</select>";
      $("#domain_select").html(htmlCode);
    },
    error: function(error) {
      alert("ERROR with ready");
      console.log(error);
    }
  });
});


function populateDomain() {
  var url = 'http://localhost:5000/domains/?query={properties(domain:"' +$("#dname").val() + '"){propertyname propertyquestion propertydisplaytype propertoptions{allowedvalue allowedvalueCode}}}';
  $.ajax({
    url: url,
    type: 'GET',
    success: function(response) {
      var props = response.data.properties;
      var htmlCode = " <div class='record'> <table>";
      var iter=1; 
      for (var i=0; i<props.length; i++){
        if( i>0)
        {
          if(i%4==0)
          {
            htmlCode+="</table> </div>"
            htmlCode+="<div class='record'> <table>"
          }
        }
        htmlCode += "<tr><td><b>"+iter+"</b>."+props[i].propertyquestion+"</td></tr>";
        iter = iter + 1;
        if (props[i].propertydisplaytype == "select"){
          htmlCode += "<tr><td><select id='ddname'>"+
          "<option id='None'>Select</option>";
          for (var k=0; k<props[i].propertoptions.length; k++)
            htmlCode += "<option name='"+props[i].propertyname+"' value='"+props[i].propertoptions[k].allowedvalueCode+"'>"+props[i].propertoptions[k].allowedvalue+"</option>";
          htmlCode += "</select></td></tr>";
        }
        else if (props[i].propertydisplaytype == "multiselect"){
          htmlCode += "<tr><td><select id='dddname' multiple>"+
          "<option id='None'>Select</option>";
          for (var k=0; k<props[i].propertoptions.length; k++)
          //console.log(props[i].propertoptions[k].allowedvaluecode")
            htmlCode += "<option name='"+props[i].propertyname+"' value='"+props[i].propertoptions[k].allowedvalueCode+"'>"+props[i].propertoptions[k].allowedvalue+"</option>";
          htmlCode += "</select></td></tr>";
        }
        else{
        for (var j=0; j<props[i].propertoptions.length; j++){
          htmlCode += "<tr><td><input type='"+props[i].propertydisplaytype+"' name='"+props[i].propertyname+"' value='"+props[i].propertoptions[j].allowedvalueCode+"'> "+props[i].propertoptions[j].allowedvalue+" </td></tr>";
        }
      }
      }  
      
      htmlCode+="  <script> const records = document.querySelectorAll('.record'); console.log(records); const previousButton = document.querySelector('#previous');const nextButton = document.querySelector('#next');const pageNumber = document.querySelector('#page-number'); let currentPage = 0;records[currentPage].classList.add('active');previousButton.addEventListener('click', () => {    records[currentPage].classList.remove('active');   currentPage = Math.max(0, currentPage - 1);   records[currentPage].classList.add('active');   pageNumber.innerHTML = currentPage + 1;  });  nextButton.addEventListener('click', () => {   records[currentPage].classList.remove('active');   currentPage = Math.min(records.length - 1, currentPage + 1);    records[currentPage].classList.add('active');    pageNumber.innerHTML = currentPage + 1;  });  </script>"
      console.log(htmlCode)
      $("#property_details").html(htmlCode);
    },
    error: function(error) {
      alert("ERROR");
      console.log(error);
    }
  });
}


function getvalues  () {
  document.getElementById("result").innerHTML = "";
  var ele = document.getElementsByTagName('input');
        
  var select = document.getElementsByTagName("select");
  console.log(select.length)
     
  const li_names=new Array();
        const li_values=new Array();
        let i=0;
  for(i = 0; i < ele.length; i++) {

      if(ele[i].checked)
        {
                        li_names.push(ele[i].name);
                        li_values.push(ele[i].value);
                    }
  }
  var select = document.getElementsByTagName("select");
  for(i=0;i<select.length;i++)
  {
    var temp1=document.getElementsByTagName("select")[i];
    if (temp1.checked){
    var name=temp1.name;
    var selectValue = temp1.options[temp1.selectedIndex].value;
    if(selectValue=="None")
    {
    continue;
    }
    else
    {
    li_values.push(selectValue)
    li_names.push(name)
    }
  }
  }
        i=1;
        let query_string="( "
        query_string=query_string.concat(" ",li_names[0]," = ",li_values[0])
        while(i<li_names.length)
        {
         if(li_names[i]==li_names[i-1])
         {
            query_string=query_string.concat(" or ",li_names[i]," = ",li_values[i])
         }
         else{
            query_string=query_string.concat(")"," and ","(",li_names[i]," = ",li_values[i])
         }
        i=i+1;
        }
        query_string=query_string.concat(")")
        console.log(query_string)
        




      var ur = 'http://localhost:5000/domains/?query={output(domainname:"' +$("#dname").val() + '",str:"'+query_string+'"){url name id heading}}';
      console.log(ur)
       $.ajax({
    url: ur,
    type: 'GET',
    success: function(response) {
      var dmns = response.data.output;
      var htmlCod = "<table id=search> <tr> <th>Name</th>  <th>Url</th>    </tr>";
      console.log(dmns[0].url)
      var a=dmns[1].id;
      //console.log(dmns[0].name)
       for (var i=0; i<dmns.length; i++)
         htmlCod += "<tr><td>"+dmns[i].name+"</td><td>"+dmns[i].url+"</td></tr>";
         htmlCod += "</table>";
      $("#result").html(htmlCod);
    },
    error: function(error) {
      alert("ERROR with ready");
      console.log(error);
    }
  });
}



