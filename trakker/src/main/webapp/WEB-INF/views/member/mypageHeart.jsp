<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Random" %><%@ page import="java.util.Random" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <%@ include file="../header.jspf" %>
</head>
<style>
    .card .card-img-overlay {
            overflow: hidden;
            display: none;
        }
        .card {
            transition: all 0.3s ease-in-out;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .card:hover .card-img-overlay {
            display: block;
        }
        .card-text {
            display: -webkit-box;
            max-width: 400px;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        #category {
                position: fixed;
                top: 0;
                left: 0;
                height: 100%;
                width: 200px;
                background-color: #f8f9fa;
                border-right: 1px solid #dee2e6;
                padding-top: 50px;
            }

        #myreview {
                margin-left: 200px;
            }

        div a.menubar {
                text-decoration: none;
                display: block;
                color: #000;
                padding: 15px;
                font-weight: bold;
            }


        .menu > a:hover {
              background-color: #333;
              color: #fff;
           }

           .bi-plus-lg {
              font-size: 22px;
           }

        p.content2 {
              overflow: hidden;
              text-overflow: ellipsis;
              display: -webkit-box;
              -webkit-line-clamp: 1; /* Set the number of lines to display */
              -webkit-box-orient: vertical;
           }

        small a {
                   color: #6c757d !important;
                   text-decoration-line: none;
           }

</style>
<script>
    "use strict";
    $(window).on('load', function() {
        const urlParams = new URL(location.href).searchParams;
        const area = urlParams.get('area'); // <- query에 area가 있으면 콜랩스가 펼쳐짐
        const sort = urlParams.get('sort'); // <- query에 sort가 있으면 콜랩스가 펼쳐짐
        if (area || sort) $('#d-search').addClass('show')
        else $('#d-search').removeClass('show')
    });
    function detail(num) {
        location.href = '/trakker/planner/'+num;
    }

    function optionChange(type, param) {
                const urlParams = new URLSearchParams(location.search);
                switch (type) {
                    case 'resetTag':
                        urlParams.delete("sort");
                        urlParams.delete("area");
                        urlParams.delete("page");
                        break;
                    case 'sortTag':
                        urlParams.delete("page");
                        urlParams.set("sort", param);
                        break;
                    case 'areaTag':
                        urlParams.delete("page");
                        urlParams.set("area", param);
                        break;
                    case 'page':
                        urlParams.set("page", param);
                        break;
                    case 'search':
                        const type = document.getElementById('searchType').value;
                        const keyword = document.getElementById('keyword').value;
                        urlParams.delete("page");
                        urlParams.set("searchType", type);
                        urlParams.set("keyword", keyword);
                }
                location.href='${path}/member/mypageHeart?'+urlParams.toString();
            }
</script>
<body>

<div class="container pt-5">
    <div style="display: flex; height: auto;">
    <div id="category" class="menu center" style="width: 10%; margin-top: 70px;">
                                         <a class="menubar" href="${path}/member/mypageHeart">좋아요한 플래너</a>
                                         <a class="menubar" href="${path}/member/mypagePlanner">내가 만든 플래너</a>
                                         <a class="menubar" href="${path}/member/r_list?num=1">내가 쓴 리뷰</a>
                                         <a class="menubar" href="${path}/member/editprofile.do">프로필수정</a>
    </div>
    <div id="myreview" style="width: 80%;">
<div class="container">
<div class="row">
        <div class="col-sm-8">
        <h2 class="ps-5 mt-5">좋아요한 플래너</h2></div>
        <div class="col-sm-4" >
            <div class="d-flex pe-5 mt-5" role="search" action="${path}/member/mypageHeart">
                <select class="border-success rounded-3" id="searchType">
                    <c:choose>
                     <c:when test="${type eq 'title'}">
                            <option value="title" selected>제목</option>
                            <option value="writer">작성자</option>
                        </c:when>
                        <c:when test="${type eq 'writer'}">
                            <option value="title">제목</option>
                            <option value="writer" selected>작성자</option>
                        </c:when>
                        <c:otherwise>
                            <option value="title">제목</option>
                            <option value="writer">작성자</option>
                        </c:otherwise>
                    </c:choose>
                </select>
                <input class="form-control ms-2 me-2" id="keyword" value="${keyword}" aria-label="Search"placeholder="Search">
                <button class="btn btn-outline-success" type="submit" onclick="optionChange('search','null')">Search</button>
            </div>
        </div>
    </div>

    <div class="pe-5 text-end">
        <a class="text-muted text-decoration-none" data-bs-toggle="collapse" data-bs-target="#d-search">
            <small class="bi bi-caret-down-fill">옵션</small>
        </a>

        <div class="collapse" id="d-search">
            <small><a href="javascript:void(0);" onclick="optionChange('resetTag','reset')">초기화</a></small>
            <div class="mt-2">
                <small>
                    <c:choose>
                        <c:when test="${sort == 'ht'}">
                            <a href="javascript:void(0);" onclick="optionChange('sortTag','ht')"><strong><i>인기순</i></strong></a>
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:void(0);" onclick="optionChange('sortTag','ht')">인기순</a>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${sort == 'add'}">
                            <a href="javascript:void(0);" onclick="optionChange('sortTag','add')"><strong><i>최신순</i></strong></a>
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:void(0);" onclick="optionChange('sortTag','add')">최신순</a>
                        </c:otherwise>
                    </c:choose>
                </small>
            </div>
            <div class="mt-1">
                <small class="text-muted">
                    <c:forEach items="${local}" var="l">
                        <c:choose>
                        <c:when test="${l.lnum eq area}">
                            <a href="javascript:void(0);" onclick="optionChange('areaTag',${l.lnum})"><strong><i>${l.kname}</i></strong></a>
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:void(0);" onclick="optionChange('areaTag',${l.lnum})">${l.kname}</a>
                        </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </small>
            </div>
        </div>
    </div>

<c:choose>
        <c:when test="${list eq [] and param.searchType ne null}">
            <div class="center mt-5 mb-5 pb-5">
                <h1><i class="bi bi-search"></i></h1>
                <h3 class="pb-3">검색조건과 일치하는 플래너가 없습니다.</h3>
            </div>
        </c:when>
<c:otherwise>
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
        <c:forEach items="${list}" varStatus="i">
            <div class="col p-5">
                <div class="card rounded-3 shadow-sm">
                    <a href="javascript:void(0);" onclick="detail(${list[i.index].planNum});" style="text-decoration-line:none;">

                       <c:set var="randomNumber" value="${Random().nextInt(6) + 1}" />
                    <img src="${path}/resources/images/local/${list[i.index].lnum}/${list[i.index].lnum}-${randomNumber}.jpg" class="card-img-top w-100">

                        <div class="card-body rounded-3 p-0 w-100">
                            <h6 class="text-muted ms-3 mt-3">${list[i.index].member.mem_nickname}</h6>
                            <p class="card-text m-3" style="color:#1a1e21">${list[i.index].title}</p>
                        </div>
                        <div class="card-img-overlay rounded-3 p-0">
                            <div class="card-body align-text-top text-end p-0">
                                <div class="d-flex justify-content-between align-items-center p-3 pb-0">
                                    <h6 class="text-muted">${list[i.index].local.kname}</h6>
                                    <div class="d-flex justify-content-center align-items-center">
                                        <h6 class="mt-1 me-2" style="color: white">${list[i.index].hc}</h6>
                                        <c:choose>
                                            <c:when test="${list[i.index].heart.mh eq 1}">
                                                <i class="bi bi-heart-fill" style="color:#dc3545"></i>
                                            </c:when>
                                            <c:otherwise>
                                                <i class="bi bi-heart" style="color:#dc3545"></i>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </c:forEach>
    </div>
    </c:otherwise>
    </c:choose>

        <div class="d-flex justify-content-center align-items-center py-4 my-5 h5">
            <span>

                <c:if test="${page.pageNum > 2}">
                    <a class="ms-3 text-muted" onclick="optionChange('page', 1)"><i class="bi bi-chevron-double-left"></i></a>
                </c:if>

                <c:if test="${page.pageNum > 1}">
                    <a class="ms-3 text-muted" onclick="optionChange('page', ${page.pageNum - 1})"><i class="bi bi-chevron-left"></i></a>
                </c:if>
            </span>

            <c:forEach begin="1" end="${page.lastPageNum}" var="num">
            <span class="ms-3 text-muted">
                <c:choose>
                    <c:when test="${select == num}">
                        <b class="ms-3 text-muted">${num}</b>
                    </c:when>
                    <c:otherwise>
                        <a class="ms-3 text-muted" onclick="optionChange('page', ${num})">${num}</a>
                    </c:otherwise>
                </c:choose>
            </span>
            </c:forEach>
            <span>

                <c:if test="${page.pageNum != page.lastPageNum and (page.lastPageNum ne 0)}">
                    <a class="ms-3 text-muted" onclick="optionChange('page', ${page.pageNum + 1})"><i class="bi bi-chevron-right"></i></a>
                </c:if>

                <c:if test="${page.pageNum != page.lastPageNum and (page.lastPageNum ne 0)}">
                    <a class="ms-3 text-muted" onclick="optionChange('page', ${page.lastPageNum})"><i class="bi bi-chevron-double-right"></i></a>
                </c:if>
            </span>
        </div>

    </div>
    </div>
    </div>
    <%@ include file="../footer.jspf" %>
</div>
</body>

</html>
