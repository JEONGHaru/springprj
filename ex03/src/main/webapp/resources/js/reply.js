/**
 * 게시판 댓글 관련 JS
 */
 
 //JS 동작된다.
 console.log("Reply Module -------------------------");
 
//replyService JS 객체 생ㅓ
var replyService = (function(){
    //getList(서버로 전달데이터,서버에 갔다오면 처리되는 함수,에러를 처리되는 함수)
    //callback,error 함수는 get.jsp의 js 부분에서 작성해준다
    function getList(param,callback,error){
        //alert("댓글 가져오기 철기");
        var bno = param.bno; // param - json data
        var page = param.page || 1;
        //ajax 통해서 JSON 데이터로 댓글 리스트를 가져오는 처리
        // $.getJSON(url,[data],function())
        $.getJSON(
            "/replies/pages/"+bno+"/"+page,
            //function(서버에 전달하는 데이터 - JSON)
            //데이터를 가져오기를 성공했을때 처리되는 함수 - data : List<ReplyDTO> -> JSON data - > forEach
            function(data){
                //alert(JSON.stringify(data));
                //callback함수가 있으면 callback함수를 실행하자
                if(callback){
                    callback(data);
                //callback함수가 없으면 처리되는 처리문
                }else{
                    if(data.length > 0) {alert("데이터가 있습니다")}
                    else {alert("데이터가 없습니다");}
                }
            }
            //데이터 가져오기를 실패했을때 처리되는 함수
        ).fail(function(xhr,status,err){
            if(error) error();
        });
        //getJSON()의 끝 
    } //getList()의 끝
    function displayTime(timeValue){
        //오늘 날짜 객체 생성 - 24시간이 지났는지 알아내기위해서 필요함
        var today = new Date();
        //댓글 작성 시간과의 차이
        var gap = today.getTime() - timeValue;
        //댓글작성 날짜에 대한 형식을 만들려면 날짜객체로 만들어야한다.
        var dateObj = new Date(timeValue);
        var str = "";

        //24시간이 안지난경우 - 시간/분/초를 출력한다
        if(gap < (24*60*60*1000)){
            var hh = dateObj.getHours();
            var mi = dateObj.getMinutes();
            var ss = dateObj.getSeconds();
            //join(구분문자) 배열을 이어주는 함수 
            return [(hh > 9 ? '' : '0') + hh, ':',
                    (mi > 9 ? '' : '0') + mi, ';', 
                    (ss > 9 ? '' : '0') + ss, 
                ].join(' ');
        }else{ //24시간이 지난 경우 - 날짜를 출력한다
            var yy = dateObj.getFullYear();
            //월의 날짜 객체는 0~11까지만 있음 우리가 사용하는 월은 +1 처리를 해야함
            var mm = dateObj.getMonth() + 1;
            var dd = dateObj.getDate();
            //join(구분문자) 배열을 이어주는 함수 
            return [ yy, '/',
                    (mm > 9 ? '' : '0') + mm, '/', 
                    (dd > 9 ? '' : '0') + dd, 
                ].join('');
        }

    }//displayTime()의 끝
 //댓글 등록   
//add(JSON데이터, 등록시 처리함수 , 등록오류 처리함수)
 function add(reply,callback,error){
    console.log("add reply ------------- reply : " +JSON.stringify(reply));
    //ajax를 이용해서 서버에 데이터 전달(URL - /replys/new)
    $.ajax(
        {
            type : "POST", //전달방식
            url : "/replies/new", //서버 URL
            data : JSON.stringify(reply), //브라우저단에서 서버로 전달되는 데이터
            contentType : "application/json; charset=UTF-8", //전달 데이터의 형식
            success : function(result,status,xhr){ //처리가 성공했을떄
                if(callback){
                    callback(result);     
                }
            },
            error : function(xhr,status,err){ //처리가 실패했을때
                if(error){
                    error(err);
                }else{
                    console.log(xhr);
                    console.log(status);
                    console.log(err);
                }
            }
        }
    );
 }//댓글 등록의 끝 

 //댓글 수정
 function update(reply,callback,error){
    //alert("update reply(json) : " + JSON.stringify(reply));
    $.ajax(
        {
            type : "PUT",
            url : "/replies/"+reply.rno,
            data : JSON.stringify(reply),
            contentType : "application/json; charset=UTF-8",
            success : function(result,status,xhr){ //처리가 성공했을떄
                if(callback){
                    callback(result);     
                }
            },
            error : function(xhr,status,err){ //처리가 실패했을때
                if(error){
                    error(err);
                }else{
                    console.log(xhr);
                    console.log(status);
                    console.log(err);
                }
            }

    })
 }//댓글 수정의 끝
 //댓글 삭제
 function remove(rno,callback,error){
    //alert("remove rno : " +rno );
    $.ajax(
        {
            type : "DELETE",
            url : "/replies/"+rno,
            success : function(result,status,xhr){ //처리가 성공했을떄
                if(callback){
                    callback(result);     
                }
            },
            error : function(xhr,status,err){ //처리가 실패했을때
                if(error){
                    error(err);
                }else{
                    console.log(xhr);
                    console.log(status);
                    console.log(err);
                }
            }

    }); 
 }//댓글 수정의 끝
return {
    getList : getList,
    displayTime : displayTime,
    add : add,
    update : update,
    remove : remove
};
})();