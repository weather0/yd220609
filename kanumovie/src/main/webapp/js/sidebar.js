	const pathname = window.location.pathname.substring(11);
let reportusers = Number(document.getElementById('reportusers').value);

	//현재 주소
	//실행시 출력
	$(function() {
		if(pathname == 'home.do'){ //주소가 home.do이고
			if(reportusers >= 1){ // 리포트 수가 1보다 크면 
				 toastr.options = {
	    	      "closeButton": true,
	    	      "debug": false,
	    	      "newestOnTop": false,
	    	      "progressBar": false,
	    	      "positionClass": "toast-top-center",
	    	      "preventDuplicates": false,
	    	      "onclick": null,
	    	      "showDuration": "300",
	    	      "hideDuration": "1000",
	    	      "timeOut": "5000",
	    	      "extendedTimeOut": "1000",
	    	      "showEasing": "swing",
	    	      "hideEasing": "linear",
	    	      "showMethod": "fadeIn",
	    	      "hideMethod": "fadeOut"
	    	    }
	    	    toastr.info("새로운 신고 "+reportusers+ "건 있습니다.", '새로운 메세지');
			}
		}
	});
	
	
/* EXPANDER MENU */
const showMenu = (toggleId, navbarId, bodyId) => {
    const toggle = document.getElementById(toggleId),
    navbar = document.getElementById(navbarId),
    bodypadding = document.getElementById(bodyId)

    if( toggle && navbar ) {
        toggle.addEventListener('click', ()=>{
            navbar.classList.toggle('expander');

            bodypadding.classList.toggle('body-pd')
        })
    }
}

showMenu('nav-toggle', 'navbar', 'body-pd')

/* LINK ACTIVE */
const linkColor = document.querySelectorAll('.nav__link')
function colorLink() {
    linkColor.forEach(l=> l.classList.remove('bactive'))
    this.classList.add('bactive')
}
linkColor.forEach(l=> l.addEventListener('click', colorLink))

/* COLLAPSE MENU */
const linkCollapse = document.getElementsByClassName('collapse__link')
var i

for(i=0;i<linkCollapse.length;i++) {
    linkCollapse[i].addEventListener('click', function(){
        const collapseMenu = this.nextElementSibling
        collapseMenu.classList.toggle('showCollapse')

        const rotate = collapseMenu.previousElementSibling
        rotate.classList.toggle('rotate')
    });
}



let navlist = document.querySelector('.nav__list');

if(pathname == 'admin.do') {
console.log(navlist)
navlist.children[0].className += ' bactive';	
	
} else if(pathname == 'adminmessage.do') {
	navlist.children[1].className += ' bactive';	
} else if(pathname == 'analytics.do') {
	console.log('analytics')
	navlist.children[3].className += ' bactive';
}




