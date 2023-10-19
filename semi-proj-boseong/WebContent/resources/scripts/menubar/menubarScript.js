
		
if(msg != 'null'){
    alert(msg);
    <% session.removeAttribute("alertMsg"); %>
}

window.addEventListener("scroll", function(){
    var header = document.querySelector('#header');
    header.classList.toggle("sticky", window.scrollY > 0);
})


function backtoindex(){
    location.href = indexPath;
}