function CheckAddProduct(){
	var productId = document.getElementById("productId");
	var name = document.getElementById("name");
	var unitPrice = document.getElementById("unitPrice");
	var unitsInStock = document.getElementById("unitsInStock");
	
	var description = document.newProduct.description.value;
	var manufacturer = document.newProduct.manufacturer.value;
	var category = document.newProduct.category.value;
	var productImage = document.newProduct.productImage.value;
	//check 함수
	//첫번째 매개변수:정규표현식
	//두번째 매개변수:상품등록화면의 속성값
	//세번째 매개변수:정규표현식 부합하지 않을때 에러메시지
	if(!check(/^P[0-9]{4,11}$/,productId,"[상품 코드]\nP와 숫자를 조합하여 5-12자리까지 입력하세요")){
		return false;
	}
	
	if(name.value.length < 4 || name.value.length > 12){
		alert("[상품명]\n 최소 4자리에서 12자리까지 입력하세요");
		name.select();
		name.focus();
		return false;
	}
	
	if(unitPrice.value.length == 0 || isNaN(unitPrice.value)){
		alert("[가격]\n숫자만 입력하세요");
		unitPrice.select();
		unitPrice.focus();
		return false;		
	}
	
	if(unitPrice.value < 0){
		alert("[가격]\n음수는 입력할 수 없습니다.");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}else if (!check(/^\d+(?:[.]?[\d]?[\d])?$/,unitPrice,"[가격]\n소숫점 둘째 자리까지만 입력하세요")){
		return false;
	}
	
	if(!description){
		alert("[상세정보]\n상세정보를 입력하세요.");
		description.select();
		description.focus();
		return false;
	}
	
	if(!manufacturer){
		alert("[제조사]\n제조사를 입력하세요.");
		manufacturer.select();
		manufacturer.focus();
		return false;
	}
	
	if(!category){
		alert("[분류]\n분류를 입력하세요.");
		category.select();
		category.focus();
		return false;
	}
	
	if(unitsInStock.value.length == 0 || isNaN(unitsInStock.value)){
		alert("[재고수]\n숫자만 입력하세요");
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}
	
	if($("input:radio[name='condition']").is(":checked") == false){
			alert("상품상태를 반드시 선택하세요!");
			return false;
	}
	
	if(!productImage){
		alert("[이미지]\n이미지를 업로드 하세요.");
		productImage.select();
		productImage.focus();
		return false;
	}
	
	
	function check(regExp,e,msg){
		if(regExp.test(e.value)){
			return true;
		}
		
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	
	document.newProduct.submit();
}



