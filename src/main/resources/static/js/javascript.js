//Review scroll feature
function scrollDiv() {
	var div = document.getElementById('divReview');
	var scrollAmount = div.scrollWidth - div.clientWidth;
	var currentScroll = div.scrollLeft;
	if (currentScroll < scrollAmount) {
		div.scrollLeft = currentScroll + 1;
	} else {
		div.scrollLeft = 0;
	}
}
setInterval(scrollDiv, 20);


//popup Details window
const popupCenter = ({url, title, w, h}) => {
    // Fixes dual-screen position                             Most browsers      Firefox
    const dualScreenLeft = window.screenLeft !==  undefined ? window.screenLeft : window.screenX;
    const dualScreenTop = window.screenTop !==  undefined   ? window.screenTop  : window.screenY;

    const width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
    const height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;

    const systemZoom = width / window.screen.availWidth;
    const left = (width - w) / 2 / systemZoom + dualScreenLeft
    const top = (height - h) / 2 / systemZoom + dualScreenTop
    const newWindow = window.open(url, title, 
      `
      scrollbars=yes,
      width=${w / systemZoom}, 
      height=${h / systemZoom}, 
      top=${top}, 
      left=${left}
      `
    )

    if (window.focus) newWindow.focus();
}

//Change background color on puppy image
function changeColor(element){
	element.style = "opacity: .5";
}
function resetColor(element){
	element.style = "opacity: 1";
}

//Scroll button
function scrollX(value){
	var container = document.querySelector('.scroll-container');
	container.scrollBy({
		left: value,
		behavior: 'smooth'
		});
}