<?php
echo View::make('profile.header',array('title'=>$title));
?>

<div class='container profile-container'>
    <div class='col-md-2 sidebar'>
        <?php
        echo View::make("profile.sidebar",array('active_link'=>'Vehicles'))->render();
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
        <h1>View Seating Arrangement</h1>
        <?php
        $csv_file=base_path($result->seat_arrangement_csv);
        $seat_row=array();
        $seats=array();
        $row = 1;
        if (($handle = fopen($csv_file, "r")) !== FALSE) {
            $data = fgetcsv($handle, 1000, ",");
            $seat_row=$data;

            while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
                $num = count($data);
                $seats[]=array_combine($seat_row,$data);
                $row++;
            }
            fclose($handle);
            unset($seats[0]);
            //debug($seats);

        }
        ?>
        <table  style="width:50%;margin:auto;text-align: center !important;" class="table table-striped">
            <tr><th style="padding:10px;text-align: center !important;">Row #</th><th style="padding:10px;text-align: center !important;">Student Name</th></tr>
            <?php
            $row=1;
            $alphabets=array("","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S");
            foreach($seats as $key):
                //debug($key);

                unset($key['LEFT']);
                unset($key['RIGHT']);
                  $inner_row=1;
                    foreach($key as $k=>$v):
                        echo"<tr><td>{$alphabets[$row]}{$inner_row}</td><td>{$v}</td></tr>";
                        $inner_row++;
                    endforeach;
            $row++;
            endforeach;
            ?>
        </table>
<br><br>
    </div>


</div> <!-- Container ends -->

<?php
echo view('profile.footer');
?>
