<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="/WEB-INF/views/inc/asset.jsp" %>
    <style>
        .nav-icon {
            font-size: 50px !important;
        }

        #main {
            text-align: center;
            margin-top: 150px;
        }

        #search-container {
            width: 80%;
            text-align: center;
            border-top: 2px solid black;
            margin: 50px auto 0;
        }

        #search-form {
            margin-top: 50px;
        }

        #hashtag-container {
            display: flex;
            text-align: center;
            margin-top: 10px;
            justify-content: center;
        }

        .hashtag {
            width: 100px;
            height: 40px;
            margin-right: 5px;
        }

        #result-container {
            text-align: left;
            margin-top: 20px;
        }

        .result-title {
            font-size: 30px;
            border-bottom: 2px solid #CCC;
            padding-bottom: 10px;
            margin-bottom: 10px;
        }

        .result-content {
            font-size: 20px;
            margin-bottom: 10px;
            padding-bottom: 10px;
            border-bottom: 1px solid #CCC;
        }

        #search-field {
            height: 80px;
            width: 60%;
            padding: 30px;
            font-size: 20px;
            border-radius: 40px;
        }

        #search-button {
            background-color: transparent;
            border: none;
            outline: none;
        }

        #search-button span {
            font-size: 40px;
            position: relative;
            top: 13px;
        }
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/inc/header.jsp" %>

    <main id="main">
        <h1>검색</h1>

        <div id="search-container">
            <form method="POST" id="search-form">
                <input type="text" name="word" id="search-field" pattern=".{2,}" placeholder="두 글자 이상의 단어를 입력하세요." required>

                <button type="button" id="search-button">
                    <span class="material-symbols-outlined">search</span>
                </button>
            </form>

            <div id="hashtag-container">
                <div class="hashtag">#hashtag</div>
                <div class="hashtag">#hashtag</div>
                <div class="hashtag">#hashtag</div>
            </div>

            <div id="result-container">
                <!-- Search results will be dynamically added here -->
            </div>
        </div>
    </main>
    <%@ include file="/WEB-INF/views/inc/footer.jsp" %>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var searchField = document.getElementById('search-field');
            var searchButton = document.getElementById('search-button');
            var resultContainer = document.getElementById('result-container');

            searchButton.addEventListener('click', function () {
                var searchTerm = searchField.value.trim();
                if (searchTerm !== '') {
                    // Ajax request
                    var xhr = new XMLHttpRequest();
                    xhr.open('POST', '/ddstudio/user/search.do', true);
                    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === 4 && xhr.status === 200) {
                            // Parse the JSON response
                            var response = JSON.parse(xhr.responseText);
                            // Display search results
                            displaySearchResults(response);
                        }
                    };

                    // Send the request with the search term
                    xhr.send('word=' + encodeURIComponent(searchTerm));
                }
            });

            function displaySearchResults(results) {
                // Clear existing content
                resultContainer.innerHTML = '';

                // Display search results dynamically
                results.forEach(function (result) {
                    var titleDiv = document.createElement('div');
                    titleDiv.className = 'result-title';
                    titleDiv.textContent = result.attractionName; // Adjust as per your actual field

                    var contentDiv = document.createElement('div');
                    contentDiv.className = 'result-content';
                    contentDiv.textContent = result.themeName; // Adjust as per your actual field

                    // Append dynamically created elements to result container
                    resultContainer.appendChild(titleDiv);
                    resultContainer.appendChild(contentDiv);
                });
            }
        });
    </script>
</body>
</html>
