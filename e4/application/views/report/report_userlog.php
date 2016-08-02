<style>
.t-print{ 
	border: 1px solid lightblue;
	border-spacing: 0;
}
.t-print th{
	font-weight: bold;
	padding-bottom: 10px;
	padding-top: 10px;
	font-size: 14px;
	background-color: lightblue;
	line-height: 25px;
}
.t-print td{
	line-height: 25px;
	padding: 3px 10px;
	font-size: 13px;
	border: 1px solid lightblue;
	
}
</style>
<div id="header">
	<h1><?php echo $pageTitle;?></h1>
</div>
<table width="100%" class="t-print">
	<tr>
		<?php foreach($headers as $header) {?>
			<th><?php echo $header?></th>
		<?php }?>
	</tr>
<?php
foreach ($report as $row) {
	echo $row;
}
?>
</table>