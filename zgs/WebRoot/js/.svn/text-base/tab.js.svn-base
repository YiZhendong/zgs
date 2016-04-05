// JavaScript Document
$(function(){
$(".tabli").each(function (index){     //杩欒浠ｇ爜鐨勬剰鎬濇槸鍘嗕究鎵�湁鐨刲i锛岃鎵�湁鐨刲i閮借Е鍙戜竴涓嚱鏁帮紝鍗充笅闈㈢殑閮ㄥ垎鍜�
   $(this).click(function(){     //鏁伴亶婊戣繃鍝竴涓猯i鏃讹紝璁╁綋鍓嶇殑li閮借Е鍙戜竴涓猰ouseover浜嬩欢
    $("li.tabIn").removeClass("tabIn");        //璁╂湰鏉ュ叿鏈塼abIn鐨刲i鐨則abIn绫荤Щ闄�
   $(this).addClass("tabIn");           //缁欏綋鐨刲i澧炲姞涓�釜tabIn绫伙紝璁╁畠鑳屾櫙浠ュ強鏍峰紡鍖哄埆浜庡叾浠栫殑li
    $("div.inner").removeClass("tabCont");   //璁╂湰鏉ュ叿鏈塼abCont鐨刣iv鐨則abCont绫荤Щ闄�涔熷氨鏄璁╂湰鏉ュ彲瑙佺殑div鍧椾笉鍙
    $(".inner").eq(index).addClass("tabCont")       //鎵惧埌#tabBox妗嗘灦閲岀殑div鐒跺悗閫氳繃eq锛堬級鍑芥暟閫氳繃璁剧疆index鍊煎綋鍓嶇殑div蹇紝缁欎粬澧炲姞涓�釜绫籺abCont锛堝嵆璁╁畠鍙锛�
        })          
  })     
 })
 
 $(function(){
$(".edit").click(function(){
	$("li.tabIn").removeClass("tabIn"); 
	$(this).addClass("tabIn"); 
	
	$("div.inner").removeClass("tabCont");
	
	$(".edit_log").addClass("tabCont"); 	})   
 })

 
 $(function(){
$(".return_list").click(function(){
	$("li.tabIn").removeClass("tabIn"); 
	$(this).addClass("tabIn"); 
	
	$(".edit_log").removeClass("tabCont");
	
	$(".log_list").addClass("tabCont"); 
})   
 }) 