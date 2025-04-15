const passwordErrorDiv = document.getElementById("reg-password-error");
passwordErrorDiv.style.height = "auto"; 
passwordErrorDiv.style.maxHeight = "none";

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

let setOfInvalidElements = new Set();

const passwordRegex =
  /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*])^(?!.*\s)[A-Za-z\d!@#$%^&*]{6,20}$/

  const validatorsMap = new Map();
  function attachValidation(elementToValidate, validator, message) {
      validatorsMap.set(elementToValidate, { validator, message });
    elementToValidate.addEventListener("blur", () => {
      validateWith(validator, elementToValidate, message);
    });
  }


function validateWith(validator, element, message) {
    const errorDiv = document.getElementById(`${element.id}-error`);
    const value = element.value.trim();
  
    let isValid = false;
    let errorMsg = "";
  
    if (!value) {
      errorMsg = "*This field is required";
    } else {
      isValid = typeof validator === "function"
        ? validator(value)
        : validator.test(value);
  
      if (!isValid) {
        errorMsg = message;
      }
    }
  
    if (errorMsg) {
      errorDiv.innerHTML = errorMsg;
      setOfInvalidElements.add(element);
    } else {
      errorDiv.innerHTML = "";
      errorDiv.removeAttribute("style");
      setOfInvalidElements.delete(element);
    }
  }


  const password = document.getElementById("reg-password");
  const confirmPassword = document.getElementById("reg-conf-password");
  attachValidation(password, passwordRegex,"*Password must be 6–20 characters with at least 1 uppercase letter, 1 lowercase letter, 1 digit, and 1 special character");
  function confirmPasswordValidator(passwordElement) {
    return function (confPassword) {
      return confPassword === passwordElement.value.trim();
    };
  }
  
  // Attach validation
  attachValidation(
    confirmPassword,
    confirmPasswordValidator(password),
    "*Passwords do not match"
  );

  function notEmptyValidator(value) {
    return value.trim() !== "";
  }


  // submit bttn
const form = document.getElementById("reset-password-form");
const submitBttn = document.getElementById("reset-bttn");
submitBttn.addEventListener("click", (e) => {
  e.preventDefault();

  validatorsMap.forEach(({ validator, message }, element) => {
    validateWith(validator, element, message);
  });

  if (setOfInvalidElements.size !== 0) {
    Swal.fire({
      icon: 'error',
      title: 'Incomplete or Invalid Form',
      text: 'Please complete all required fields and correct any invalid inputs before submitting.',
      confirmButtonText: 'OK',
      willOpen: () => {
       
        Swal.getConfirmButton().style.backgroundColor = '#ff4500';  
        Swal.getConfirmButton().style.color = 'white';             
        Swal.getConfirmButton().style.border = 'none';            
        Swal.getConfirmButton().style.padding = '10px 20px';       
        Swal.getConfirmButton().style.borderRadius = '5px';        
      }

    });
    return;
  }
  const passwordValue = password.value.trim();
  const tokenValue = new URLSearchParams(window.location.search).get("token");

  $.ajax({
    url: 'resetPassword', // URL to your servlet
    type: 'POST',
    data: {
      password: passwordValue,
      token: tokenValue
    },
    success: function(response) {
      if (response.status === "success") {
        Swal.fire({
          icon: 'success',
          title: 'Password Reset!',
          text: 'Your password has been reset successfully.',
          confirmButtonText: 'OK',
          willOpen: () => {
       
            Swal.getConfirmButton().style.backgroundColor = '#ff4500';  
            Swal.getConfirmButton().style.color = 'white';             
            Swal.getConfirmButton().style.border = 'none';            
            Swal.getConfirmButton().style.padding = '10px 20px';       
            Swal.getConfirmButton().style.borderRadius = '5px';        
          }
        }).then(() => {
          window.location.href = "signin.jsp"; // Redirect to login page
        });
      } else {
        Swal.fire({
          icon: 'error',
          title: 'Reset Failed',
          text: response.message,
          confirmButtonText: 'Try Again',
          willOpen: () => {
       
            Swal.getConfirmButton().style.backgroundColor = '#ff4500';  
            Swal.getConfirmButton().style.color = 'white';             
            Swal.getConfirmButton().style.border = 'none';            
            Swal.getConfirmButton().style.padding = '10px 20px';       
            Swal.getConfirmButton().style.borderRadius = '5px';        
          }
        });
      }
    },
    error: function(xhr, status, error) {
      console.error("Error during password reset:", error);
      Swal.fire({
        icon: 'error',
        title: 'Unexpected Error',
        text: 'Something went wrong. Please try again later.',
        confirmButtonText: 'OK',
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