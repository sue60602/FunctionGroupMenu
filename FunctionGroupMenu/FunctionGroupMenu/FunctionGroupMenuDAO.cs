using FunctionGroupMenu;
using FunctionGroupMenu.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;

namespace FunctionGroupMenuSrc
{
    public class FunctionGroupMenuDAO
    {
        ESFAccEntities db = new ESFAccEntities();

        //查詢功能群組
        public IQueryable<Pow_User_FuncGrp> getUserFunctionGrp(Expression<Func<Pow_User_FuncGrp, bool>> condition)
        {
            var result = from s1 in db.Pow_User_FuncGrp select s1;

            return result.Where(condition);
        }

        //查詢功能群組名稱
        public IQueryable<Pow_FuncGrp> getFunctionGrpName(Expression<Func<Pow_FuncGrp, bool>> condition)
        {
            var result = from s1 in db.Pow_FuncGrp select s1;

            return result.Where(condition);
        }

        //查詢登入者資訊
        public IQueryable<Pow_User> getUserName(Expression<Func<Pow_User, bool>> condition)
        {
            var result = from s1 in db.Pow_User select s1;

            return result.Where(condition);
        }

        //查詢身分代碼
        public IQueryable<Pow_User_Level> getUserPow(Expression<Func<Pow_User_Level, bool>> condition)
        {
            var result = from s1 in db.Pow_User_Level select s1;

            return result.Where(condition);
        }
        //查詢身分名稱
        public IQueryable<Pow_Level> getUserPowName(Expression<Func<Pow_Level, bool>> condition)
        {
            var result = from s1 in db.Pow_Level select s1;

            return result.Where(condition);
        }

        //查詢人員業務組室
        public IQueryable<Pow_User_DptSet> getUserDptSet(Expression<Func<Pow_User_DptSet, bool>> condition)
        {
            var result = from s1 in db.Pow_User_DptSet select s1;

            return result.Where(condition);
        }

        //查詢業務組室關聯之公告主號
        public IQueryable<Notice_Detail> getNoticeDetail(Expression<Func<Notice_Detail, bool>> condition)
        {
            var result = from s1 in db.Notice_Detail select s1;

            return result.Where(condition);
        }

        //查詢業務組室關聯之公告主號
        public IQueryable<Notice_Main> getNoticeMain(Expression<Func<Notice_Main, bool>> condition)
        {
            var result = from s1 in db.Notice_Main select s1;

            return result.Where(condition);
        }

        //查詢公告種類名稱
        public IQueryable<Notice_Kind> getNoticeKindName(Expression<Func<Notice_Kind, bool>> condition)
        {
            var result = from s1 in db.Notice_Kind select s1;

            return result.Where(condition);
        }
    }
}