<cfmodule template="./customTags/headerFile.cfm" pagename="Register">
<body>
<!--- Show the register page with the registration form --->
<cfoutput>
<cfform class="form-content">

 
    <section class="sectionBody">
        <div class="container-fluid mx-2">
            <div class="my-3 text-left">
                <h5 class="regHead text-dark font-weight-normal ">Register yourself here!</h5>
                    <h6 class="regSubHead text-info">It's quick and easy.</h6>
            </div>
            <!--- Show the input fields --->
            <div class="row">
                <div class="col-sm-12 col-md-6">
                        <div class="form-group">
                            <label class="myLabel" for="firstName">Name :</label><span class=" text-danger"> *</span>
                            <div class="row">
                                <div class="col-sm-6 col-md-6">
                                    <cfinput type="text" id="firstName" class="form-control" name="firstName"
                                        placeholder="First Name" maxlength="15" />
                                    <small><span class="errorMsg firstNameErrorMsg text-danger" id="firstNameErrorMsg">Please enter only
                                            Alphabets</span></small>
                                </div>
                                <div class="col-sm-6 col-md-6">
                                    <cfinput type="text" id="lastName" class="form-control" name="lastName"
                                        placeholder="Last Name" maxlength="15" />
                                              <small><span class="errorMsg lastNameErrorMsg text-danger" id="lastNameErrorMsg">Please enter only Alphabets</span></small>
                                   
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="myLabel" for="email">E-mail :</label><span class=" text-danger"> *</span>
                            <br>
                            <cfinput type="email" id="email" class="form-control" name="email"
                                placeholder="yourname@example.com" value="" maxlength="50" />
                            <small><span class="errorMsg text-danger" id="emailErrorMsg">Invalid email type</span></small>
                            <small><span class="errorMsg emailExistErrorMsg text-danger" id="emailExistErrorMsg">This email id has already been registered. Please login or register with a new email id</span></small>


                          
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-sm-6 col-md-6">
                                    <label class="myLabel" for="password">Password :</label><span class=" text-danger">
                                        *</span>

                                    <cfinput type="password" id="password" 	 class="form-control" name="password"
                                        placeholder="Password"  maxlength="15" />
                                        <small><span class="errorMsg text-danger" id="passwordErrorMsg">Length should be within 6-12
                                            characters(One
                                            digit and one special character at least)</span></small>
                                   <!---  <small><span class="errorMsg text-danger" id="passwordErrorMsg">Length should be within 6-12
                                            characters(One
                                            digit and one special character at least)</span></small> --->
                                </div>
                                <div class="col-sm-6 col-md-6">
                                    <label for="confirmPassword" class="confirmPassword myLabel">Confirm Password
                                        :</label><span class=" text-danger"> *</span>
                                    <cfinput type="password" id="confirmPassword" class="form-control"
                                        name="confirmPassword" placeholder="Confirm your Password"
                                         maxlength="15" />
                                         <small><span class="errorMsg text-danger" id="confirmPasswordErrorMsg">Password
                                            mismatch</span></small>
                                   
                                </div>
                            </div>
                        </div>


				
				<div class="form-group">
                            <label class="myLabel" for="gender">Gender</label>
                            <span class=" text-danger">*</span>
                            <br>
                            <div class="form-check-inline">
                                <label class="form-check-label" for="male">Male
                                    <cfinput type="radio" name="gender" class="form-check-input" value="male" id="male" />
                                </label>
                            </div>
                            <div class="form-check-inline">
                                <label class="form-check-label" for="female">Female
                                    <cfinput type="radio" name="gender" class="form-check-input" value="female"
                                        id="female" />
                                </label>
                            </div>
                            <div class="form-check-inline">
                                <label class="form-check-label" for="other">Other
                                    <cfinput type="radio" name="gender" class="form-check-input" value="other"
                                        id="other" />
                                </label>
                            </div>
                            <br>
                            <small><span class="errorMsg text-danger" id="genderErrorMsg">Select Gender</span></small>
                        </div>
                        <br>
                        <div class="form-group">
                            <label class="myLabel">Select the languages you are comfortable with:</label> <span
                                class=" text-danger"> *</span>
                            <br>
                            <div class="form-check-inline">
                                <label class="form-check-label">
                                    <cfinput type="checkbox" id="java" class="form-check-input" name="language"
                                        value="java" >
                                    Java
                                </label>
                            </div>
                            <div class="form-check-inline">
                                <label class="form-check-label">
                                    <cfinput type="checkbox" id="python" class="form-check-input" name="language"
                                        value="python">
                                    Python
                                </label>
                            </div>
                            <div class="form-check-inline">
                                <label class="form-check-label">
                                    <cfinput type="checkbox" id="c" class="form-check-input" name="language" value="c">
                                    C
                                </label>
                            </div>
                            <div class="form-check-inline">
                                <label class="form-check-label">
                                    <cfinput type="checkbox" id="c++" class="form-check-input" name="language"
                                        value="c++">
                                    C++
                                </label>
                            </div>
                            <br>
                            <small><span class="errorMsg text-danger" id="languageErrorMsg">Select at least one
                                    language</span></small>

                        </div>
                        <br>   
                        <div class="form-group">
                            <label class="myLabel" for="course">Select Course :</label>
                            <span class=" text-danger">*</span>
                            <cfselect name="course" class="form-control" id="course">
                                <option disabled selected value="">-- Choose Course --
                                
                                <option value="HTML">HTML
                                <option value="CSS">CSS
                                <option value="JS">JavaScript
                            </cfselect>
                          
                        </div>  
                        <small>
                            <span class="errorMsg text-danger" id="courseErrorMsg">Select atleast one
                                    course.</span>
                        </small>
                        <br>
                       

                        <!--- clear the form button --->
                        <cfinput type="Reset" class="btn btn-warning"  name="ResetForm" value="Clear Form">
                        <!--- submit button --->
                        <cfinput type="button" class= " btn btn-info" onclick="validateForm()" name="SubmitForm" value="Submit">
                </div>  
                <small>
                    <span class="errorMsg submitError text-danger" id="submitErrorMsg">Please fill in all the fields.</span>
                </small>
                <br>
                <a href="./loginPage.cfm">Already have an account? Sign in here</a>
</cfform>
</cfoutput>
</body>
</html>