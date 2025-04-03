// password toggle
document.querySelectorAll(".toggle-password").forEach(function (icon) {
    icon.addEventListener("click", function () {
      const input = document.querySelector(this.getAttribute("toggle"));
      const isPassword = input.getAttribute("type") === "password";
  
      input.setAttribute("type", isPassword ? "text" : "password");
  
      // Swap the icon
      if (isPassword) {
        this.src = "images/eyeslashicon.png";
      } else {
        this.src = "images/eyeicon.png";
      }
    });
  });

  document.getElementById("login-form").addEventListener("submit", function (event) {
    let email = document.getElementById("login-email").value.trim();
    let password = document.getElementById("login-password").value.trim();
    const errorDiv = document.getElementById("cred-error");


    let isValid = true; 

    if (!email) {
        emailError.style.visibility = "visible";
        isValid = false;
    } 

    if (!password) {
        passwordError.style.visibility = "visible";
        isValid = false;
    } 

    if (!isValid) {
        errorDiv.innerHTML ="*Invalid Email or Password";
        event.preventDefault(); // Prevent form submission only if validation fails
    }
});
