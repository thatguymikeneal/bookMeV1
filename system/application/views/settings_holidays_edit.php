<div class="row-fluid">
	<div class="span12">
		<div class="row-fluid">
			
			<div class="span1">
				&nbsp;
			</div>

			<div class="span10 well">
			<center>
				<div class="alert alert-info"><h3>Holiday</h3></div>
			</center>
			<h4>Click on a holiday to edit it</h4>
			<br>

				<?php foreach ($holidays as $holiday){ ?>


					<a class="btn span4" href="edit_holiday/<?php echo $holiday['holiday_id'];?>"> 
						<h5><?php echo $holiday['holiday_name'] ?></h5>
						
						<?php
							$temp_start_date= $holiday['holiday_start'];
 							$arr =explode("-",$temp_start_date);
 							$arr=array_reverse($arr);
 							$start_date =implode($arr,"-");
 						?>
						<h5>Start Date : <?php echo $start_date ?></h5>
						
						<?php
							$temp_end_date= $holiday['holiday_end'];
 							$arr =explode("-",$temp_end_date);
 							$arr=array_reverse($arr);
 							$end_date =implode($arr,"-");
 						?>
						<h5>End Date : <?php echo $end_date ?></h5>
						
						
						
						

					</a>
<div class="span10">&nbsp;</div>
				<?php }?>

				<div class="span10">
					<br>
					<a class="btn btn-primary" href="add_holiday"><i class="icon-plus"></i> Add a new holiday</a>

				</div>
				
			</div>
		</div>
			

			<div class="span1">
				&nbsp;
			</div>

		</div>
		
	</div>
</div>