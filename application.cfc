<cfcomponent
	displayname="Application"
	output="true"
	hint="Handle the application.">


	<!--- Set up the application. --->
	<cfset THIS.Name = "AppCFC" />
	<cfset THIS.SessionManagement = "Yes" />
	<cfset THIS.SetClientCookies = true />
	<cfset THIS.datasource = "sample_cf" />
	<cfset THIS.ApplicationTimeout = CreateTimeSpan( 0, 0, 10, 0 ) />
	<cfset This.SessionTimeout = CreateTimeSpan(0, 0, 0, 10) />


	<!--- Define the page request properties. --->
	<cfsetting
		requesttimeout="20"
		showdebugoutput="false"
		enablecfoutputonly="false"
		/>


	<cffunction
		name="OnApplicationStart"
		access="public"
		returntype="boolean"
		output="false"
		hint="Fires when the application is first created.">
		<!--- log the message of the function in a file to know the flow --->
		<cflog file="MyLogFile" text="OnApplicationStart">
		<cfreturn true />
	</cffunction>


	<cffunction
		name="OnSessionStart"
		access="public"
		returntype="void"
		output="false"
		hint="Fires when the session is first created.">
		<!--- log the message of the function in a file to know the flow --->
		<cflog file="MyLogFile" text="OnSessionStart">
		<cfreturn />
	</cffunction>


	<cffunction
		name="OnRequestStart"
		access="public"
		returntype="boolean"
		output="false"
		hint="Fires at first part of page processing.">

		<cfargument
			name="TargetPage"
			type="string"
			required="true"
			/>
		<!--- log the message of the function in a file to know the flow --->
		<cflog file="MyLogFile" text="OnRequestStart">
		<cfreturn true />
	</cffunction>


	<cffunction
		name="OnRequest"
		access="public"
		returntype="void"
		output="true"
		hint="Fires after pre page processing is complete.">

		<cfargument
			name="TargetPage"
			type="string"
			required="true"
			/>

		<!--- Include the requested page. --->
		<cfinclude template="#ARGUMENTS.TargetPage#" />

		<!--- log the message of the function in a file to know the flow --->
		<cflog file="MyLogFile" text="OnRequest">
		<cfreturn />
	</cffunction>


	<cffunction
		name="OnRequestEnd"
		access="public"
		returntype="void"
		output="true"
		hint="Fires after the page processing is complete.">

		<!--- log the message of the function in a file to know the flow --->
		<cflog file="MyLogFile" text="OnRequestEnd">
		<cfreturn />
	</cffunction>


	<cffunction
		name="OnSessionEnd"
		access="public"
		returntype="void"
		output="false"
		hint="Fires when the session is terminated, mostly after a session timeout.">

		<!--- Define arguments. --->
		<cfargument
			name="SessionScope"
			type="struct"
			required="true"
			/>

		<cfargument
			name="ApplicationScope"
			type="struct"
			required="false"
			default="#StructNew()#"
			/>

		<!--- log the message of the function in a file to know the flow --->
		<cflog file="MyLogFile" text="OnSessionEnd">
		<cfreturn />
	</cffunction>


	<cffunction
		name="OnApplicationEnd"
		access="public"
		returntype="void"
		output="false"
		hint="Fires when the application is terminated.">

		<!--- Define arguments. --->
		<cfargument
			name="ApplicationScope"
			type="struct"
			required="false"
			default="#StructNew()#"
			/>
		<!--- log the message of the function in a file to know the flow --->
		<cflog file="MyLogFile" text="Application terminated">
		<cfreturn />
	</cffunction>

	<cffunction
		name="OnError"
		access="public"
		returntype="void"
		output="true"
		hint="Fires when an exception occures that is not caught by a try/catch.">

		<!--- Define arguments. --->
		<cfargument
			name="Exception"
			type="any"
			required="true"
			/>

		<cfargument
			name="EventName"
			type="string"
			required="false"
			default=""
			/>
		<cfreturn />
	</cffunction>

</cfcomponent>