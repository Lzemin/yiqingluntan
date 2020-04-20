<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>关于我</title>
    <link rel="stylesheet" href="${ctxStatic}/css/style.css"/>
    <script type="text/javascript" src="${ctxStatic}/js/top.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/js/top.js"></script>
    <script type="text/javascript" src="${ctxStatic}/js/jquery.1.4.2.min.js"></script>
</head>
<body>
<div class="bodycontent">
    <jsp:include page="header.jsp"/>
    <div class="clear"></div>
    <section class="blockGroup">
        <h2 class="s_title">about 疫情</h2>
        <div class="views">
            <time>发布于:2020-04-04</time>--作者：huanglingyan
        </div>
        <article class="single">
            <h3>简介</h3>
            <p>基于springboot+mybatis+shiro+ehcache制作的疫情论坛</p>
            <p>这个疫情论坛主要功能有写论坛文章和日记，浏览论坛与日记</p>
            <h3>运用知识点</h3>
            <ul>
                <li>springboot</li>
                <li>mybatis</li>
                <li>shiro</li>
                <li>ehcache</li>
                <li>mysql</li>
                <li>maven</li>
            </ul>
            <h3>运行环境</h3>
            <ul>
                <li>idea</li>
                <li>mysql</li>
                <li>java</li>
                <li>maven</li>
            </ul>
        </article>
    </section>
</div>
<%@include file="footer.jsp" %>