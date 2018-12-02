<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.starters.*" import="java.util.ArrayList"%>
<link rel="stylesheet" href="assets/css/community_tab.css" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container list">
<div class="row list1 text-center">
	<c:forEach items="${list}" var="tutoringVO2">

		<div class="col-lg-4 col-md-4 cardlist">
			<div class="card">
				<a class="tutorstutoring"
					href="starters?cmd=tutoringListDetailAction&num=${tutoringVO2.tutoringId}">
				<div class="tutoringImage"
					tutoringIdImg="${tutoringVO2.tutoringId }" id = "${tutoringVO2.tutoringId }"></div>
				</a>
				<div class="card-text">
					<a href="starters?cmd=tutoringListDetailAction&num=${tutoringVO2.tutoringId}" class="title" id="${tutoringVO2.tutoringId }">${tutoringVO2.title}</a>
					<p class="readCount">${tutoringVO2.count}</p>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
</div>
<!-- pagination -->
<div class="paging">

	<c:if test="${ tutortutoringListNumber > 0}">
	
		<c:if test="${startPage > pageBlock}">
			<button id="jumPre" name="${startPage-pageBlock}" onclick="p(this)"
				class="btn btn-outline-secondary w2">이전</button>
		</c:if>
	
		<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
			<c:choose>
				<c:when test="${currentPage == i}">
					<button id="ju" name="${i}" onclick="p(this)" class="btn btn-outline-secondary w1">${i}</button>
				</c:when>
	
				<c:otherwise>
					<button id="ju" name="${i}" onclick="p(this)" class="btn btn-outline-secondary w">${i}</button>
				</c:otherwise>
	
			</c:choose>
		</c:forEach>
	
		<c:if test="${endPage < pageCount }">
			<button id="juN" name="${startPage+pageBlock}" onclick="p(this)"
				class="btn btn-outline-secondary w2">다음</button>
		</c:if>
	
	
	</c:if>
	<%-- 136번째줄 close --%>
</div>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
	function p(jumpBtn) {
		var rStr = jumpBtn.name;
		// alert(rStr);
		$.ajax({
			url : "starters?cmd=tutorTutoringListPagingAction&pageNum=" + rStr,
			success : function(result) {
				$("div.mainList").html(result);
			}
		})
	}
	
				var list1 = new Array();
				<c:forEach items="${list}" var="item1">
				list1.push("${item1.tutoringId}");
				var tutoringListId = ${item1.tutoringId};
				console.log("tutoringListId"+tutoringListId);
				$.ajax({
					data: list1,
					url : "starters?cmd=tutortutoringListImage&tutoringListNum="+ tutoringListId,
					async : false,
					type : "POST",
					success : function(result) {
						console.log("result"+result);
						console.log("tutoringListId"+tutoringListId);
						 $(".tutoringImage[tutoringIdImg = '" + tutoringListId + "']").html(result);
					}

				});
				</c:forEach>
				console.log(list1);
				console.log("리얼확인"+tutoringListId);

</script>