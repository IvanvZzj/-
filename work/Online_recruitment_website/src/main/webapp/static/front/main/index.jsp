<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<html xmlns:wb="http://open.weibo.com/wb">
<head>
    <script id="allmobilize" charset="utf-8" src="${path}/static/front/style/js/allmobilize.min.js"></script>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="alternate" media="handheld"/>
    <!-- end 云适配 -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>拉勾网-最专业的互联网招聘平台</title>
    <meta property="qc:admins" content="23635710066417756375"/>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <meta name="baidu-site-verification" content="QIQ6KC1oZ6"/>

    <link rel="stylesheet" type="text/css" href="${path}/static/front/style/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/static/front/style/css/external.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/static/front/style/css/popup.css"/>
    <style>
        .ui-menu-item a {
            display: block;
            overflow: hidden;
        }
    </style>
    <script type="text/javascript" src="${path}/static/front/style/js/jquery.1.10.1.min.js"></script>
    <script type="text/javascript" src="${path}/static/front/style/js/jquery.lib.min.js"></script>
</head>
<body>
<div id="body">
    <div id="header">
        <div class="wrapper">
            <a href="index.jsp" class="logo">
                <img src="${path}/static/front/style/images/logo.png" width="229" height="43" alt="拉勾招聘-专注互联网招聘"/>
            </a>
            <ul class="reset" id="navheader">
                <li class="current"><a href="front/main/index.html">首页</a></li>
                <li><a href="companylist.html">公司</a></li>
                <li><a href="jianli.html" rel="nofollow">我的简历</a></li>
                <li><a href="create.html" rel="nofollow">发布职位</a></li>
            </ul>
            <ul class="loginTop">
                <li><a href="login.html" rel="nofollow">登录</a></li>
                <li>|</li>
                <li><a href="register.html" rel="nofollow">注册</a></li>
            </ul>
        </div>
    </div>
    <!-- end #header -->
    <div id="container">

        <div id="sidebar">
            <div class="mainNavs">
                <c:forEach var="cate" items="${requestScope.jobcates}">
                    <div class="menu_box">
                        <div class="menu_main">
                            <h2>${cate.key.name} <span></span></h2>
                            <c:forEach var="c" items="${cate.key.childJobCate}">
                            <a href="#">${c.name}</a>
                            </c:forEach>
                        </div>
                        <div class="menu_sub dn">
                            <c:forEach var="c" items="${cate.value}">
                            <dl class="reset">
                                <dt>
                                    <a href="#">${c.name}</a>
                                </dt>
                                <dd>
                                    <c:forEach var="cc" items="${c.childJobCate}">
                                    <a href="" class="curr">${cc.name}</a>
                                    </c:forEach>
                                </dd>
                            </dl>
                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="content">
            <div id="search_box">
                <form id="searchForm" name="searchForm" action="list.html" method="get">
                    <ul id="searchType">
                        <li data-searchtype="1" class="type_selected">职位</li>
                        <li data-searchtype="4">公司</li>
                    </ul>
                    <div class="searchtype_arrow"></div>
                    <input type="text" id="search_input" name="kd" tabindex="1" value="" placeholder="请输入职位名称，如：产品经理"/>
                    <input type="submit" id="search_button" value="搜索"/>
                </form>
            </div>


            <dl class="hotSearch">
                <dt>热门搜索：</dt>
                <dd><a href="#">Java</a></dd>
                <dd><a href="#">PHP</a></dd>
                <dd><a href="#">Android</a></dd>
                <dd><a href="#">iOS</a></dd>
                <dd><a href="#">前端</a></dd>
                <dd><a href="#">产品经理</a></dd>
                <dd><a href="#">UI</a></dd>
                <dd><a href="#">运营</a></dd>
                <dd><a href="#">BD</a></dd>
                <dd><a href="#">实习</a></dd>
            </dl>
            <div id="home_banner">
                <ul class="banner_bg">
                    <li class="banner_bg_1 current">
                        <a href="" target="_blank">
                            <img src="${path}/static/front/style/images/d05a2cc6e6c94bdd80e074eb05e37ebd.jpg"
                                 width="612" height="160"
                                 alt="好买基金——来了就给100万"/></a>
                    </li>
                    <li class="banner_bg_2">
                        <a href="#" target="_blank">
                            <img src="style/images/c9d8a0756d1442caa328adcf28a38857.jpg" width="612" height="160"
                                 alt="世界杯放假看球，老板我也要！"/>
                        </a>
                    </li>
                    <li class="banner_bg_3">
                        <a href="#" target="_blank">
                            <img src="style/images/d03110162390422bb97cebc7fd2ab586.jpg" width="612" height="160"
                                 alt="出北京记——第一站厦门"/>
                        </a>
                    </li>
                </ul>
                <!--轮播图-->
                <div class="banner_control">
                    <em></em>
                    <ul class="thumbs">
                        <li class="thumbs_1 current">
                            <i></i>
                            <img src="style/images/4469b1b83b1f46c7adec255c4b1e4802.jpg" width="113" height="42"/>
                        </li>
                        <li class="thumbs_2">
                            <i></i>
                            <img src="style/images/381b343557774270a508206b3a725f39.jpg" width="113" height="42"/>
                        </li>
                        <li class="thumbs_3">
                            <i></i>
                            <img src="style/images/354d445c5fd84f1990b91eb559677eb5.jpg" width="113" height="42"/>
                        </li>
                    </ul>
                </div>
            </div><!--/#main_banner-->
            <!--公司滚动条-->
            <ul id="da-thumbs" class="da-thumbs">
                <li>
                    <a href="h/c/1650.html" target="_blank">
                        <img src="style/images/a254b11ecead45bda166afa8aaa9c8bc.jpg" width="113" height="113" alt="联想"/>
                        <div class="hot_info">
                            <h2 title="联想">联想</h2>
                            <em></em>
                            <p title="世界因联想更美好">
                                世界因联想更美好
                            </p>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="h/c/9725.html" target="_blank">
                        <img src="style/images/c75654bc2ab141df8218983cfe5c89f9.jpg" width="113" height="113" alt="淘米"/>
                        <div class="hot_info">
                            <h2 title="淘米">淘米</h2>
                            <em></em>
                            <p title="将心注入 追求极致">
                                将心注入 追求极致
                            </p>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="h/c/1914.html" target="_blank">
                        <img src="style/images/2bba2b71d0b0443eaea1774f7ee17c9f.png" width="113" height="113"
                             alt="优酷土豆"/>
                        <div class="hot_info">
                            <h2 title="优酷土豆">优酷土豆</h2>
                            <em></em>
                            <p title="专注于视频领域，是中国网络视频行业领军企业">
                                专注于视频领域，是中国网络视频行业领军企业
                            </p>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="h/c/6630.html" target="_blank">
                        <img src="style/images/f4822a445a8b495ebad81fcfad3e40e2.jpg" width="113" height="113"
                             alt="思特沃克"/>
                        <div class="hot_info">
                            <h2 title="思特沃克">思特沃克</h2>
                            <em></em>
                            <p title="一家全球信息技术服务公司">
                                一家全球信息技术服务公司
                            </p>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="h/c/2700.html" target="_blank">
                        <img src="style/images/5caf8f9631114bf990f87bb11360653e.png" width="113" height="113" alt="奇猫"/>
                        <div class="hot_info">
                            <h2 title="奇猫">奇猫</h2>
                            <em></em>
                            <p title="专注于移动互联网、互联网产品研发">
                                专注于移动互联网、互联网产品研发
                            </p>
                        </div>
                    </a>
                </li>
                <li class="last">
                    <a href="h/c/1335.html" target="_blank">
                        <img src="style/images/c0052c69ef4546c3b7d08366d0744974.jpg" width="113" height="113"
                             alt="堆糖网"/>
                        <div class="hot_info">
                            <h2 title="堆糖网">堆糖网</h2>
                            <em></em>
                            <p title="分享收集生活中的美好，遇见世界上的另外一个你">
                                分享收集生活中的美好，遇见世界上的另外一个你
                            </p>
                        </div>
                    </a>
                </li>
            </ul>
            <!--热门职位-->
            <ul class="reset hotabbing">
                <li class="current">热门职位</li>
                <li>最新职位</li>
            </ul>
            <div id="hotList">
                <!--热门-->
                <ul class="hot_pos reset">
                    <li class="clearfix">
                        <div class="hot_pos_l">
                            <div class="mb10">
                                <a href="h/jobs/147822.html" target="_blank">运营总监</a>
                                &nbsp;
                                <span class="c9">[北京]</span>
                            </div>
                            <span><em class="c7">月薪： </em>15k-20k</span>
                            <span><em class="c7">经验：</em> 3-5年</span>
                            <span><em class="c7">最低学历： </em>本科</span>
                            <br/>
                            <span><em class="c7">职位诱惑：</em>发展前景</span>
                            <br/>
                            <span>1天前发布</span>
                            <!-- <a  class="wb">分享到微博</a> -->
                        </div>
                        <div class="hot_pos_r">
                            <div class="mb10 recompany"><a href="h/c/399.html" target="_blank">节操精选</a></div>
                            <span><em class="c7">领域：</em> 移动互联网</span>
                            <span><em class="c7">创始人：</em>陈桦</span>
                            <br/>
                            <span><em class="c7">阶段：</em> 初创型(天使轮)</span>
                            <span><em class="c7">规模：</em>少于15人</span>
                            <ul class="companyTags reset">
                                <li>移动互联网</li>
                                <li>五险一金</li>
                                <li>扁平管理</li>
                            </ul>
                        </div>
                    </li>
                    <a href="list.html" class="btn fr" target="_blank">查看更多</a>
                </ul>
                <!--最新-->
                <ul class="hot_pos hot_posHotPosition reset" style="display:none;">
                    <li class="clearfix">
                        <div class="hot_pos_l">
                            <div class="mb10">
                                <a href="h/jobs/149389.html" target="_blank">高级PHP研发工程师</a>&nbsp;
                                <span class="c9">[南京]</span>
                            </div>
                            <span><em class="c7">月薪： </em>12k-24k</span>
                            <span><em class="c7">经验：</em>3-5年</span>
                            <span><em class="c7">最低学历：</em> 本科</span>
                            <br/>
                            <span><em class="c7">职位诱惑：</em>IPO了的互联网创业公司，潜力无限！</span>
                            <br/>
                            <span>15:11发布</span>
                        </div>
                        <div class="hot_pos_r">
                            <div class="mb10"><a href="h/c/8250.html" target="_blank">途牛旅游网</a></div>
                            <span><em class="c7">领域：</em> 电子商务,在线旅游</span>
                            <span><em class="c7">创始人：</em>于敦德</span>
                            <br/>
                            <span> <em class="c7">阶段： </em>上市公司</span>
                            <span> <em class="c7">规模：</em>500-2000人</span>
                            <ul class="companyTags reset">
                                <li>绩效奖金</li>
                                <li>股票期权</li>
                                <li>五险一金</li>
                            </ul>
                        </div>
                    </li>
                    <a href="list.html?city=%E5%85%A8%E5%9B%BD" class="btn fr" target="_blank">查看更多</a>
                </ul>
            </div>

            <div class="clear"></div>
            <div id="linkbox">
                <dl>
                    <dt>友情链接</dt>
                    <dd>
                        <a href="http://www.zhuqu.com/" target="_blank">住趣家居网</a> <span>|</span>
                        <a href="http://www.woshipm.com/" target="_blank">人人都是产品经理</a> <span>|</span>
                        <a href="http://zaodula.com/" target="_blank">互联网er的早读课</a> <span>|</span>
                        <a href="http://lieyunwang.com/" target="_blank">猎云网</a> <span>|</span>
                        <a href="http://www.ucloud.cn/" target="_blank">UCloud</a> <span>|</span>
                        <a href="http://www.iconfans.com/" target="_blank">iconfans</a> <span>|</span>
                        <a href="http://www.html5dw.com/" target="_blank">html5梦工厂</a> <span>|</span>
                        <a href="http://www.sykong.com/" target="_blank">手游那点事</a>
                    </dd>
                </dl>
            </div>
        </div>
        <div class="clear"></div>
        <input type="hidden" id="resubmitToken" value=""/>
        <a id="backtop" title="回到顶部" rel="nofollow"></a>
    </div>
</div>
<div id="footer">
    <div class="wrapper">
        <a href="h/about.html" target="_blank" rel="nofollow">联系我们</a>
        <a href="h/af/zhaopin.html" target="_blank">互联网公司导航</a>
        <a href="http://e.weibo.com/lagou720" target="_blank" rel="nofollow">拉勾微博</a>
        <a class="footer_qr" href="javascript:void(0)" rel="nofollow">拉勾微信<i></i></a>
        <div class="copyright">&copy;2013-2014 Lagou
            <a target="_blank" href="">京ICP备14023790号-2</a>
        </div>
    </div>
</div>
<%--<script type="text/javascript" src="${path}/static/front/style/js/Chart.min.js"></script>--%>
<script type="text/javascript" src="${path}/static/front/style/js/home.min.js"></script>
<%--<script type="text/javascript" src="${path}/static/front/style/js/count.js"></script>
<script type="text/javascript" src="${path}/static/front/style/js/search.min.js"></script>--%>
<script type="text/javascript" src="${path}/static/front/style/js/core.min.js"></script>
<script type="text/javascript" src="${path}/static/front/style/js/popup.min.js"></script>
</body>
</html>	