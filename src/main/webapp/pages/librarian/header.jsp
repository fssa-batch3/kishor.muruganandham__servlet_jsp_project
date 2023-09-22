<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
String userName = (String) session.getAttribute("userName");
String profileImage = (String) session.getAttribute("profileImage");
%>
<header class="top-header">
	<div class="left-header">
		<div class="side-toggle">
			<span class="menu-line"></span><span class="menu-line"></span><span
				class="menu-line"></span>
		</div>
		<div class="user-date">
			<h4 class="header-username">Hello</h4>
			<p class="greetings">Have a Great Day!</p>
		</div>
	</div>
	<div class="right-header">
		<div class="search-field">
			<label for="head-search"><i class="bi bi-search"></i></label><input
				type="search" name="head-search" id="head-search"
				placeholder="Search..." class="search-list-show" />
			<div class="focus-out"></div>
			<div class="search-list">
				<div class="search-result"></div>
				<a href="http://localhost:5500/pages/library.html" class="show-all">Show
					All Books</a>
			</div>
		</div>
		<a href="profile"
			aria-label="profile-page" class="profile-area"><div
				class="profile-field"></div>
			<div class="tooltip" role="tooltip" data-popper-placement="top">
				User Profile
				<div class="arrow" data-popper-arrow=""></div>
			</div></a>
	</div>
</header>

<script>
        function displayUserData() {
            try {
                const nameDisplay = document.querySelector(".header-username");
                const greetings = document.querySelector(".greetings");
                const now = moment();
                if (
                    now.isBetween(
                        moment("05:00:00", "HH:mm:ss"),
                        moment("12:00:00", "HH:mm:ss")
                    )
                ) {
                    greetings.textContent = 'Good morning!';
                } else if (
                    now.isBetween(
                        moment("12:00:00", "HH:mm:ss"),
                        moment("18:00:00", "HH:mm:ss")
                    )
                ) {
                    greetings.textContent = 'Good afternoon!';
                } else {
                    greetings.textContent = 'Good evening!';
                }
                const profileDisplay = document.querySelector(".profile-field");

                profileDisplay.addEventListener("mouseenter", () => {
                    profileDisplay.nextElementSibling.style.display = "inline-block";
                });

                profileDisplay.addEventListener("mouseleave", () => {
                    profileDisplay.nextElementSibling.style.display = "none";
                });
                nameDisplay.textContent = `Hello <%=userName%>`;
                profileDisplay.style.background = `url(<%=profileImage%>) center center/cover no-repeat`;
            } catch (error) {
                console.error(`Error in displayUserData function: ${error}`);
            }
        }
        window.addEventListener("load", displayUserData);
    </script>