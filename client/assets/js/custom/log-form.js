document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll("form.log-form").forEach((form) => {
      form.addEventListener("submit", function (event) {
        event.preventDefault();
        const formData = new FormData(event.target);
        const formObj = {};
        formData.forEach((value, key) => {
          formObj[key] = value;
        });
        console.log("Form Data:", formObj);
      });
    });
  });
  