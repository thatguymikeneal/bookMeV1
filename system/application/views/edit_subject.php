<div class="row-fluid">
	<div class="span12">
		<div class="row-fluid">
			
			<div class="span1">
				&nbsp;
			</div>
			
			<div class="span10 well">
			<center>
				<div class="alert alert-info"><h3>Edit subject - <?php echo $subject_name; ?></h3></div>
			</center>
			
				<form class="form-horizontal" method="post" action="../update_subject">
        			<fieldset>
          				<div class="control-group">
            				<label class="control-label" for="input01">Subject name</label>
            				<div class="controls">
              					<input type="text" class="input-xlarge" id="input01" value="<?php echo $subject_name;?>" name="subject_name">
              					<p class="help-block"><i class="icon-question-sign"rel="tooltip" title="The name of the subject which will show up in the booking and add booking view"></i></p>
            				</div>
            				<br>
            				<div class="control-group">
            					<label class="control-label" for="bookable">Use subject shading</label>
            					<div class="controls">
              						<select name= "subject_use_shading" id="subject_use_shading">
									<?php if ($subject_use_shading == 1)
                					{ ?>
                					<option value="1">Yes</option>
                					<option value="0">No</option>
                					<?php 
                					} else 
                					{
                					?>
                					<option value="0">No</option>
                					<option value="1">Yes</option>
                					<?php 
                					}?>
	               				    </select>
					            	<p class="help-block"><i class="icon-question-sign"rel="tooltip" title="If yes, bookings made under this subject will have the background shaded with the colour chosen"></i></p>
            					</div>
          					</div>
            				<label class="control-label" for="input02">Subject shading colour</label>
            				<div class="controls">
              					<input type="text" class="input-xlarge color" id="subject_colour" value="<?php echo $subject_colour;?>" name="subject_colour">
              				</div>
              				<input type="hidden" name="subject_id" value="<?php echo $subject_id;?>">
							<div class="form-actions">
            					<button type="submit" class="btn btn-primary">Update subject</button>
            					<a class="btn btn-info" href="../subject_settings">back</a>
            				</div>
            			</div>
        			</fieldset>
      			</form>
			</div>
			
			<script type="text/javascript"> 
  				$(document).ready(function () { 
    			$("[rel=tooltip]").tooltip(); 
  				}); 
			</script> 
			
			<div class="span1">
				&nbsp;
			</div>

		</div>
	</div>
</div>
