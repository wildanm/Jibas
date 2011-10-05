var win = null;
function newWindow(mypage,myname,w,h,features) {
      var winl = (screen.width-w)/2;
      var wint = (screen.height-h)/2;
      if (winl < 0) winl = 0;
      if (wint < 0) wint = 0;
      var settings = 'height=' + h + ',';
      settings += 'width=' + w + ',';
      settings += 'top=' + wint + ',';
      settings += 'left=' + winl + ',';
      settings += features;
      win = window.open(mypage,myname,settings);
      win.window.focus();
}
function getInfoTabContent(nis){
	//show_wait('TabbedPanelsContentGroup2');
	/*alert ('Masuk');*/
	//show_wait('datapribadi');
	//alert ('nis_awal');
	sendRequestText('datapribadi.php',showInfoTabDP,'nis='+nis);
	//show_wait('keuangan');
	sendRequestText('keuangan.php',showInfoTabK,'nis='+nis);
	//show_wait('ph');
	sendRequestText('ph.php',showInfoTabPH,'nis_awal='+nis);
	//show_wait('pp');
	sendRequestText('pp.php',showInfoTabPP,'nis_awal='+nis);
	//show_wait('nilai');
	sendRequestText('nilai.php',showInfoTabN,'nis_awal='+nis);
	//show_wait('rapor');
	sendRequestText('rapor.php',showInfoTabR,'nis_awal='+nis);
	//show_wait('peprustakaan');
	//alert ('nis_awal');
	sendRequestText("perpustakaan.php",showInfoTabP,'nis_awal='+nis);
}

function showInfoTabDP(x){
	show_wait('datapribadi');
	setTimeout(function(){
	document.getElementById("datapribadi").innerHTML = x;
	},500);
	
}function showInfoTabK(x){
	document.getElementById("keuangan").innerHTML = x;
}
function showInfoTabPH(x){
	document.getElementById("ph").innerHTML = x;
}
function showInfoTabPP(x){
	document.getElementById("pp").innerHTML = x;
}
function showInfoTabN(x){
	document.getElementById("nilai").innerHTML = x;
	var TabbedPanels3 = new Spry.Widget.TabbedPanels("TabbedPanels3");
}
function showInfoTabR(x){
	document.getElementById("rapor").innerHTML = x;
}
function showInfoTabP(x){
	document.getElementById("perpus").innerHTML = x;
}
function chg_tab_sem(nis,replid,pelajaran,kelas,i,nmsem,num){
	//alert ('Masoooookkkkkkk_'+i);
	document.getElementById('active_tab').value = i;
	show_wait('sem'+i);
	sendRequestText("get_nil_sem.php", showInfoTabSemester, "nis="+nis+"&semester="+replid+"&pelajaran="+pelajaran+"&kelas="+kelas+"&namasemester="+nmsem);		
	//sendRequestText('get_nil_sem.php',showInfoTabSemester,'nis_awal='+nis);
}
function showInfoTabSemester(x){
	var active_tab = document.getElementById('active_tab').value;
	document.getElementById('sem'+active_tab).innerHTML = x;
}
function change_dep(panel){
	if (panel==1){
		var dep = document.panelph.departemen.value;
		var nis	 =  document.panelph.nis_awal.value;
		sendRequestText('ph.php',showInfoTabPH,'nis_awal='+nis+'&departemen='+dep);
	} else if (panel==2) {
		var dep = document.panelpp.departemen.value;
		var nis	 =  document.panelpp.nis_awal.value;
		sendRequestText('pp.php',showInfoTabPP,'nis_awal='+nis+'&departemen='+dep);
	} else if (panel==3) {
		var dep = document.panelnilai.departemen.value;
		var nis	 =  document.panelnilai.nis_awal.value;
		sendRequestText('nilai.php',showInfoTabN,'nis_awal='+nis+'&departemen='+dep);
	} else if (panel==4) {
		var dep = document.panelrapor.departemen.value;
		var nis	 =  document.panelrapor.nis_awal.value;
		sendRequestText('rapor.php',showInfoTabR,'nis_awal='+nis+'&departemen='+dep);
	}
}
function change_ta(panel){
	if (panel==1){
		var dep  = 	document.panelph.departemen.value;
		var ta   = 	document.panelph.tahunajaran.value;
		var nis	 =  document.panelph.nis_awal.value;
		sendRequestText('ph.php',showInfoTabPH,'nis_awal='+nis+'&departemen='+dep+'&tahunajaran='+ta);
	} else if (panel==2) {
		var dep = document.panelpp.departemen.value;
		var ta   = 	document.panelpp.tahunajaran.value;
		var nis	 =  document.panelpp.nis_awal.value;
		sendRequestText('pp.php',showInfoTabPP,'nis_awal='+nis+'&departemen='+dep+'&tahunajaran='+ta);
	} else if (panel==3) {
		var dep = document.panelnilai.departemen.value;
		var ta   = 	document.panelnilai.tahunajaran.value;
		var nis	 =  document.panelnilai.nis_awal.value;
		sendRequestText('nilai.php',showInfoTabN,'nis_awal='+nis+'&departemen='+dep+'&tahunajaran='+ta);
	} else if (panel==4) {
		var dep = document.panelrapor.departemen.value;
		var ta   = 	document.panelrapor.tahunajaran.value;
		var nis	 =  document.panelrapor.nis_awal.value;
		sendRequestText('rapor.php',showInfoTabR,'nis_awal='+nis+'&departemen='+dep+'&tahunajaran='+ta);
	}
}
function change_kls(panel){
	if (panel==1){
		var dep  = 	document.panelph.departemen.value;
		var ta   = 	document.panelph.tahunajaran.value;
		var k    =	document.panelph.kelas.value;
		var nis	 =  document.panelph.nis_awal.value;
		sendRequestText('ph.php',showInfoTabPH,'nis_awal='+nis+'&departemen='+dep+'&tahunajaran='+ta+'&kelas='+k);
	} else if (panel==2) {
		var dep = document.panelpp.departemen.value;
		var ta   = 	document.panelpp.tahunajaran.value;
		var k    =	document.panelpp.kelas.value;
		var nis	 =  document.panelpp.nis_awal.value;
		sendRequestText('pp.php',showInfoTabPP,'nis_awal='+nis+'&departemen='+dep+'&tahunajaran='+ta+'&kelas='+k);
	} else if (panel==3) {
		var dep = document.panelnilai.departemen.value;
		var ta   = 	document.panelnilai.tahunajaran.value;
		var k    =	document.panelnilai.kelas.value;
		var nis	 =  document.panelnilai.nis_awal.value;	
		sendRequestText('nilai.php',showInfoTabN,'nis_awal='+nis+'&departemen='+dep+'&tahunajaran='+ta+'&kelas='+k);
	} else if (panel==4) {
		var dep = document.panelrapor.departemen.value;
		var ta   = 	document.panelrapor.tahunajaran.value;
		var k    =	document.panelrapor.kelas.value;
		var nis	 =  document.panelrapor.nis_awal.value;
		sendRequestText('rapor.php',showInfoTabR,'nis_awal='+nis+'&departemen='+dep+'&tahunajaran='+ta+'&kelas='+k);
	}
}
function change_sem(){
	var dep = document.panelrapor.departemen.value;
	var ta   = 	document.panelrapor.tahunajaran.value;
	var k    =	document.panelrapor.kelas.value;
	var s    =	document.panelrapor.semester.value;
	var nis	 =  document.panelrapor.nis_awal.value;
	sendRequestText('rapor.php',showInfoTabR,'nis_awal='+nis+'&departemen='+dep+'&tahunajaran='+ta+'&kelas='+k+'&semester='+s);
}
function change_pel(){
	var dep = document.panelnilai.departemen.value;
	var ta   = 	document.panelnilai.tahunajaran.value;
	var k    =	document.panelnilai.kelas.value;
	var p    =	document.panelnilai.pelajaran.value;
	var nis	 =  document.panelnilai.nis_awal.value;
	sendRequestText('nilai.php',showInfoTabN,'nis_awal='+nis+'&departemen='+dep+'&tahunajaran='+ta+'&kelas='+k+'&pelajaran='+p);
}
function cetak(panel){
	//alert('Masuk');
	var addr;
	if (panel==1)
	{
		var nis = document.paneldp.nis.value;
		addr = 'datapribadi_cetak.php?nis='+nis;

	}
	else if (panel==2)
	{
		var nis = document.panelkeuangan.nis.value;
		addr = 'keuangan_cetak.php?nis='+nis;

	}
	else if (panel==3)
	{
		var nis = document.panelph.nis_awal.value;
		var kelas = document.panelph.kelas.value;
		addr = 'ph_cetak.php?nis='+nis+'&kelas='+kelas;
	}
	else if (panel==4)
	{
		var nis = document.panelpp.nis_awal.value;
		var kelas = document.panelpp.kelas.value;
		addr = 'pp_cetak.php?nis='+nis+'&kelas='+kelas;
	}
	else if (panel==6)
	{
		var nis = document.panelpp.nis_awal.value;
		var kelas = document.panelpp.kelas.value;
		addr = 'rapor_cetak.php?nis='+nis+'&kelas='+kelas;
	}
	else 
	{
		var x = panel.split('_');
		var semester = x[1];
		var nis = document.panelnilai.nis_awal.value;
		var kelas = document.panelnilai.kelas.value;
		var pelajaran = document.panelnilai.pelajaran.value;
		var tahunajaran = document.panelnilai.tahunajaran.value;
		//alert ("Sem="+semester+"Nis="+nis+"kel="+kelas+"Pel="+pelajaran);
		addr = 'nilai_cetak.php?nis='+nis+'&kelas='+kelas+'&pelajaran='+pelajaran+'&semester='+semester+'&tahunajaran='+tahunajaran;
	}
	
	newWindow(addr, 'CetakData','800','650','resizable=1,scrollbars=1,status=0,toolbar=0');
}
