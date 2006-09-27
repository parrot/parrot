var reg;
var page = 0;
var page_str = '';
var goto_page = 0;

function req_changed() {
    // 0 = uninitialized, 1 = open, 2 = sent, 3 = receiving and 4 = loaded
    if (req.readyState == 4) {
	if (req.status == 200) {	// Ok of course
	    var x = document.getElementById('content');
	    x.innerHTML = req.responseText;
	}
	else {
	    var x = document.getElementById('content');
	    x.innerHTML = "<p>Error: '" + page_str + "': " + 
		req.statusText + "</p>";
	}
    }
}

function send_req(url) {
    req = new XMLHttpRequest();
    req.onreadystatechange = req_changed;
    req.open("GET", url, true);	// async
    req.send(null);
}

function send_p(d) {
    var nxt = page + d;
    if (nxt < 0)
	return;
    page = nxt;
    var cgi = document.getElementById('cgi');
    var slides = document.getElementById('slides');
    page_str = cgi.firstChild.nodeValue + "?f=" + slides.firstChild.nodeValue +
	"&p=" + page.toString();
    send_req(page_str);
}

function key_event(key) {
    switch (key.which) {
	case 32:	// sp
	case 39:	// right
	    send_p(1);
	    break;
	case 37:	// left
	    send_p(-1);
	    break;
	case 13:
	    page = goto_page;
	    goto_page = 0;
	    send_p(0);
	    break;
    }
    // </d+> <enter> = goto page
    if (key.which >= 48 && key.which <= 57) {
	goto_page = goto_page * 10 + key.which - 48;
    }
}

function go() {
    document.onkeyup = key_event;
    send_p(0);
}
window.onload = go;
