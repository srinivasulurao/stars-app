<?php
echo View::make('billing.header',array('title'=>$title));
?>

<div class='container profile-container'>
    <div class='col-md-2 sidebar'>
        <?php
        echo View::make("billing.sidebar",array('active_link'=>'Pricing'))->render();
        ?>
    </div>
    <!-- Entire content to be shown here -->
    <div class='col-md-10'>
        <?php if(Session::has('system_message')):
            $tick=(Session::get('system_message_type')=='success')?"<div class='system-message-success-tick'>&#x2713;</div>":"<div class='system-message-tick'>&#x2718;</div>";
            ?>
            <div class="system-message bg-<?php echo Session::get('system_message_type'); ?>"><?php echo $tick.Session::get('system_message'); ?></div>
            <?php
            Session::forget('system_message');
            Session::forget('system_message_type');
        endif;

        //debug($accountDetail);
        ?>
        <h1>Set Pricing Details</h1>
        <form method="post" action="<?php echo site_url("/billing-admin/save-pricing"); ?>"  style="width:50%" enctype="multipart/form-data">
            <?php echo Form::label('District', 'District'); ?>
            <?php echo Form::text('district_name', $result->district_name,array('class'=>"form-control","required"=>"required")); ?>

            <?php echo Form::label('State', 'State'); ?>
            <?php echo Form::text('state', $result->state,array('class'=>"form-control","required"=>"required")); ?>

            <?php echo Form::label('Pricing', 'Pricing'); ?>
            <table class="bg bg-warning" style="border-spacing: 10px;border-collapse: separate;">
                <tr><th>School</th><th>Enrollment</th><th>Discount (In %)</th><th>Price (In Dollars)</th></tr>
                <?php
                foreach($result->pricing as $pricing):
                ?>
                    <tr>
                        <td><?php echo schoolName($pricing->school_id); ?></td>
                        <td><?php echo Form::label('Enrollment', 'Enrollment'); ?>
                            <?php echo Form::text("pricing[$pricing->pricing_id][enrollment]", $pricing->enrollment,array('class'=>"form-control","required"=>"required")); ?></td>
                        <td><?php echo Form::label('Discount', 'Discount'); ?>
                            <?php echo Form::text("pricing[$pricing->pricing_id][discount]", $pricing->discount,array('class'=>"form-control","required"=>"required")); ?></td>
                        <td><?php echo Form::label('Price', 'Price'); ?>
                            <?php echo Form::text("pricing[$pricing->pricing_id][price]", $pricing->price,array('class'=>"form-control","required"=>"required")); ?></td>

                    </tr>

                <?php
                endforeach;
                ?>
            </table>


            <?php echo Form::hidden('district_id',$district_id); ?>
            <?php echo Form::token(); ?><br>
            <?php echo Form::submit('Submit',array('class'=>"btn btn-success","required"=>"required")); ?>

        </form>

    </div>


</div> <!-- Container ends -->

<?php
echo view('profile.footer');
?>
