

// const currentUser = JSON.parse(localStorage.getItem("currentUser"));

// if(currentUser){
//   const adminName = document.getElementById("adminName");
//   adminName.textContent = currentUser.name;
// }

// const admin = JSON.parse(localStorage.getItem("users"));
// console.log(admin);

// const table = document.getElementById("table");
// admin.forEach((item) => {
//   const row = document.createElement("tr");

//   const nameCell = document.createElement("td");
//   const startTime = document.createElement("td");
//   const endTime = document.createElement("td");

//   nameCell.textContent = item.name;
//   row.appendChild(nameCell);

//   if(item.loginTime){
//     startTime.textContent = item.loginTime;
//     row.appendChild(startTime);
//   }else{
//     startTime.textContent = "Not Logged In Yet";
//     row.appendChild(startTime); 
//   }

//   if(item.logoutTime){
//     endTime.textContent = item.logoutTime;
//     row.appendChild(endTime);
//   }else{
//     endTime.textContent = "Not Logged Out Yet";
//     row.appendChild(endTime);
//   }
//   table.appendChild(row);
// });

// function logout(){
//   localStorage.removeItem("currentUser");
//   window.location.href = "login.html";
// }


const currentUser = JSON.parse(localStorage.getItem("currentUser"));

const nameElement = document.getElementById("name");
nameElement.textContent = currentUser.name;

const startTimeElement = document.getElementById("startTime");
if(currentUser.loginTime){
  startTimeElement.textContent = currentUser.loginTime;
}else{
  startTimeElement.textContent = "Not Logged In Yet";
}

const endTimeElement = document.getElementById("endTime");
if(currentUser.logoutTime){
  endTimeElement.textContent = currentUser.logoutTime;
}else{
  endTimeElement.textContent = "Not Logged Out Yet";
}

function logout(){
  currentUser.logoutTime = new Date().toLocaleString();
  localStorage.setItem("currentUser", JSON.stringify(currentUser));
  window.location.href = "login.html";
}
