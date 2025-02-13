document
  .getElementById("login-form")
  .addEventListener("submit", async function (event) {
    event.preventDefault();
    const formObj = {};
    const formData = new FormData(event.target);
    formData.forEach((value, key) => {
      formObj[key] = value;
    });

    try {
      const response = await fetch("http://localhost:3000/sign-in", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(formObj),
      });

      const data = await response.json();

      if (response.ok) {
        console.log("Login successful:", data);
        localStorage.setItem("token", data.token);
        window.location.href = "resume.html";
      } else {
        alert(data.error || "Login failed");
      }
    } catch (error) {
      console.error("Error:", error);
      alert("An error occurred during login");
    }
  });
const token = localStorage.getItem("token");
