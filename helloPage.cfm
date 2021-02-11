	<cfif structKeyExists(session, 'loggedInUser')>
		<cfif structkeyexists(cookie, 'visitcount')>
			<cfset cookie.visitcount=cookie.visitcount+1/>

		<cfelse>
			<cfcookie name = "visitcount" value = 1>
		</cfif>

		
		<cfquery name="helloUser" <!--- datasource="sample_cf" ---> result="userPresent">
			SELECT  name, course, language,email, idstudent FROM student
			WHERE idstudent=<cfqueryparam value="#session.loggedInUser.userID#" cfsqltype="cf_sql_varchar" />
		</cfquery>
		<cfoutput>
		<cfmodule template="./customTags/helloNavbar.cfm" pagename="Hello" userName=#session.loggedInUser.userName#>

			<cfif cookie.visitcount GT 1>
				<p style="text-align: center; color: blue; font-weight: bolder;"> You visited this page <cfoutput>#cookie.visitcount#</cfoutput> times without logging in </p>
			</cfif>

			<h2 class="navbar-brand text-dark font-weight-bold text-center font-italic mt-3">Hello #helloUser.name#.!</h2>
			<div class="container">

			<p>We're glad to have you in this institute. As we see, you have registered for <strong>#helloUser.course#</strong>. We assure you that, the prior knowledge you have in <strong>#helloUser.language#</strong>, will be really useful. The course shall start in another two weeks. You'll be notified via your email id i.e. <strong>#helloUser.email#</strong>.</p>
			<br>
			<a href="./courseIntro.cfm">To get an introductory idea of the courses, click here! </a>
			</div>
		</cfoutput>
	<cfelse>
		<cfset StructDelete(cookie,'visitcount') />
		<cflocation url="./loginPage.cfm"/>

	</cfif>
