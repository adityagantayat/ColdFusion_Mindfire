<cfcomponent output="false" displayname="authenticateComponent" extends="logErrorFile">
	<cffunction name="register" access="remote" output="false">
		<!--- accept the input values of registration form as arguments to insert them in the database --->
		<cfargument name="userName" type="string" required="true" />
		<cfargument name="userPassword" type="string" required="true" />
		<cfargument name="userEmail" type="string" required="true" />
		<cfargument name="userCourse" type="string" required="true" />
		<cfargument name="userGender" type="string" required="true" />
		<cfargument name="userLanguage" type="string" required="true" />


		<cftry>
			<!--- create an array to store the authentication error messages --->
		<cfset session.authMessages = ArrayNew(1) />

		
		<cfquery >
			<!--- -- insert the data into the database--->
			INSERT INTO student (name, email, password, gender, language, course) VALUES (
				<cfqueryparam value = "#Trim(arguments.userName)#" cfsqltype = "cf_sql_varchar">,	
				<cfqueryparam value = "#Trim(arguments.userEmail)#" cfsqltype = "cf_sql_varchar">,	
				<cfqueryparam value = "#Trim(arguments.userPassword)#" cfsqltype = "cf_sql_varchar">,	
				<cfqueryparam value = "#Trim(arguments.userGender)#" cfsqltype = "cf_sql_varchar">,	
				<cfqueryparam value = "#Trim(arguments.userLanguage)#" cfsqltype = "cf_sql_varchar">,	
				<cfqueryparam value = "#Trim(arguments.userCourse)#" cfsqltype = "cf_sql_varchar">	
				);
		</cfquery>
		<cfcatch type="any">
			<!--- send the error to logErrorFile.cfc to log the errors in a file  --->
			<cfset Super.logError(cfcatch)/>
			<cflocation url="sorry.cfm"/>
		</cfcatch>
		</cftry>
	</cffunction>


	<cffunction name="validateUser" access="remote" output="false" returntype="boolean" returnformat="JSON">
		<cfargument name="logEmail" type="string" required="true" />
		<cfargument name="logPassword" type="string" required="true" />
		<cftry>
		<cfset session.authMessages = ArrayNew(1) />
		<!---Validate the eMail---->
		<cfif arguments.logEmail EQ ''>
			<!--- append the error message to the array --->
			<cfset arrayAppend(session.authMessages,'Invalid Email') />

		</cfif>
		<!---Validate the password---->
		<cfif arguments.logPassword EQ ''>
			<!--- append the error message to the array --->
			<cfset arrayAppend(session.authMessages,'Enter your password') />
		</cfif>

		<!--- check if the validation was correct by checking the length of array of error messages --->
		<cfif arrayLen(session.authMessages) EQ 0>
			<cfreturn true/>
		<cfelse>
			<cfreturn false/>
		</cfif>

		<cfcatch type="any">
			<!--- send the error to logErrorFile.cfc to log the errors in a file  --->
			<cfset Super.logError(cfcatch)/>
			<cflocation url="sorry.cfm"/>
		</cfcatch>
		</cftry>
	</cffunction>

	<cffunction name="findUser" access="remote" output="false" returntype="boolean" returnformat="JSON">

		<cfargument name="logEmail" type="string" required="true" />
		<cfargument name="logPassword" type="string" required="true" />

		<cftry>
		<cfset var isUserLoggedIn = false />
		<cfset session.authMessages = ArrayNew(1) />

		<!--- check if the email id and password provided by user matches with any record in the database --->
		<cfquery name="checkUser"  result="userPresent">
			SELECT  name, password, email, idstudent FROM student
			WHERE email=<cfqueryparam value="#arguments.logEmail#" cfsqltype="cf_sql_varchar" />
			AND
			BINARY password=<cfqueryparam value="#arguments.logPassword#" cfsqltype="cf_sql_varchar" />;
		</cfquery>

		<!--- check if the server found any matching records --->
		<cfif userPresent.recordCount EQ 1>
			<!--- store the student id and his name in the session for identification --->
			<cfset session.loggedInUser = {'userID' = checkUser.idstudent, 'userName' = checkUser.name} />
			<cfset isUserLoggedIn = true />

		<cfelse>
			<cfset isUserLoggedIn = false />

			<cfset arrayAppend(session.authMessages,'User not found') />
		</cfif>

		<cfcatch type="any">
			<!--- send the error to logErrorFile.cfc to log the errors in a file  --->
			<cfset Super.logError(cfcatch)/>
			<cflocation url="sorry.cfm"/>
		</cfcatch>
		</cftry>
		<!--- return true if the user exists in databse or else return false --->
		<cfreturn isUserLoggedIn/>
                       

	</cffunction>
	<cffunction name="emailExists" access="remote" output="false" returntype="boolean" returnformat="JSON">
		<!--- check if the email provided by a new user in registration form already exists in database --->
		<cfargument name="checkEmail" type="string" required="true" />
		

		<cftry>
		<cfset var emailNotExists = false /> <!--- set the value to false by default --->
		

		<!--- check if the email is present in database --->
		<cfquery name="checkEmailPresent" result="emailPresent">
			SELECT  * FROM student
			WHERE email=<cfqueryparam value="#arguments.checkEmail#" cfsqltype="cf_sql_varchar" />
		</cfquery>


		<cfif emailPresent.recordCount EQ 0>
			<!--- if not present set it to true in order to return true --->
			<cfset emailNotExists = true />

		<cfelse>
			<!--- if present set it to false in order to return false --->

			<cfset emailNotExists = false />
		</cfif>

		<cfcatch type="any">
			<!--- send the error to logErrorFile.cfc to log the errors in a file  --->
			<cfset Super.logError(cfcatch)/>
			<cflocation url="sorry.cfm"/>
		</cfcatch>
		</cftry>

		<cfreturn emailNotExists/>
                       

	</cffunction>

	<cffunction name="logoutUser" access="remote" output="false" returntype="boolean" returnformat="JSON">
		<!--- when the user tries to logout --->
		<cftry>
			<!--- delete the user information and cookies from the session on Log Out --->
		<cfset StructDelete(session,'loggedInUser') />
		<cfset StructDelete(cookie,'visitcount') />

		<cfcatch type="any">
			<!--- send the error to logErrorFile.cfc to log the errors in a file  --->
			<cfset Super.logError(cfcatch)/>
			<cflocation url="sorry.cfm"/>
		</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>
</cfcomponent>
