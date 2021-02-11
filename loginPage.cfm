<cfif NOT structKeyExists(session, 'loggedInUser')>

<cfmodule template="./customTags/headerFile.cfm" pagename="Log In">
<body>
<cfoutput>

	<form class="form-content" action="helloPage.cfm" method="post">
		<div class="container-fluid mx-10 my-5">
            <div class="my-3 text-left">
                <h5 class="regHead text-dark font-weight-normal ">Welcome to IT world</h5>
                    <h6 class="regSubHead text-info">Please enter your credentials to login</h6>
            </div>
            <div class="row">
                <div class="col-sm-6 col-md-4">
			            <div class="form-group">
			                            <label class="myLabel" for="email">E-mail :</label><span class=" text-danger"> *</span>
			                            <br>
			                            <input type="email" id="loginEmail" class="form-control" name="loginEmail"
			                                placeholder="yourname@example.com" value="" maxlength="50" />
			                                <small><span class="errorMsg text-danger" id="loginEmailErrorMsg">Invalid email type</span></small>
			            </div>
			            <div class="form-group">
			                        <label class="myLabel" for="password">Password :</label><span class=" text-danger">
			                            *</span>

			                        <input type="password" id="loginPassword" value="" class="form-control" name="loginPassword"
			                            placeholder="Password"  maxlength="15" />
			           
			            </div>
			            <input type="button" class="btn btn-info btn-sm my-2" onclick="loginCheck()" name="SubmitForm" value="Login">
			            <br>
			             <small><span class="errorMsg text-danger" id="userErrorMsg">Invalid credentials. User not found.</span></small>
			            <br>
			            <a href="./regForm.cfm">New user? Register yourself here.</a>
                </div>
            </div>
        </div>
	</form>
</body>
</cfoutput>
<cfelse>
	<cflocation url="./helloPage.cfm"/>
</cfif>