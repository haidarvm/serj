<style>
.genap {
	background-color: #a1a1a1;
}
.t-print{ 
	border-spacing: 0;
	border: 1px solid #a1a1a1;
}
.t-print th{
	font-weight: bold;
	padding-bottom: 10px;
	padding-top: 10px;
	font-size: 14px;
	background-color: #a1a1a1;
	line-height: 25px;
	border-spacing: 0;
}
.t-print td{
	line-height: 25px;
	border-spacing: 0;
	padding: 3px 10px;
	font-size: 13px;
	border: 1px solid #a1a1a1;
	
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