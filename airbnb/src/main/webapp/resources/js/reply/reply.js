var replyService=(function(){
	// 추가
	function add(reply,callback, error){
		console.log("add reply........");
		
		$.ajax({
			type : 'post',
			url : '/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	// 불러오기
	function getList(param, callback, error){
		var place_id = param.place_id;
		var page = param.page || 1;
		
		$.getJSON("/replies/pages/"+place_id+"/"+page+".json",
				function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
	// 제거
	function remove(rno,callback,error){
		$.ajax({
			type:'delete',
			url:'/replies/'+rno,
			dataType: 'text',
			
			success:function(deleteResult,status,xhr){
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
	// 수정
	function update(reply, callback, error){
		console.log("RNO: " + reply.rno);
		
		$.ajax({
			type:'put',
			url:'/replies/'+reply.rno,
			data:JSON.stringify(reply),
			contentType:"application/json; charset=utf-8",
			success:function(result,status,xhr){
				if(callback){
					callback(result);
				}
			},
			error:function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	// 조회
	function get(rno, callback, error){
		console.log("rno : "+rno);
		
		$.get("/replies/"+rno+".json",function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
	
	return{
		add:add
		,getList : getList
		,remove : remove
		,update : update
		,get : get
	};
})();