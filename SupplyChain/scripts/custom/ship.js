const dataset = [['1', '2'], ['a', 'b']]


function loadDoc(url, cFunction) {
    var xhttp;
    // console.log("before httpreq object");
    
    xhttp = new XMLHttpRequest();
    // console.log("after object");
    
    xhttp.onreadystatechange = function() {
        console.log("readystate", this.readyState, this.status);
        
        if (this.readyState == 4 && this.status == 200) {
            console.log(this);
            
            cFunction(this);
        }
  };
  xhttp.open("GET", url, true);
  xhttp.send();
}
$(document).on("click", '.table-address',function(){
    console.log(this.textContent);
   document.getElementById('Address').value = this.textContent;
});
function addTable(xhttp) {
    response = JSON.parse(xhttp.responseText);
    var dataset = response['data'];
    console.log(response);
    // return;
    $('#address-table').DataTable( {
        "aaData": dataset,
        "aoColumnDefs": [{
            "sTitle": "Name",
            "aTargets": [0]
        },
        {
            "sTitle": "Address",
            "aTargets": [1],
            "bSortable": false,
            "bSearchable": false,
            "sClass": 'table-address'
        }],
        scrollY:        '36vh',
        scrollCollapse: true,
        paging:         false,
    } );
}

$(document).ready(function(){
    
    // addTable(dataset);
    vendor_data_url = "http://siiidd.pythonanywhere.com/get_vendor_data"
    console.log(vendor_data_url);
    
    loadDoc(vendor_data_url, addTable);
});

