<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>MBS-Foundation Smart Learning.</title>

    <!-- Bootstrap -->
	<link href="<?php echo base_url()?>assets/css/bootstrap.css" rel="stylesheet" type="text/css"/>
	<link href="<?php echo base_url()?>assets/css/style.css" rel="stylesheet" type="text/css"/>
	<link href="<?php echo base_url();?>assets/css/datepicker.css" rel="stylesheet" type="text/css" />
	<link href="<?php echo base_url()?>assets/css/animate.css" rel="stylesheet" type="text/css" />
	<link href="<?php echo base_url()?>assets/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
	
	
  </head>
  <body>
	<nav class="navbar navbar-default navbar-static-top wow pulse">
      <div class="container">
        <div class="navbar-header">
          <button aria-controls="navbar" aria-expanded="false" data-target="#navbar" data-toggle="collapse" class="navbar-toggle collapsed" type="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a href="<?php echo site_url()?>" class="navbar-brand">
          <img src="<?php echo base_url()?>assets/img/logo.jpg" alt="" width="45" height="45" border="0" /></a>
        </div>
        <div class="navbar-collapse collapse" id="navbar">
          <ul class="nav navbar-nav">
            <li class="active"><a href="<?php echo site_url()?>">Home</a></li>
            <li><a href="#bjee">BJEE</a></li>
            <li><a href="#serbuk">Serbuk</a></li>
            <li><a href="#tentang">Tentang Kami</a></li>
            <li><a href="#kontak">Kontak</a></li>
            <!--<li class="dropdown">
              <a aria-expanded="false" aria-haspopup="true" role="button" data-toggle="dropdown" class="dropdown-toggle" href="#">Dropdown <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li class="divider" role="separator"></li>
                <li class="dropdown-header">Nav header</li>
                <li><a href="#">Separated link</a></li>
                <li><a href="#">One more separated link</a></li>
              </ul>
            </li>-->
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <!--<li class="active"><a href="#">Fixed top</a></li>
            <li><a href="#">Fixed top</a></li>-->
            <li><a href="<?php echo site_url()?>masuk" class="btn btn-default navbar-btn">Masuk</a></li>
            <li><a href="<?php echo site_url()?>daftar" class="btn btn-success navbar-btn">Daftar</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>