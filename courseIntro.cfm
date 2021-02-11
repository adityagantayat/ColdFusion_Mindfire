<cfif structKeyExists(session, 'loggedInUser')>
		<cfoutput>
		<cfmodule template="./customTags/helloNavbar.cfm" pagename="Hello" userName=#session.loggedInUser.userName#>
			<div class="container">

			<h2 class="navbar-brand text-dark font-weight-bold font-italic mt-3 my-2">Here are the details of the courses we offer</h2>
		</div>
			<div class="container">
			<p>
				<strong class="text-success">HTML:</strong> 
				<br>
				HTML stands for Hyper Text Markup Language
				HTML is the standard markup language for creating Web pages
				HTML describes the structure of a Web page
				HTML consists of a series of elements
				HTML elements tell the browser how to display the content
				HTML elements label pieces of content such as "this is a heading", "this is a paragraph", "this is a link", etc.
			</p>
			<br>
			<p>
				<strong class="text-success">CSS:</strong> 
				<br>

				CSS is the language we use to style an HTML document.
				CSS describes how HTML elements should be displayed.
				This tutorial will teach you CSS from basic to advanced.
								
			</p>
			<br>
			<p>
				<strong class="text-success">JavaScript:</strong> 
				<br>

				JavaScript is the world's most popular programming language.
				JavaScript is the programming language of the Web.
				JavaScript is easy to learn.
				This tutorial will teach you JavaScript from basic to advanced.
								
			</p>
			<br>
			<a href="./helloPage.cfm"> Go back to Home Page</a>
			</div>
		</cfoutput>
	<cfelse>
	<cflocation url="./loginPage.cfm"/>

	</cfif>