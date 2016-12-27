<?php
$sidebarLinks=array();
$sidebarLinks['Invoices']="/billing-admin/invoices";
$sidebarLinks["Pricing"]="/billing-admin/pricing";
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
