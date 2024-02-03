document.addEventListener('DOMContentLoaded', function () {
	// Get DOM elements
	let signup = document.querySelector(".signup");
	let login = document.querySelector(".login");
	let slider = document.querySelector(".slider");
	let formSection = document.querySelector(".form-section");

	let loginForm = document.getElementById("LoginForm");
	let signupForm = document.getElementById("SignupForm");

	// Event listener for the signup button
	signup.addEventListener("click", () => {
	    slider.classList.add("moveslider");
	    formSection.classList.add("form-section-move");
	});

	// Event listener for the login button
	login.addEventListener("click", () => {
	    slider.classList.remove("moveslider");
	    formSection.classList.remove("form-section-move");
	});

	// Event listener for loginForm submission
	loginForm.addEventListener("submit", function (event) {
	    // Run login form validation
	    validation(event, "Login");
	});

	// Event listener for signupForm submission
	signupForm.addEventListener("submit", function (event) {
	    // Run signup form validation
	    validation(event, "Signup");
	});

	// Validation function
	function validation(event, formType) {
	    let nameVal, ssnVal, zipVal;
	    var ssnRegex = /^\d{9}$/;
	    var zipcodeRegex = /^\d{6}$/;

	    if (formType === "Login") {
	        nameVal = document.forms["LogInPage"]["LIName"].value;
	        ssnVal = document.forms["LogInPage"]["LISSN"].value;

	        if (nameVal == "") {
	            alert("Name is missing");
	            event.preventDefault();
	            LoginForm.LIName.focus();
	            return false;
	        } 
	        if (ssnVal == "") {
	            alert("SSN is missing");
	            event.preventDefault();
	            LoginForm.LISSN.focus();
	            return false;
	        } else if (!ssnRegex.test(ssnVal)) {
	            alert("SSN has incorrect formatting");
	            event.preventDefault();
	            LoginForm.LISSN.focus();
	            return false;
	        }
	    } else if (formType === "Signup") {
	        nameVal = document.forms["SignUpPage"]["SUName"].value;
	        zipVal = document.forms["SignUpPage"]["SUZip"].value;
	        ssnVal = document.forms["SignUpPage"]["SUSSN"].value;

	        if (nameVal == "") {
	            alert("Name is missing");
	            event.preventDefault();
	            SignupForm.SUName.focus();
	            return false;
	        } else if (!nameRegex.test(nameVal)) {
	            alert("Name has incorrect formatting");
	            event.preventDefault();
	            SignupForm.SUName.focus();
	            return false;
	        }

			if (zipVal == "") {
	            alert("Zipcode is missing");
	            event.preventDefault();
	            SignupForm.SUZip.focus();
	            return false;
	        } else if (!zipcodeRegex.test(zipVal)) {
	            alert("Zipcode has incorrect formatting");
	            event.preventDefault();
	            SignupForm.SUZip.focus();
	            return false;
	        }

	        if (ssnVal == "") {
	            alert("SSN is missing");
	            event.preventDefault();
	            SignupForm.SUSSN.focus();
	            return false;
	        } else if (!ssnRegex.test(ssnVal)) {
	            alert("SSN has incorrect formatting");
	            event.preventDefault();
	            SignupForm.SUSSN.focus();
	            return false;
	        }
	    }
	}
});

function redirectTo(documentName) {
        var selectedValue = event.target.value;
        window.location.href = documentName + '?value=' + selectedValue;
    }