<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="banner">
	<a href="/admin/admin"><div class="title">ADMINISTRATOR</div></a>
	<ul class="subbanner">
		<li id="s01" class="sub_title">
			<a href="/admin/member" class="sub_titlelink">회원관리</a>
		</li>
		<li id="s02" class="sub_title">
			<a href="#" class="sub_titlelink">진단내역</a>
		</li>
		<li id="s03" class="sub_title">
			<a href="/admin/pet" class="sub_titlelink">반려동물관리</a>
			<ul id="sub3">
				<li><a href="/admin/pet" class="sub_link">등록현황</a></li>
				<li><a href="/admin/pet" class="sub_link">0001</a></li>
			</ul>
		</li>
		<li id="s04" class="sub_title">
			<a href="/admin/board" class="sub_titlelink">게시판</a>
			<ul id="sub4">
				<li><a href="/admin/board" class="sub_link">공지사항리스트</a></li>
				<li><a href="/admin/boardComment" class="sub_link">top10 댓글분석</a></li>
			</ul>
		</li>
		<li id="s05" class="sub_title">
			<a href="/admin/qna" class="sub_titlelink">Q&A</a>
			<ul id="sub5">
				<li><a href="/admin/qna" class="sub_link">Q&A리스트</a></li>
				<li><a href="/admin/qna" class="sub_link">0001</a></li>
			</ul>
		</li>
	</ul>
	<!-- ----------------------------------------------------------------- -->
	<div class="sub" id="sub1">
		<ul id="sub11">
			<li><a href="/admin/member" class="sub_link">등록회원리스트</a></li>
			<li><a href="/admin/byeMember" class="sub_link">탈퇴회원리스트</a></li>
		</ul>
	</div>
	<div class="sub" id="sub2">
		<ul id="sub22">
			<li><a href="#" class="sub_link">0000</a></li>
			<li><a href="#" class="sub_link">0001</a></li>
		</ul>
	</div>
	<div class="sub" id="sub3">
		<ul id="sub33">
			<li><a href="/admin/pet" class="sub_link">등록현황</a></li>
			<li><a href="/admin/pet" class="sub_link">0001</a></li>
		</ul>
	</div>
	<div class="sub" id="sub4">
		<ul id="sub44">
			<li><a href="/admin/member" class="sub_link">등록회원리스트</a></li>
			<li><a href="/admin/byeMember" class="sub_link">탈퇴회원리스트</a></li>
		</ul>
	</div>
	<div class="sub" id="sub5">
		<ul id="sub55">
			<li><a href="/admin/member" class="sub_link">등록회원리스트</a></li>
			<li><a href="/admin/byeMember" class="sub_link">탈퇴회원리스트</a></li>
		</ul>
	</div>
</div>
