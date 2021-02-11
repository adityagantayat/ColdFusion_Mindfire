<!--- log the error messages(if any) in a file --->
<cfcomponent displayname="logErrorFileComponent">
	<cffunction name="logError" output="false" access="package" >

		<!--- accept the errors as an argument from other pages and log them in a file --->
		<cfargument name="error" type="any" required="true">
		<cflog file="errorLogFile" application="yes" text="Type - #arguments.error.type#, Error Message - #arguments.error.message#, Details - #arguments.error.detail#">
	</cffunction>
</cfcomponent>