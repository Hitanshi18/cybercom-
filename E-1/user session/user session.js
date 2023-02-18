
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
