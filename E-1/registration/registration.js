function handleSubmit(){
    const alert = document.getElementById("alert");
    const name = document.getElementsByName("name")[0].value;
    const email = document.getElementsByName("Email")[0].value;
    const password = document.getElementsByName("Password")[0].value;
    const confirmPassword = document.getElementsByName("Confirm password")[0].value;
    
    // validation 
    if(!name){
        alert.textContent = "Please enter your name !!";
        alert.style.display = "block"
        return false;
    }
    if(!email){
        alert.textContent = "Please fill in all fields !!";
        alert.style.display = "block"
        return false;
    }
    if(!password){
        alert.textContent = "Please fill in all fields !!";
        alert.style.display = "block"
        return false;
    }
    if(!confirmPassword){
        alert.textContent = "Please fill in all fields !!";
        alert.style.display = "block"
        return false;
    }
    if(email.match(/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/) == null){
        alert.textContent = "Please enter a valid email !!";
        alert.style.display = "block"
        return false;
    }
    if(password != confirmPassword){
        alert.textContent = "Passwords do not match !!";
        alert.style.display = "block"
        return false;
    }

    let startTime = new Date();
    let endTime = new Date();

    // data addon to local storage
    const data = {
        name,
        email,
        password,
        startTime,
        endTime
    }
    
    const users = JSON.parse(localStorage.getItem("admin"));

    // check if user already exists
    if(users){
        const user = users.find(user => user.email === email);
        if(user){
            alert.textContent = "User already exists !!";
            alert.style.display = "block"
            return false;
        }else{
            users.push(data);
            localStorage.setItem("admin", JSON.stringify(users));
            alert.textContent = "Registration Successful !!";
            alert.style.backgroundColor = "green";  
            alert.style.display = "block"
            setTimeout(() => {
                window.location.href = "login.html";
            }, 2000);
        }
    }else{
        localStorage.setItem("admin", JSON.stringify([data]));
        alert.textContent = "Registration Successful !!";
        alert.style.backgroundColor = "green";  
        alert.style.display = "block"
        setTimeout(() => {
            window.location.href = "login.html";
        }, 2000);
    }
}
