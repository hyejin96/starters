<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">

  <table class="table">
    <thead>
      <tr>
       <th>번호</th>
        <th>작성자</th>
        <th>제목</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${list}" var="qnaVO">
      <tr>
        <td>${qnaVO.qnaId}</td>
         <td>${qnaVO.qnaWriterId}</td>
       <c:choose>
						<c:when test="${qnaVO.qanPasswd==''}">
							<td class="notitle">
					<a href="starters?cmd=adminQnaListDetailAction&qnaNum=${qnaVO.qnaId}" >${qnaVO.qnaTitle}</a>
					</td>		
						</c:when>
						<c:otherwise>
							<td class="notitle">
							<a href="starters?cmd=adminQnaListDetailAction&qnaNum=${qnaVO.qnaId}" >★${qnaVO.qnaTitle}</a>
							</td>
							

						</c:otherwise>
					</c:choose>
        <td>${qnaVO.qnaDate}</td>
        <td>${qnaVO.qnaHits}</td>
        
      </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
<!-- pagination -->
<div class="paging">
<c:if test="${ qnaListNumber > 0}">

	<c:if test="${startPage > pageBlock}">
		<button id="jumPre" name="${startPage-pageBlock}" onclick="p(this)"
			class="btn btn-outline-basic w2">이전</button> &nbsp;
	</c:if>

	<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
		<c:choose>
			<c:when test="${currentPage == i}">
				<button id="ju" name="${i}" onclick="p(this)" class="btn btn-outline-basic  w1">${i}</button>
			</c:when>

			<c:otherwise>
				<button id="ju" name="${i}" onclick="p(this)" class="btn btn-outline-basic w">${i}</button>
			</c:otherwise>

		</c:choose>
	</c:forEach>

	<c:if test="${endPage < pageCount }">
		<button id="juN" name="${startPage+pageBlock}" onclick="p(this)"
			class="btn btn-outline-basic w2">다음</button> &nbsp;
	</c:if>


</c:if>
</div>
<%-- 136번째줄 close --%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<script>
	
	function p(jumpBtn) {
		var rStr = jumpBtn.name;
		// alert(rStr);
		$.ajax({
			url : "starters?cmd=adminQnaListPaging&pageNum=" + rStr,
			success : function(result) {
				$("div.mainList").html(result);
			}
		})
		//var query = "starters?cmd=TutoringListPagingAction&pageNum=" + rStr;
		//alert("starters?cmd=tutoringList?pageNum=" + rStr);
		//	$("#mainList").load(query);
		// alert(query);
	}
	
	

	</script>
