$(function(){
    $('#galleryImg-file').hide();
});

function imageclickarea(){
    $('#galleryImg-file').click();
}
function loadImg(inputFile){
    if(inputFile.files.length == 1){ // 파일이 첨부 됐을때
        
        //파일을 읽어들일 FileReader객체 생성
        let reader = new FileReader();

        // FileReader객체로부터 파일을 읽어들이는 메소드를 호출
        reader.readAsDataURL(inputFile.files[0]);

        // 파일 읽기가 완료되면 실행할 익명함수를 정의
        reader.onload = function(e){
            $('#galleryImg').attr('src', e.target.result);
        }
    }
    else{
        const str = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ67cTzZiRoYqv3QETVuupeq8DumnRsz1d5r1VdOZPk&s"
        $('#galleryImg').attr('src', str);
    }
}