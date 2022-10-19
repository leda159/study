<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.uploadResult {
		width:100%;
		background-color:gray;
	}
	
	.uploadResult ul {
		display:flex;
		flex-flow:row;
		justify-content:center;
		align-items:center;
	}
	
	.uploadResult ul li {
		list-style:none;
		padding:10px;
		align-content:center;
		text-align:center;
	}
	
	.uploadResult ul li img{
		width:100px;
	}
	
	.uploadResult ul li span {
		color:white;
	}
	
	.bigPictureWrapper {
		position:absolute;
		display:none;
		justify-content:center;
		align-items:center;
		top:0%;
		width:100%;
		height:100%;
		background-color:gray;
		z-index:100;
		background:rgba(255,255,255,0.5);
	}
	
	.bigPicture {
		position:relative;
		display:flex;
		justify-content:center;
		align-items:center;
	}
	
	.bigPicture img {
		width:600px;
	}
	
</style>
	<script>
 		function showImage(fileCallPath){
			
			//원본이미지 영역을 보여준다.
			$(".bigPictureWrapper").css("display","flex").show();
			
			//원본이미지를 1초동안 천천히 보여준다.
			$(".bigPicture").html("<img src='/display?fileName=" + encodeURI(fileCallPath) + "'>")
			                .animate({width:'100%',height:'100%'},1000);
			
			//p544 원본이미지 클릭시 닫기 처리
			$(".bigPictureWrapper").on("click",function(e){
				$(".bigPicture").animate({width:'0%',height:'0%'},1000);
				
				setTimeOut(function(){
					$('.bigPictureWrapper').hide();
				},1000);
				
				/* //현재 사용중인 웹브라우저
				var userAgent = navigator.userAgent.toLowerCase();
				
				if(userAgent.indexOf("trident") > -1){
					setTimeOut(function(){
						$('.bigPictureWrapper').hide();
					},1000);
				}else if(userAgent.indexOf("chrome") > -1){
					//setTimeout?일정시간이 지난후에 함수를 실행
					setTimeout(() => {
						$(this).hide();
					},1000);
				}
				
				
			}); */
		}
	</script>
</head>
<body>
	<div class="uploadDiv">
		<input type="file" name="uploadFile" multiple>
	</div>
	
	<!-- 
		p542 썸네일 파일을 클릭시 원본 이미지를
		보여주는 영역 
	-->
	<div class="bigPictureWrapper">
		<div class="bigPicture">
		</div>
	</div>	
	
	<!-- 업로드 파일 목록을 보여준다. -->
	<div class="uploadResult">
		<ul></ul>
	</div>
	
	<button id="uploadBtn">업로드</button>
	
	<!-- jquery 최신버전 가져오기 -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<!-- p540 -->
<!-- 	<script>
 		function showImage(fileCallPath){
			
			//원본이미지 영역을 보여준다.
			$(".bigPictureWrapper").css("display","flex").show();
			
			//원본이미지를 1초동안 천천히 보여준다.
			$(".bigPicture").html("<img src='/display?fileName=" + encodeURI(fileCallPath) + "'>")
			                .animate({width:'100%',height:'100%'},1000);
			
			//p544 원본이미지 클릭시 닫기 처리
			$(".bigPictureWrapper").on("click",function(e){
				$(".bigPicture").animate({width:'0%',height:'0%'},1000);
				
				//현재 사용중인 웹브라우저
				var userAgent = navigator.userAgent.toLowerCase();
				
				if(userAgent.indexOf("trident") > -1){
					setTimeOut(function(){
						$('.bigPictureWrapper').hide();
					},1000);
				}else if(userAgent.indexOf("chrome") > -1){
					//setTimeout?일정시간이 지난후에 함수를 실행
					setTimeout(() => {
						$(this).hide();
					},1000);
				}
				
				
			});
		}
	</script> -->
	
	<script>
		$(document).ready(function(){
			
			//p506 파일업로드시 크기및 확장자 체크
			//RegExp : 정규식 처리하는 객체
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880;//파일 업로드 최대크기 5M
			
			function checkExtension(fileName,fileSize){
				
				if(fileSize >= maxSize){
					alert("파일 크기 초과");
					return false;
				}
				
				//정규식을 테스트하여 조건에 만족하면 true 아니면 false
				if(regex.test(fileName)){
					alert("해당 종류의 파일은 업로드할 수 없습니다.");
					return false;
				}
				
				return true;
			}//
			
			//p520
			//class로 지정된 uploadDiv 영역을 복제
			var cloneObj = $(".uploadDiv").clone();
			
			$("#uploadBtn").on("click",function(e){
				
				//FormData?
				//<form>태그와 같은 효과로 key와value
				//형태로 저장되는 객체로 페이지 전환없이
				//폼 데이터를 서버로 전송가능하다.
				var formData = new FormData();
				
				var inputFile = $("input[name='uploadFile']");
				
				//업로드한 파일 내역을 변수에 대입
				//업로된 파일들은 FileList 형태로 대입된다.
				var files = inputFile[0].files;
				
				for(var i=0;i<files.length;i++){
					
					//파일 확장자,크기가 조건에 맞지 않으면 업로드 처리 불가
					if(!checkExtension(files[i].name,files[i].size)){
						return false;
					}
					
					//서버로 전송시 업로드 파일내역을 매개변수로 전달
					formData.append("uploadFile",files[i]);
				}				
				
				$.ajax({
					url:"/uploadAjaxAction",
					//일반적으로 서버로 전송시 query string 형태로
					//인식하는데 formData 전송시 이렇게 인식하지 
					//않도록 반드시 false로 지정해야 한다.
					processData:false,
					//contentType의 기본값이 
					//application/x-www-form-unlencoded;utf-8
					//로 선언되는데 formData를 이용하여 파일을 업로드
					//시에는 multipart/form-data로 인식시키기 위해
					//반드시 false로 지정해야 한다.
					contentType:false,
					data:formData,
					type:"post",
					dataType:"json",
					success:function(result){
						console.log(result);
						
						//p523 업로드된 파일내역을 화면에 출력
						showUploadedFile(result);
						
						//p521
						//파일 업로드 정상처리후 화면 초기화 작업
						$(".uploadDiv").html(cloneObj.html());
					}
				});//
				
			});//
			
			//p522 업로드 파일을 uploadResult 영역에
			//출력
			//업로드 파일을 보여주는 ul 태그 영역 초기값을 
			//변수에 대입
			var uploadResult = $(".uploadResult ul");
			
			//업로드한 파일내역을 출력하는 함수
			function showUploadedFile(uploadResultArr){
				
				var str = "";
				
				$(uploadResultArr).each(function(i,obj){
					//업로드한 파일이 이미지가 아니면 처리					
					if(!obj.image){
						
						//p537
						//파일 경로(한글깨짐 방지를 위해 인코딩 처리)
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
						//일반파일인 경우 a 태그 추가
						str += "<li><a href='/download?fileName="+fileCallPath+"'>" + "<img src='/resources/img/attach.png'>" + obj.fileName + "</a></li>";
					}else{//업로드 파일이 이미지인 경우
						
						//p528 업로드 파일 한글 처리
						//매개변수로 파일명을 전달시
						//한글이 깨지므로 encodeURIComponent() 메서드를
						//사용하여 한글깨짐 방지
						var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_" + obj.uuid + "_" + obj.fileName);
					
						//p541
						//원본 파일명 가져오기
						var originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
						
						//url에서  사용하기 위해 파일명의 \\를 /로 모두 변경
						originPath = originPath.replace(new RegExp(/\\/g),"/");
											
						str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\"><img src='/display?fileName="+fileCallPath+"'></a></li>";
					}
					
				});
				
				//uploadResult 영역에 표시
				uploadResult.append(str);
			}//
			
		});//
	</script>
</body>
</html>



