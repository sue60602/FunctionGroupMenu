//------------------------------------------------------------------------------
// <auto-generated>
//     這個程式碼是由範本產生。
//
//     對這個檔案進行手動變更可能導致您的應用程式產生未預期的行為。
//     如果重新產生程式碼，將會覆寫對這個檔案的手動變更。
// </auto-generated>
//------------------------------------------------------------------------------

namespace FunctionGroupMenu.EF
{
    using System;
    using System.Collections.Generic;
    
    public partial class Data_VouPayee
    {
        public string PK_AccYear { get; set; }
        public string FK_FundNo { get; set; }
        public string FK_UnitNo { get; set; }
        public string PK_AccType { get; set; }
        public int PK_AccMainNo { get; set; }
        public int PK_OrderNo { get; set; }
        public Nullable<int> FK_DetailNo { get; set; }
        public string IDNo { get; set; }
        public string UnifyNo { get; set; }
        public string PayeeName { get; set; }
        public string PayTypeNo { get; set; }
        public Nullable<int> PayListNo { get; set; }
        public string AreaCode { get; set; }
        public string PayAddress { get; set; }
        public string E_Mail { get; set; }
        public string Tel { get; set; }
        public Nullable<long> PayeeAmount { get; set; }
        public string BankNo { get; set; }
        public string BankName { get; set; }
        public string AccountNo { get; set; }
        public string AccountName { get; set; }
        public string CheckNo { get; set; }
        public string FK_ChequeReasonNo { get; set; }
        public string ReceiptType { get; set; }
        public string MemoItem_Payee { get; set; }
        public string PayWay_Payee { get; set; }
        public string Remark1_Payee { get; set; }
        public Nullable<System.DateTime> EffectiveDate_Payee { get; set; }
        public string CaseKindNo_Payee { get; set; }
    }
}
