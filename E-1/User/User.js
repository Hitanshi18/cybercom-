let userRecords = [];

// function to add user record to the table
function addUserRecord() {

  let name = document.getElementById("name").value;
  let email = document.getElementById("email").value;
  let password = document.getElementById("password").value;
  let date = document.getElementById("date").value;

  let user = {
    name: name,
    email: email,
    password: password,
    date: date,
  };


  userRecords.push(user);


  document.getElementById("name").value = "";
  document.getElementById("email").value = "";
  document.getElementById("password").value = "";
  document.getElementById("date").value = "";

  renderUserTable();
}

function deleteUserRecord(index) {
  userRecords.splice(index, 1);
  renderUserTable();
}

function editUserRecord(index) {
  let user = userRecords[index];
  document.getElementById("name").value = user.name;
  document.getElementById("email").value = user.email;
  document.getElementById("password").value = user.password;
  document.getElementById("date").value = user.date;

  let btnSave = document.createElement("button");
  btnSave.classList.add("btn", "btn-success");
  btnSave.innerText = "Save";
  btnSave.onclick = function() {
    saveUserRecord(index);
  };
  let tdAction = document.getElementById("tbody").rows[index].cells[6];
  tdAction.innerHTML = "";
  tdAction.appendChild(btnSave);
}

function saveUserRecord(index) {
  let name = document.getElementById("name").value;
  let email = document.getElementById("email").value;
  let password = document.getElementById("password").value;
  let date = document.getElementById("date").value;

  let user = {
    name: name,
    email: email,
    password: password,
    date: date,
  };

  userRecords[index] = user;

  document.getElementById("name").value = "";
  document.getElementById("email").value = "";
  document.getElementById("password").value = "";
  document.getElementById("date").value = "";

  renderUserTable();
}

function renderUserTable() {
  let tbody = document.getElementById("tbody");

  tbody.innerHTML = "";

  userRecords.forEach((user, index) => {
    let tr = tbody.insertRow();

    let tdIndex = tr.insertCell(0);
    tdIndex.innerText = index + 1;

    let tdName = tr.insertCell(1);
    tdName.innerText = user.name;

    let tdEmail = tr.insertCell(2);
    tdEmail.innerText = user.email;

    let tdPassword = tr.insertCell(3);
    tdPassword.innerText = user.password;

    let tdDate = tr.insertCell(4);
    tdDate.innerText = user.date;

    let tdAge = tr.insertCell(5);
    tdAge.innerText = calculateAge(user.date);

    let tdAction = tr.insertCell(6);

    let btnEdit = document.createElement("button");
    btnEdit.classList.add("btn", "btn-info");
    btnEdit.innerText = "Edit";
    btnEdit.onclick = function() {
      editUserRecord(index);
    };
    tdAction.appendChild(btnEdit);

    let btnDelete = document.createElement("button");
    btnDelete.classList.add("btn", "btn-danger");
    btnDelete.innerText = "Delete";
    btnDelete.onclick = function () {
      deleteUserRecord(index);
    };
    tdAction.appendChild(btnDelete);
  });
}

function calculateAge(birthdate) {
  let today = new Date();
  let birthdateParts = birthdate.split("-");
  let birthdateYear = parseInt(birthdateParts[0]);
  let birthdateMonth = parseInt(birthdateParts[1]);
  let birthdateDay = parseInt(birthdateParts[2]);

  let age = today.getFullYear() - birthdateYear;
  let m = today.getMonth() - birthdateMonth;
  if (m < 0 || (m === 0 && today.getDate() < birthdateDay)) {
    age--;
  }

  return age;
}
