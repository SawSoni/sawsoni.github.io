//var URL  = 'https://my-json-server.typicode.com/SawSoni/sawsoni.github.io/students/';
var URL = "http://demo.soni.com:3000/students/";
/**
Call on load
*/
$(document).ready( () => {
    console.log('document is ready');
    getStudents(URL);
})

//create dynamic row
function getRow(student) {
    if (typeof student != 'object' || Array.isArray(student)) {
        return false;
    }
    var row;
    var name = student.name;
    var columns = `<div><input type="checkbox" id="${student.id}">${student.id}</div>
        				<div><a href="#" onclick="detailLinkClick(${student.id})">${student.name}</a></div>
        				<div>${student.class}</div>
        				<div>${student.age}</div>
        				<div class ="deleteDiv"> <button class="deleteBtn" onclick='deleteStudent(${student.id})'>&#215</button> </div>`;
    return row = `<div class="row">${columns}</div>`;
}

// create rows of students
function getRows(students) {
    if (Array.isArray(students)) {
        var rowsOfStudents = '';
        var rows;
        students.forEach((studentObj, index) => {
            rowsOfStudents += getRow(studentObj);
        })
        return rows = `${rowsOfStudents}`;
    }
}
//update dom function
function domUpdateEle(classN, data) {
    // document.querySelector(classN).innerHTML = data;
    $(classN).html(data);
}


// $.ajax to get data
function getData(url) {
    $.ajax({
        url: url,
        method: 'GET'
    }).then((response) => {
        return response;
    })
}

// $.ajax to get data
function getStudents(url) {
    $.ajax({
        url: url,
        method: 'GET'
    }).then((response) => {
        var rows = getRows(response);
        domUpdateEle('.rowContainer', rows);
        $('#total').html(response.length); //this will show total no of student
    })
}

// $.ajax to get data through input
function searchStudent() {
    var input = $('#serchByClass').val();
    var url = URL + '?q=' + input;
    $.ajax({
        url: url,
        method: 'GET'
    }).then((response) => {
        var rows = getRows(response);
        $('.rowContainer').html('');
        $('.rowContainer').html(rows);
        $('#total').html(response.length); //this will show total no of student
    })
}
$('#serchByClass').on(' keyup', function(e) {
    console.log(e.type);
    searchStudent();
});
$('#serchButton').on('click', function(e) {
    e.preventDefault();
    searchStudent();
});
// $.ajax to delete  data
function deleteCheckedObject(url) {
    var selectedCheackBoxes = $(":checkbox:checked"); //array
    var selectedStudent = []; //in the array will right ajax
    var detetedStudentName = [];
    $.each(selectedCheackBoxes, (index, selectedCheckBox) => {
        selectedStudent.push(selectedCheckBox.id);
        // detetedStudentName.push(selectedCheckBox.name);
    })
    var s = confirm('Are you sure you want to delete?');
    var deteleFlag = false;
    if (s) {
        $.each(selectedStudent, (index, id) => {
            deleteStudent(id)
        })
    }
    // ==
    if (deteleFlag = true) {
        var massage = `student '${selectedStudent}' deleted successfully`;
        alert(massage);
    }
}
$('#deleteAllBTN').on('click', function() {
    // alert('i will delete all');
    deleteCheckedObject(URL);
})

function deleteStudent(id) {
    var url = URL + id;
    var that = this;
    $.ajax({
        url: url,
        method: 'DELETE'
    }).then((response) => {
        //alert(`Student ${id} delete successfully.`);
        searchStudent();
    }).catch((error) => {
        alert('sorry...' + error);
    })
}
/*==============new student create============*/
function createStudent() {
    var ID = parseInt(document.getElementById('ID').value);
    var nameS = document.getElementById('name').value;
    var classN = document.getElementById('class').value;
    var age = document.getElementById('age').value;
    //create student obj,this obj will convert in json and send it to server
    var newStudentData = {
        id: ID,
        name: nameS,
        class: classN,
        age: age
    };
    $.ajax(URL, {
        method: 'POST',
        data: JSON.stringify(newStudentData),
        header: {
            'user-agent': 'Mozila/4.0/ md example',
            'content-type': 'application/json'
        }
    }).then(function(response) {
        document.getElementById('mms').innerHTML = 'New student added.';
    })
};
//newstudent btn click
function newStudentBtnClick() {
    var c = $('#createStudent');
    c.css('display', 'block'); // show div to create 
    var studentDataDiv = $('#studentDataTable');
    studentDataDiv.css('display', 'none');
}
$('#createStudentBTN').on('click', newStudentBtnClick);
//cancel btn click
function cancel() {
    window.location = "index.html";
}
/**=========get a singale student data====when click in singal student name**/
function getStudentDetail(id) {
    var url = URL + id;
    $.ajax({
        url: url,
        method: 'GET'
    }).then(function(response) {
        return response;
    }).then(function(data) {
        var id = data.id;
        var name = data.name;
        var classS = data.class;
        var age = data.age;
        var template = `<div class="fieldsetParentDiv" style='display:block'>
							<div class="fieldsetChildDiv">
								<fieldset class="fieldsetArea">
									<legend class="legendArea">
                           				 Details Student of <span>'${name}'</span>
                        			</legend>
                        			<table>
                           		 <tr>
                                	<td>
                                    <label class="labelArea" for="idName">
                                        ID
                                        <span>
                                            <i class="fa fa-asterisk">
                                            </i>
                                        </span>
                                    </label>
                                	</td>
                                	<td>
                                    <input class="inputArea" id="uID" name="ID" placeholder="Enter your ID" value='2' type="text"/>
                                	</td>
                            	</tr>
                            	<tr>
                                <td>
                                    <label class="labelArea" for="stuName">
                                        Student Name:
                                    </label>
                                </td>
                                <td>
                                    <input class="inputArea" id="uname" name="stuName" placeholder="Enter your Name" value='${name}' type="text">
                                    </input>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label class="labelArea" for="className">
                                        Class:
                                    </label>
                                </td>
                                <td>
                                    <input class="inputArea" id="uclass" value='${classS}'/>
                                 </td>
                            </tr>
                            <tr>
                                <td>
                                    <label class="labelArea" for="ageName">
                                        Age:
                                    </label>
                                </td>
                                <td>
                                    <input class="inputArea" id="uage" value='${age}' placeholder="Enter your Age"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="buttonTD" colspan="2">
                                        <a href="#">
                                        <button class="btnAnc" onclick="cancel(this)">
                                            Cancel
                                        </button>
                                        </a>
                                        <a href="#">
                                        <button class="btnAnc" onclick="updateStudent(this)">
                                            Save
                                        </button>
                                        </a>
                                </td>
                            </tr>
                        </table>
					</fieldset>
					</div>
				</div>`;

				$('#getStudentDetail').html(template).css('display','block');

    }).catch(function(error){
    	console.log('sorry...' + error);
    })
}
/*function call on each student name link */
	function detailLinkClick(id){
        console.log(id);
        // call this function to update the studentDetail div
		getStudentDetail(id);
		 var studentList = $('#studentDataTable');
		 studentList.css('display','none');

	}
/************************updateStudent********************************/
function updateStudent() {
    var ID = document.getElementById('uID').value;
    var nameS = document.getElementById('uname').value;
    var classN = document.getElementById('uclass').value;
    var age = document.getElementById('uage').value;
    var url = URL + ID;
    var newStudentData = {
        id: ID,
        name: nameS,
        class: classN,
        age: age
    };
    $.ajax(url, {
        method: 'PUT',
        data: JSON.stringify(newStudentData)
    }).then(function(response) {
        console.log(response);
        window.location = 'index.html';
    })
}