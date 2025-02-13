document.getElementById("login-form").addEventListener("submit", function(event) {
    event.preventDefault();
    const formData = new FormData(event.target);
    const formObj = {};
    formData.forEach((value, key) => formObj[key] = value);

    // Send the form data to the server
    // to this
    fetch('http://localhost:3000/sign-in', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(formObj)
    })
   .then(response => response.json())
   .then(data => {
    // Handle the response from the server
    if (data.success) {
        alert("hello")
    } else {
        window.location.href = "resume.html";
        // Display an error message
        console.log(data.message);
    }
});
})