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
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
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
					</div>
				</div>

				<div class="stat" style="display: block">
					<div class="stat__wrap">
						<div class="stat__left">
							<div class="stat__power">
								<div class="stat__powerTit">전투력</div>
								<div class="stat__powerText"></div>
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
						<div class="itemEquipment__left">
							<div class="symbol">
								<div class="symbol__tabs">
									<div class="symbol__tab" onclick="symbolTab(1)">아케인</div>
									<div class="symbol__tab" onclick="symbolTab(2)">어센틱</div>
								</div>
								<div class="symbol__content">
									<div id="symbolArcane"></div>
									<div id="symbolAuthentic"></div>
								</div>
							</div>
						</div>
						<div class="itemEquipment__mid">
							<div class="itemEquipment__tit">장비</div>

							<div class="itemEquipment__box">
								<div class="itemEquipment__boxWrap">
									<div class="itemEquipment__list" id="itemEquipment"></div>
								</div>
								<div class="itemEquipment__itemDetail" id="itemDetail">
									<div class="itemEquipment__itemText">장비를 선택해주세요.</div>
								</div>
							</div>
						</div>
						<div class="itemEquipment__right"></div>
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
	const parsedCharactercharacterSymbol = JSON
			.parse(characterData.characterSymbol);
	let newPreset = [];

	console.log(parsedCharacterBasic);
	console.log(parsedCharacterStat);
	console.log(parsedCharacterHyperStat);
	console.log(parsedCharacterAbility);
	console.log(parsedCharacterItem);
	console.log(parsedCharactercharacterSymbol);

	const nowdate = new Date(parsedCharacterBasic.date);
	var today = nowdate;
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var todayFormat = year + '-' + month + '-' + day;

	$('.characterDate').text(todayFormat);
	$('.characterClass').text(parsedCharacterBasic.character_class);
	$('.profile__bottomBar').css("width",
			Math.floor(parsedCharacterBasic.character_exp_rate) + "%");
	$('.characterExpRate').text(
			Math.floor(parsedCharacterBasic.character_exp_rate) + "%");
	$('.characterGuildName').text(parsedCharacterBasic.character_guild_name);
	$('.characterImage').attr("src", parsedCharacterBasic.character_image);
	$('.characterLevel').text("LV." + parsedCharacterBasic.character_level);
	$('.characterName').text(parsedCharacterBasic.character_name);
	$('.worldName').text(parsedCharacterBasic.world_name);

	$('.stat__powerText').text(
			parsedCharacterStat.final_stat[42].stat_value.replace(
					/\B(?=(\d{3})+(?!\d))/g, ","));

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
		} else if (preset == null) {
			const nowAbility = abilityArray.ability_info;
			$(".stat__abilityTab").removeClass("stat__abilityTab--active");
			nowAbility.forEach(function(data, idx) {
				const output3 = document.getElementById('ability');
				output3.innerHTML += "<div class='stat__abilityText'>"
						+ data.ability_value + "</div>";
			});
		}
	}

	detailTab("1");

	function detailTab(idx) {
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
	function itemEquipmentHtml(preset) {
		const preset1 = parsedCharacterItem.item_equipment_preset_1;
		const preset2 = parsedCharacterItem.item_equipment_preset_2;
		const preset3 = parsedCharacterItem.item_equipment_preset_3;
		const nowItem = parsedCharacterItem.item_equipment;

		const parsedCharacterAndroid = JSON.parse(characterData.characterAndroid);
		newPreset = [];

		$("#itemEquipment").empty();
		const itemEquipment = document.getElementById('itemEquipment');

		if (preset == "1") {
			var itemLing4 = 0;
			preset1.forEach(function(data, idx) {
				if(itemLing4 <= 0){
					if (preset1[idx].item_equipment_slot == "반지4") {
						itemLing4 = idx + 1;
					} else{
						itemLing4 = -1;
					}
				}
			});
			
			if(itemLing4 > 0){
				newPreset.push(preset1[itemLing4 - 1]);
			}else{
				newPreset.push("Null");
			}
			newPreset.push("ZERO");
			
			var itemHat = 0;
			preset1.forEach(function(data, idx) {
				if(itemHat <= 0){
					if (preset1[idx].item_equipment_slot == "모자") {
						itemHat = idx + 1;
					} else{
						itemHat = -1;
					}
				}
			});
			
			if(itemHat > 0){
				newPreset.push(preset1[itemHat - 1]);
			}else{
				newPreset.push("Null");
			}
			
			newPreset.push("ZERO");
			
			var itemEmblem = 0;
			preset1.forEach(function(data, idx) {
				if(itemEmblem <= 0){
					if (preset1[idx].item_equipment_slot == "엠블렘") {
						itemEmblem = idx + 1;
					} else{
						itemEmblem = -1;
					}
				}
			});
			
			if(itemEmblem > 0){
				newPreset.push(preset1[itemEmblem - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemLing3 = 0;
			preset1.forEach(function(data, idx) {
				if(itemLing3 <= 0){
					if (preset1[idx].item_equipment_slot == "반지3") {
						itemLing3 = idx + 1;
					} else{
						itemLing3 = -1;
					}
				}
			});
			
			if(itemLing3 > 0){
				newPreset.push(preset1[itemLing3 - 1]);
			}else{
				newPreset.push("Null");
			}
			

			var itemPndant2 = 0;
			preset1.forEach(function(data, idx) {
				if(itemPndant2 <= 0){
					if (preset1[idx].item_equipment_slot == "펜던트2") {
						itemPndant2 = idx + 1;
					} else{
						itemPndant2 = -1;
					}
				}
			});
			
			if(itemPndant2 > 0){
				newPreset.push(preset1[itemPndant2 - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemFaceDecoration= 0;
			preset1.forEach(function(data, idx) {
				if(itemFaceDecoration <= 0){
					if (preset1[idx].item_equipment_slot == "얼굴장식") {
						itemFaceDecoration = idx + 1;
					} else{
						itemFaceDecoration = -1;
					}
				}
			});
			
			if(itemFaceDecoration > 0){
				newPreset.push(preset1[itemFaceDecoration - 1]);
			}else{
				newPreset.push("Null");
			}
			
			newPreset.push("ZERO");
			
			var itemBadge = 0;
			preset1.forEach(function(data, idx) {
				if(itemBadge <= 0){
					if (preset1[idx].item_equipment_slot == "뱃지") {
						itemBadge = idx + 1;
					} else{
						itemBadge = -1;
					}
				}
			});
			
			if(itemBadge > 0){
				newPreset.push(preset1[itemBadge - 1]);
			}else{
				newPreset.push("Null");
			}
		
			
			var itemLing2 = 0;
			preset1.forEach(function(data, idx) {
				if(itemLing2 <= 0){
					if (preset1[idx].item_equipment_slot == "반지2") {
						itemLing2 = idx + 1;
					} else{
						itemLing2 = -1;
					}
				}
			});
			
			if(itemLing2 > 0){
				newPreset.push(preset1[itemLing2 - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemPndant = 0;
			preset1.forEach(function(data, idx) {
				if(itemPndant <= 0){
					if (preset1[idx].item_equipment_slot == "펜던트") {
						itemPndant = idx + 1;
					} else{
						itemPndant = -1;
					}
				}
			});
			
			if(itemPndant > 0){
				newPreset.push(preset1[itemPndant - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemEyeDecoration = 0;
			preset1.forEach(function(data, idx) {
				if(itemEyeDecoration <= 0){
					if (preset1[idx].item_equipment_slot == "눈장식") {
						itemEyeDecoration = idx + 1;
					} else{
						itemEyeDecoration = -1;
					}
				}
			});
			
			if(itemEyeDecoration > 0){
				newPreset.push(preset1[itemEyeDecoration - 1]);
			}else{
				newPreset.push("Null");
			}
			
			
			var itemEarring = 0;
			preset1.forEach(function(data, idx) {
				if(itemEarring <= 0){
					if (preset1[idx].item_equipment_slot == "귀고리") {
						itemEarring = idx + 1;
					} else{
						itemEarring = -1;
					}
				}
			});
			
			if(itemEarring > 0){
				newPreset.push(preset1[itemEarring - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemMerit = 0;
			preset1.forEach(function(data, idx) {
				if(itemMerit <= 0){
					if (preset1[idx].item_equipment_slot == "훈장") {
						itemMerit = idx + 1;
					} else{
						itemMerit = -1;
					}
				}
			});
			
			if(itemMerit > 0){
				newPreset.push(preset1[itemMerit - 1]);
			}else{
				newPreset.push("Null");
			}
			
			
			var itemLing = 0;
			preset1.forEach(function(data, idx) {
				if(itemLing <= 0){
					if (preset1[idx].item_equipment_slot == "반지1") {
						itemLing = idx + 1;
					} else{
						itemLing = -1;
					}
				}
			});
			
			if(itemLing > 0){
				newPreset.push(preset1[itemLing - 1]);
			}else{
				newPreset.push("Null");
			}
			
			
			var itemWeapon = 0;
			preset1.forEach(function(data, idx) {
				if(itemWeapon <= 0){
					if (preset1[idx].item_equipment_slot == "무기") {
						itemWeapon = idx + 1;
					} else{
						itemWeapon = -1;
					}
				}
			});
			
			if(itemWeapon > 0){
				newPreset.push(preset1[itemWeapon - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemTop = 0;
			preset1.forEach(function(data, idx) {
				if(itemTop <= 0){
					if (preset1[idx].item_equipment_slot == "상의") {
						itemTop = idx + 1;
					} else{
						itemTop = -1;
					}
				}
			});
			
			if(itemTop > 0){
				newPreset.push(preset1[itemTop - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemShoulder  = 0;
			preset1.forEach(function(data, idx) {
				if(itemShoulder <= 0){
					if (preset1[idx].item_equipment_slot == "어깨장식") {
						itemShoulder = idx + 1;
					} else{
						itemShoulder = -1;
					}
				}
			});
			
			if(itemShoulder > 0){
				newPreset.push(preset1[itemShoulder - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemAuxiliary   = 0;
			preset1.forEach(function(data, idx) {
				if(itemAuxiliary <= 0){
					if (preset1[idx].item_equipment_slot == "보조무기") {
						itemAuxiliary = idx + 1;
					} else{
						itemAuxiliary = -1;
					}
				}
			});
			
			if(itemAuxiliary > 0){
				newPreset.push(preset1[itemAuxiliary - 1]);
			}else{
				newPreset.push("Null");
			}
			
			
			var itemPocket   = 0;
			preset1.forEach(function(data, idx) {
				if(itemPocket <= 0){
					if (preset1[idx].item_equipment_slot == "포켓 아이템") {
						itemPocket = idx + 1;
					} else{
						itemPocket = -1;
					}
				}
			});
			
			if(itemPocket > 0){
				newPreset.push(preset1[itemPocket - 1]);
			}else{
				newPreset.push("Null");
			}
			
			
			var itemBelt   = 0;
			preset1.forEach(function(data, idx) {
				if(itemBelt <= 0){
					if (preset1[idx].item_equipment_slot == "벨트") {
						itemBelt = idx + 1;
					} else{
						itemBelt = -1;
					}
				}
			});
			
			if(itemBelt > 0){
				newPreset.push(preset1[itemBelt - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemBottom   = 0;
			preset1.forEach(function(data, idx) {
				if(itemBottom <= 0){
					if (preset1[idx].item_equipment_slot == "하의") {
						itemBottom = idx + 1;
					} else{
						itemBottom = -1;
					}
				}
			});
			
			if(itemBottom > 0){
				newPreset.push(preset1[itemBottom - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemGloves   = 0;
			preset1.forEach(function(data, idx) {
				if(itemGloves <= 0){
					if (preset1[idx].item_equipment_slot == "장갑") {
						itemGloves = idx + 1;
					} else{
						itemGloves = -1;
					}
				}
			});
			
			if(itemGloves > 0){
				newPreset.push(preset1[itemGloves - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemCloak   = 0;
			preset1.forEach(function(data, idx) {
				if(itemCloak <= 0){
					if (preset1[idx].item_equipment_slot == "망토") {
						itemCloak = idx + 1;
					} else{
						itemCloak = -1;
					}
				}
			});
			
			if(itemCloak > 0){
				newPreset.push(preset1[itemCloak - 1]);
			}else{
				newPreset.push("Null");
			}
			
			
			if(parsedCharacterItem.title){
				newPreset.push(parsedCharacterItem.title);
			}else{
				newPreset.push("Null");
			}

			 newPreset.push("ZERO");
			
			var itemShoes   = 0;
			preset1.forEach(function(data, idx) {
				if(itemShoes <= 0){
					if (preset1[idx].item_equipment_slot == "신발") {
						itemShoes = idx + 1;
					} else{
						itemShoes = -1;
					}
				}
			});
			
			if(itemShoes > 0){
				newPreset.push(preset1[itemShoes - 1]);
			}else{
				newPreset.push("Null");
			}
			
	
		
			if(parsedCharacterAndroid.android_description == null){
				newPreset.push("Null");
			}else{
				newPreset.push(parsedCharacterAndroid);
			}
			
			var itemAndroid   = 0;
			preset1.forEach(function(data, idx) {
				if(itemAndroid <= 0){
					if (preset1[idx].item_equipment_slot == "기계 심장") {
						itemAndroid = idx + 1;
					} else{
						itemAndroid = -1;
					}
				}
			});
			
			if(itemAndroid > 0){
				newPreset.push(preset1[itemAndroid - 1]);
			}else{
				newPreset.push("Null");
			}

			newPreset
					.forEach(function(data, idx) {
						if (data == "Null") {
							itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn'></button></div>";
						} else if (data == "ZERO") {
							itemEquipment.innerHTML += "<div class='itemEquipment__item'></div>";
						} else if (idx == 25) {
							itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn' onclick='itemDetail("
									+ idx
									+ ")'><img src=' "+ data.title_icon +" '/></button></div>";
						} else if (idx == 28) {
							itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn' onclick='itemDetail("
									+ idx
									+ ")'><img src="+data.android_icon+" /></button></div>";
						} else {
							if (data.potential_option_grade == "레전드리") {
								itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn itemEquipment__btn--legend' onclick='itemDetail("
										+ idx
										+ ")'><img src="+data.item_icon+" /></button></div>";
							} else if (data.potential_option_grade == "유니크") {
								itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn itemEquipment__btn--unique' onclick='itemDetail("
										+ idx
										+ ")'><img src="+data.item_icon+" /></button></div>";
							} else if (data.potential_option_grade == "에픽") {
								itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn itemEquipment__btn--epic' onclick='itemDetail("
										+ idx
										+ ")'><img src="+data.item_icon+" /></button></div>";
							} else {
								itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn' onclick='itemDetail("
										+ idx
										+ ")'><img src="+data.item_icon+" /></button></div>";
							}
						}
					});
		} else if (preset == "2") {
			var itemLing4 = 0;
			preset1.forEach(function(data, idx) {
				if(itemLing4 <= 0){
					if (preset1[idx].item_equipment_slot == "반지4") {
						itemLing4 = idx + 1;
					} else{
						itemLing4 = -1;
					}
				}
			});
			
			if(itemLing4 > 0){
				newPreset.push(preset1[itemLing4 - 1]);
			}else{
				newPreset.push("Null");
			}
			newPreset.push("ZERO");
			
			var itemHat = 0;
			preset1.forEach(function(data, idx) {
				if(itemHat <= 0){
					if (preset1[idx].item_equipment_slot == "모자") {
						itemHat = idx + 1;
					} else{
						itemHat = -1;
					}
				}
			});
			
			if(itemHat > 0){
				newPreset.push(preset1[itemHat - 1]);
			}else{
				newPreset.push("Null");
			}
			
			newPreset.push("ZERO");
			
			var itemEmblem = 0;
			preset1.forEach(function(data, idx) {
				if(itemEmblem <= 0){
					if (preset1[idx].item_equipment_slot == "엠블렘") {
						itemEmblem = idx + 1;
					} else{
						itemEmblem = -1;
					}
				}
			});
			
			if(itemEmblem > 0){
				newPreset.push(preset1[itemEmblem - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemLing3 = 0;
			preset1.forEach(function(data, idx) {
				if(itemLing3 <= 0){
					if (preset1[idx].item_equipment_slot == "반지3") {
						itemLing3 = idx + 1;
					} else{
						itemLing3 = -1;
					}
				}
			});
			
			if(itemLing3 > 0){
				newPreset.push(preset1[itemLing3 - 1]);
			}else{
				newPreset.push("Null");
			}
			

			var itemPndant2 = 0;
			preset1.forEach(function(data, idx) {
				if(itemPndant2 <= 0){
					if (preset1[idx].item_equipment_slot == "펜던트2") {
						itemPndant2 = idx + 1;
					} else{
						itemPndant2 = -1;
					}
				}
			});
			
			if(itemPndant2 > 0){
				newPreset.push(preset1[itemPndant2 - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemFaceDecoration= 0;
			preset1.forEach(function(data, idx) {
				if(itemFaceDecoration <= 0){
					if (preset1[idx].item_equipment_slot == "얼굴장식") {
						itemFaceDecoration = idx + 1;
					} else{
						itemFaceDecoration = -1;
					}
				}
			});
			
			if(itemFaceDecoration > 0){
				newPreset.push(preset1[itemFaceDecoration - 1]);
			}else{
				newPreset.push("Null");
			}
			
			newPreset.push("ZERO");
			
			var itemBadge = 0;
			preset1.forEach(function(data, idx) {
				if(itemBadge <= 0){
					if (preset1[idx].item_equipment_slot == "뱃지") {
						itemBadge = idx + 1;
					} else{
						itemBadge = -1;
					}
				}
			});
			
			if(itemBadge > 0){
				newPreset.push(preset1[itemBadge - 1]);
			}else{
				newPreset.push("Null");
			}
		
			
			var itemLing2 = 0;
			preset1.forEach(function(data, idx) {
				if(itemLing2 <= 0){
					if (preset1[idx].item_equipment_slot == "반지2") {
						itemLing2 = idx + 1;
					} else{
						itemLing2 = -1;
					}
				}
			});
			
			if(itemLing2 > 0){
				newPreset.push(preset1[itemLing2 - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemPndant = 0;
			preset1.forEach(function(data, idx) {
				if(itemPndant <= 0){
					if (preset1[idx].item_equipment_slot == "펜던트") {
						itemPndant = idx + 1;
					} else{
						itemPndant = -1;
					}
				}
			});
			
			if(itemPndant > 0){
				newPreset.push(preset1[itemPndant - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemEyeDecoration = 0;
			preset1.forEach(function(data, idx) {
				if(itemEyeDecoration <= 0){
					if (preset1[idx].item_equipment_slot == "눈장식") {
						itemEyeDecoration = idx + 1;
					} else{
						itemEyeDecoration = -1;
					}
				}
			});
			
			if(itemEyeDecoration > 0){
				newPreset.push(preset1[itemEyeDecoration - 1]);
			}else{
				newPreset.push("Null");
			}
			
			
			var itemEarring = 0;
			preset1.forEach(function(data, idx) {
				if(itemEarring <= 0){
					if (preset1[idx].item_equipment_slot == "귀고리") {
						itemEarring = idx + 1;
					} else{
						itemEarring = -1;
					}
				}
			});
			
			if(itemEarring > 0){
				newPreset.push(preset1[itemEarring - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemMerit = 0;
			preset1.forEach(function(data, idx) {
				if(itemMerit <= 0){
					if (preset1[idx].item_equipment_slot == "훈장") {
						itemMerit = idx + 1;
					} else{
						itemMerit = -1;
					}
				}
			});
			
			if(itemMerit > 0){
				newPreset.push(preset1[itemMerit - 1]);
			}else{
				newPreset.push("Null");
			}
			
			
			var itemLing = 0;
			preset1.forEach(function(data, idx) {
				if(itemLing <= 0){
					if (preset1[idx].item_equipment_slot == "반지1") {
						itemLing = idx + 1;
					} else{
						itemLing = -1;
					}
				}
			});
			
			if(itemLing > 0){
				newPreset.push(preset1[itemLing - 1]);
			}else{
				newPreset.push("Null");
			}
			
			
			var itemWeapon = 0;
			preset1.forEach(function(data, idx) {
				if(itemWeapon <= 0){
					if (preset1[idx].item_equipment_slot == "무기") {
						itemWeapon = idx + 1;
					} else{
						itemWeapon = -1;
					}
				}
			});
			
			if(itemWeapon > 0){
				newPreset.push(preset1[itemWeapon - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemTop = 0;
			preset1.forEach(function(data, idx) {
				if(itemTop <= 0){
					if (preset1[idx].item_equipment_slot == "상의") {
						itemTop = idx + 1;
					} else{
						itemTop = -1;
					}
				}
			});
			
			if(itemTop > 0){
				newPreset.push(preset1[itemTop - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemShoulder  = 0;
			preset1.forEach(function(data, idx) {
				if(itemShoulder <= 0){
					if (preset1[idx].item_equipment_slot == "어깨장식") {
						itemShoulder = idx + 1;
					} else{
						itemShoulder = -1;
					}
				}
			});
			
			if(itemShoulder > 0){
				newPreset.push(preset1[itemShoulder - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemAuxiliary   = 0;
			preset1.forEach(function(data, idx) {
				if(itemAuxiliary <= 0){
					if (preset1[idx].item_equipment_slot == "보조무기") {
						itemAuxiliary = idx + 1;
					} else{
						itemAuxiliary = -1;
					}
				}
			});
			
			if(itemAuxiliary > 0){
				newPreset.push(preset1[itemAuxiliary - 1]);
			}else{
				newPreset.push("Null");
			}
			
			
			var itemPocket   = 0;
			preset1.forEach(function(data, idx) {
				if(itemPocket <= 0){
					if (preset1[idx].item_equipment_slot == "포켓 아이템") {
						itemPocket = idx + 1;
					} else{
						itemPocket = -1;
					}
				}
			});
			
			if(itemPocket > 0){
				newPreset.push(preset1[itemPocket - 1]);
			}else{
				newPreset.push("Null");
			}
			
			
			var itemBelt   = 0;
			preset1.forEach(function(data, idx) {
				if(itemBelt <= 0){
					if (preset1[idx].item_equipment_slot == "벨트") {
						itemBelt = idx + 1;
					} else{
						itemBelt = -1;
					}
				}
			});
			
			if(itemBelt > 0){
				newPreset.push(preset1[itemBelt - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemBottom   = 0;
			preset1.forEach(function(data, idx) {
				if(itemBottom <= 0){
					if (preset1[idx].item_equipment_slot == "하의") {
						itemBottom = idx + 1;
					} else{
						itemBottom = -1;
					}
				}
			});
			
			if(itemBottom > 0){
				newPreset.push(preset1[itemBottom - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemGloves   = 0;
			preset1.forEach(function(data, idx) {
				if(itemGloves <= 0){
					if (preset1[idx].item_equipment_slot == "장갑") {
						itemGloves = idx + 1;
					} else{
						itemGloves = -1;
					}
				}
			});
			
			if(itemGloves > 0){
				newPreset.push(preset1[itemGloves - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemCloak   = 0;
			preset1.forEach(function(data, idx) {
				if(itemCloak <= 0){
					if (preset1[idx].item_equipment_slot == "망토") {
						itemCloak = idx + 1;
					} else{
						itemCloak = -1;
					}
				}
			});
			
			if(itemCloak > 0){
				newPreset.push(preset1[itemCloak - 1]);
			}else{
				newPreset.push("Null");
			}
			
			
			if(parsedCharacterItem.title){
				newPreset.push(parsedCharacterItem.title);
			}else{
				newPreset.push("Null");
			}

			 newPreset.push("ZERO");
			
			var itemShoes   = 0;
			preset1.forEach(function(data, idx) {
				if(itemShoes <= 0){
					if (preset1[idx].item_equipment_slot == "신발") {
						itemShoes = idx + 1;
					} else{
						itemShoes = -1;
					}
				}
			});
			
			if(itemShoes > 0){
				newPreset.push(preset1[itemShoes - 1]);
			}else{
				newPreset.push("Null");
			}
			
	
		
			if(parsedCharacterAndroid.android_description == null){
				newPreset.push("Null");
			}else{
				newPreset.push(parsedCharacterAndroid);
			}
			
			var itemAndroid   = 0;
			preset1.forEach(function(data, idx) {
				if(itemAndroid <= 0){
					if (preset1[idx].item_equipment_slot == "기계 심장") {
						itemAndroid = idx + 1;
					} else{
						itemAndroid = -1;
					}
				}
			});
			
			if(itemAndroid > 0){
				newPreset.push(preset1[itemAndroid - 1]);
			}else{
				newPreset.push("Null");
			}

			newPreset
					.forEach(function(data, idx) {
						if (data == "ZERO") {
							itemEquipment.innerHTML += "<div class='itemEquipment__item'></div>";
						} else if (idx == 25) {
							itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn' onclick='itemDetail("
									+ idx
									+ ")'><img src=' "+ data.title_icon +" '/></button></div>";
						} else if (idx == 28) {
							itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn' onclick='itemDetail("
									+ idx
									+ ")'><img src="+data.android_icon+" /></button></div>";
						} else {
							if (data.potential_option_grade == "레전드리") {
								itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn itemEquipment__btn--legend' onclick='itemDetail("
										+ idx
										+ ")'><img src="+data.item_icon+" /></button></div>";
							} else if (data.potential_option_grade == "유니크") {
								itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn itemEquipment__btn--unique' onclick='itemDetail("
										+ idx
										+ ")'><img src="+data.item_icon+" /></button></div>";
							} else if (data.potential_option_grade == "에픽") {
								itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn itemEquipment__btn--epic' onclick='itemDetail("
										+ idx
										+ ")'><img src="+data.item_icon+" /></button></div>";
							} else {
								itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn' onclick='itemDetail("
										+ idx
										+ ")'><img src="+data.item_icon+" /></button></div>";
							}
						}
					});

		} else if (preset == "3") {
			var itemLing4 = 0;
			preset1.forEach(function(data, idx) {
				if(itemLing4 <= 0){
					if (preset1[idx].item_equipment_slot == "반지4") {
						itemLing4 = idx + 1;
					} else{
						itemLing4 = -1;
					}
				}
			});
			
			if(itemLing4 > 0){
				newPreset.push(preset1[itemLing4 - 1]);
			}else{
				newPreset.push("Null");
			}
			newPreset.push("ZERO");
			
			var itemHat = 0;
			preset1.forEach(function(data, idx) {
				if(itemHat <= 0){
					if (preset1[idx].item_equipment_slot == "모자") {
						itemHat = idx + 1;
					} else{
						itemHat = -1;
					}
				}
			});
			
			if(itemHat > 0){
				newPreset.push(preset1[itemHat - 1]);
			}else{
				newPreset.push("Null");
			}
			
			newPreset.push("ZERO");
			
			var itemEmblem = 0;
			preset1.forEach(function(data, idx) {
				if(itemEmblem <= 0){
					if (preset1[idx].item_equipment_slot == "엠블렘") {
						itemEmblem = idx + 1;
					} else{
						itemEmblem = -1;
					}
				}
			});
			
			if(itemEmblem > 0){
				newPreset.push(preset1[itemEmblem - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemLing3 = 0;
			preset1.forEach(function(data, idx) {
				if(itemLing3 <= 0){
					if (preset1[idx].item_equipment_slot == "반지3") {
						itemLing3 = idx + 1;
					} else{
						itemLing3 = -1;
					}
				}
			});
			
			if(itemLing3 > 0){
				newPreset.push(preset1[itemLing3 - 1]);
			}else{
				newPreset.push("Null");
			}
			

			var itemPndant2 = 0;
			preset1.forEach(function(data, idx) {
				if(itemPndant2 <= 0){
					if (preset1[idx].item_equipment_slot == "펜던트2") {
						itemPndant2 = idx + 1;
					} else{
						itemPndant2 = -1;
					}
				}
			});
			
			if(itemPndant2 > 0){
				newPreset.push(preset1[itemPndant2 - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemFaceDecoration= 0;
			preset1.forEach(function(data, idx) {
				if(itemFaceDecoration <= 0){
					if (preset1[idx].item_equipment_slot == "얼굴장식") {
						itemFaceDecoration = idx + 1;
					} else{
						itemFaceDecoration = -1;
					}
				}
			});
			
			if(itemFaceDecoration > 0){
				newPreset.push(preset1[itemFaceDecoration - 1]);
			}else{
				newPreset.push("Null");
			}
			
			newPreset.push("ZERO");
			
			var itemBadge = 0;
			preset1.forEach(function(data, idx) {
				if(itemBadge <= 0){
					if (preset1[idx].item_equipment_slot == "뱃지") {
						itemBadge = idx + 1;
					} else{
						itemBadge = -1;
					}
				}
			});
			
			if(itemBadge > 0){
				newPreset.push(preset1[itemBadge - 1]);
			}else{
				newPreset.push("Null");
			}
		
			
			var itemLing2 = 0;
			preset1.forEach(function(data, idx) {
				if(itemLing2 <= 0){
					if (preset1[idx].item_equipment_slot == "반지2") {
						itemLing2 = idx + 1;
					} else{
						itemLing2 = -1;
					}
				}
			});
			
			if(itemLing2 > 0){
				newPreset.push(preset1[itemLing2 - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemPndant = 0;
			preset1.forEach(function(data, idx) {
				if(itemPndant <= 0){
					if (preset1[idx].item_equipment_slot == "펜던트") {
						itemPndant = idx + 1;
					} else{
						itemPndant = -1;
					}
				}
			});
			
			if(itemPndant > 0){
				newPreset.push(preset1[itemPndant - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemEyeDecoration = 0;
			preset1.forEach(function(data, idx) {
				if(itemEyeDecoration <= 0){
					if (preset1[idx].item_equipment_slot == "눈장식") {
						itemEyeDecoration = idx + 1;
					} else{
						itemEyeDecoration = -1;
					}
				}
			});
			
			if(itemEyeDecoration > 0){
				newPreset.push(preset1[itemEyeDecoration - 1]);
			}else{
				newPreset.push("Null");
			}
			
			
			var itemEarring = 0;
			preset1.forEach(function(data, idx) {
				if(itemEarring <= 0){
					if (preset1[idx].item_equipment_slot == "귀고리") {
						itemEarring = idx + 1;
					} else{
						itemEarring = -1;
					}
				}
			});
			
			if(itemEarring > 0){
				newPreset.push(preset1[itemEarring - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemMerit = 0;
			preset1.forEach(function(data, idx) {
				if(itemMerit <= 0){
					if (preset1[idx].item_equipment_slot == "훈장") {
						itemMerit = idx + 1;
					} else{
						itemMerit = -1;
					}
				}
			});
			
			if(itemMerit > 0){
				newPreset.push(preset1[itemMerit - 1]);
			}else{
				newPreset.push("Null");
			}
			
			
			var itemLing = 0;
			preset1.forEach(function(data, idx) {
				if(itemLing <= 0){
					if (preset1[idx].item_equipment_slot == "반지1") {
						itemLing = idx + 1;
					} else{
						itemLing = -1;
					}
				}
			});
			
			if(itemLing > 0){
				newPreset.push(preset1[itemLing - 1]);
			}else{
				newPreset.push("Null");
			}
			
			
			var itemWeapon = 0;
			preset1.forEach(function(data, idx) {
				if(itemWeapon <= 0){
					if (preset1[idx].item_equipment_slot == "무기") {
						itemWeapon = idx + 1;
					} else{
						itemWeapon = -1;
					}
				}
			});
			
			if(itemWeapon > 0){
				newPreset.push(preset1[itemWeapon - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemTop = 0;
			preset1.forEach(function(data, idx) {
				if(itemTop <= 0){
					if (preset1[idx].item_equipment_slot == "상의") {
						itemTop = idx + 1;
					} else{
						itemTop = -1;
					}
				}
			});
			
			if(itemTop > 0){
				newPreset.push(preset1[itemTop - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemShoulder  = 0;
			preset1.forEach(function(data, idx) {
				if(itemShoulder <= 0){
					if (preset1[idx].item_equipment_slot == "어깨장식") {
						itemShoulder = idx + 1;
					} else{
						itemShoulder = -1;
					}
				}
			});
			
			if(itemShoulder > 0){
				newPreset.push(preset1[itemShoulder - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemAuxiliary   = 0;
			preset1.forEach(function(data, idx) {
				if(itemAuxiliary <= 0){
					if (preset1[idx].item_equipment_slot == "보조무기") {
						itemAuxiliary = idx + 1;
					} else{
						itemAuxiliary = -1;
					}
				}
			});
			
			if(itemAuxiliary > 0){
				newPreset.push(preset1[itemAuxiliary - 1]);
			}else{
				newPreset.push("Null");
			}
			
			
			var itemPocket   = 0;
			preset1.forEach(function(data, idx) {
				if(itemPocket <= 0){
					if (preset1[idx].item_equipment_slot == "포켓 아이템") {
						itemPocket = idx + 1;
					} else{
						itemPocket = -1;
					}
				}
			});
			
			if(itemPocket > 0){
				newPreset.push(preset1[itemPocket - 1]);
			}else{
				newPreset.push("Null");
			}
			
			
			var itemBelt   = 0;
			preset1.forEach(function(data, idx) {
				if(itemBelt <= 0){
					if (preset1[idx].item_equipment_slot == "벨트") {
						itemBelt = idx + 1;
					} else{
						itemBelt = -1;
					}
				}
			});
			
			if(itemBelt > 0){
				newPreset.push(preset1[itemBelt - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemBottom   = 0;
			preset1.forEach(function(data, idx) {
				if(itemBottom <= 0){
					if (preset1[idx].item_equipment_slot == "하의") {
						itemBottom = idx + 1;
					} else{
						itemBottom = -1;
					}
				}
			});
			
			if(itemBottom > 0){
				newPreset.push(preset1[itemBottom - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemGloves   = 0;
			preset1.forEach(function(data, idx) {
				if(itemGloves <= 0){
					if (preset1[idx].item_equipment_slot == "장갑") {
						itemGloves = idx + 1;
					} else{
						itemGloves = -1;
					}
				}
			});
			
			if(itemGloves > 0){
				newPreset.push(preset1[itemGloves - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemCloak   = 0;
			preset1.forEach(function(data, idx) {
				if(itemCloak <= 0){
					if (preset1[idx].item_equipment_slot == "망토") {
						itemCloak = idx + 1;
					} else{
						itemCloak = -1;
					}
				}
			});
			
			if(itemCloak > 0){
				newPreset.push(preset1[itemCloak - 1]);
			}else{
				newPreset.push("Null");
			}
			
			
			if(parsedCharacterItem.title){
				newPreset.push(parsedCharacterItem.title);
			}else{
				newPreset.push("Null");
			}

			 newPreset.push("ZERO");
			
			var itemShoes   = 0;
			preset1.forEach(function(data, idx) {
				if(itemShoes <= 0){
					if (preset1[idx].item_equipment_slot == "신발") {
						itemShoes = idx + 1;
					} else{
						itemShoes = -1;
					}
				}
			});
			
			if(itemShoes > 0){
				newPreset.push(preset1[itemShoes - 1]);
			}else{
				newPreset.push("Null");
			}
			
	
		
			if(parsedCharacterAndroid.android_description == null){
				newPreset.push("Null");
			}else{
				newPreset.push(parsedCharacterAndroid);
			}
			
			var itemAndroid   = 0;
			preset1.forEach(function(data, idx) {
				if(itemAndroid <= 0){
					if (preset1[idx].item_equipment_slot == "기계 심장") {
						itemAndroid = idx + 1;
					} else{
						itemAndroid = -1;
					}
				}
			});
			
			if(itemAndroid > 0){
				newPreset.push(preset1[itemAndroid - 1]);
			}else{
				newPreset.push("Null");
			}
			newPreset
					.forEach(function(data, idx) {
						if (data == "ZERO") {
							itemEquipment.innerHTML += "<div class='itemEquipment__item'></div>";
						} else if (idx == 25) {
							itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn' onclick='itemDetail("
									+ idx
									+ ")'><img src=' "+ data.title_icon +" '/></button></div>";
						} else if (idx == 28) {
							itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn' onclick='itemDetail("
									+ idx
									+ ")'><img src="+data.android_icon+" /></button></div>";
						} else {
							if (data.potential_option_grade == "레전드리") {
								itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn itemEquipment__btn--legend' onclick='itemDetail("
										+ idx
										+ ")'><img src="+data.item_icon+" /></button></div>";
							} else if (data.potential_option_grade == "유니크") {
								itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn itemEquipment__btn--unique' onclick='itemDetail("
										+ idx
										+ ")'><img src="+data.item_icon+" /></button></div>";
							} else if (data.potential_option_grade == "에픽") {
								itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn itemEquipment__btn--epic' onclick='itemDetail("
										+ idx
										+ ")'><img src="+data.item_icon+" /></button></div>";
							} else {
								itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn' onclick='itemDetail("
										+ idx
										+ ")'><img src="+data.item_icon+" /></button></div>";
							}
						}
					});
		} else if (preset == null) {
			var itemLing4 = 0;
			preset1.forEach(function(data, idx) {
				if(itemLing4 <= 0){
					if (preset1[idx].item_equipment_slot == "반지4") {
						itemLing4 = idx + 1;
					} else{
						itemLing4 = -1;
					}
				}
			});
			
			if(itemLing4 > 0){
				newPreset.push(preset1[itemLing4 - 1]);
			}else{
				newPreset.push("Null");
			}
			newPreset.push("ZERO");
			
			var itemHat = 0;
			preset1.forEach(function(data, idx) {
				if(itemHat <= 0){
					if (preset1[idx].item_equipment_slot == "모자") {
						itemHat = idx + 1;
					} else{
						itemHat = -1;
					}
				}
			});
			
			if(itemHat > 0){
				newPreset.push(preset1[itemHat - 1]);
			}else{
				newPreset.push("Null");
			}
			
			newPreset.push("ZERO");
			
			var itemEmblem = 0;
			preset1.forEach(function(data, idx) {
				if(itemEmblem <= 0){
					if (preset1[idx].item_equipment_slot == "엠블렘") {
						itemEmblem = idx + 1;
					} else{
						itemEmblem = -1;
					}
				}
			});
			
			if(itemEmblem > 0){
				newPreset.push(preset1[itemEmblem - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemLing3 = 0;
			preset1.forEach(function(data, idx) {
				if(itemLing3 <= 0){
					if (preset1[idx].item_equipment_slot == "반지3") {
						itemLing3 = idx + 1;
					} else{
						itemLing3 = -1;
					}
				}
			});
			
			if(itemLing3 > 0){
				newPreset.push(preset1[itemLing3 - 1]);
			}else{
				newPreset.push("Null");
			}
			

			var itemPndant2 = 0;
			preset1.forEach(function(data, idx) {
				if(itemPndant2 <= 0){
					if (preset1[idx].item_equipment_slot == "펜던트2") {
						itemPndant2 = idx + 1;
					} else{
						itemPndant2 = -1;
					}
				}
			});
			
			if(itemPndant2 > 0){
				newPreset.push(preset1[itemPndant2 - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemFaceDecoration= 0;
			preset1.forEach(function(data, idx) {
				if(itemFaceDecoration <= 0){
					if (preset1[idx].item_equipment_slot == "얼굴장식") {
						itemFaceDecoration = idx + 1;
					} else{
						itemFaceDecoration = -1;
					}
				}
			});
			
			if(itemFaceDecoration > 0){
				newPreset.push(preset1[itemFaceDecoration - 1]);
			}else{
				newPreset.push("Null");
			}
			
			newPreset.push("ZERO");
			
			var itemBadge = 0;
			preset1.forEach(function(data, idx) {
				if(itemBadge <= 0){
					if (preset1[idx].item_equipment_slot == "뱃지") {
						itemBadge = idx + 1;
					} else{
						itemBadge = -1;
					}
				}
			});
			
			if(itemBadge > 0){
				newPreset.push(preset1[itemBadge - 1]);
			}else{
				newPreset.push("Null");
			}
		
			
			var itemLing2 = 0;
			preset1.forEach(function(data, idx) {
				if(itemLing2 <= 0){
					if (preset1[idx].item_equipment_slot == "반지2") {
						itemLing2 = idx + 1;
					} else{
						itemLing2 = -1;
					}
				}
			});
			
			if(itemLing2 > 0){
				newPreset.push(preset1[itemLing2 - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemPndant = 0;
			preset1.forEach(function(data, idx) {
				if(itemPndant <= 0){
					if (preset1[idx].item_equipment_slot == "펜던트") {
						itemPndant = idx + 1;
					} else{
						itemPndant = -1;
					}
				}
			});
			
			if(itemPndant > 0){
				newPreset.push(preset1[itemPndant - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemEyeDecoration = 0;
			preset1.forEach(function(data, idx) {
				if(itemEyeDecoration <= 0){
					if (preset1[idx].item_equipment_slot == "눈장식") {
						itemEyeDecoration = idx + 1;
					} else{
						itemEyeDecoration = -1;
					}
				}
			});
			
			if(itemEyeDecoration > 0){
				newPreset.push(preset1[itemEyeDecoration - 1]);
			}else{
				newPreset.push("Null");
			}
			
			
			var itemEarring = 0;
			preset1.forEach(function(data, idx) {
				if(itemEarring <= 0){
					if (preset1[idx].item_equipment_slot == "귀고리") {
						itemEarring = idx + 1;
					} else{
						itemEarring = -1;
					}
				}
			});
			
			if(itemEarring > 0){
				newPreset.push(preset1[itemEarring - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemMerit = 0;
			preset1.forEach(function(data, idx) {
				if(itemMerit <= 0){
					if (preset1[idx].item_equipment_slot == "훈장") {
						itemMerit = idx + 1;
					} else{
						itemMerit = -1;
					}
				}
			});
			
			if(itemMerit > 0){
				newPreset.push(preset1[itemMerit - 1]);
			}else{
				newPreset.push("Null");
			}
			
			
			var itemLing = 0;
			preset1.forEach(function(data, idx) {
				if(itemLing <= 0){
					if (preset1[idx].item_equipment_slot == "반지1") {
						itemLing = idx + 1;
					} else{
						itemLing = -1;
					}
				}
			});
			
			if(itemLing > 0){
				newPreset.push(preset1[itemLing - 1]);
			}else{
				newPreset.push("Null");
			}
			
			
			var itemWeapon = 0;
			preset1.forEach(function(data, idx) {
				if(itemWeapon <= 0){
					if (preset1[idx].item_equipment_slot == "무기") {
						itemWeapon = idx + 1;
					} else{
						itemWeapon = -1;
					}
				}
			});
			
			if(itemWeapon > 0){
				newPreset.push(preset1[itemWeapon - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemTop = 0;
			preset1.forEach(function(data, idx) {
				if(itemTop <= 0){
					if (preset1[idx].item_equipment_slot == "상의") {
						itemTop = idx + 1;
					} else{
						itemTop = -1;
					}
				}
			});
			
			if(itemTop > 0){
				newPreset.push(preset1[itemTop - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemShoulder  = 0;
			preset1.forEach(function(data, idx) {
				if(itemShoulder <= 0){
					if (preset1[idx].item_equipment_slot == "어깨장식") {
						itemShoulder = idx + 1;
					} else{
						itemShoulder = -1;
					}
				}
			});
			
			if(itemShoulder > 0){
				newPreset.push(preset1[itemShoulder - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemAuxiliary   = 0;
			preset1.forEach(function(data, idx) {
				if(itemAuxiliary <= 0){
					if (preset1[idx].item_equipment_slot == "보조무기") {
						itemAuxiliary = idx + 1;
					} else{
						itemAuxiliary = -1;
					}
				}
			});
			
			if(itemAuxiliary > 0){
				newPreset.push(preset1[itemAuxiliary - 1]);
			}else{
				newPreset.push("Null");
			}
			
			
			var itemPocket   = 0;
			preset1.forEach(function(data, idx) {
				if(itemPocket <= 0){
					if (preset1[idx].item_equipment_slot == "포켓 아이템") {
						itemPocket = idx + 1;
					} else{
						itemPocket = -1;
					}
				}
			});
			
			if(itemPocket > 0){
				newPreset.push(preset1[itemPocket - 1]);
			}else{
				newPreset.push("Null");
			}
			
			
			var itemBelt   = 0;
			preset1.forEach(function(data, idx) {
				if(itemBelt <= 0){
					if (preset1[idx].item_equipment_slot == "벨트") {
						itemBelt = idx + 1;
					} else{
						itemBelt = -1;
					}
				}
			});
			
			if(itemBelt > 0){
				newPreset.push(preset1[itemBelt - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemBottom   = 0;
			preset1.forEach(function(data, idx) {
				if(itemBottom <= 0){
					if (preset1[idx].item_equipment_slot == "하의") {
						itemBottom = idx + 1;
					} else{
						itemBottom = -1;
					}
				}
			});
			
			if(itemBottom > 0){
				newPreset.push(preset1[itemBottom - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemGloves   = 0;
			preset1.forEach(function(data, idx) {
				if(itemGloves <= 0){
					if (preset1[idx].item_equipment_slot == "장갑") {
						itemGloves = idx + 1;
					} else{
						itemGloves = -1;
					}
				}
			});
			
			if(itemGloves > 0){
				newPreset.push(preset1[itemGloves - 1]);
			}else{
				newPreset.push("Null");
			}
			
			var itemCloak   = 0;
			preset1.forEach(function(data, idx) {
				if(itemCloak <= 0){
					if (preset1[idx].item_equipment_slot == "망토") {
						itemCloak = idx + 1;
					} else{
						itemCloak = -1;
					}
				}
			});
			
			if(itemCloak > 0){
				newPreset.push(preset1[itemCloak - 1]);
			}else{
				newPreset.push("Null");
			}
			
			
			if(parsedCharacterItem.title){
				newPreset.push(parsedCharacterItem.title);
			}else{
				newPreset.push("Null");
			}

			 newPreset.push("ZERO");
			
			var itemShoes   = 0;
			preset1.forEach(function(data, idx) {
				if(itemShoes <= 0){
					if (preset1[idx].item_equipment_slot == "신발") {
						itemShoes = idx + 1;
					} else{
						itemShoes = -1;
					}
				}
			});
			
			if(itemShoes > 0){
				newPreset.push(preset1[itemShoes - 1]);
			}else{
				newPreset.push("Null");
			}
			
	
		
			if(parsedCharacterAndroid.android_description == null){
				newPreset.push("Null");
			}else{
				newPreset.push(parsedCharacterAndroid);
			}
			
			var itemAndroid   = 0;
			preset1.forEach(function(data, idx) {
				if(itemAndroid <= 0){
					if (preset1[idx].item_equipment_slot == "기계 심장") {
						itemAndroid = idx + 1;
					} else{
						itemAndroid = -1;
					}
				}
			});
			
			if(itemAndroid > 0){
				newPreset.push(preset1[itemAndroid - 1]);
			}else{
				newPreset.push("Null");
			}
			newPreset
					.forEach(function(data, idx) {
						if (data == "ZERO") {
							itemEquipment.innerHTML += "<div class='itemEquipment__item'></div>";
						} else if (idx == 25) {
							itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn' onclick='itemDetail("
									+ idx
									+ ")'><img src=' "+ data.title_icon +" '/></button></div>";
						} else if (idx == 28) {
							itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn' onclick='itemDetail("
									+ idx
									+ ")'><img src="+data.android_icon+" /></button></div>";
						} else {
							if (data.potential_option_grade == "레전드리") {
								itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn itemEquipment__btn--legend' onclick='itemDetail("
										+ idx
										+ ")'><img src="+data.item_icon+" /></button></div>";
							} else if (data.potential_option_grade == "유니크") {
								itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn itemEquipment__btn--unique' onclick='itemDetail("
										+ idx
										+ ")'><img src="+data.item_icon+" /></button></div>";
							} else if (data.potential_option_grade == "에픽") {
								itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn itemEquipment__btn--epic' onclick='itemDetail("
										+ idx
										+ ")'><img src="+data.item_icon+" /></button></div>";
							} else {
								itemEquipment.innerHTML += "<div class='itemEquipment__item'><button type='button' class='itemEquipment__btn' onclick='itemDetail("
										+ idx
										+ ")'><img src="+data.item_icon+" /></button></div>";
							}
						}
					});
		}
	}

	function itemDetail(idx) {
		const itemDetail = document.getElementById('itemDetail');
		const itemData = [];
		itemData.push(newPreset[idx]);
		const itemNow = itemData[0];

		$("#itemDetail").empty();
		var newbox = '';
		newbox += '<div class="itemEquipment__itemLeft">';
		if (idx == 25) {
			newbox += '<div class="itemEquipment__titleName">' + itemNow.title_name + '</div>';
		} else if (idx == 28) {
			newbox += '<div class="itemEquipment__androidName">' + itemNow.android_name + '</div>';
		} else {
			if (itemNow.starforce == 0) {
			} else {
				var output = '';
				output += '<div class="itemEquipment__starforce">';
				var itemLv = itemNow.item_base_option.base_equipment_level;
				var starforceTotal = '';
				var nowStarforce = '';

				if (itemLv <= 94) {
					starforceTotal = 5;
				} else if (itemLv >= 95 && itemLv <= 107) {
					starforceTotal = 8;
				} else if (itemLv >= 108 && itemLv <= 117) {
					starforceTotal = 10;
				} else if (itemLv >= 118 && itemLv <= 127) {
					starforceTotal = 15;
				} else if (itemLv >= 128 && itemLv <= 137) {
					starforceTotal = 20;
				} else if (itemLv >= 138) {
					starforceTotal = 25;
				}

				nowStarforce = starforceTotal - itemNow.starforce;

				for (var i = 0; i < itemNow.starforce; i++) {
					output += '<div class="itemEquipment__star">★</div>';
				}
				for (var i = 0; i < nowStarforce; i++) {
					output += '<div class="itemEquipment__star">☆</div>';
				}
				output += '</div>';
				newbox += output;
			}
			
			if(itemNow.scroll_upgrade == 0){
				newbox += '<div class="itemEquipment__shapeName">' 
					+ itemNow.item_shape_name + '</div>';
			} else {
				newbox += '<div class="itemEquipment__shapeName">' 
					+ itemNow.item_shape_name + ' (+' + itemNow.scroll_upgrade+')'
					+ '</div>';
			}

			
			if (itemNow.potential_option_grade == null) {
			} else {
				newbox += '<div class="itemEquipment__potential">(' + itemNow.potential_option_grade+ ' 아이템)</div>';
			}
			newbox += '<div class="itemEquipment__icon"><img src="'+itemNow.item_icon+'"/></div>';
			newbox += '<div class="itemEquipment__part">장비분류 : ' + itemNow.item_equipment_part + '</div>';
			
			if(itemNow.item_total_option.str > 0){
			newbox += '<div class="itemEquipment__itemOption">'
					+ '<div class="itemEquipment__totalOption">STR : '
					+'+'+itemNow.item_total_option.str
					+ ' </div><div class="itemEquipment__baseOption">('
					+ itemNow.item_base_option.str
					+ '</div><div class="itemEquipment__addOption">'
					+ ' + '+itemNow.item_add_option.str
					+ '</div><div class="itemEquipment__etcOption">'
					+ ' + '+itemNow.item_etc_option.str
					+ ' </div><div class="itemEquipment__starforceOption">'
					+  ' + ' +itemNow.item_starforce_option.str + '</div>)</div>';	
			}
			if(itemNow.item_total_option.dex > 0){
			newbox += '<div class="itemEquipment__itemOption">'
				+ '<div class="itemEquipment__totalOption">DEX : '
				+'+'+itemNow.item_total_option.dex
				+ ' </div><div class="itemEquipment__baseOption">('
				+ itemNow.item_base_option.dex
				+ '</div><div class="itemEquipment__addOption">'
				+ ' + '+itemNow.item_add_option.dex
				+ '</div><div class="itemEquipment__etcOption">'
				+ ' + '+itemNow.item_etc_option.dex
				+ ' </div><div class="itemEquipment__starforceOption">'
				+  ' + ' +itemNow.item_starforce_option.dex + '</div>)</div>';
			}
				if(itemNow.item_total_option.luk > 0){
					newbox += '<div class="itemEquipment__itemOption">'
					+ '<div class="itemEquipment__totalOption">LUK : '
					+'+'+itemNow.item_total_option.luk
					+ ' </div><div class="itemEquipment__baseOption">('
					+ itemNow.item_base_option.luk
					+ '</div><div class="itemEquipment__addOption">'
					+ ' + '+itemNow.item_add_option.luk
					+ '</div><div class="itemEquipment__etcOption">'
					+ ' + '+itemNow.item_etc_option.luk
					+ ' </div><div class="itemEquipment__starforceOption">'
					+  ' + ' +itemNow.item_starforce_option.luk + '</div>)</div>';
				} 
				if(itemNow.item_total_option.int > 0){
					newbox += '<div class="itemEquipment__itemOption">'
					+ '<div class="itemEquipment__totalOption">INT : '
					+'+'+itemNow.item_total_option.int
					+ ' </div><div class="itemEquipment__baseOption">('
					+ itemNow.item_base_option.int
					+ '</div><div class="itemEquipment__addOption">'
					+ ' + '+itemNow.item_add_option.int
					+ '</div><div class="itemEquipment__etcOption">'
					+ ' + '+itemNow.item_etc_option.int
					+ ' </div><div class="itemEquipment__starforceOption">'
					+  ' + ' +itemNow.item_starforce_option.int + '</div>)</div>';
				}
				if(itemNow.item_total_option.max_hp > 0){
					newbox += '<div class="itemEquipment__itemOption">'
					+ '<div class="itemEquipment__totalOption">HP : '
					+'+'+itemNow.item_total_option.max_hp
					+ ' </div><div class="itemEquipment__baseOption">('
					+ itemNow.item_base_option.max_hp
					+ '</div><div class="itemEquipment__addOption">'
					+ ' + '+itemNow.item_add_option.max_hp
					+ '</div><div class="itemEquipment__etcOption">'
					+ ' + '+itemNow.item_etc_option.max_hp
					+ ' </div><div class="itemEquipment__starforceOption">'
					+  ' + ' +itemNow.item_starforce_option.max_hp + '</div>)</div>';
				}
				if(itemNow.item_total_option.max_mp > 0){
					newbox += '<div class="itemEquipment__itemOption">'
					+ '<div class="itemEquipment__totalOption">MP : '
					+'+'+itemNow.item_total_option.max_mp
					+ ' </div><div class="itemEquipment__baseOption">('
					+ itemNow.item_base_option.max_mp
					+ '</div><div class="itemEquipment__addOption">'
					+ ' + '+itemNow.item_add_option.max_mp
					+ '</div><div class="itemEquipment__etcOption">'
					+ ' + '+itemNow.item_etc_option.max_mp
					+ ' </div><div class="itemEquipment__starforceOption">'
					+  ' + ' +itemNow.item_starforce_option.max_mp + '</div>)</div>';
				}
				if(itemNow.item_total_option.attack_power > 0){
					newbox += '<div class="itemEquipment__itemOption">'
					+ '<div class="itemEquipment__totalOption">공격력 : '
					+'+'+itemNow.item_total_option.attack_power
					+ ' </div><div class="itemEquipment__baseOption">('
					+ itemNow.item_base_option.attack_power
					+ '</div><div class="itemEquipment__addOption">'
					+ ' + '+itemNow.item_add_option.attack_power
					+ '</div><div class="itemEquipment__etcOption">'
					+ ' + '+itemNow.item_etc_option.attack_power
					+ ' </div><div class="itemEquipment__starforceOption">'
					+  ' + ' +itemNow.item_starforce_option.attack_power + '</div>)</div>';
				}
				if(itemNow.item_total_option.magic_power > 0){
					newbox += '<div class="itemEquipment__itemOption">'
					+ '<div class="itemEquipment__totalOption">마력 : '
					+' + '+itemNow.item_total_option.magic_power
					+ ' </div><div class="itemEquipment__baseOption">('
					+ itemNow.item_base_option.magic_power
					+ '</div><div class="itemEquipment__addOption">'
					+ ' + '+itemNow.item_add_option.magic_power
					+ '</div><div class="itemEquipment__etcOption">'
					+ ' + '+itemNow.item_etc_option.magic_power
					+ ' </div><div class="itemEquipment__starforceOption">'
					+  ' + ' +itemNow.item_starforce_option.magic_power + '</div>)</div>';
				}
				if(itemNow.item_total_option.armor > 0){
					newbox += '<div class="itemEquipment__itemOption">'
					+ '<div class="itemEquipment__totalOption">방어력 : '
					+'+'+itemNow.item_total_option.armor
					+ ' </div><div class="itemEquipment__baseOption">('
					+ itemNow.item_base_option.armor
					+ '</div><div class="itemEquipment__addOption">'
					+ ' + '+itemNow.item_add_option.armor
					+ '</div><div class="itemEquipment__etcOption">'
					+ ' + '+itemNow.item_etc_option.armor
					+ ' </div><div class="itemEquipment__starforceOption">'
					+  ' + ' +itemNow.item_starforce_option.armor + '</div>)</div>';
				}
				if(itemNow.item_total_option.all_stat > 0){
					newbox += '<div class="itemEquipment__itemOption">'
					+ '<div class="itemEquipment__totalOption">올스텟 : '
					+'+'+itemNow.item_total_option.all_stat
					+ '%</div><div class="itemEquipment__baseOption">('
					+ itemNow.item_base_option.all_stat
					+ '</div><div class="itemEquipment__addOption">'
					+ '+ '+itemNow.item_add_option.all_stat
					+ '%</div>)</div>';
				}
				if(itemNow.item_total_option.boss_damage > 0){
					newbox += '<div class="itemEquipment__itemOption">'
					+ '<div class="itemEquipment__totalOption">보스 공격 시 데미지 : +'+itemNow.item_total_option.boss_damage + '%</div>('
					+ '<div class="itemEquipment__baseOption">'+itemNow.item_base_option.boss_damage +'%</div>'
					+ '<div class="itemEquipment__addOption"> + '+itemNow.item_add_option.boss_damage +'%</div>)'
					+ '</div>';
				}

				if(itemNow.item_total_option.ignore_monster_armor > 0){
					newbox += '<div class="itemEquipment__itemOption">'
					+ '<div class="itemEquipment__totalOption">방어력 무시 : '
					+'+'+itemNow.item_total_option.ignore_monster_armor
					+ '% </div></div>';
				}
				if(itemNow.item_total_option.damage > 0){
					newbox += '<div class="itemEquipment__itemOption">'
					+ '<div class="itemEquipment__totalOption">데미지 : +'+itemNow.item_total_option.damage + '%</div>'
							if(itemNow.item_base_option.damage == 0){
								+ '<div class="itemEquipment__baseOption">0%</div>'
							} else {
								+ '<div class="itemEquipment__baseOption">'+itemNow.item_base_option.damage +'%</div>'
							}
					+ '<div class="itemEquipment__addOption"> + '+itemNow.item_add_option.damage +'%</div>)'
					newbox += '</div>';
				}
	
				if(parsedCharacterBasic.world_name == "리부트"){
				
				} else {
					if(itemNow.cuttable_count == 255){
						
					} else {
						newbox += '<div class="itemEquipment__itemOption">'
						newbox += '<div class="itemEquipment__cuttable">가위 사용 가능 횟수 : ' + itemNow.cuttable_count + '</div>'
						newbox +='</div>'
					}
				}

		}
		console.log(itemNow.potential_option_grade);
		if(itemNow.potential_option_grade){
				newbox += '<div class="itemEquipment__potentialOption">'
				if(itemNow.potential_option_grade == "레어"){
					newbox += '<div class="itemEquipment__potentialOption-tit itemEquipment__potentialOption-tit--rare">잠재옵션</div>'
				}  else if(itemNow.potential_option_grade == "에픽"){
					newbox += '<div class="itemEquipment__potentialOption-tit itemEquipment__potentialOption-tit--epic">잠재옵션</div>'
				} else if(itemNow.potential_option_grade == "유니크"){
					newbox += '<div class="itemEquipment__potentialOption-tit itemEquipment__potentialOption-tit--unique">잠재옵션</div>'
				} else if(itemNow.potential_option_grade == "레전드리"){
					newbox += '<div class="itemEquipment__potentialOption-tit itemEquipment__potentialOption-tit--legend">잠재옵션</div>'			
				} 
				if(itemNow.potential_option_1 == null && itemNow.potential_option_2 == null && itemNow.potential_option_3 == null ){
					newbox += '<div class="itemEquipment_potentialOption-item">잠재능력이 봉인되어 있습니다.</div>'
				} else {
					if(itemNow.potential_option_1){
						newbox += '<div class="itemEquipment_potentialOption-item">'+itemNow.potential_option_1+'</div>'
					}
					if(itemNow.potential_option_2){
						newbox += '<div class="itemEquipment_potentialOption-item">'+itemNow.potential_option_2+'</div>'
					}
					if(itemNow.potential_option_3){
						newbox += '<div class="itemEquipment_potentialOption-item">'+itemNow.potential_option_3+'</div>' 
					}
				}

				
				newbox += '</div>';
		}

		if(itemNow.additional_potential_option_grade){
				newbox += '<div class="itemEquipment__potentialOption">'
				if(itemNow.additional_potential_option_grade == "레어"){
					newbox += '<div class="itemEquipment__potentialOption-tit itemEquipment__potentialOption-tit--rare">잠재옵션</div>'
				}  else if(itemNow.additional_potential_option_grade == "에픽"){
					newbox += '<div class="itemEquipment__potentialOption-tit itemEquipment__potentialOption-tit--epic">잠재옵션</div>'
				} else if(itemNow.additional_potential_option_grade == "유니크"){
					newbox += '<div class="itemEquipment__potentialOption-tit itemEquipment__potentialOption-tit--unique">잠재옵션</div>'
				} else if(itemNow.additional_potential_option_grade == "레전드리"){
					newbox += '<div class="itemEquipment__potentialOption-tit itemEquipment__potentialOption-tit--legend">잠재옵션</div>'			
				} 
				if(itemNow.additional_potential_option_1 == null && additional_potential_option_2 == null && additional_potential_option_3 == null ){
					newbox += '<div class="itemEquipment_potentialOption-item">잠재능력이 봉인되어 있습니다.</div>'
					
				} else {
					if(itemNow.additional_potential_option_1){
						newbox += '<div class="itemEquipment_potentialOption-item">'+itemNow.additional_potential_option_1+'</div>'
					}
					if(itemNow.additional_potential_option_2){
						newbox += '<div class="itemEquipment_potentialOption-item">'+itemNow.additional_potential_option_2+'</div>'
					}
					if(itemNow.additional_potential_option_3){
						newbox += '<div class="itemEquipment_potentialOption-item">'+itemNow.additional_potential_option_3+'</div>'
					}
				}
			
				newbox += '</div>';
		}
			itemDetail.innerHTML += newbox;
	}

	symbolDetail(parsedCharactercharacterSymbol);

	function symbolDetail(data) {
		const symboldata = data.symbol;
		const symbolBox1 = document.getElementById('symbolArcane');
		const symbolBox2 = document.getElementById('symbolAuthentic');

		let symbolArcane = [];
		let symbolAuthentic = [];

		let symbolArcaneHtml = '';
		let symbolAuthenticHtml = '';

		for (var i = 0; i < symboldata.length; i++) {
			if (i < 6) {
				symbolArcane.push(symboldata[i])
			} else {
				symbolAuthentic.push(symboldata[i])
			}
		}

		let sumForce = 0;
		symbolArcaneHtml += "<div class='symbol__textBox'>";
		symbolArcane.forEach(function(data, idx) {
			sumForce = sumForce + Number(data.symbol_force);
		});
		const nowForce = sumForce.toString().replace(/\B(?=(\d{3})+(?!\d))/g,
				",");
		symbolArcaneHtml += "<div class='symbol__textBox'>";
		symbolArcaneHtml += "ACR " + nowForce;
		symbolArcaneHtml += "</div>";
		let sum = 0;
		let mainStat = '';
		symbolArcaneHtml += "<div class='symbol__textBox'>";

		symbolArcane.forEach(function(data, idx) {
			if (data.symbol_str > 0) {
				sum = sum + Number(data.symbol_str);
				mainStat = "STR";
			}
			if (data.symbol_dex > 0) {
				sum = sum + Number(data.symbol_dex);
				mainStat = "DEX";
			}
			if (data.symbol_luk > 0) {
				sum = sum + Number(data.symbol_luk);
				mainStat = "LUK";
			}
			if (data.symbol_int > 0) {
				sum = sum + Number(data.symbol_int);
				mainStat = "INT";
			}
			if (data.symbol_hp > 0) {
				sum = sum + Number(data.symbol_hp);
				mainStat = "HP";
			}
		});

		const nowSum = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		symbolArcaneHtml += mainStat + " " + nowSum;
		symbolArcaneHtml += "</div>";
		symbolArcaneHtml += "<div class='symbol__box'>";
		symbolArcane
				.forEach(function(data, idx) {
					symbolArcaneHtml += "<div class='symbol__item'>";
					symbolArcaneHtml += "<div class='symbol__img'><img src=' "+ data.symbol_icon +" '/></div>";
					symbolArcaneHtml += "<div>Lv. " + data.symbol_level
							+ "</div>";
					symbolArcaneHtml += "</div>";
				});
		symbolArcaneHtml += "</div>"

		let sumForceAuthentic = 0;
		symbolAuthenticHtml += "<div class='symbol__textBox'>";
		symbolAuthentic.forEach(function(data, idx) {
			sumForceAuthentic = sumForceAuthentic + Number(data.symbol_force);
		});
		const nowForceAuthentic = sumForceAuthentic.toString().replace(
				/\B(?=(\d{3})+(?!\d))/g, ",");
		symbolAuthenticHtml += "<div class='symbol__textBox'>";
		symbolAuthenticHtml += "ACR " + nowForceAuthentic;
		symbolAuthenticHtml += "</div>";
		let sumAuthentic = 0;
		let mainStatAuthentic = '';
		symbolAuthenticHtml += "<div class='symbol__textBox'>";

		symbolAuthentic.forEach(function(data, idx) {
			if (data.symbol_str > 0) {
				sumAuthentic = sumAuthentic + Number(data.symbol_str);
				mainStatAuthentic = "STR";
			}
			if (data.symbol_dex > 0) {
				sumAuthentic = sumAuthentic + Number(data.symbol_dex);
				mainStatAuthentic = "DEX";
			}
			if (data.symbol_luk > 0) {
				sumAuthentic = sumAuthentic + Number(data.symbol_luk);
				mainStatAuthentic = "LUK";
			}
			if (data.symbol_int > 0) {
				sumAuthentic = sumAuthentic + Number(data.symbol_int);
				mainStatAuthentic = "INT";
			}
			if (data.symbol_hp > 0) {
				sumAuthentic = sumAuthentic + Number(data.symbol_hp);
				mainStatAuthentic = "HP";
			}
		});

		const nowSumAuthenti = sumAuthentic.toString().replace(
				/\B(?=(\d{3})+(?!\d))/g, ",");
		symbolAuthenticHtml += mainStatAuthentic + " " + nowSumAuthenti;
		symbolAuthenticHtml += "</div>";

		symbolAuthenticHtml += "<div class='symbol__box'>"
		symbolAuthentic
				.forEach(function(data, idx) {
					symbolAuthenticHtml += "<div class='symbol__item'>";
					symbolAuthenticHtml += "<div class='symbol__img'><img src=' "+ data.symbol_icon +" '/></div>"
					symbolAuthenticHtml += "<div>Lv. " + data.symbol_level
							+ "</div>"
					symbolAuthenticHtml += "</div>"
				});
		symbolAuthenticHtml += "</div>"
		symbolBox2.innerHTML += symbolAuthenticHtml;
		symbolBox1.innerHTML += symbolArcaneHtml;
	}

	symbolTab(1)
	function symbolTab(idx) {
		$(".symbol__tab").removeClass("symbol__tab--active");
		if (idx == "1") {
			$("#symbolArcane").show();
			$("#symbolAuthentic").hide();
			$(".symbol__tab").eq(0).addClass("symbol__tab--active");
		}
		if (idx == "2") {
			$("#symbolArcane").hide();
			$("#symbolAuthentic").show();
			$(".symbol__tab").eq(1).addClass("symbol__tab--active");
		}
	}
</script>
</html>