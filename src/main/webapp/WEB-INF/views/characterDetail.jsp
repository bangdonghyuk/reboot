<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.bang.reboot.model.CharacterDetail"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>리부트GG</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
</head>
<body>
	<div class="wrap">
		<div class="header">
			<div class="header__wrap">
				<div class="header__logo">
					<a href="#none">REBOOT</a>
				</div>

				<!-- 검색 폼 -->
				<!-- 				<form id="searchForm">
					<input type="text" id="characterName" name="characterName" required>
					<button type="button" onclick="searchCharacter()">Search</button>
				</form> -->
				<!-- //검색 폼 -->
			</div>
		</div>

		<div class="container">
			<div class="content">
				<div class="profile">
					<div class="profile__wrap">
						<div class="profile__left">
							<img class="profile__img characterImage"
								src="https://source.unsplash.com/random" />
							<div class="characterDate"></div>
						</div>
						<!-- 프로필 -->
						<div class="profile__right">
							<div>
								<div class="profile__topText">
									<div class="characterName"></div>
									<div class="worldName"></div>
								</div>

								<div class="profile__midText">
									<div class="characterLevel"></div>
									<div class="characterClass"></div>
									<div class="">인기도 99</div>
									<div class="characterGuildName"></div>
								</div>
								<div class="profile__bottomText">
									<div class="profile__bottomBar">
										<div class="characterExpRate"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="detileTab">
					<div class="detileTab__tabs detileTab__tabs--active1">
						<button type="button"
							class="detileTab__tab detileTab__tab--active"
							onclick="detailTab(1)">스탯</button>
						<button type="button" class="detileTab__tab"
							onclick="detailTab(2)">장비</button>
						<button type="button" class="detileTab__tab"
							onclick="detailTab(3)">유니온</button>
					</div>
				</div>

				<div class="stat" style="display: block">
					<div class="stat__wrap">
						<div class="stat__left">
							<div class="stat__power">
								<div class="stat__powerTit">전투력</div>
								<div class="stat__powerText">23,351,607</div>
							</div>
							<div class="stat__hyper">
								<div class="stat__hyperTit">하이퍼 스탯</div>
								<div class="stat__hyperList" id="statHyper"></div>
								<div class="stat__hyperTabs">
									<button type="button" class="stat__hyperTab"
										onclick="hyperHtml(1);">프리셋 1</button>
									<button type="button" class="stat__hyperTab"
										onclick="hyperHtml(2);">프리셋 2</button>
									<button type="button" class="stat__hyperTab"
										onclick="hyperHtml(3);">프리셋 3</button>
								</div>
							</div>
							<div class="stat__ability">
								<div class="stat__abilityTit">어빌리티</div>

								<div class="stat__abilityList" id="ability"></div>
								<div class="stat__abilityTabs">
									<button type="button" class="stat__abilityTab"
										onclick="abilityHtml('1')">프리셋 1</button>
									<button type="button" class="stat__abilityTab"
										onclick="abilityHtml('2')">프리셋 2</button>
									<button type="button" class="stat__abilityTab"
										onclick="abilityHtml('3')">프리셋 3</button>
								</div>
							</div>
						</div>
						<div class="stat__right">
							<div class="stat__infor">
								<div class="stat__inforTit">스탯 정보</div>
								<div class="stat__inforBox" id="statDetail"></div>
							</div>
						</div>
					</div>
				</div>

				<div class="itemEquipment" style="display: none">
					<div class="itemEquipment__wrap">
						<div class="itemEquipment__left">123</div>
						<div class="itemEquipment__right">
							<div class="itemEquipment__tit">장비</div>

							<div class="itemEquipment__box">
								<div class="itemEquipment__boxWrap">
									<div class="itemEquipment__list" id="itemEquipment">
										<div class="itemEquipment__item">
											<button type="button" class="itemEquipment__btn">1</button>
										</div>
										<div class="itemEquipment__item">
											<button type="button" class="itemEquipment__btn">1</button>
										</div>
										<div class="itemEquipment__item">
											<button type="button" class="itemEquipment__btn">1</button>
										</div>
										<div class="itemEquipment__item">
											<button type="button" class="itemEquipment__btn">1</button>
										</div>
										<div class="itemEquipment__item">
											<button type="button" class="itemEquipment__btn">1</button>
										</div>

										<div class="itemEquipment__item">
											<button type="button" class="itemEquipment__btn">1</button>
										</div>
										<div class="itemEquipment__item">
											<button type="button" class="itemEquipment__btn">1</button>
										</div>
										<div class="itemEquipment__item">
											<button type="button" class="itemEquipment__btn">1</button>
										</div>
										<div class="itemEquipment__item">
											<button type="button" class="itemEquipment__btn">1</button>
										</div>
										<div class="itemEquipment__item">
											<button type="button" class="itemEquipment__btn">1</button>
										</div>

										<div class="itemEquipment__item">
											<button type="button" class="itemEquipment__btn">1</button>
										</div>
										<div class="itemEquipment__item">
											<button type="button" class="itemEquipment__btn">1</button>
										</div>
										<div class="itemEquipment__item">
											<button type="button" class="itemEquipment__btn">1</button>
										</div>
										<div class="itemEquipment__item">
											<button type="button" class="itemEquipment__btn">1</button>
										</div>
										<div class="itemEquipment__item">
											<button type="button" class="itemEquipment__btn">1</button>
										</div>
									</div>
								</div>
								<div class="itemEquipment__itemDetail"  id="itemDetail">
									<div class="itemEquipment__itemText">장비를 선택해주세요.</div>

								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	const characterData = ${characterDetail};
	const parsedCharacterBasic = JSON.parse(characterData.characterBasic);
	const parsedCharacterStat = JSON.parse(characterData.characterStat);
	const parsedCharacterHyperStat = JSON
			.parse(characterData.characterHyperStat);
	const parsedCharacterAbility = JSON.parse(characterData.characterAbility);
	const parsedCharacterItem = JSON.parse(characterData.characterItem);	
	let newPreset = [];
	

	console.log(characterData);
	console.log(parsedCharacterBasic);
	console.log(parsedCharacterStat);
	console.log(parsedCharacterHyperStat);
	console.log(parsedCharacterAbility);
	console.log(parsedCharacterItem);
	

	const nowdate = new Date(parsedCharacterBasic.date);
	var today = nowdate;
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var todayFormat = year + '-' + month + '-' + day;

	$('.characterDate').text(todayFormat);
	$('.characterClass').text(parsedCharacterBasic.character_class);
	/* $('.characterClassLevel').text(parsedCharacterBasic.character_class_level); */
	/* 	$('.characterExp').text(parsedCharacterBasic.character_exp); */
	$('.profile__bottomBar').css("width",
			Math.floor(parsedCharacterBasic.character_exp_rate) + "%");
	$('.characterExpRate').text(
			Math.floor(parsedCharacterBasic.character_exp_rate) + "%");
	/* 	$('.characterGender').text(parsedCharacterBasic.character_gender); */
	$('.characterGuildName').text(parsedCharacterBasic.character_guild_name);
	$('.characterImage').attr("src", parsedCharacterBasic.character_image);
	$('.characterLevel').text("LV." + parsedCharacterBasic.character_level);
	$('.characterName').text(parsedCharacterBasic.character_name);
	$('.worldName').text(parsedCharacterBasic.world_name);
	console.log(todayFormat);
	const final_statArray = parsedCharacterStat.final_stat;
	final_statArray
			.forEach(function(data, idx) {
				const output = document.getElementById('statDetail');
				output.innerHTML += "<div class='stat__inforItem'><div class='stat__inforText'>"
						+ data.stat_name
						+ "</div><div class='stat__inforText'>"
						+ data.stat_value.replace(/\B(?=(\d{3})+(?!\d))/g, ",")
						+ "</div></div>";
			});
	const hyperStatArray = parsedCharacterHyperStat;
	const hyperStat_use_preset_no = parsedCharacterHyperStat.use_preset_no;
	console.log(hyperStat_use_preset_no);

	hyperHtml(hyperStat_use_preset_no);
	function hyperHtml(preset) {
		const preset1 = hyperStatArray.hyper_stat_preset_1;
		const preset2 = hyperStatArray.hyper_stat_preset_2;
		const preset3 = hyperStatArray.hyper_stat_preset_3;

		$("#statHyper").empty();
		$(".stat__hyperTab").removeClass("stat__hyperTab--active");
		$(".stat__hyperTab").eq(preset - 1).addClass("stat__hyperTab--active");

		if (preset == "1") {
			preset1
					.forEach(function(data, idx) {
						const output2 = document.getElementById('statHyper');
						output2.innerHTML += "<div class='stat__hyperItem'><div class='stat__hyperText'>"
								+ data.stat_type
								+ "</div><div class='stat__hyperText'>"
								+ data.stat_level + "</div></div>";
					});
		} else if (preset == "2") {
			preset2
					.forEach(function(data, idx) {
						const output2 = document.getElementById('statHyper');
						output2.innerHTML += "<div class='stat__hyperItem'><div class='stat__hyperText'>"
								+ data.stat_type
								+ "</div><div class='stat__hyperText'>"
								+ data.stat_level + "</div></div>";
					});
		} else if (preset == "3") {
			preset3
					.forEach(function(data, idx) {
						const output2 = document.getElementById('statHyper');
						output2.innerHTML += "<div class='stat__hyperItem'><div class='stat__hyperText'>"
								+ data.stat_type
								+ "</div><div class='stat__hyperText'>"
								+ data.stat_level + "</div></div>";
					});
		}
	}

	const abilityArray = parsedCharacterAbility;
	const ability_preset_no = parsedCharacterAbility.preset_no;
	console.log(ability_preset_no);

	abilityHtml(ability_preset_no);
	function abilityHtml(preset) {


		$("#ability").empty();


		if (preset == "1") {
			const preset1 = abilityArray.ability_preset_1.ability_info;
			$(".stat__abilityTab").removeClass("stat__abilityTab--active");
			$(".stat__abilityTab").eq(preset - 1).addClass(
					"stat__abilityTab--active");
			preset1.forEach(function(data, idx) {
				const output3 = document.getElementById('ability');
				output3.innerHTML += "<div class='stat__abilityText'>"
						+ data.ability_value + "</div>";
			});
		} else if (preset == "2") {
			const preset2 = abilityArray.ability_preset_2.ability_info;
			$(".stat__abilityTab").removeClass("stat__abilityTab--active");
			$(".stat__abilityTab").eq(preset - 1).addClass(
					"stat__abilityTab--active");
			preset2.forEach(function(data, idx) {
				const output3 = document.getElementById('ability');
				output3.innerHTML += "<div class='stat__abilityText'>"
						+ data.ability_value + "</div>";
			});
		} else if (preset == "3") {
			const preset3 = abilityArray.ability_preset_3.ability_info;
			preset3.forEach(function(data, idx) {
				const output3 = document.getElementById('ability');
				output3.innerHTML += "<div class='stat__abilityText'>"
						+ data.ability_value + "</div>";
			});
		} else if(preset == null){
			const nowAbility = abilityArray.ability_info;
			$(".stat__abilityTab").removeClass("stat__abilityTab--active");
			nowAbility.forEach(function(data, idx) {
				const output3 = document.getElementById('ability');
				output3.innerHTML += "<div class='stat__abilityText'>"
						+ data.ability_value + "</div>";
			});
		}
	}

	detailTab("2");

	function detailTab(idx) {
		console.log(idx);
		$(".detileTab__tab").removeClass("detileTab__tab--active");
		$(".detileTab__tabs").removeClass("detileTab__tabs--active1");
		$(".detileTab__tabs").removeClass("detileTab__tabs--active2");
		$(".detileTab__tabs").removeClass("detileTab__tabs--active3");

		$(".stat").hide();
		$(".itemEquipment").hide();

		if (idx == "1") {
			$(".detileTab__tabs").addClass("detileTab__tabs--active1");
			$(".detileTab__tab").eq(idx - 1).addClass("detileTab__tab--active");
			$(".stat").show();
		}
		if (idx == "2") {
			$(".detileTab__tabs").addClass("detileTab__tabs--active2");
			$(".detileTab__tab").eq(idx - 1).addClass("detileTab__tab--active");
			$(".itemEquipment").show();
		}
		if (idx == "3") {
			$(".detileTab__tabs").addClass("detileTab__tabs--active3");
			$(".detileTab__tab").eq(idx - 1).addClass("detileTab__tab--active");
		}
	}

	itemEquipmentHtml(parsedCharacterItem.preset_no);

	console.log(parsedCharacterItem.preset_no);
	function itemEquipmentHtml(preset) {
		const preset1 = parsedCharacterItem.item_equipment_preset1;
		const preset2 = parsedCharacterItem.item_equipment_preset2;
		const preset3 = parsedCharacterItem.item_equipment_preset3;
		const nowItem = parsedCharacterItem.item_equipment;
		
		const parsedCharacterAndroid = JSON.parse(characterData.characterAndroid);
		console.log("new:",newPreset);
		newPreset = [];
		console.log(newPreset);
		
		$("#itemEquipment").empty();
		const itemEquipment = document.getElementById('itemEquipment');
		
		if (preset == "1") {
			newPreset.push(preset1[14]);
			newPreset.push("ZERO");
			newPreset.push(preset1[0]);
			newPreset.push("ZERO");
			newPreset.push(preset1[22]);
			newPreset.push(preset1[13]);
			newPreset.push(preset1[23]);
			newPreset.push(preset1[1]);
			newPreset.push("ZERO");
			newPreset.push(preset1[21]);
			newPreset.push(preset1[12]);
			newPreset.push(preset1[15]);
			newPreset.push(preset1[2]);
			newPreset.push(preset1[3]);
			newPreset.push(preset1[16]);
			newPreset.push(preset1[11]);
			newPreset.push(preset1[10]);
			newPreset.push(preset1[4]);
			newPreset.push(preset1[18]);
			newPreset.push(preset1[9]);
			newPreset.push(preset1[19]);
			newPreset.push(preset1[17]);
			newPreset.push(preset1[5]);
			newPreset.push(preset1[7]);
			newPreset.push(preset1[8]);
			newPreset.push(parsedCharacterItem.title);
			newPreset.push("ZERO");
			newPreset.push(preset1[6]);
			newPreset.push(parsedCharacterAndroid);
			newPreset.push(preset1[20]);

			newPreset.forEach(function(data, idx) {
				if(data== "ZERO"){
					itemEquipment.innerHTML += "<div class='itemEquipment__item'></div>";
				}  else if(idx == 25) {
					console.log("111 data : ", data);
					itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn' onclick='itemDetail("+idx+")'><img src=' "+ data.title_icon +" '/></button></div>";
				} else if(idx == 28) {
					itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn' onclick='itemDetail("+idx+")'><img src="+data.android_icon+" /></button></div>";
				} else {
					if(data.potential_option_grade == "레전드리"){
						itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn itemEquipment__btn--legend' onclick='itemDetail("+idx+")'><img src="+data.item_icon+" /></button></div>";
					} else if(data.potential_option_grade == "유니크"){
						itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn itemEquipment__btn--unique' onclick='itemDetail("+idx+")'><img src="+data.item_icon+" /></button></div>";
					} else if(data.potential_option_grade == "에픽"){
						itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn itemEquipment__btn--epic' onclick='itemDetail("+idx+")'><img src="+data.item_icon+" /></button></div>";
					} else {
						itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn' onclick='itemDetail("+idx+")'><img src="+data.item_icon+" /></button></div>";
					}
				}
			});
		} else if (preset == "2") {
			newPreset.push(preset2[14]);
			newPreset.push("ZERO");
			newPreset.push(preset2[3]);
			newPreset.push("ZERO");
			newPreset.push(preset2[22]);
			
			newPreset.push(preset2[13]);
			newPreset.push(preset2[23]);
			newPreset.push(preset2[4]);
			newPreset.push("ZERO");
			newPreset.push(preset2[21]);
			

			newPreset.push(preset2[2]);
			newPreset.push(preset2[15]);
			newPreset.push(preset2[5]);
			newPreset.push(preset2[0]);
			newPreset.push(preset2[16]);
			
			
			newPreset.push(preset2[1]);
			newPreset.push(preset2[12]);
			newPreset.push(preset2[6]);
			newPreset.push(preset2[18]);
			newPreset.push(preset2[11]);
			
			
			newPreset.push(preset2[19]);
			newPreset.push(preset2[17]);
			newPreset.push(preset2[7]);
			newPreset.push(preset2[9]);
			newPreset.push(preset2[10]);
			
			newPreset.push(parsedCharacterItem.title);
			newPreset.push("ZERO");
			newPreset.push(preset2[8]);
			newPreset.push(parsedCharacterAndroid);
			newPreset.push(preset2[20]);
			
			newPreset.forEach(function(data, idx) {
				if(data== "ZERO"){
					itemEquipment.innerHTML += "<div class='itemEquipment__item'></div>";
				}  else if(idx == 25) {
					console.log("111 data : ", data);
					itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn' onclick='itemDetail("+idx+")'><img src=' "+ data.title_icon +" '/></button></div>";
				} else if(idx == 28) {
					itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn' onclick='itemDetail("+idx+")'><img src="+data.android_icon+" /></button></div>";
				} else {
					if(data.potential_option_grade == "레전드리"){
						itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn itemEquipment__btn--legend' onclick='itemDetail("+idx+")'><img src="+data.item_icon+" /></button></div>";
					} else if(data.potential_option_grade == "유니크"){
						itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn itemEquipment__btn--unique' onclick='itemDetail("+idx+")'><img src="+data.item_icon+" /></button></div>";
					} else if(data.potential_option_grade == "에픽"){
						itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn itemEquipment__btn--epic' onclick='itemDetail("+idx+")'><img src="+data.item_icon+" /></button></div>";
					} else {
						itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn' onclick='itemDetail("+idx+")'><img src="+data.item_icon+" /></button></div>";
					}
				}
			});
			
		} else if (preset == "3") {
			newPreset.push(preset3[14]);
			newPreset.push("ZERO");
			newPreset.push(preset3[0]);
			newPreset.push("ZERO");
			newPreset.push(preset3[22]);
			newPreset.push(preset3[13]);
			newPreset.push(preset3[23]);
			newPreset.push(preset3[1]);
			newPreset.push("ZERO");
			newPreset.push(preset3[21]);
			newPreset.push(preset3[12]);
			newPreset.push(preset3[15]);
			newPreset.push(preset3[2]);
			newPreset.push(preset3[3]);
			newPreset.push(preset3[16]);
			newPreset.push(preset3[11]);
			newPreset.push(preset3[10]);
			newPreset.push(preset3[4]);
			newPreset.push(preset3[18]);
			newPreset.push(preset3[9]);
			newPreset.push(preset3[19]);
			newPreset.push(preset3[17]);
			newPreset.push(preset3[5]);
			newPreset.push(preset3[7]);
			newPreset.push(preset3[8]);
			newPreset.push(parsedCharacterItem.title);
			newPreset.push("ZERO");
			newPreset.push(preset3[6]);
			newPreset.push(parsedCharacterAndroid);
			newPreset.push(preset3[20]);
			newPreset.forEach(function(data, idx) {
				if(data== "ZERO"){
					itemEquipment.innerHTML += "<div class='itemEquipment__item'></div>";
				}  else if(idx == 25) {
					console.log("111 data : ", data);
					itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn' onclick='itemDetail("+idx+")'><img src=' "+ data.title_icon +" '/></button></div>";
				} else if(idx == 28) {
					itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn' onclick='itemDetail("+idx+")'><img src="+data.android_icon+" /></button></div>";
				} else {
					if(data.potential_option_grade == "레전드리"){
						itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn itemEquipment__btn--legend' onclick='itemDetail("+idx+")'><img src="+data.item_icon+" /></button></div>";
					} else if(data.potential_option_grade == "유니크"){
						itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn itemEquipment__btn--unique' onclick='itemDetail("+idx+")'><img src="+data.item_icon+" /></button></div>";
					} else if(data.potential_option_grade == "에픽"){
						itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn itemEquipment__btn--epic' onclick='itemDetail("+idx+")'><img src="+data.item_icon+" /></button></div>";
					} else {
						itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn' onclick='itemDetail("+idx+")'><img src="+data.item_icon+" /></button></div>";
					}
				}
			});
		} else  if (preset == null){
			newPreset.push(nowItem[14]);
			newPreset.push("ZERO");
			newPreset.push(nowItem[0]);
			newPreset.push("ZERO");
			newPreset.push(nowItem[22]);
			newPreset.push(nowItem[13]);
			newPreset.push(nowItem[23]);
			newPreset.push(nowItem[1]);
			newPreset.push("ZERO");
			newPreset.push(nowItem[21]);
			newPreset.push(nowItem[12]);
			newPreset.push(nowItem[15]);
			newPreset.push(nowItem[2]);
			newPreset.push(nowItem[3]);
			newPreset.push(nowItem[16]);
			newPreset.push(nowItem[11]);
			newPreset.push(nowItem[10]);
			newPreset.push(nowItem[4]);
			newPreset.push(nowItem[18]);
			newPreset.push(nowItem[9]);
			newPreset.push(nowItem[19]);
			newPreset.push(nowItem[17]);
			newPreset.push(nowItem[5]);
			newPreset.push(nowItem[7]);
			newPreset.push(nowItem[8]);
			newPreset.push(parsedCharacterItem.title);
			newPreset.push("ZERO");
			newPreset.push(nowItem[6]);
			newPreset.push(parsedCharacterAndroid);
			newPreset.push(nowItem[20]);
			newPreset.forEach(function(data, idx) {
				if(data== "ZERO"){
					itemEquipment.innerHTML += "<div class='itemEquipment__item'></div>";
				}  else if(idx == 25) {
					console.log("111 data : ", data);
					itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn' onclick='itemDetail("+idx+")'><img src=' "+ data.title_icon +" '/></button></div>";
				} else if(idx == 28) {
					itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn' onclick='itemDetail("+idx+")'><img src="+data.android_icon+" /></button></div>";
				} else {
					if(data.potential_option_grade == "레전드리"){
						itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn itemEquipment__btn--legend' onclick='itemDetail("+idx+")'><img src="+data.item_icon+" /></button></div>";
					} else if(data.potential_option_grade == "유니크"){
						itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn itemEquipment__btn--unique' onclick='itemDetail("+idx+")'><img src="+data.item_icon+" /></button></div>";
					} else if(data.potential_option_grade == "에픽"){
						itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn itemEquipment__btn--epic' onclick='itemDetail("+idx+")'><img src="+data.item_icon+" /></button></div>";
					} else {
						itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn' onclick='itemDetail("+idx+")'><img src="+data.item_icon+" /></button></div>";
					}
				}
			});
		}
	}
	
	function itemDetail(idx){
 		const itemDetail = document.getElementById('itemDetail');
 		const itemDate = [];
 		itemDate.push(newPreset[idx]);
 		const itemNow = itemDate[0];
 		
		$("#itemDetail").empty();
 		var newbox = '';
 		newbox += '<div class="itemEquipment__itemLeft">';
 		if(idx == 25){
 				newbox += '<div class="">'+itemNow.title_name+'</div>';
 		} else if(idx == 28){
 				newbox += '<div class="">'+itemNow.android_name+'</div>';
 		} else {
 				if(itemNow.starforce == 0 ){
 				} else {
 					var output = '';
 					output += '<div class="itemEquipment__starforce">';
 			        for(var i=0;i<itemNow.starforce;i++){
 			        	output += '<div class="">★</div>';
 			        }
 			      output += '</div>';
 			      newbox += output;
 				}
 				newbox += '<div class="">'+itemNow.item_shape_name+'</div>';
 				newbox += '<div class="">'+itemNow.potential_option_grade+'</div>';
 				newbox += '<div class=""><img src="'+itemNow.item_icon+'"/></div>';
 				newbox += '<div class="">장비분류 : '+itemNow.item_equipment_part+'</div>';
 				newbox += '<div class="itemEquipment__itemOption"><div class="">'+itemNow.item_total_option.str+'</div><div class="">'+itemNow.item_base_option.str+'</div><div class="">'+itemNow.item_add_option.str+'</div><div class="">'+itemNow.item_starforce_option.str+'</div></div>';
 		}
		newbox.innerHTML += '</div>';
		itemDetail.innerHTML += newbox;
		itemDetail.innerHTML += '<div class="itemEquipment__itemRight">이거</div>';
	}
</script>
</html>