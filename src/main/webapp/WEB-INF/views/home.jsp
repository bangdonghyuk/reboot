<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>


<body>
	<div class="wrap">
		<div class="header">
			<div class="header__wrap">
				<div class="header__logo">
					<a href="#none">REBOOT</a>
				</div>
			</div>
		</div>

		<div class="container">
		
				<div class="search">
					<div class="search__wrap">
						<!-- 검색 폼 -->
						<div class="search__box">
							<div class="search__tit">REBOOT.GG</div>
							<div class="search__subTit">메이플스토리 캐릭터 정보 검색 서비스</div>
							<div class="search__inputBox">
								<input class="search__input" type="text" id="characterName"
									name="characterName" required placeholder="캐릭터 이름 검색">
								<button class="search__inputBtn" type="button"
									onclick="searchCharacter()">
									<span class="material-symbols-outlined"> search </span>
								</button>
							</div>
						</div>
						<!-- //검색 폼 -->
					</div>

			</div>
		</div>
	</div>
</body>
<script>


	//버튼 클릭시 ajax 실행  
	function searchCharacter() {
		const name = document.getElementById('characterName').value;
		const nameLength = name.length; 
		
		if(nameLength <= 2){
			alert("한글자 이상 넣어주세요.");
		} else {
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/characterName",
				data : {
					"name" : name
				},
				success : function(args) {
					const jsonData = JSON.parse(args);
					if (!jsonData.error) {
						console.log(jsonData);
						window.location.href = "${pageContext.request.contextPath}/characterDetail/"
								+ encodeURIComponent(name);
					} else {
						console.log(jsonData.error);
						if(jsonData.error){
							alert("2023년 12월 21일 이후 접속 기록이 있어야 조회가 가능합니다.");
						}
					}
				},
				error : function(e) {
					alert(e.responseText);
				}
			});
		}
	};
</script>
</html>