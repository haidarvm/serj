<style>
.ganjil {
	background-color: #999999
}
</style>
<div id="header" align="center">
	<h1><?php echo $pageTitle;?></h1>
</div>
<table width="100%">
	<tr>
		<?php foreach($headers as $header) {?>
			<td><?php echo $header?></td>
		<?php }?>
	</tr>
<?php
foreach ($report as $row) {
	echo $row;
}
?>
</table>