using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using FunctionGroupMenuSrc;
using FunctionGroupMenu.EF;

namespace FunctionGroupMenu
{
    public partial class FunctionGroupMenu : System.Web.UI.Page
    {
        FunctionGroupMenuDAO dao = new FunctionGroupMenuDAO();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string accYear = "106";
                int userNo = int.Parse(Session["userNo"].ToString());
                int PermitUserNo = int.Parse(Session["PermitUserNo"].ToString());
                string userInfoJSON;
                string userFuncGrpJSON;
                string userNoticeJSON;


                //若登入者為臨時帳號，需尋找此臨時帳號之對應權限號
                if (userNo > 10000)
                {
                    userNo = PermitUserNo;
                }

                userInfoJSON = getUserInfo(accYear, userNo);
                userFuncGrpJSON = getUserFuncGrp(accYear, userNo);
                userNoticeJSON = getNotice(userNo);

                //使用者資訊JSON
                Session["userInfoJSON"] = userInfoJSON;

                //使用者功能群組JSON
                Session["userFuncGrp"] = userFuncGrpJSON;

                //公告JSON
                Session["userNoticeJSON"] = userNoticeJSON;


            }

        }

        /// <summary>
        /// 取使用者功能群組
        /// </summary>
        /// <param name="userNo"></param>
        /// <returns></returns>
        protected string getUserFuncGrp(string accYear, int userNo)
        {
            IQueryable<Pow_User_FuncGrp> getUserFunctionGrp = dao.getUserFunctionGrp(x => x.FK_UserNo == userNo && x.PK_AccYear == accYear);
            IQueryable<Pow_FuncGrp> getFunctionGrpName = dao.getFunctionGrpName(x => 1 == 1);

            var userFuncGrp = from s1 in getUserFunctionGrp
                              join s2 in getFunctionGrpName on s1.FK_FuncGrpNo equals s2.PK_FuncGrpNo
                              select new { s2.PK_FuncGrpNo, s2.FuncGrpName, s2.FuncGrpURL1, s2.FuncGrpURL2 };

            return JsonConvert.SerializeObject(userFuncGrp);
        }

        /// <summary>
        /// 取使用者資訊
        /// </summary>
        /// <param name="userNo"></param>
        /// <returns></returns>
        protected string getUserInfo(string accYear, int userNo)
        {
            IQueryable<Pow_User> getUserName = dao.getUserName(x => x.PK_UserNo == userNo && x.PK_AccYear == accYear);
            IQueryable<Pow_User_Level> getUserPow = dao.getUserPow(x => x.FK_UserNo == userNo);
            IQueryable<Pow_Level> getUserPowName = dao.getUserPowName(x => 1 == 1);

            var userPow = from s1 in getUserPow
                          join s2 in getUserPowName on s1.FK_LevelNo equals s2.PK_LevelNo
                          select new { s1.FK_UserNo, s2.PK_LevelNo, s2.LevelName };

            var userInfo = (from s1 in getUserName
                            join s2 in userPow on s1.PK_UserNo equals s2.FK_UserNo
                            select new { s1.PK_AccYear, s1.UserName, s1.UnitName_AD, s1.DptName_AD, s2.LevelName }).First();

            return JsonConvert.SerializeObject(userInfo);
        }

        /// <summary>
        /// 取組室公告
        /// </summary>
        /// <param name="userNo"></param>
        /// <returns></returns>
        protected string getNotice(int userNo)
        {
            IQueryable<Pow_User_DptSet> getUserDptSet = dao.getUserDptSet(x => x.FK_UserNo == userNo);
            IQueryable<Notice_Detail> getNoticeDetail = dao.getNoticeDetail(x => 1 == 1);
            IQueryable<Notice_Main> getNoticeMain = dao.getNoticeMain(x => 1 == 1);
            IQueryable<Notice_Kind> getNoticeKindName = dao.getNoticeKindName(x => 1 == 1);

            var userNoticeNo = from s1 in getUserDptSet
                               join s2 in getNoticeDetail on s1.FK_DptNo equals s2.FK_DptNo
                               select new { s2.FK_NoticeKind, s2.PK_NoticeNo };

            var userNotice = from s1 in userNoticeNo
                             join s2 in getNoticeMain on new { s1.FK_NoticeKind, s1.PK_NoticeNo } equals new { s2.FK_NoticeKind, s2.PK_NoticeNo }
                             //orderby s2.NoticeTime descending
                             select s2;

            var userNoticeWithKindName = from s1 in userNotice
                                         join s2 in getNoticeKindName on s1.FK_NoticeKind equals s2.PK_NoticeKind
                                         orderby s1.NoticeTime descending
                                         select new { s1.FK_NoticeKind, s2.NoticeKindName, s1.PK_NoticeNo, s1.NoticeAccYear, s1.NoticeTime, s1.StartDay, s1.EndDay, s1.NoticeTitle, s1.NoticeMemo, s1.NoticeUser };


            return JsonConvert.SerializeObject(userNoticeWithKindName);
        }
    }
}
