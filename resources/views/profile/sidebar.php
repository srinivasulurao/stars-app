<?php
$sidebarLinks=array();
$sidebarLinks['Dashboard']="/system-admin/dashboard";
$sidebarLinks["Drivers"]="/system-admin/drivers";
$sidebarLinks["Incidents"]="/system-admin/incidents";
$sidebarLinks['Schools']="/system-admin/schools";
$sidebarLinks['Route Maps']="/system-admin/route-maps";
$sidebarLinks["Discipline Referrals"]="/system-admin/discipline-referrals";
$sidebarLinks['Vehicles']="/system-admin/vehicles";
$sidebarLinks['Maintenance']="/system-admin/maintenance-history";
$sidebarLinks['Seating Chart']="/system-admin/seating-charts";
$sidebarLinks['Trip Inspection Steps']="/system-admin/inspection-steps";
$sidebarLinks['Trip History']="/system-admin/trip-history";
$sidebarLinks["Forms"]="/system-admin/forms";
$sidebarLinks["Threshold Problems"]="/system-admin/threshold-problems";
$sidebarLinks["Route Types"]="/system-admin/route-types";
?>

<div class="backend-system-admin-comp-logo">
<?php
$root=Request::root();
echo "<img src='$root/images/logo.png' class='sys-logo'>";
?>
</div>

<ul class='list-group'>
<?php
foreach($sidebarLinks as $sl=>$sv):
	$slink=Request::root().$sv;
$active=($sl==$active_link)?"menu-active":"not-active";
echo"<li class='list-group-item $active'><a href='$slink'>$sl</a></li>";
endforeach;
?>
</ul>
