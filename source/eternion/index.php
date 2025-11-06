<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- saved from url=(0031)http://eternion-wow-reborn.com/ -->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-us" lang="en-us" data-url="http://eternion-wow-reborn.com/"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="icon" href="favicon.ico" type="image/ico" sizes="16x16">
		<title>MY WoW</title>
		<link href="style.css" rel="stylesheet" type="text/css" media="screen">
		<script type="text/javascript" src="js/store.js"></script>
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/link.js"></script>
		<script type="text/javascript" src="js/jquery.dhslider.js"></script>
		<script type="text/javascript" src="js/interface.js"></script>
		<script type="text/javascript" src="js/power.js"></script><script src=".js/basic.js"></script>
		<script type="text/javascript" src="js/shout.js"></script><!-- [END ShoutBox JS Include] {/module.shoutbox.js} [Important Don't Remove] -->
		<script type="text/javascript">
		        $(document).ready(function () {
		            $(".slider").DHslider({
		                speed: 1000,
		                auto: {
		                    speed: 5000,
		                    active: true
		                },
			    controls: {
				active: true,
				action: {
				    type: "fade",
				    speed: 1000,
				    fixed: true
				},
				numbers: false,
				callback: function () {}
			    },
		            });
		        });
		</script>
	<style data-cbh-dummy="dummy" type="text/css">*[data-cbh-blocked]{display:none !important;}
</style><style data-cbh-dummy="dummy" type="text/css"></style><script type="text/javascript" src="./Deathwing WoW_files/data=item-scaling" charset="utf8"></script><script type="text/javascript" src="./Deathwing WoW_files/data=spell-scaling" charset="utf8"></script></head>
	<body>
		<?php 
			include("connect.php");
		?>
		<!-- LOGO -->
		<div id="logo"><a href="#" style="opacity: 1;"><img src="images/logo.png"></a></div><br>
		<!-- MENU -->
		<div id="menu">
			<a href="#">Home</a>
			<a href="#">Vote</a>
			<a href="#">Armory</a>
			<a href="#">Connect</a>
			<!-- a href="http://eternion-wow-reborn.com/?page=connect">Connect</a-->
			
			<!-- a href="http://eternion-wow-reborn.com/?page=vote">Vote</a-->
			<!-- a href="http://eternion-wow-reborn.com/?page=donate">Donate</a-->
			<!-- a href="http://eternion-wow-reborn.com/?page=changelog">Changelog</a-->
		</div>
		<!-- SLIDER -->
		<div id="slider">
			<div class="slider" style="display: block;">
				<div class="elements" style="width: 4400px; left: -291.405px;">
					<img src="images/slider-1.jpg" alt="" border="0">
					<img src="images/slider-2.jpg" alt="" border="0">
					<img src="images/slider-3.jpg" alt="" border="0">
					<img src="images/slider-4.jpg" alt="" border="0">
					<img src="images/slider-5.jpg" alt="" border="0">
					<img src="images/slider-6.jpg" alt="" border="0">
					<img src="images/slider-7.jpg" alt="" border="0">
					<img src="images/slider-8.jpg" alt="" border="0">
				</div>
				<div class="controls" style="margin-left: -60px; display: block;"><div class="control control-0" rel="0"></div><div class="control control-1 active" rel="1"></div><div class="control control-2" rel="2"></div><div class="control control-3" rel="3"></div><div class="control control-4" rel="4"></div><div class="control control-5" rel="5"></div><div class="control control-6" rel="6"></div><div class="control control-7" rel="7"></div></div>
			</div>
		</div>
		<!-- GLOBAL CONTAINER -->
		<div id="global">
			<!-- LEFT CONTAINER -->
			<div id="left">
				<!-- MEMBERSHIP & ACCOUNT INFOS -->
				<div class="panel">
					<div class="title">Account Details</div>
					<div class="body">
					
						
						<p>Welcome, <a href="#">KEM008</a> <span style="float:right"><a class="button" href="#">Logout</a></span></p>
						<hr>
						<p>New Messages: <font color="#4e6a1b">0</font><span style="float:right"><a class="button" href="#">inbox</a>&nbsp;<a class="button" href="#">new</a></span></p>
						<hr>
						<p>Site Rank : <span>Player</span></p>
						<p>Banned: No</p>
						<p>You have <font color="#4e6a1b">6</font> vote points to spend</p>
						<p>You have <font color="#4e6a1b">30</font> donation points to spend</p>
						
					
					
						<table style="width:100%;margin:0 auto">
							<tbody><tr>
								<td><input type="button" value="Account" onclick="window.location=&#39;./?page=account&#39;"></td>
								<td><input type="button" value="Store" onclick="window.location=&#39;./?page=store_select&#39;"></td>
							</tr>
							<tr>
								<td><input type="button" value="Donate" onclick="window.location=&#39;./?page=donate&#39;"></td>
								<td><input type="button" value="Vote" onclick="window.location=&#39;./?page=vote&#39;"></td>
							</tr>
						</tbody></table>
					
					</div>
					<div class="bottom"></div>
				</div>
				<!-- MEMBERSHIP & ACCOUNT INFOS -->
				<div class="panel">
					<div class="title">Navigation</div>
					<div class="body">
						<table style="width:100%;margin:0 auto">
							<tbody><tr><td><input type="button" value="News &amp; Announcement" onclick="window.location=&#39;./&#39;"></td></tr>
							<tr><td><input type="button" value="Our Discord" onclick="window.location=&#39;https://discord.gg/e5hY9Bd&#39;"></td></tr>
							<tr><td><input type="button" value="Our Staff" onclick="window.location=&#39;./?page=team&#39;"></td></tr>
							<tr><td><input type="button" value="Deathwing WoW Armory" onclick="window.location=&#39;./armory&#39;"></td></tr>
							<tr><td><input type="button" value="Custom Prices" onclick="window.location=&#39;./?page=customprices&#39;"></td></tr>
						</tbody></table>
					</div>
					<div class="bottom"></div>
				</div>
			</div>
			<!-- MIDDLE CONTAINER -->
			<div id="middle">
				<div class="body-title">News &amp; Announcements</div>
<div class="body-body">
<!-- News/Page System -->

<!-- -->
	<?php include"news.php"; ?>
<!-- -->

<!--  -->
</div>
<div class="body-bottom"></div>
			</div>
			<!-- RIGHT CONTAINIER -->
			<div id="right">
				<!-- PENEL -->
				<div class="panel">
					<div class="title">Realm Status</div>
					<div class="body">
						<!--Begin Realms-->
						
							<table style="width:100%;margin:0 auto;">
								<tbody><tr>
									<td style="color:#4e6a1b"><a href="http://eternion-wow-reborn.com/?page=realm&amp;id=1">DeathWing WoW</a></td>
									<td style="background:#000;border:1px solid #2a1306;padding:3px 5px;">7 Players <span style="float:right">Online</span></td>
								</tr>
								<tr>
									<td style="text-align:center;font-size:11px;">Horde : <span>3</span></td>
									<td style="text-align:center;font-size:11px;">Alliance : <span>4</span></td>
								</tr>
								<tr>
									<th colspan="2"><hr></th>
								</tr>
							</tbody></table>
						
						<!--End Realms-->
						<p style="text-align:center;font-size:12px;">Set realmlist <span>deathwing-wow.com</span></p>
					</div>
					<div class="bottom"></div>
				</div>
				
				<!-- SHOUTBOX -->
				<div class="panel" id="shout">
					<div class="title">SHOUTBOX</div>
					<div class="body">
						<table style="width:100%;margin:0 auto;">
							<form action="http://eternion-wow-reborn.com/#sbox" method="POST" name="sbox" id="sbox"></form>
							<tbody><tr><td><textarea class="shout" name="sbody"></textarea></td></tr>
							<tr><td><input type="submit" name="shout-post" value="Shout"></td></tr>
							<tr><td>
							<!--Shouts-->
							<!-- Shoutbox  -->
								<table style="border:1px solid #101e1c;width:100%;font-size:12px;padding:0 5px;border-left:none;"><tbody><tr>
									<td align="left"><font color="#90cf5d">Ee44</font></td>
									<td align="right" style="font-size:10px;font-weight:bold;">03-20, 9:02</td>
								</tr></tbody></table>
								<table style="border:1px solid #101e1c;width:100%;font-size:12px;padding:0 5px;margin-bottom:10px;border-top:none;border-right:none;"><tbody><tr>
									<td><font style="font-size:12px;"><span>cant install the game from launcher is crash can someone give my a torrent link of wow 4.0.6 plz ty</span></font></td>
								</tr></tbody></table>
							<!--  -->

							<!--  -->
							<center><a href="#">Previous</a> - <a href="#">Next</a></center>
							<!--End Shouts-->
							</td></tr>
							</tbody></table>
					</div>
					<div class="bottom"></div>
				</div>
			</div>
		</div><br><br>
		<!-- FOOTER -->
		<div id="footer">
			<a href="#">Home</a> | 
			<p>This website and its content was created for MY WoW™ © MY WoW™ 2018.</p>
			<p>Design and coding by : <a href="http://bit.ly/iTemplates" target="_blank">iTemplat.es™</a></p>
		</div>
	

<!--Powered By Azer CMS V3.0. &copy; Copyright Azer-cms.com. All Rights Reserved.-->
<!-- Page Generated In 0.091403961181641 Seconds (ACMS V3.0) --></body></html>