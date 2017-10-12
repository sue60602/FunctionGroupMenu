<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FunctionGroupMenu.aspx.cs" Inherits="FunctionGroupMenu.FunctionGroupMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" id="ng-app" ng-app="myApp">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <meta http-equiv="cache-control" content="no-cache" />
    <%--<meta http-equiv="X-UA-Compatible" content="IE=9" />--%>

    <%--<script src="http://cdnjs.cloudflare.com/ajax/libs/json3/3.2.4/json3.min.js"></script>--%>
    
    <title>Document</title>
        <!-- Bootstrap 3-->
        <!-- <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-theme.min.css" rel="stylesheet"> -->

        <!-- Bootstrap 4-->
        <link rel="stylesheet" href="css/bootstrap4/bootstrap.min.css">            
        <!--免費icon-->
        <link rel="stylesheet" href="styles/font-awesome/css/font-awesome.min.css">
        <%--SoA的css--%>
        <link rel="stylesheet" href="styles/FundGroupMenu.css" />
   
        <!-- 依需要參考已編譯外掛版本（如下），或各自獨立的外掛版本 -->
        <!-- jQuery (Bootstrap 所有外掛均需要使用) -->
        <script src="scripts/json3.min.js"></script>
        <script src="scripts/jquery-3.2.1.min.js"></script>
        <script src="scripts/popper.min.js"></script>
        <script src="scripts/bootstrap-4.0.min.js"></script>
        <script src="scripts/angular.min.js"></script>
        <script src="scripts/angular-route.min.js"></script>

        <style>
             /*.row div{
                border: 1px solid #000000;
            }*/ 
             /*body {
                background-color: rgb(224, 243, 224);
            }*/
        </style>
</head>
<body ng-controller="customersCtrl">

    <div class="container-fluid header-fluid">
        <div class="container">
            <div class="row">            
                <div class="col-xs-6 col-md-6 col-lg-6"><img src="images/wda_logo.png"></div>
                <div class="col-xs-6 col-md-5 col-lg-5 user-info">
                    年度：{{userInfo.PK_AccYear}}<br />
                    姓名：{{userInfo.UserName}}[{{userInfo.LevelName}}]<br />
                    機關所屬：{{userInfo.UnitName_AD}}-{{userInfo.DptName_AD}}
                </div>
                <div class="col-xs-6 col-md-1 col-lg-1 ">
                    <a href="{{sysURL}}" target="_blank" ng-if="group_0_display" class="sys-config"><i class="fa fa-cog"></i></a>                    
                </div>
            </div>
        </div>
    </div>

    <%--內容START--%>
    <div class="container content">       
        <div class="row">
            <div class="col-12">
                <div class="row">
                    <div class="col-4">
                        <h4 class="title"><i class="fa fa-calendar-o"></i>公告</h4>
                        <table class="table table-striped table-hover border rounded">
                            <thead>
                                <tr>
                                <th>日期</th>
                                <th>標題</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat="x in items">
                                    <td>{{x.NoticeTime}}</td>
                                    <td>
                                        <a href="" data-toggle="modal" data-target="#{{x.FK_NoticeKind + x.PK_NoticeNo}}">
                                            <span class="badge badge-secondary badge-danger" ng-show="'{{x.NoticeTime}}' > '{{RangDate}}'">New</span>【{{x.NoticeKindName}}】{{x.NoticeTitle}}
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!--分頁列-->
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <li class="page-item"><a class="page-link" ng-click="Previous()" href="#">上一頁</a></li>
                                <li class="page-item" ng-repeat="page in pageList" ng-class="{active: isActivePage(page)}">
                                    <a class="page-link" ng-click="selectPage(page)" href="#">{{page}}</a></li>
                                <li class="page-item"><a class="page-link" ng-click="Next()" href="#">下一頁</a></li>
                            </ul>
                        </nav>

                    </div>
                    <%--功能MENU start--%>
                    <div class="col-8">
                        <%---------預算控制類-------------%>
                        <div class="row" ng-if="group_1_display">
                            <div class="col-12" ><h4 class="title"><i class="fa fa-calculator"></i>{{group_1_Name}}</h4></div>
                        </div>
                        <div class="row func-group">                  
                            <div class="col-3" ng-repeat="x in group_1_Layout">
                                <img class="fund-img img-thumbnail" src="images/p{{x.PK_FuncGrpNo}}.jpeg"/>
                                <div class="list-group url-group">
                                    <a href="{{x.FuncGrpURL1}}" target="_blank" class="list-group-item list-group-item-action"><i class="fa fa-caret-right" aria-hidden="true"></i>{{x.FuncGrpName}}<span ng-if="x.FuncGrpURL2">-勻支</span></a>
                                    <a href="{{x.FuncGrpURL2}}" target="_blank" class="list-group-item list-group-item-action" ng-if="x.FuncGrpURL2"><i class="fa fa-caret-right" aria-hidden="true"></i>{{x.FuncGrpName}}<span ng-if="x.FuncGrpURL2">-流用</span></a>
                                </div> 
                            </div>
                        </div>
                        <%---------會計帳務類-------------%>
                        <div class="row" ng-if="group_2_display">
                            <div class="col-12"><h4 class="title"><i class="fa fa-bar-chart"></i>{{group_2_Name}}</h4></div>
                        </div>
                        <div class="row func-group">                  
                            <div class="col-3" ng-repeat="x in group_2_Layout">
                                <img class="func-img img-thumbnail" src="images/p{{x.PK_FuncGrpNo}}.jpeg"/>
                                <div class="list-group url-group">
                                    <a href="{{x.FuncGrpURL1}}" target="_blank" class="list-group-item list-group-item-action"><i class="fa fa-caret-right" aria-hidden="true"></i>{{x.FuncGrpName}}<span ng-if="x.FuncGrpURL2">-勻支</span></a>
                                    <a href="{{x.FuncGrpURL2}}" target="_blank" class="list-group-item list-group-item-action" ng-if="x.FuncGrpURL2"><i class="fa fa-caret-right" aria-hidden="true"></i>{{x.FuncGrpName}}<span ng-if="x.FuncGrpURL2">-流用</span></a>
                                </div> 
                            </div>
                        </div>
                        <%---------其他類-------------%>
                        <div class="row" ng-if="group_3_display">
                            <div class="col-12"><h4 class="title"><i class="fa fa-search"></i>{{group_3_Name}}</h4></div>
                        </div>
                        <div class="row func-group">                  
                            <div class="col-3" ng-repeat="x in group_3_Layout">
                                <img class="func-img img-thumbnail" src="images/p{{x.PK_FuncGrpNo}}.jpeg"/>
                                <div class="list-group url-group">
                                    <a href="{{x.FuncGrpURL1}}" target="_blank" class="list-group-item list-group-item-action"><i class="fa fa-caret-right" aria-hidden="true"></i>{{x.FuncGrpName}}<span ng-if="x.FuncGrpURL2">-勻支</span></a>
                                    <a href="{{x.FuncGrpURL2}}" target="_blank" class="list-group-item list-group-item-action" ng-if="x.FuncGrpURL2"><i class="fa fa-caret-right" aria-hidden="true"></i>{{x.FuncGrpName}}<span ng-if="x.FuncGrpURL2">-流用</span></a>
                                </div> 
                            </div>
                        </div>
                        <%----------------------%>
                    </div>
                    <%--功能MENU End--%>
                </div>
            </div>
        </div>            
    </div>
    <%--內容END--%>

    <%--頁尾START--%>
    <div class="container-fluid footer-fluid">
        <div class="container">
            <div class="row">            
                <div class="col-12">                    
                    建議瀏覽器：Chrome、FireFox、Safari及IE 10.0(含)以上版本<br />
                    勞動力發展署： 24219   新北市新莊區中平路439號南棟4樓 <br />
                    電話代表號：(02)8995-6000 <br />
                    本署服務時間：週一至週五　上午8時30分至12時30分，下午1時30分至5時30分
                </div>
            </div>
        </div>
    </div>
    <%--頁尾END--%>  

    <!-- 公告明細視窗START -->
    <div ng-repeat="x in userNotice">
        <div class="modal fade" id="{{x.FK_NoticeKind + x.PK_NoticeNo}}" tabindex="-1" role="dialog"  aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">{{x.NoticeTitle}}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                {{x.NoticeMemo}}
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
    </div>
    <!-- 公告明細視窗END -->


    <script>        
        var app = angular.module('myApp', ['ngRoute']);
        app.controller('customersCtrl', function ($scope, $http) {

            //取使用者資訊JSON
            $scope.userInfo = <%=Session["userInfoJSON"]%>;
            //console.log($scope.userInfo);
            //for(let userInfoIndex in $scope.userInfo)
            //{
            //    let userInfoValue = $scope.userInfo[userInfoIndex];

            //    $scope.PK_AccYear = userInfoValue.PK_AccYear;
            //    $scope.UserName = userInfoValue.UserName;
            //    $scope.DptName_AD = userInfoValue.DptName_AD;
            //    $scope.UserTitle_AD = userInfoValue.UserTitle_AD;

            //}

            //定義權限類別位置
            var group_0 = [0];
            var group_1 = [1, 2, 3, 4];
            var group_2 = [5, 6, 7, 8];
            var group_3 = [9, 10];

            //宣告分類
            $scope.group_1_Layout = [];
            $scope.group_2_Layout = [];
            $scope.group_3_Layout = [];

            //初始類別隱藏
            $scope.group_0_display = false;
            $scope.group_1_display = false;
            $scope.group_2_display = false;
            $scope.group_3_display = false;

            //從後端取功能群組JSON
            $scope.userPower = <%=Session["userFuncGrp"]%>;         
            //console.log($scope.userPower);
            for(var userPowerIndex in $scope.userPower)
            {                        
                var powValueJSON = $scope.userPower[userPowerIndex];
                //console.log(powValueJSON)

                //includes指令不適用於IE瀏覽器
                //if(group_0.includes(powValueJSON.PK_FuncGrpNo)) {
                //    $scope.group_0_display = true;
                //    $scope.sysURL=powValueJSON.FuncGrpURL1;
                //}
                //if(group_1.includes(powValueJSON.PK_FuncGrpNo))
                //{
                //    $scope.group_1_display = true;
                //    $scope.group_1_Name = "預算控制類";
                //    $scope.group_1_Layout.push(powValueJSON);
                //}
                //if(group_2.includes(powValueJSON.PK_FuncGrpNo))
                //{
                //    $scope.group_2_display = true;
                //    $scope.group_2_Name = "會計帳務類";
                //    $scope.group_2_Layout.push(powValueJSON);
                //}
                //if(group_3.includes(powValueJSON.PK_FuncGrpNo))
                //{
                //    $scope.group_3_display = true;
                //    $scope.group_3_Name = "其他類";
                //    $scope.group_3_Layout.push(powValueJSON);
                //}

                if(group_0.indexOf(powValueJSON.PK_FuncGrpNo) >= 0) 
                {
                    $scope.group_0_display = true;
                    $scope.sysURL=powValueJSON.FuncGrpURL1;
                }
                if(group_1.indexOf(powValueJSON.PK_FuncGrpNo) >= 0) 
                {
                        $scope.group_1_display = true;
                        $scope.group_1_Name = "預算控制類";
                        $scope.group_1_Layout.push(powValueJSON);
                }
                if(group_2.indexOf(powValueJSON.PK_FuncGrpNo) >= 0)
                {
                    $scope.group_2_display = true;
                    $scope.group_2_Name = "會計帳務類";
                    $scope.group_2_Layout.push(powValueJSON);
                }
                if(group_3.indexOf(powValueJSON.PK_FuncGrpNo) >= 0)
                {
                    $scope.group_3_display = true;
                    $scope.group_3_Name = "其他類";
                    $scope.group_3_Layout.push(powValueJSON);
                }
            }

            //從後端取公告JSON
            $scope.userNotice = <%=Session["userNoticeJSON"]%>;

            //======設定5天內之公告標示NEW====================            
            var rangeDay = 5;
            var nowDate = new Date();
            var DifferenceDate =  new Date(nowDate.valueOf() - (rangeDay * 24 * 60 * 60 * 1000))
            var yyyy = DifferenceDate.getFullYear();
            var mm = DifferenceDate.getMonth()+1;
            var dd = DifferenceDate.getDate();
            //將日期格式調整為yyyy/mm/dd
            $scope.RangDate = yyyy+'/'+ (mm>9 ? '' : '0') + mm+'/'+(dd>9 ? '' : '0') + dd;
            
            //console.log($scope.RangDate);
            //======設定5天內之公告標示NEW====================

            //====處理公告分頁START=======
            //設定公告每頁最大筆數
            $scope.pageSize = 10;
            //計算共幾頁
            $scope.pages = Math.ceil($scope.userNotice.length / $scope.pageSize);
            //最多列出5頁可選
            $scope.newPages = $scope.pages > 5 ? 5 : $scope.pages;

            $scope.pageList = [];
            //預設印第一頁
            $scope.selPage = 1;

            //用slice擷取每頁內容
            $scope.setData = function () {
                $scope.items = $scope.userNotice.slice(($scope.pageSize * ($scope.selPage - 1)), ($scope.selPage * $scope.pageSize));
            }
            $scope.items = $scope.userNotice.slice(0, $scope.pageSize);
            for (var i = 0; i < $scope.newPages; i++) {
                $scope.pageList.push(i + 1);
            }
            $scope.selectPage = function (page) {
                //不能小於1或是大於最大
                if (page < 1 || page > $scope.pages) return;
                //最多顯示分頁5
                if (page > 2) {
                    //大於2頁開始轉換
                    var newpageList = [];
                    for (var i = (page - 3) ; i < ((page + 2) > $scope.pages ? $scope.pages : (page + 2)) ; i++) {
                        newpageList.push(i + 1);
                    }
                    $scope.pageList = newpageList;
                }
                $scope.selPage = page;
                $scope.setData();
                $scope.isActivePage(page);
                //console.log("選擇頁：" + page);
            };

            //選取中的樣式
            $scope.isActivePage = function (page) {
                return $scope.selPage == page;
            };
            //上一頁
            $scope.Previous = function () {
                $scope.selectPage($scope.selPage - 1);
            }
            //下一頁
            $scope.Next = function () {
                $scope.selectPage($scope.selPage + 1);
            };
            //====處理公告分頁END=======

        });

    </script>
</body>
</html>
