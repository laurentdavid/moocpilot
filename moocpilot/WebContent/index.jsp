<!DOCTYPE html>
<html lang = "fr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>MOOC Pilote: tableau de progression des �l�ves</title>
        <link href="Styles/style.css" rel="stylesheet" media="all" type="text/css">
		<link href="Styles/d3.css" rel="stylesheet" media="all" type="text/css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
		<link href="Styles/screenSelector.css" rel="stylesheet" media="all" type="text/css">
    </head>
    <body>
        <div id="presentationCoverTop" class="presentationCover"></div>
        <div id="presentationCoverRight" class="presentationCover"></div>
        <div id="presentationCoverLeft" class="presentationCover"></div>
        <div id="presentationCoverBottom" class="presentationCover"></div>
        <div id="presentationCover"></div>
        <div id="presentationPanel">   	
			<a></a>
	    	<svg id="presentationArrow" fill="#000000" height="60" viewBox="0 0 24 24" width="60" xmlns="http://www.w3.org/2000/svg">
				<path d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"/>
			</svg>     
        	<div id="PresentationPanelMenu">
        	    <div onclick="previousPresentationPage()">
					<span>Pr�c�dent</span>
				</div>
				<div onclick="nextPresentationPage()">
					<span>Suivant</span>
				</div>				
				<div onclick="stopPresentation()">
					<span>Quitter la d�monstration</span>
				</div>
        	</div>
        </div>
        <img id = "loaderGif" alt="Loading" src="Ressources/loading.gif">

    	<div id = "titleView">
			<a></a>
			<div class = "tooltips tooltipsbottomdiag" id = "infoDiag">  	
				<svg fill="#000000" height="36" viewBox="0 0 24 24" width="36" xmlns="http://www.w3.org/2000/svg">    
				    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-6h2v6zm0-8h-2V7h2v2z"></path>
				</svg>	
				<span></span>
    		</div>	
		</div>	
    	<div id = "content">
    	    	<div id="presentation">
    	    		<div id="presentationText">
    	    			<p>Bienvenue sur l'application Mooc-Pilot.</p>
    	    			<p>Mooc-Pilot est une application d�di� � la visualisation de la progression d'�l�ves au cours d'un MOOC.</p>
    	    			<p>L'application permet une visualisation en bulles de donn�es repr�sentant la progression d'�tudiants au sein d'un MOOC avec pour but de repr�senter un grand nombre de donn�es de mani�re � faire ressortir les probl�mes dans l'�volution des apprenants.</p>
    	    			<p>Vous pouvez assister � une d�monstration, ou commencer � visualiser des donn�es.</p>
    	    		</div>
    	    		<div id="presentationMenu">
    	    			<div onclick="checkCookieCheckBox();launchPresentation()" class="link">
    	    				<span>Assister � la d�monstration</span>
    	    			</div>
    	    			<div onclick="checkCookieCheckBox();dataSelectionLink(2)" class="link">
    	    				<span id = "presentationMenuCourseLink" >Ignorer la d�monstration</span>
    	    			</div>
    	    			<div style = "margin:20px 0px;">
    	    				<span>Ne plus afficher ce panneau</span>
    	    				<input id = "nonPresentationPanel" type = "checkbox">
    	    			</div>
					</div>
    	    	</div>
    	    <div id = "header">
    	    	<a class = "headPict" href = "https://www.imt.fr/"><img style = "margin-left: 60px;" src="Ressources/imt.jpg"></a>
	        	<a class = "headPict" href = "http://www.mines-ales.fr/"><img src="Ressources/mines_ales_logo.jpg"></a>
	    		<div id ="appNameDiv">
	    			<p>MOOC-PILOT</p>
	    		</div>
				<div id = "headerMenu">
					<div style = "display:none">					
						<a href = "." class="headerMenuUnselected"></a>
						<a></a>
					</div>
					<div style = "display:none">					
						<a href = "diagramme.jsp" class="headerMenuUnselected"></a>
						<a></a>
					</div>
						<a style =  "display:none" onclick="launchPresentation()" id="DemoButton">D�monstration</a>
						<div id="contact">
							<a>
								contact
								<span>
									<p>Notre �quipe de recherche au laboratoire LGi2P de l'�cole des Mines d'Al�s :</p>
									<p>Michel Crampes, professeur et chercheur,</p>
									<p>Michel Planti�, chercheur,</p>
									<p>Axel Garcia, d�veloppeur,</p>
									<p>Pierre Jean, ing�nieur de recherche</p>	
							        <p>Email : social.networks@mines-ales.fr</p>
							        <p>Numero de t�l�phone : 04 66 38 70 35</p>
							   	</span>
						   	</a>
						</div>
						
					<div>					
						<a href = "admin" class="headerMenu">administrateur (r�serv�)</a>
						<a></a>
					</div>
				</div>
    		</div>
    		<div id="bullePopup">
				<a></a>
				<i class="fa fa-arrows"></i>
				<button id = "visualiseCohorteButton">Progression de ce groupe d'�l�ves. (Passage en donn�es cumul�es)</button>
				<div id = "visualiseCohorteToggleDiv">
					<span>Progression de ce groupe d'�l�ves</span>
					<input id = "visualiseCohorteToggle" type = "checkbox" checked="">
				</div>
				
				<div>
			    	<a style = "width:50%;font-size:13px;">Visualisation d'un �l�ve</a>
			    	<select style = "background-color: red;width:120px;" onchange = "updateBulleStudentListCall()" id = "bulleStudentList">
						<option value = "">Tous les �l�ves</option>
					</select>
			    </div>

				<button>Liste des �l�ves de ce groupe</button>
				<button id = "resetSelectedCohorte">R�initialiser la s�lection</button>
	    	</div>
    		<div id = "svgPanel">		
    			<table id="tableau"></table>
			    <div class = "notRequired student-name-prompt">
			    	<a style = "width:50%;">Nom d'un �l�ve</a>
			    		<input id=studentSelect oninput = "changeStudent()" list="studentSelectData" title = "Double clique pour afficher la liste des �l�ves">
					<datalist id=studentSelectData></datalist>
					<svg style = "cursor: pointer;" onclick="resetStudent();" fill="#000000" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
						<path style = "transform: translate(0px, 5px);" d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"/>
					</svg>
				</div>
    			<p id = "studentInfo">
	    			<a id = "pieContainer" style = "margin-right:10px"></a>
	    			<svg class = "smileys" style = "margin-bottom:-10px; fill:blue;" fill="#000000" viewBox="0 0 24 24" width="32" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" height="32" style="/*! position: relative; *//*! top: 20px; */margin-bottom: -10px;">
					    <path d="M12 2C8.14 2 5 5.14 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.86-3.14-7-7-7z"></path>
					    <path style="fill:#EBE8DE" d="M18 10h-12c.331 1.465 2.827 4 6.001 4 3.134 0 5.666-2.521 5.999-4zm-9.5-6c-.828 0-1.5.671-1.5 1.5s.672 1.5 1.5 1.5 1.5-.671 1.5-1.5-.672-1.5-1.5-1.5zm7 0c-.828 0-1.5.671-1.5 1.5s.672 1.5 1.5 1.5 1.5-.671 1.5-1.5-.672-1.5-1.5-1.5z"></path>
				    </svg>
	    			<svg class = "smileys" style = "margin-bottom:-10px; fill:blue;" fill="#000000" viewBox="0 0 24 24" width="32" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" height="32" style="/*! position: relative; *//*! top: 20px; */margin-bottom: -10px;">
					    <path d="M12 2C8.14 2 5 5.14 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.86-3.14-7-7-7z"></path>
					    <path style="fill:#EBE8DE" d="M17.507 9.941c-1.512 1.195-3.174 1.931-5.506 1.931-2.334 0-3.996-.736-5.508-1.931l-.493.493c1.127 1.72 3.2 3.566 6.001 3.566 2.8 0 4.872-1.846 5.999-3.566l-.493-.493zm-9.007-5.941c-.828 0-1.5.671-1.5 1.5s.672 1.5 1.5 1.5 1.5-.671 1.5-1.5-.672-1.5-1.5-1.5zm7 0c-.828 0-1.5.671-1.5 1.5s.672 1.5 1.5 1.5 1.5-.671 1.5-1.5-.672-1.5-1.5-1.5z"></path>
				    </svg>
	    			<svg class = "smileys" style = "margin-bottom:-10px; fill:#ff8005;" fill="#000000" viewBox="0 0 24 24" width="32" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" height="32" style="/*! position: relative; *//*! top: 20px; */margin-bottom: -10px;">
					    <path d="M12 2C8.14 2 5 5.14 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.86-3.14-7-7-7z"></path>
					    <path style="fill:#EBE8DE" d="M16 14h-8v-2h8v2zm-7.5-9c-.828 0-1.5.671-1.5 1.5s.672 1.5 1.5 1.5 1.5-.671 1.5-1.5-.672-1.5-1.5-1.5zm7 0c-.828 0-1.5.671-1.5 1.5s.672 1.5 1.5 1.5 1.5-.671 1.5-1.5-.672-1.5-1.5-1.5z"></path>
				    </svg>
	    			<svg class = "smileys" style = "margin-bottom:-10px; fill:#ff8005;" fill="#000000" viewBox="0 0 24 24" width="32" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" height="32" style="/*! position: relative; *//*! top: 20px; */margin-bottom: -10px;">
					    <path d="M12 2C8.14 2 5 5.14 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.86-3.14-7-7-7z"></path>
					    <path style="fill:#EBE8DE" d="M12 10c-2.332 0-4.145 1.636-5.093 2.797l.471.58c1.286-.819 2.732-1.308 4.622-1.308s3.336.489 4.622 1.308l.471-.58c-.948-1.161-2.761-2.797-5.093-2.797zm-3.501-6c-.828 0-1.5.671-1.5 1.5s.672 1.5 1.5 1.5 1.5-.671 1.5-1.5-.672-1.5-1.5-1.5zm7 0c-.828 0-1.5.671-1.5 1.5s.672 1.5 1.5 1.5 1.5-.671 1.5-1.5-.672-1.5-1.5-1.5z"></path>
				    </svg>
	    			<a id = "studentInfoText"></a>
    			</p>
    		</div>

    	</div>
 
     	<div id = "menu">
    		<div id = "screenSelectorSpace"></div>
			<div id = "screenSelectorArrows">
				<img alt="Loading" src="Ressources/sticker-fleche.png">
				<img alt="Loading" src="Ressources/sticker-fleche.png">
			</div>
			<div style = "display:none"id = "dataSelection">
				<div onclick="launchPresentation()">
					<span>Voir la d�monstration</span>
				</div>
				<div onclick="callDemoJSON(useJSON)">
					<span>Donn�es de d�monstration</span>
				</div>
				<div>
					<span>Essayez avec vos donn�es</span>
					<input type="file" name="xlfile" id="xlf" accept=".xls" />
				</div>				
				<div onclick="callSavedJSON(useJSON)">
					<span>Voir les derni�res donn�es</span>
				</div>
			</div>
			
			<div id = "parameters">
				<div class = "optionsList">
					<span>Param�tres du tuteur</span>
		    		<div>
			    		<a>Seuil des notes</a>
			    		<input oninput = "stopMoreOf()" id="moreOf" step = "0.1" value = "0.0" type = "number" min = "0" max = "1">
		    		</div>
		    		<div>
			    		<a style = "width:50%;">Visualisation d'une cohorte</a>
			    		<select onchange = "changeCohorte()" id = "cohorteSelect">
							<option value = "0">Tous les �l�ves</option>
						</select>
			    	</div>				
			    </div>
				<div id = "newViewSelection" style = "display:none">
					<label title = "En cumul�e un �l�ve est dans autant de bulles que d'exercices qu'il a effectu�." class = "radioParameterLabel">Progressions Cumul�es<input onchange = "changeModeVisualisation()" class="shape" name="visualisationMode" value="0" type="radio"></label>
					<label title = "En r�partie un �l�ve est pr�sent dans la bulle qui repr�sente le dernier exercice qu'il a effectu� par type d'exercices." class = "radioParameterLabel">Progressions R�parties<input onchange = "changeModeVisualisation()" class="shape" name="visualisationMode" value="1" type="radio"></label>
				</div>
				
				<div id = "options">
		    		<div class="optionsList">
			    		<div style = "display:none">
			    			<a style = "width:50%;">Recherche par id/pseudo/email</a>
			    			<input oninput = "stopTimerEmailArea()" onkeypress = "onEnterTimer(event)" style = "background-color:#00f6 ; width: 56px; top: calc(50% - 13px);" id = "infoContains">
			    		</div>
		    		</div>
		    	</div>
		    </div>
		    
		    <div id = "studentLegend" class = "notRequired">
		    	<svg class = "smileysLegend" style = "fill:blue;" fill="#000000" viewBox="0 0 24 24" width="32" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" height="32" style="/*! position: relative; *//*! top: 20px; */margin-bottom: -10px;">
				    <path d="M12 2C8.14 2 5 5.14 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.86-3.14-7-7-7z"></path>
				    <path style="fill:#EBE8DE" d="M18 10h-12c.331 1.465 2.827 4 6.001 4 3.134 0 5.666-2.521 5.999-4zm-9.5-6c-.828 0-1.5.671-1.5 1.5s.672 1.5 1.5 1.5 1.5-.671 1.5-1.5-.672-1.5-1.5-1.5zm7 0c-.828 0-1.5.671-1.5 1.5s.672 1.5 1.5 1.5 1.5-.671 1.5-1.5-.672-1.5-1.5-1.5z"></path>
				</svg>
				<a>0.75&rarr;1&nbsp;&nbsp;&nbsp;</a>
	    		<svg class = "smileysLegend" style = "fill:blue;" fill="#000000" viewBox="0 0 24 24" width="32" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" height="32" style="/*! position: relative; *//*! top: 20px; */margin-bottom: -10px;">
				    <path d="M12 2C8.14 2 5 5.14 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.86-3.14-7-7-7z"></path>
				    <path style="fill:#EBE8DE" d="M17.507 9.941c-1.512 1.195-3.174 1.931-5.506 1.931-2.334 0-3.996-.736-5.508-1.931l-.493.493c1.127 1.72 3.2 3.566 6.001 3.566 2.8 0 4.872-1.846 5.999-3.566l-.493-.493zm-9.007-5.941c-.828 0-1.5.671-1.5 1.5s.672 1.5 1.5 1.5 1.5-.671 1.5-1.5-.672-1.5-1.5-1.5zm7 0c-.828 0-1.5.671-1.5 1.5s.672 1.5 1.5 1.5 1.5-.671 1.5-1.5-.672-1.5-1.5-1.5z"></path>
				</svg>
				<a>0.5&nbsp;&rarr;0.75</a>
	    		<svg class = "smileysLegend" style = "fill:#ff8005;" fill="#000000" viewBox="0 0 24 24" width="32" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" height="32" style="/*! position: relative; *//*! top: 20px; */margin-bottom: -10px;">
				    <path d="M12 2C8.14 2 5 5.14 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.86-3.14-7-7-7z"></path>
				    <path style="fill:#EBE8DE" d="M16 14h-8v-2h8v2zm-7.5-9c-.828 0-1.5.671-1.5 1.5s.672 1.5 1.5 1.5 1.5-.671 1.5-1.5-.672-1.5-1.5-1.5zm7 0c-.828 0-1.5.671-1.5 1.5s.672 1.5 1.5 1.5 1.5-.671 1.5-1.5-.672-1.5-1.5-1.5z"></path>
				</svg>
				<a>0.25&rarr;0.5</a>
	    		<svg class = "smileysLegend" style = "fill:#ff8005;" fill="#000000" viewBox="0 0 24 24" width="32" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" height="32" style="/*! position: relative; *//*! top: 20px; */margin-bottom: -10px;">
					    <path d="M12 2C8.14 2 5 5.14 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.86-3.14-7-7-7z"></path>
					    <path style="fill:#EBE8DE" d="M12 10c-2.332 0-4.145 1.636-5.093 2.797l.471.58c1.286-.819 2.732-1.308 4.622-1.308s3.336.489 4.622 1.308l.471-.58c-.948-1.161-2.761-2.797-5.093-2.797zm-3.501-6c-.828 0-1.5.671-1.5 1.5s.672 1.5 1.5 1.5 1.5-.671 1.5-1.5-.672-1.5-1.5-1.5zm7 0c-.828 0-1.5.671-1.5 1.5s.672 1.5 1.5 1.5 1.5-.671 1.5-1.5-.672-1.5-1.5-1.5z"></path>
				</svg>
				<a>0&nbsp;&nbsp;&nbsp;&nbsp;&rarr;0.25</a>
				
				<svg width="32" height="32" style = "margin-left: 45px;margin-bottom:7px;margin-right:5px;">
					<g transform="translate(16,16)">
						<g class="arc">
							<path d="M9.552245033349357e-16,-15.600000000000001A15.600000000000001,15.600000000000001 0 0,1 13.509996299037246,7.799999999999998L0,0Z" style="stroke: black; fill: rgb(255, 128, 5);"></path>
						</g>
						<g class="arc">
							<path d="M13.509996299037246,7.799999999999998A15.600000000000001,15.600000000000001 0 0,1 -13.509996299037242,7.800000000000006L0,0Z" style="stroke: black; fill: rgb(255, 255, 255);"></path>
						</g>
						<g class="arc">
							<path d="M-13.509996299037242,7.800000000000006A15.600000000000001,15.600000000000001 0 0,1 -2.8656735100048066e-15,-15.600000000000001L0,0Z" style="stroke: black; fill: rgb(0, 0, 255);"></path>
						</g>
					</g>
				</svg>
				<div style = "line-height:5px;width: 100px;display: inline-block;font-size: 14px;font-weight:bold">
					<p style = "color:blue">note >= 0.5</p>
					<p style = "color:rgb(255, 128, 5)">note < 0.5</p>
					<p style = "color:white">sans note</p>
				</div>
		    </div>
		    
		    <div id = "otherOption" class = "optionsList notRequired">
		    	<button onclick="displayOptions();" id = "optionViewer">Autres options</button>
		    					    		    
		    	<div id = "realOptions" class="notRequired">
		    
					<div id = "viewModeOption" style = "">
						<label class = "radioParameterLabel">Progression Courante<input onchange = "changeModeVisualisation()" class="shape" name="visualisationModeOption" value="2" type="radio" checked="true"></label>
						<label class = "radioParameterLabel doubleLineLabel">Progression selon la semaine d'inscription<input onchange = "changeModeVisualisation()" class="shape" name="visualisationModeOption" value="0" type="radio"></label>
					</div>
					<hr style="width: 60%; margin-bottom: 15px;">
					<div id = "navigation" style = "display:none">
				    	<svg onclick="previousWeek()" fill="#000000" height="48" viewBox="0 0 24 24" width="48" xmlns="http://www.w3.org/2000/svg">
							<path d="M6 6h2v12H6zm3.5 6l8.5 6V6z"></path>
							<path d="M0 0h24v24H0z" fill="none"></path>
						</svg>
				        <svg onclick = "startPlayWeek()" id = "play/pause" fill="#000000" height="48" viewBox="0 0 24 24" width="48" xmlns="http://www.w3.org/2000/svg">
							<path d="M8 5v14l11-7z"></path>
							<path d="M0 0h24v24H0z" fill="none"></path>
						</svg>
						<svg onclick="nextWeek()" fill="#000000" height="48" viewBox="0 0 24 24" width="48" xmlns="http://www.w3.org/2000/svg">
						    <path d="M6 18l8.5-6L6 6v12zM16 6v12h2V6h-2z"></path>
						    <path d="M0 0h24v24H0z" fill="none"></path>
						</svg>
						<input title="Modifie la derni�re collecte voulue" id="slideBar" min="0" max="11" value="11" step="1" type="range">	
						<span id = "slideBarDisplay">S12</span>    	
			    	</div>
			    		<div>
							<label class = "radioParameterLabel doubleLineLabel">Classement par semaine FUN<input onchange = "prepareAll()" class="shape" name="weekModeOption" value="1" type="radio" checked="true"></label>
							<label class = "radioParameterLabel doubleLineLabel">Classement par type d'exercice<input onchange = "prepareAll()" class="shape" name="weekModeOption" value="0" type="radio"></label>
						</div>
						<hr style="width: 60%; margin-bottom: 15px;">
						
						<!-- 
						<div>
			    			<a>Classement par semaine FUN</a>
			    			<input id = "weekMode" type = "checkbox" checked = "true">
			    		</div>	 -->
						<div style = "display:none">
			    			<a>Taille/Type Travaux</a>
			    			<input id = "maxCategorieToggle" type = "checkbox">
			    		</div>						
			    		<div>
			    			<a>Afficher les nombres</a>
			    			<input onclick = "circleTextBackgroundUpdate()" id = "isDisplayNumber" type = "checkbox" checked="true">
			    		</div>			    		
			    		<div class="notRequired">
			    			<a>Agrandissement lors du survol</a>
			    			<input id = "isZooming" type = "checkbox">
			    		</div>					    		
			    		<div class="notRequired">
			    			<a>Cohorte seulement</a>
			    			<input onclick = "actualisation(3, 0)" id = "onlyDisplaySelectedCohorte" type = "checkbox" checked="true">
			    		</div>						    		
			    		<div style = "display:none">
			    			<a>Croix ou cercle???</a>
			    			<input onclick = "actualisation(3, 0)" id = "crossCircle" type = "checkbox" checked="true">
			    		</div>			    
			    		<div style = "display:none">
			    			<a>TEST : SIZE EN SURFACE</a>
			    			<input onclick = "actualisation()" id = "sizeMethod" type = "checkbox" checked="true">
			    		</div>			    		
			    		<div style = "display:none">
			    			<a>Taille logarithmique</a>
			    			<input onclick = "actualisation()" id = "logDisplay" type = "checkbox">
			    	</div>
				</div>
		    </div>

			<div id="noParameters">
			    <button id="download">Sauvegarder en image</button>
			</div>
			<div id = "screenSelectorMenu">
				<div>
			    	<a>Afficher les bulles d'aides</a>
			    	<input onclick = "displayToolTip();" id = "tooltipDisplay" type = "checkbox">
				</div>
			</div>
	    	<div id = "minimapContainer" style = "position:initial; margin-left:40px;">
	    	    <div style = "display:none" id = "minimapSizeDiv">
					<i class="fa fa-arrows"></i>
	    			<input title="Changer la taille de la minimap" id="minimapSize" min="0" max="10" value="10" step="1" oninput="minimapSizeChanger()" type="range">	
	    		</div>
	    		<div id = "minimap">
					<div id = "cadre"></div>
					<div id = "minimapContent"></div>
	    		</div>
	    	</div>
    	</div>
    	<!-- 
    	<div id = "minimapContainer">
    	    <div id = "minimapSizeDiv">
				<i class="fa fa-arrows"></i>
    			<input title="Changer la taille de la minimap" id="minimapSize" min="0" max="10" value="10" step="1" oninput="minimapSizeChanger()" type="range">	
    		</div>
    		<div id = "minimap">
				<div id = "cadre"></div>
				<div id = "minimapContent"></div>
    		</div>
    	</div>-->
		<div id = "screenSelectorArea">
			<div id = "screenSelectorCover" onclick="swapScreenMode(false)"></div>
			<div class = "tooltips tooltipsbottom" onclick="selectScreen(0)">
				<div>
					<a>title</a>
				</div>
				<span>test</span>
				<img alt="Loading" src="Ressources/screen0.png">
			</div>
			<div class = "tooltips tooltipsbottom" onclick="selectScreen(1)">
				<div>
					<a>title</a>
				</div>
				<span>test</span>
				<img alt="Loading" src="Ressources/screen1.png">
			</div>
			<div class = "tooltips tooltipsbottom" onclick="selectScreen(2)">
				<div>
					<a>title</a>
				</div>				
				<span>test</span>
				<img alt="Loading" src="Ressources/screen2.png">
			</div>
			<div class = "tooltips tooltipsbottom" onclick="selectScreen(3)">
				<div>
					<a>title</a>
				</div>				
				<span>test</span>
				<img alt="Loading" src="Ressources/screen3.png">
			</div>
			<div class = "tooltips tooltipsbottom" onclick="selectScreen(4)">
				<div>
					<a>title</a>
				</div>				
				<span>test</span>
				<img alt="Loading" src="Ressources/screen4.png">
			</div>
			<div class = "tooltips tooltipsbottom" onclick="selectScreen(5)">
				<div>
					<a>title</a>
				</div>				
				<span>test</span>
				<img alt="Loading" src="Ressources/screen5.png" onclick="selectScreen(5)">
			</div>
			<div class = "tooltips tooltipstop" onclick="selectScreen(6)">
				<div>
					<a>title</a>
				</div>				
				<span>test</span>
				<img alt="Loading" src="Ressources/screen6.png">
			</div>
			<div class = "tooltips tooltipstop" onclick="selectScreen(7)">
				<div>
					<a>title</a>
				</div>				
				<span>test</span>
				<img alt="Loading" src="Ressources/screen7.png">
			</div>
			<div class = "tooltips tooltipstop" onclick="selectScreen(8)">
				<div>
					<a>title</a>
				</div>		
				<span>test</span>
				<img alt="" src="Ressources/screen8.png">
			</div>
			<div class = "tooltips tooltipstop" onclick="selectScreen(9)">
				<div>
					<a>title</a>
				</div>
				<span>test</span>
				<img alt="" src="Ressources/screen9.png">
			</div>
		</div>
    	
    	<div id = "waitingPanel">
    		<a>Traitement en cours</a>
    	</div>
    	
        <script src="Scripts/cohortes.js"></script>
        <script src="Libraries/saveSvgAsPng.js"></script>
        <script src="Libraries/d3.min.js"></script>
        <script src="Libraries/fisheye.js"></script>
        <script src="Scripts/Class/note.js"></script>
        <script src="Scripts/Class/eleve.js"></script>
        <script src="Scripts/Class/bulle.js"></script>
        <script src="Scripts/Class/bulleData.js"></script>
        <script src="Scripts/Class/category.js"></script>
        <script src="Scripts/bulleGenerator.js"></script>
        <script src="Scripts/D3/d3.tip.js"></script>
        <script src="Libraries/FileSaver.min.js"></script>

        <script src="Scripts/D3/d3PieChart.js"></script>
        <script src="Scripts/D3/d3Generation.js"></script>
        <script src="Scripts/dataGenerator.js"></script>
        <script src="Scripts/ajax.js"></script>
        <script src="Scripts/presentationAndCookies.js"></script>
        <script src="Scripts/index.js"></script>
        <script src="Scripts/screenSelector.js"></script>
        
    </body>
</html>
