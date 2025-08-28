const calculateHours = (empList) => {
    let hoursPerEmp = {}
    
    empList.forEach(emp=> {
        if(emp.empId && typeof emp.hoursWorked === 'number'){
            if(hoursPerEmp[emp.empId]){
                hoursPerEmp[emp.empId] += emp.hoursWorked;
            } else {
                hoursPerEmp[emp.empId] = emp.hoursWorked;
            }
        }  else console.error('Invalid entry:', emp);
    })
    
    return hoursPerEmp;
}

const empList = [
    { empId: 'emp001', hoursWorked: 8 },
    { empId: 'emp002', hoursWorked: 6 },
    { empId: 'emp001', hoursWorked: 7 },
];

console.log(calculateHours(empList))
