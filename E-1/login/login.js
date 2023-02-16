function handleLogin(){
    const alert = document.getElementById("alert");
    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;

    if(!email){
        alert.textContent = "Please fill in all fields !!";
        alert.style.display = "block"
        alert.style.backgroundColor = "red";
        return false;
    }
    if(!password){
        alert.textContent = "Please fill in all fields !!";
        alert.style.display = "block"
        alert.style.backgroundColor = "red";
        return false;
    }
    if(email.match(/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/) == null){
        alert.textContent = "Please enter a valid email !!";
        alert.style.display = "block"
        alert.style.backgroundColor = "red";
        return false;
    }

    const subUser = JSON.parse(localStorage.getItem("users"));
    if(subUser){
        const user = subUser.find(user => user.email === email && user.password === password);
        if(user){
            alert.textContent = "Login Successful !!";
            alert.style.display = "block"
            alert.style.backgroundColor = "green";
            localStorage.setItem("currentSubUser", JSON.stringify(user)); 
            var d = new Date();
            var hours = d.getHours();
            var minutes = d.getMinutes();
            var ampm = hours >= 12 ? 'PM' : 'AM';
            hours = hours % 12;
            hours = hours ? hours : 12;
            minutes = minutes < 10 ? '0' + minutes : minutes;
            var strTime = hours + ':' + minutes + ' ' + ampm;
            let userLoginDataTime = ((d.getMonth() + 1) + "/" + d.getDate() + "/" + d.getFullYear() + "  " + strTime)

            let data = JSON.parse(localStorage.getItem("users"));
            var userLoginData = {};
            const AddLoginTime = data.map((element) => {
                if (element.email == email) {
                    userLoginData = element;
                    return {
                        ...element,
                        loginTime: userLoginDataTime,
                    };
                }
                return element;
            });
            localStorage.setItem("users", JSON.stringify(AddLoginTime));
            setTimeout(() => {
                window.location.href = " E:\Cybercom\E-1\sub-user\sub-user.html"; 
            }, 2000);
            return true;
        }else{
            alert.textContent = "User does not exist !!";
            alert.style.display = "block"
            // return false;
        }
    }

    const users = JSON.parse(localStorage.getItem("admin"));
    if(users){
        const user = users.find(user => user.email === email && user.password === password);
        if(user){
            alert.textContent = "Login Successful !!";
            alert.style.display = "block"
            alert.style.backgroundColor = "green";
            localStorage.setItem("currentUser", JSON.stringify(user)); 
            setTimeout(() => {
                window.location.href = "E:\Cybercom\E-1\dashboard\dashboard.html ";
            }, 2000);
            return true;
        }else{
            alert.textContent = "User does not exist !!";
            alert.style.display = "block"
            return false;
        }
    }else{
        alert.textContent = "User does not exist !!";
        alert.style.display = "block"
        return false;
    }
}