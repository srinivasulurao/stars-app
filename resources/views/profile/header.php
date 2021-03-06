<html itemscope itemtype="http://schema.org/QAPage">
<head>
<!-- CSS FILES-->
<?php
$bootstrapCdn="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5";
$localCdn=Request::root();//this is the root url
?>
<link rel="stylesheet" href="<?php echo $bootstrapCdn; ?>/css/bootstrap.min.css">
<link rel="stylesheet" href="<?php echo $localCdn; ?>/css/bootstrap.min.css">
<link rel="stylesheet" href="<?php echo $localCdn; ?>/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="<?php echo $localCdn; ?>/css/lunchbox.css">
<link type="text/css" href="http://mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.css" rel="stylesheet" />

<!-- JS FILES -->
<script src="<?php echo $localCdn; ?>/js/jquery.min.js"></script>
<script src="<?php echo $localCdn; ?>/js/bootstrap.min.js"></script>
<script src="<?php echo Request::root(); ?>/js/lunchbox.js"></script>
<script src="http://mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<link rel="shortcut icon" href="<?php echo $localCdn."/favicon.ico"; ?>">
<title><?php echo $title; ?></title>
</head>
<body class='canteen'>
<nav class='profile-nav'>
<span class="logoDiv logoDivExtra" style="display:none">
	<a href='<?php echo Request::root(); ?>'><img src='<?php echo $localCdn."/images/logo.png"; ?>' class='logo'>
		<h1>StarsApp</h1><br><i>The best cloud based solution for transportation with security.</i></a>
</span>
	<ul class='profile-top-right-menu'>
	<li> <a class='btn btn-danger' href="<?php echo $localCdn; ?>/system-admin/logout"><i class='glyphicon glyphicon-log-out'></i> Logout</a>
	</ul>
</nav>
