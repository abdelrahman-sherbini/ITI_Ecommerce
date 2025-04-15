const email = document.getElementById("reset-email");
const form = document.getElementById("reset-password-form");
const submitBttn = document.getElementById("reset-bttn");
const errorElement = document.getElementById("reg-email-error");

// Email format regex
const emailRegex = /^[^\s@]+@[^\s@]+\.(com|net|org|edu|gov)$/i;

submitBttn.addEventListener("click", (e) => {
  e.preventDefault();

  const emailText = email.value.trim();

  // 1. Check if email is empty
  if (!emailText) {
    errorElement.innerHTML = "*Please enter your email.";
    return;
  }

  // 2. Check if email format is valid
  if (!emailRegex.test(emailText)) {
    errorElement.innerHTML = "*Please enter a valid email address.";
    return;
  }

  // 3. Validate via AJAX
  $.ajax({
    url: "email",
    method: "GET",
    data: { email: emailText },
    success: function (response) {
      const isValid = response === "true" || response === true;

      if (!isValid) {
        errorElement.innerHTML = "*Email not recognized. Please try again or create an account if you haven’t registered yet.";
        return;
      }

      // Clear error message
      errorElement.innerHTML = "";

      
      $.ajax({
        url: "lostPassword",
        method: "POST",
        data: { resetEmail: emailText },
        success: function (response) {
          Swal.fire({
            icon: "success",
            title: "Reset Link Sent!",
            text: "A password reset link has been sent to your email address.",
            confirmButtonText: "OK",
            willOpen: () => {
              Swal.getConfirmButton().style.backgroundColor = '#ff4500';  
              Swal.getConfirmButton().style.color = 'white';             
              Swal.getConfirmButton().style.border = 'none';            
              Swal.getConfirmButton().style.padding = '10px 20px';       
              Swal.getConfirmButton().style.borderRadius = '5px';
            }
          });
        },
        error: function () {
          Swal.fire({
            icon: "error",
            title: "Failed to Send Email",
            text: "Something went wrong. Please try again later.",
            willOpen: () => {
              Swal.getConfirmButton().style.backgroundColor = '#ff4500';  
              Swal.getConfirmButton().style.color = 'white';             
              Swal.getConfirmButton().style.border = 'none';            
              Swal.getConfirmButton().style.padding = '10px 20px';       
              Swal.getConfirmButton().style.borderRadius = '5px';
            }
          });
        }
      });
    },
    error: function () {
      console.error("Failed to validate email.");
      Swal.fire({
        icon: "error",
        title: "Server Error",
        text: "Something went wrong while validating your email. Please try again later.",
        willOpen: () => {
          Swal.getConfirmButton().style.backgroundColor = '#ff4500';  
          Swal.getConfirmButton().style.color = 'white';             
          Swal.getConfirmButton().style.border = 'none';            
          Swal.getConfirmButton().style.padding = '10px 20px';       
          Swal.getConfirmButton().style.borderRadius = '5px';
        }
      });
    }
  });
});
