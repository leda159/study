console.log("Reply Module......");

//function() :  즉시 실행한다 
//replyService라는 객체를 만들어서 
//{add:add} > 속성이름:값


var replyService = (function(){
	
	//reply: 신규 댓글 객체
	//callback:함수에서 다른 함수를 호출함
	function add(reply,callback,error){
	
		$.ajax({
			type:"post",				                   //전송 방식
			url:"/replies/new", 			               //실행 할려고하는 url 선언
			//매개변수로 전달된 객체를 json형태의 문자열로 변환처리를 함
			data:JSON.stringify(reply), 	               //stringify : 문자열로 바꿈
			contentType:"application/json; charset=utf-8", //MIME 형식을 선언			
			success:function(result,status,xhr){           //비동기 통신방식이 성공하면 처리	
				if(callback){
					callback(result);
				}
			},
			ereeor : function(xhr, status, er){            //비동기 통신방식이 실패하면 처리
				if(error){
					error(er);
				}
			}
		})
	}	
	
	//특정게시물에 대한 댓글 목록 처리		
	function getList(param,callback,error){
	
		var bno = param.bno;
		var page = param.page || 1;
		
		//Http Get방식의 요청을 통해 서버로 부터 받은
		//json 데이터를 가져온다
		$.getJSON("/replies/pages/" + bno + "/" + page + ".json",
			function(data){
			  if(callback){								//성공시
					callback(data);
				}
			}).fail(function(xhr,status,err){			//실패시
			if(error){
				error();
			}			
		});		
	}		
					
	//특정게시물에 대한 댓글 삭제 처리		
	function remove(param,callback,error){
	
		$.ajax({
			type : "delete",
			url : 	'/replies/' + rno,
			success : function(deleteResult,status,xhr){
				if(callback){
					callback(deleteResult);	
				}	
			},
			error : function(xhr,status,er){
				if(error){
					error(er);
				}
			}
		});			
	}				
	
	//특정 댓글 수정 처리	
	//reply: 객체형태로 전달
	function update(reply,callback,error){
		console.log("RNO:" + reply.rno);
		
		$.ajax({
			type:"put",
			url:"/replies/" + reply.rno,
			data:JSON.stringify(reply),      //제이슨 형태를 문자열로 바꿈
			contentType:"application/json; charset=utf-8",
			success:function(result,status,xhr){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr,status,er){
				if(error){
					error(er);	
				}
			}
		 });					
	}	
	
	
	//특정 댓글번호에 대한 내역 
	function get(rno,callback,error){
		$.get("/replies/" + rno + ".json",function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}	
	
								
	return { 											  //함수명 : 함수호출
		add : add,	
		getList : getList,
		remove : remove,
		update : update,
		get : get
	};
})();









