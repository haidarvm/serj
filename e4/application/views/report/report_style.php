<div class="page-content">
	<div class="page-header">
		<h1><?php echo $pageTitle;?></h1>
	</div>
	<form action="<?php echo site_url()?>report/<?php echo $this->uri->segment(2)?>/pdf" id="pdf_report" target="_blank" method="POST" >
		<input type="hidden" name="begin" value="<?php echo isset($begin) ? $begin : ''?>">
		<input type="hidden" name="end" value="<?php echo isset($end) ? $end : ''?>">
		<input type="hidden" name="vehicle" value="<?php echo isset($vehicle) ? $vehicle : ''?>">
		<input type="hidden" name="pdf" value="1">
	<h4>View PDF : <img onclick="pdf_report.submit()" src="<?php base_url()?>/assets/img/pdf.png"
		style="cursor: pointer"></h4>
	</form>
	<div class="row">
		<div class="col-xs-12">
			<div class="table-header">Results for "Latest Vehicle Fleet Status"</div>
			<div class="table-responsive">
				<table id="sample-table-2"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<?php foreach($headers as $header) {?>
							<th><?php echo $header?></th>
							<?php } ?>
						</tr>
					</thead>
					<tbody>
						<?php  foreach ($report as $row) { ?>
							<?php echo $row."\r\n"?>
						<?php }?>
					</tbody>
				</table>
			</div>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
</div>
<!-- /.page-content -->