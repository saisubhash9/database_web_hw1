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
  var dname=$("#dname").val()
  
  var url = 'http://localhost:5000/domains/?query={properties(domain:"' +dname + '"){propertyname propertyquestion propertydisplaytype propertoptions{allowedvalue allowedvalueCode}}}';
  $.ajax({
    url: url,
    type: 'GET',
    success: function(response) {
      var divsToRemove = document.querySelectorAll(".temp");
      console.log(divsToRemove.length);
      if (divsToRemove.length==0){
        console.log(divsToRemove)

      }
      else{
        flag=0;
    for (var i = 0; i < divsToRemove.len; i++) {
    divsToRemove[i].remove(); 
     }
    console.log(flag)
}
      var props = response.data.properties;
      var htmlCode = "<div class='temp'> <div class='record'> <table>";
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
    
      htmlCode+="  <script>if (typeof records==='undefined'){ const records = document.querySelectorAll('.record'); console.log(records); const previousButton = document.querySelector('#previous');const nextButton = document.querySelector('#next');const pageNumber = document.querySelector('#page-number'); let currentPage = 0;records[currentPage].classList.add('active');previousButton.addEventListener('click', () => {    records[currentPage].classList.remove('active');   currentPage = Math.max(0, currentPage - 1);   records[currentPage].classList.add('active');   pageNumber.innerHTML = currentPage + 1;  });  nextButton.addEventListener('click', () => {   records[currentPage].classList.remove('active');   currentPage = Math.min(records.length - 1, currentPage + 1);    records[currentPage].classList.add('active');    pageNumber.innerHTML = currentPage + 1;  }); }else{console.log('hello')} </script>"
      htmlCode+="</div>"
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


var g="hello";

function bookmarks(){
  var uid=$("#userid").val()
  if(typeof uid==='undefined')
  {
uid=g
  }
  else{
console.log(uid)
  }
  var url = 'http://localhost:5000/domains/?query={user(user:"' +uid + '"){userid domname bname bookmark}}';
  $.ajax({
    url: url,
    type: 'GET',
    success: function(response) {
      var use = response.data.user;
      
      if (use.length == 0){
        alert("invalid user")
      }
      else{
        if(typeof uid==='undefined')
        {
      var x = document.getElementById("userid");
      x.style.display = "block";
        }
      var htmlCode="<h1>hello, "+use[0].userid+"</h1>";
      g=use[0].userid;
      }
      $("#books").html(htmlCode);
      var htmlCode2="<table align='right'>";
      
      for (var i=0; i<use.length; i++){
        console.log(use[i].bookmark)
        var temp=use[i].bname;
        var temp2=use[i].domname;
        temp=String(temp)
        temp2=String(temp2)
        temp3=temp.concat('@',temp2)
        // console.log(temp3)
         htmlCode2 += "<tr><td><button value='"+use[i].bookmark+"' id='"+use[i].bname+"' type='button' onclick=bookmarksearch('"+temp3+"')>"+use[i].bname+"</button><div class='w3-xlarge'><a href='javascript:void(0);' onclick=deletebookmark('"+use[i].bname+"')><i  class='fa fa-trash'></i> </div></a></td></tr>";
        }
      $("#bookmarksbar").html(htmlCode2);
      if (use.length>=5){
        console.log("helllo")
        document.getElementById("bookmarkbtn").disabled=true;
      }
    },
    error: function(error) {
      alert("invalid user");
      console.log(error);
    }
  });

}

function deletebookmark(bookmarkname)
{
  console.log("Hello")
  console.log(bookmarkname)
  console.log(g)

  var ur = 'http://localhost:5000/domains/?query=mutation{deleteBookmark(userid:"' +g+ '",bookmarkname:"'+bookmarkname+'"){ok userid bookmarkname}}';
  $.ajax({
    url: ur,
    type: 'POST',
    success: function(response) {
      
        console.log("deleted")
      bookmarks()
    },
    error: function(error) {
      alert("ERROR with delete");
      console.log(error);
    }
    });
console.log(ur)
}


function bookmarksearch(a){
  console.log(a)
  const myArray = a.split("@");
  var temp=document.getElementById(myArray[0]).value;
  console.log(temp)
  var temp2= myArray[1]
  var ur = 'http://localhost:5000/domains/?query={output(domainname:"' +temp2+ '",str:"'+temp+'"){url name id heading}}';
  console.log(ur)
   $.ajax({
url: ur,
type: 'GET',
success: function(response) {
  var dmns = response.data.output;
  var htmlCod = "<table id=search> <tr> <th>Name</th>  <th>Url</th>    </tr>";
  console.log(dmns[0].url)
  // var a=dmns[1].id;
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


function addbookmark(){
  var name=document.getElementById("bookmm").value;
  var user=g;
  var domname=document.getElementById('dname').value;

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
  let bookmarks_str=""
  for(i=0;i<li_names.length;i++)
  {
    if(i>0){
      if( i<li_names.length)
      {
        bookmarks_str=bookmarks_str.concat(",")
      }
    }
    bookmarks_str=bookmarks_str.concat(li_names[i],"=",li_values[i])
    
  }
  console.log(li_names)
  console.log(li_values)
  console.log(bookmarks_str)
  var ur = 'http://localhost:5000/domains/?query=mutation{createBookmark(bname:"' +name+ '",userid:"'+g+'",dname:"'+domname+'",bookmark:"'+bookmarks_str+'"){ok userid dname bname bookmark}}';
console.log(ur)
  $.ajax({
    url: ur,
    type: 'POST',
    success: function(response) {
      
        console.log()
      var dmns = response.data.create_bookmark;
      var htmlCod = "<table> <tr>bookmark created</tr>";
      $("#result").html(htmlCod);
      bookmarks()
      document.getElementById('bookmm').value = ''
    },
    error: function(error) {
      alert("ERROR with add");
      console.log(error);
    }
    });

}


