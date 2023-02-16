let userRecords = [];

// function to add user record to the table
function addUserRecord() {
  // get input values
  let name = document.getElementById("name").value;
  let email = document.getElementById("email").value;
  let password = document.getElementById("password").value;
  let date = document.getElementById("date").value;

  // create user object
  let user = {
    name: name,
    email: email,
    password: password,
    date: date,
  };

  // add user object to array
  userRecords.push(user);

  // clear input fields
  document.getElementById("name").value = "";
  document.getElementById("email").value = "";
  document.getElementById("password").value = "";
  document.getElementById("date").value = "";

  // render user table
  renderUserTable();
}

// function to delete user record from the table
function deleteUserRecord(index) {
  // remove user object from array
  userRecords.splice(index, 1);

  // render user table
  renderUserTable();
}

// function to render user table
function renderUserTable() {
  let tbody = document.getElementById("tbody");

  // clear table body
  tbody.innerHTML = "";

  // loop through user records and add to table
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
    let btnDelete = document.createElement("button");
    btnDelete.classList.add("btn", "btn-danger");
    btnDelete.innerText = "Delete";
    btnDelete.onclick = function () {
      deleteUserRecord(index);
    };
    tdAction.appendChild(btnDelete);
  });
}

// function to calculate age based on birth date
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
