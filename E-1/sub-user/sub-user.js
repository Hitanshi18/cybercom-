const currSubUser = JSON.parse(localStorage.getItem('currentSubUser'));

if(adminName){
    const adminName = document.getElementById('adminName');
    adminName.innerHTML = currSubUser.name;
}

if(currSubUser){
    let date = new Date();
    let currentMonth = date.getMonth();
    let currentDay = date.getDate();
    let birthMonth = new Date(currSubUser.dob).getMonth();
    let birthDay = new Date(currSubUser.dob).getDate();
    if(currentMonth === birthMonth && currentDay === birthDay){
        const birthName = document.getElementById('birthDay');
        const span = document.createElement('span');
        span.innerHTML = "Happy BirthDay" + " " + currSubUser.name +  "<br>";
        birthName.appendChild(span);
    }else{
        const birthName = document.getElementById('birthDay');
        const span = document.createElement('span');
        span.innerHTML = "Tamaro BirthDay Nthi" + " " + currSubUser.name ;
        birthName.appendChild(span);
    }
}

function handleLogOut(){
  
    var d = new Date();
    var hours = d.getHours();
    var minutes = d.getMinutes();
    var ampm = hours >= 12 ? 'PM' : 'AM';
    hours = hours % 12;
    hours = hours ? hours : 12;
    minutes = minutes < 10 ? '0' + minutes : minutes;
    var strTime = hours + ':' + minutes + ' ' + ampm;
    let userLogoutDataTime = ((d.getMonth() + 1) + "/" + d.getDate() + "/" + d.getFullYear() + "  " + strTime)

    let email = JSON.parse(localStorage.getItem("currentSubUser")).email;
    let data = JSON.parse(localStorage.getItem("users"));
    var userLoginData = {};
    const AddLogoutTime = data.map((element) => {
        if (element.email == email) {
            userLoginData = element;
            return {
                ...element,
                logoutTime: userLogoutDataTime,
            };
        }
        return element;
    });


    localStorage.setItem("users", JSON.stringify(AddLogoutTime));
    localStorage.removeItem("currentSubUser");
    window.location.href = " E:\Cybercom\E-1\login\login.html ";
}