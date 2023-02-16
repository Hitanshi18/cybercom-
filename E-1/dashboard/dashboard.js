const currentUser = JSON.parse(localStorage.getItem('currentUser'));
if(currentUser){
    const user = document.getElementById('UserName');
    user.textContent = currentUser.name;
}

function ageParameter(){
    let users = JSON.parse(localStorage.getItem('users'));
    if(users){
        let ageArr = []
        for(let i of users){
            ageArr.push(i.age);
        }
    
        let underAge = ageArr.filter((item) => item < 18);
        let young = ageArr.filter((item) => item >= 18 && item <= 50);
        let old = ageArr.filter((item) => item > 50);
    
        const underAgeCount = document.getElementById('below18');
        const youngCount = document.getElementById('between18-50');
        const oldCount = document.getElementById('above50');
    
        underAgeCount.textContent = underAge.length;
        youngCount.textContent = young.length;
        oldCount.textContent = old.length;
    }
}
ageParameter();

function birthDateFind(){
    let users = JSON.parse(localStorage.getItem('users'));
    let date = new Date();
    let currentMonth = date.getMonth();
    let currentDay = date.getDate();


    if(users){
         let birthDate = users.filter((item) =>{
            let birthMonth = new Date(item.dob).getMonth();
            let birthDay = new Date(item.dob).getDate();
            if(currentMonth === birthMonth && currentDay === birthDay){
                return item.name;
            }
         });
         if(birthDate && birthDate.length > 0){
             for(let i of birthDate){
                 const birthName = document.getElementById('birthDay');
                 const span = document.createElement('span');
                 span.className = "title";
                 span.innerHTML = i.name + "'s" + " Birthday" + "<br>";
                 birthName.appendChild(span);
             }
         }else{
                const birthName = document.getElementById('birthDay');
                const span = document.createElement('span');
                span.textContent = "No One's BirthDay Today";
                birthName.appendChild(span);
         }
    }
}
birthDateFind();