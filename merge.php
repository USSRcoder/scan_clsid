<?PHP
# php.exe merge.php > clsid_merged.txt
//no errors cheking;
//megre 2 files, remove duplicates;
$STRIP_PATHS = true;
$uuid_len = strlen('33564D57-0000-0010-8000-00AA00389B71');
$f1 = explode("\n",file_get_contents('clsid_ascii.txt'));
$f2 = explode("\n",file_get_contents('clsid_unicode.txt'));
$cache = [];

function mb_basefname($fn) {
	global $STRIP_PATHS;
	return ($STRIP_PATHS ? basename($fn) : $fn);
}
for ($i = 0; $i < count($f1); $i++) {
	$len = strlen($f1[$i]) - $uuid_len;
	$f_name = mb_basefname(substr($f1[$i],0, $len - 1));
	$f_uuid = substr($f1[$i], $len);
	if (!isset($cache[$f_name])) 
		$cache[$f_name] = [];
	$cache[$f_name][$f_uuid] = $f_uuid;
}
for ($i = 0; $i < count($f2); $i++) {
	$len = strlen($f2[$i]) - $uuid_len;
	$f_name = mb_basefname(substr($f2[$i],0, $len - 1));
	$f_uuid = substr($f2[$i], $len);
	if (!isset($cache[$f_name])) 
		$cache[$f_name] = [];
	$cache[$f_name][$f_uuid] = $f_uuid;
}
//results
foreach ($cache as $key=>$val) {
	print($key."\n");
	foreach ($val as $uuid) {
		print '{'.$uuid.'}'."\n";
	}
	print ("\n");
}
?>
