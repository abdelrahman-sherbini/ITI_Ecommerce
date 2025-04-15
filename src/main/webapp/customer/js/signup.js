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
// governoates and cities
const governorates = {
    "Cairo": ["Nasr City", "Heliopolis", "Maadi", "New Cairo", "Shubra"],
    "Giza": ["Dokki", "Mohandessin", "6th October", "Sheikh Zayed", "Faisal"],
    "Alexandria": ["Smouha", "Stanley", "Sidi Gaber", "Mandara"],
    "Aswan": ["Aswan City", "Edfu", "Kom Ombo"],
    "Luxor": ["Luxor City", "Armant", "Esna"],
    "Assiut": ["Assiut City", "Abnub", "El Badari"],
    "Suez": ["Suez City", "Ain Sokhna"],
    "Port Said": ["Port Fouad", "Port Said City"],
    "Ismailia": ["Ismailia City", "Fayed", "Abu Suwir"],
    "Dakahlia": ["Mansoura", "Talkha", "Mit Ghamr"],
    "Beheira": ["Damanhur", "Kafr El Dawwar", "Rashid"],
    "Sharqia": ["Zagazig", "10th of Ramadan", "Bilbeis"],
    "Qalyubia": ["Banha", "Qalyub", "Shubra El Kheima"],
    "Kafr El Sheikh": ["Desouk", "Baltim", "Kafr El Sheikh City"],
    "Menoufia": ["Shebin El Kom", "Sadat City", "Menouf"],
    "Gharbia": ["Tanta", "Mahalla", "Kafr El Zayat"],
    "Faiyum": ["Faiyum City", "Ibsheway", "Tamiya"],
    "Beni Suef": ["Beni Suef City", "El Wasta", "Nasser"],
    "Minya": ["Minya City", "Mallawi", "Samalut"],
    "Qena": ["Qena City", "Nag Hammadi", "Qus"],
    "Sohag": ["Sohag City", "Akhmim", "Tahta"],
    "North Sinai": ["Arish", "Bir al-Abed"],
    "South Sinai": ["Sharm El Sheikh", "Dahab", "Nuweiba"],
    "Red Sea": ["Hurghada", "Safaga", "Quseir"],
    "New Valley": ["Kharga", "Dakhla"],
    "Matruh": ["Marsa Matruh", "Siwa"],
  };
  
  const governorateSelect = document.getElementById("address-state");
  const citySelect = document.getElementById("address-city");
  
  // Populate governorates
  Object.keys(governorates).forEach(gov => {
    const option = document.createElement("option");
    option.value = gov;
    option.textContent = gov;
    governorateSelect.appendChild(option);
  });
  
  // Change city options based on selected governorate
  governorateSelect.addEventListener("change", function () {
    const selectedGov = this.value;
    citySelect.innerHTML = '<option selected value="">Choose City</option>';
  
    if (governorates[selectedGov]) {
      governorates[selectedGov].forEach(city => {
        const option = document.createElement("option");
        option.value = city;
        option.textContent = city;
        citySelect.appendChild(option);
      });
    }
  });
  
// regex

const nameRegex = /^[a-zA-Z]{2,15}$/; // start with capital letter min 2 char max 15
/*  at least 6 chars max 20 
    at least 1 capital letter
    at least 1 small letter
    at least 1 digit letter
    at least 1 special character
*/
const passwordRegex =
  /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*])^(?!.*\s)[A-Za-z\d!@#$%^&*]{6,20}$/
const emailRegex = /^[^\s@]+@[^\s@]+\.(com|net|org|edu|gov)$/i;
const phoneRegex = /^(01)[1250][0-9]{8}$/;
const jobRegex = /^[a-zA-Z][a-zA-Z\s]{3,50}$/;
const postalCodeRegex = /^\d{5}$/;

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
  
    
    const ageDiff = today.getFullYear() - dob.getFullYear();
    const monthDiff = today.getMonth() - dob.getMonth();
    const dayDiff = today.getDate() - dob.getDate();
  
    const isOldEnough = (
      ageDiff > 18 ||
      (ageDiff === 18 && (monthDiff > 0 || (monthDiff === 0 && dayDiff >= 0)))
    );
  
    return dob < today && isOldEnough;
  }
  
function creditValidator(amount){
    if(!Number.isNaN(amount)){
        if(amount >= 500){
            return true;
        }else{
            return false;
        }
    }else{
        return false;
    }
}

// personal information
const fname = document.getElementById("reg-fname");
const lname = document.getElementById("reg-lname");
const job = document.getElementById("reg-job");
const password = document.getElementById("reg-password");
const confirmPassword = document.getElementById("reg-conf-password");
const  email = document.getElementById("reg-email");
const phone = document.getElementById("reg-phone");
const credit = document.getElementById("reg-credit");
const dob = document.getElementById("reg-dob");



attachValidation(fname, nameRegex, "*First name must contain only letters");
attachValidation(lname, nameRegex, "*Last name must contain only letters");
attachValidation(job, jobRegex, "*Job must conatin only letters");
attachValidation(password, passwordRegex,"*Password must be 6–20 characters with at least 1 uppercase letter, 1 lowercase letter, 1 digit, and 1 special character");
attachValidation(phone, phoneRegex, "*Phone must start with 010, 011, 012, or 015 and contain 11 digits");
attachValidation(email, emailRegex, "*Please enter a valid email address");
attachValidation(dob, dobValidator, "*must be 18 years old or above");
attachValidation(credit, creditValidator, "*Credit must be above 500 L.E");

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
  
  function selectValidator(value) {
    return value !== "";
  }

  function fetchEmails() {
    const emailText = email.value.trim(); // Get email value
    if (!emailText) return; // Avoid unnecessary requests if empty

     // check email format
     const isFormatValid = emailRegex.test(emailText);
     if (!isFormatValid) {
         return;
     }

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
     
     validateWith(emailRegex, email, "*Please enter a valid email address");
    
     
     if (!setOfInvalidElements.has(email)) {
         fetchEmails();
     }
});




function fetchPhone() {
  const phoneText = phone.value.trim();
  if (!phoneText) return;

  // check phone format
  const isFormatValid = phoneRegex.test(phoneText);
  if (!isFormatValid) {
      return;
  }
  $.ajax({
      url: "phone",
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
  validateWith(phoneRegex, phone, "*Phone must start with 010, 011, 012, or 015 and contain 11 digits");
  fetchPhone();

  if (!setOfInvalidElements.has(phone)) {
    fetchPhone();
  }
});

function descriptiveAddressValidator(value) {
  const trimmed = value.trim();
  const wordCount = trimmed.split(/\s+/).length;
  return wordCount >= 3 && trimmed.length >= 10;
}
function fullAddressValidator(value) {
  return notEmptyValidator(value) && descriptiveAddressValidator(value);
}


// default address
const address = document.getElementById("address-street");
const governorate = document.getElementById("address-state");
const city = document.getElementById("address-city");
const postal = document.getElementById("address-postal");

attachValidation(address, fullAddressValidator, "*Address must be more descriptive (at least 3 words and 10 characters).");
attachValidation(governorate, selectValidator, "*Please select a governorate");
attachValidation(city, selectValidator, "*Please select a city");
attachValidation(postal, postalCodeRegex, "*Please enter a valid Egyptian postal code (e.g., 11511).")




// submit bttn
const form = document.getElementById("reg-form");
const submitBttn = document.getElementById("reg-bttn");
submitBttn.addEventListener("click", (e) => {
  e.preventDefault();

  validatorsMap.forEach(({ validator, message }, element) => {
    validateWith(validator, element, message);
  });
  // type radio button validation
  console.log("Radio checked?", document.querySelector('input[name="type"]:checked'));

  const addressTypeRadios = document.querySelectorAll('input[name="type"]');
  const firstRadio = addressTypeRadios[0];
  const isAddressTypeSelected = document.querySelector('input[name="type"]:checked') !== null;
  const errorDiv = document.getElementById("address-type-error");

  if (!isAddressTypeSelected) {
    errorDiv.textContent = "*Please select an address type";
    setOfInvalidElements.add(firstRadio); 
  } else {
    errorDiv.textContent = "";
    setOfInvalidElements.delete(firstRadio); 
  }

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
  Swal.fire({
    icon: 'success',
    title: 'Welcome aboard!',
    text: 'Registration successful Start shopping now!',
    confirmButtonText: 'OK',
    willOpen: () => {
       
      Swal.getConfirmButton().style.backgroundColor = '#ff4500';  
      Swal.getConfirmButton().style.color = 'white';             
      Swal.getConfirmButton().style.border = 'none';            
      Swal.getConfirmButton().style.padding = '10px 20px';       
      Swal.getConfirmButton().style.borderRadius = '5px';        
    }
  }).then(() => {
    form.submit(); 
  });
});
