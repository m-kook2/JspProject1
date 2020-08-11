/*별점 : .star-input*/
/*출처 : http://codepen.io/naradesign/pen/zxPbOw*/
var starRating = function(){
var $star = $(".star-input"),
    $result = $star.find("output>b");
	
  	$(document)
	.on("focusin", ".star-input>.input", 
		function(){
   		 $(this).addClass("focus");
 	})
		 
   	.on("focusout", ".star-input>.input", function(){
    	var $this = $(this);
    	setTimeout(function(){
      		if($this.find(":focus").length == 0){
       			$this.removeClass("focus");
     	 	}
   		}, 100);
 	 })
  
    .on("change", ".star-input :radio", function(){
    	//$result.text($(this).next().text());
    	$("#msg").text($(this).next().text());
  	})
  	//마우스가 안으로 들어왔을떄
    .on("mouseover", ".star-input label", function(){
    	//$result.text($(this).text());
    	//$("#msg").text($(this).next().text());
    })
    //마우스가 경계 외부로나갈떄
    .on("mouseleave", ".star-input>.input", function(){
    	var $checked = $star.find(":checked");
    		//if($checked.length == 0){
     	 		//$result.text("0");
    		//	$("#msg").text("0");
   		 	//} else {
     	 		//$result.text($checked.next().text());
   		 		$("#msg").text($(this).next().text());
    		//}
  	});
};

starRating();