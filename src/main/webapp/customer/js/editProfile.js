
// regex

const nameRegex = /^[a-zA-Z]{2,15}$/; // start with capital letter min 2 char max 15
/*  at least 6 chars max 20 
    at least 1 capital letter
    at least 1 small letter
    at least 1 digit letter
    at least 1 special character
*/

const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
const phoneRegex = /^(01)[1250][0-9]{8}$/;

let setOfInvalidElements = new Set();

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
  
  function dobValidator(dateText) {
    const dob = new Date(dateText);
    const today = new Date();
  
    if (isNaN(dob.getTime())) return false; // Not a valid date
  
    // Optional: Check age (e.g., at least 13 years old)
    const ageDiff = today.getFullYear() - dob.getFullYear();
    const monthDiff = today.getMonth() - dob.getMonth();
    const dayDiff = today.getDate() - dob.getDate();
  
    const isOldEnough = (
      ageDiff > 18 ||
      (ageDiff === 18 && (monthDiff > 0 || (monthDiff === 0 && dayDiff >= 0)))
    );
  
    return dob < today && isOldEnough;
  }
  

// personal information
const fname = document.getElementById("reg-fname");
const lname = document.getElementById("reg-lname");
const job = document.getElementById("reg-job");

const email = document.getElementById("reg-email");
const phone = document.getElementById("reg-phone");




attachValidation(fname, nameRegex, "*First name must contain only letters");
attachValidation(lname, nameRegex, "*Last name must contain only letters");
attachValidation(job, nameRegex, "*Job must conatin only letters");
attachValidation(phone, phoneRegex, "*Phone must start with 010, 011, 012, or 015 and contain 11 digits");
attachValidation(email, emailRegex, "*Please enter a valid email address");




function notEmptyValidator(value) {
    return value.trim() !== "";
  }
  
  function selectValidator(value) {
    return value !== "";
  }

  function fetchEmails() {
    const emailText = email.value.trim(); // Get email value
    if (!emailText) return; // Avoid unnecessary requests if empty

    $.ajax({
        url: "email",
        method: "GET",
        data: { email: emailText },
        success: function (response) {
            let isInvalid = response === "true" || response === true; 
            let errorElement = document.getElementById("reg-email-error");

            if (isInvalid) {
                setOfInvalidElements.add(email);
                errorElement.innerHTML = "*This email is already taken.";
                
            } else {
                setOfInvalidElements.delete(email);
                errorElement.innerHTML = "";
            }
        },
        error: function () {
            console.error("Failed to validate email.");
        },
    });
}

// Attach event properly
email.addEventListener("blur", function () {
    fetchEmails();
});


email.addEventListener("blur", fetchEmails);

function fetchPhone() {
  const phoneText = phone.value.trim();
  if (!phoneText) return;

  $.ajax({
      url: "phoneedit",
      method: "GET",
      data: { phone: phoneText },
      success: function (response) {
          let isInvalid = response === "true" || response === true; 
          let errorElement = document.getElementById("reg-phone-error");

          if (isInvalid) {
              setOfInvalidElements.add(phone);
              errorElement.innerHTML = "*This phone number is already taken.";
          } else {
              setOfInvalidElements.delete(phone);
              errorElement.innerHTML = "";
          }
      },
      error: function () {
          console.error("Failed to validate phone number.");
      },
  });
}

// Attach event properly
phone.addEventListener("blur", function () {
  fetchPhone();
});







// submit bttn
$("#editProfileForm").on("submit", function (e) {
  e.preventDefault(); // Prevent default form submission

  let form = this; 
  validatorsMap.forEach(({ validator, message }, element) => {
    validateWith(validator, element, message);
  });
  
  if (setOfInvalidElements.size !== 0) {
    return;
  }
  // Check if all required fields are filled
  if (form.checkValidity()) {
      form.submit();

  } else {
      form.reportValidity(); // Show validation messages
  }
});