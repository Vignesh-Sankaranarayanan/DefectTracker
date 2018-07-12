using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Teradata.Client.Provider;
using System.Data;
using System.Configuration;
using System.Timers;

namespace Defect
{
    public class DataAccesLayer
    {
        string strConnString = ConfigurationManager.ConnectionStrings["Connstr"].ToString();
        
        public static string GetDefectsearch(DateTime fromdate, DateTime todate )
        {
            string query = "Select DefectID,DefectName,Status,sDate as Opendate,sCycle as Cycles,Description,Project,Tester,TestcasesAssosiated,Module,AssignedTo,Filename,Filesize from  coebatch.tbl_Defect where  sDate between '" + fromdate + "' and '" + todate + "'";
            TdCommand cmd = new TdCommand(query);
            return GetData(cmd).GetXml();
        }
        private static DataSet GetData(TdCommand cmd)
        {
            string strConnString = ConfigurationManager.ConnectionStrings["Connstr"].ToString();
            using (TdConnection con = new TdConnection(strConnString))
            {
                using (TdDataAdapter sda = new TdDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataSet ds = new DataSet())
                    {
                        sda.Fill(ds);
                        return ds;

                    }
                }
            }
        }
        public static string GetDefecthistory(int defectid)
        {
            string query = "select * from coebatch.tbl_defect_history where defectid = '" + defectid + "'";
            TdCommand cmd = new TdCommand(query);
            return GetData(cmd).GetXml();
        }

        public int GetDefectcount()
        {
            string query = "";
            int ID = 0;
            TdCommand cmd = new TdCommand(query);
            TdConnection con = new TdConnection(strConnString);
            Teradata.Client.Provider.TdCommand AdvancedDefectSearch =
                       new Teradata.Client.Provider.TdCommand("select count(*) as test  from coebatch.tbl_defect ", con);

            try
            {
                //Open the Connection  to connect to the database
                con.Open();

                //Execute the Query
               //AdvancedDefectSearch.ExecuteNonQuery();
                TdDataReader r = AdvancedDefectSearch.ExecuteReader();
                if (r.Read())
                {
                     query = r["test"].ToString() ;


                }
                r.Close();

                if ( query == "")
                {
                    con.Close();
                    return ID;
                }
                else
                {
                    ID = Convert.ToInt32(query);
                }
              
               
               // nextDefectId = (int)cmdNewDefect.ExecuteScalar();



            }
            catch (TdException ex)
            {

                return ID;
                
            }
            finally
            {
                //Close the Connection from the Database
                con.Close();

            }
            return ID;
           
        }

          public int DefectIDSearch(int  DefectID)
        {
            //Define the Command Object
            int ID =0;
            string defect1 ="";
            //IDDefect = Convert.ToInt32(DefectID);
              TdConnection con = new TdConnection(strConnString);
            Teradata.Client.Provider.TdCommand AdvancedDefectSearch =
                       new Teradata.Client.Provider.TdCommand("Select DefectID from  coebatch.tbl_Defect where  DefectID = " + DefectID + ";", con);

            try
            {
                //Open the Connection  to connect to the database
                con.Open();

                //Execute the Query
               //AdvancedDefectSearch.ExecuteNonQuery();
                TdDataReader r = AdvancedDefectSearch.ExecuteReader();
                if (r.Read())
                {
                     defect1 = r["DefectID"].ToString() ;


                }
                r.Close();

                if ( defect1 == "")
                {
                    con.Close();
                    return ID;
                }
                else
                {
                    ID = 1;
                }
              
               
               // nextDefectId = (int)cmdNewDefect.ExecuteScalar();



            }
            catch (TdException ex)
            {

                return ID;
                
            }
            finally
            {
                //Close the Connection from the Database
                con.Close();

            }
            return ID;

        }
          public int GetAttachid(int DefectID1)
          {
              //Define the Command Object
              int ID = 0;
              string defect1 = "";
              int attachid =1 ;
              //IDDefect = Convert.ToInt32(DefectID);
              TdConnection con = new TdConnection(strConnString);
              Teradata.Client.Provider.TdCommand AdvancedDefectSearch =
                         new Teradata.Client.Provider.TdCommand("Select Max(Attachid) +1 as test from  coebatch.tbl_Attachments where  DefectID = " + DefectID1 + ";", con);

              try
              {
                  //Open the Connection  to connect to the database
                  con.Open();

                  //Execute the Query
                  //AdvancedDefectSearch.ExecuteNonQuery();
                  TdDataReader r = AdvancedDefectSearch.ExecuteReader();
                  if (r.Read())
                  {
                      defect1 = r["test"].ToString();
                      


                  }
                  r.Close();

                  if (defect1 == "")
                  {
                      con.Close();
                      return attachid;
                  }
                  else
                  {
                      attachid =Convert.ToInt32(defect1) ;
                      return attachid;
                  }


                  // nextDefectId = (int)cmdNewDefect.ExecuteScalar();



              }
              catch (TdException ex)
              {

                  return attachid;

              }
              finally
              {
                  //Close the Connection from the Database
                  con.Close();

              }
              return attachid;

          }

          public int GetHistoryid(int DefectID)
          {
              //Define the Command Object
              int ID = 0;
              string defect1 = "";
              //IDDefect = Convert.ToInt32(DefectID);
              TdConnection con = new TdConnection(strConnString);
              Teradata.Client.Provider.TdCommand AdvancedDefectSearch =
                         new Teradata.Client.Provider.TdCommand("Select max(defecthistid)+ 1 as test from  coebatch.tbl_Defect_history where  DefectID = " + DefectID + ";", con);

              try
              {
                  //Open the Connection  to connect to the database
                  con.Open();

                  //Execute the Query
                  //AdvancedDefectSearch.ExecuteNonQuery();
                  TdDataReader r = AdvancedDefectSearch.ExecuteReader();
                  if (r.Read())
                  {
                        defect1 = r["test"].ToString();
                       


                  }
                  r.Close();

                  if (defect1 == "")
                  {
                      con.Close();
                      return ID;
                  }
                  else
                  {
                      ID = Convert.ToInt32(defect1);
                      return ID;
                  }

                  
                  // nextDefectId = (int)cmdNewDefect.ExecuteScalar();



              }
              catch (TdException ex)
              {
                  return ID;
                  throw ex;
                 

              }
              finally
              {
                  //Close the Connection from the Database
                  con.Close();

              }
             

          }
                 
          public void InsertDefect(string Loginuser,int DefectID, String DefectName, TdTimestamp Date, String Status, String Cycle, String Description, String Project, String Tester, String TestcasesAssociated, String Module, String Assignedto,TdTimestamp date1, String filenames, String filesize,Byte Attachments,String environment,String severity,String Projectname,String Rootcause )
          {
              TdConnection con = new TdConnection(strConnString);
             
              
              // Date = CAST(Date AS FORMAT 'YYYY-MM-DD');
             // TdTimestamp dt = new TdTimestamp(Date);
            //  string dts = dt.ToString("MM/dd/yyyy HH:mm:ss");
              
             
             
                 


              //Define the Command Object
              Teradata.Client.Provider.TdCommand cmdAddDefect = new Teradata.Client.Provider.TdCommand(@"INSERT INTO coebatch.tbl_Defect Values('" + DefectID + "','"
                                         + DefectName + "','"
                                         + Date + "','" + Status + "','" + Cycle + "','" + Description + "','" + Project + "','" + Tester + "','" + TestcasesAssociated + "','" + Module + "','" + Assignedto + "','"
                                         + date1 + "','" + filenames + "','" + filesize + "',,'" + environment + "','" + severity + "','" + Projectname + "','" + Rootcause + "')", con);
              int DefectIDD = (int)GetNextDefectID();
              int histid = 1;
              //DefectIDD = DefectIDD - 1;
              Teradata.Client.Provider.TdCommand cmdAddDefectHistory = new Teradata.Client.Provider.TdCommand(@"INSERT INTO coebatch.tbl_Defect_History Values('"
                                        + DefectIDD + "','"
                                        + DefectName + "','"
                                         + Date + "','" + Status + "','" + Cycle + "','" + Description + "','" + Project + "','" + Tester + "','" + TestcasesAssociated + "','" + Module + "','" + Assignedto + "','"
                                         + date1 + "','" + histid + "','" + Loginuser + "','" + environment + "','" + severity + "', '" + Projectname + "','" + Rootcause + "')", con);
                                        


              int intLengt = 0;
              byte[] objDat;
              objDat = new byte[intLengt];
              string DataOb = Convert.ToString(objDat);

              // cmdAddDefect.Parameters.Add(new Teradata.Client.Provider.TdParameter("@Attachments", (object)objDat));
              // cmdAddDefectHistory.Parameters.Add(new Teradata.Client.Provider.TdParameter("@Attachments", (object)objDat));



              try
              {
                  //Open the Connection  to connect to the database
                  con.Open();
                  //Execute the Query
                  cmdAddDefect.ExecuteNonQuery();
                  cmdAddDefectHistory.ExecuteNonQuery();

              }
              catch (Teradata.Client.Provider.TdException ex)
              {

                  throw ex;
              }
              finally
              {
                  //Close the Connection from the Database
                  con.Close();

              }
          }

          public int InsertLogin(string Loginuser, string Password)
          {
              TdConnection con = new TdConnection(strConnString);


              int id = 0;


              //Define the Command Object
              Teradata.Client.Provider.TdCommand cmdAddLogin = new Teradata.Client.Provider.TdCommand(@"INSERT INTO coebatch.tbl_Login Values('" + Loginuser + "','"
                                         + Password + "')", con);
                                         
              

              try
              {
                  //Open the Connection  to connect to the database
                  con.Open();
                  //Execute the Query

                  cmdAddLogin.ExecuteNonQuery();
                  id = 1;
                  return id;
 
                      
                 

              }
              catch (Teradata.Client.Provider.TdException ex)
              {

                  throw ex;
                  
              }
              finally
              {
                  //Close the Connection from the Database
                  con.Close();
                  

              }
              return id;
          }

          public int AddAttachments(string text, string filename, int Defectid1, int id1)
          {
              TdConnection con = new TdConnection(strConnString);


              int id = 0;


              //Define the Command Object
              Teradata.Client.Provider.TdCommand cmdAddAttach = new Teradata.Client.Provider.TdCommand(@"INSERT INTO coebatch.tbl_Attachments Values('" + text + "','"
                                         + filename + "',"
                                         + Defectid1 + ","
                                         + id1 + " )", con);


              try
              {
                  //Open the Connection  to connect to the database
                  con.Open();
                  //Execute the Query

                  cmdAddAttach.ExecuteNonQuery();
                  id = 1;
                  return id;




              }
              catch (Teradata.Client.Provider.TdException ex)
              {

                  throw ex;

              }
              finally
              {
                  //Close the Connection from the Database
                  con.Close();


              }
              return id;
          }

          public TdDataAdapter DefectSearch(int DefectID)
          {
              //Define the Command Object
              int ID = 0;
              string defect1 = "";
              //IDDefect = Convert.ToInt32(DefectID);
              TdConnection con = new TdConnection(strConnString);
              Teradata.Client.Provider.TdDataAdapter AdvancedDefectSearch =
                         new Teradata.Client.Provider.TdDataAdapter("Select * from  coebatch.tbl_Defect where  DefectID = " + DefectID + ";", con);

              try
              {
                  //Open the Connection  to connect to the database
                  con.Open();

                  //Execute the Query
                  //AdvancedDefectSearch.ExecuteNonQuery();
                  //TdDataReader r = AdvancedDefectSearch.ExecuteReader();
                  //if (r.Read())
                  //{
                  //    defect1 = r["DefectID"].ToString();


                  //}
                  //r.Close();

                  //if (defect1 == "")
                  //{
                  //    con.Close();
                  //    return ID;
                  //}
                  //else
                  //{
                  //    ID = 1;
                  //}


                  // nextDefectId = (int)cmdNewDefect.ExecuteScalar();



              }
              catch (TdException ex)
              {

                 // return ID;

              }
              finally
              {
                  //Close the Connection from the Database
                  con.Close();

              }
              return AdvancedDefectSearch;

          }
          public TdDataAdapter DefectHome()
          {
              //Define the Command Object
              int ID = 0;
              string defect1 = "";
              //IDDefect = Convert.ToInt32(DefectID);
              TdConnection con = new TdConnection(strConnString);
              Teradata.Client.Provider.TdDataAdapter AdvancedDefectSearch =
                         new Teradata.Client.Provider.TdDataAdapter("Select * from  coebatch.tbl_Defect ;", con);

              try
              {
                  //Open the Connection  to connect to the database
                  con.Open();

                  //Execute the Query
                  //AdvancedDefectSearch.ExecuteNonQuery();
                  //TdDataReader r = AdvancedDefectSearch.ExecuteReader();
                  //if (r.Read())
                  //{
                  //    defect1 = r["DefectID"].ToString();


                  //}
                  //r.Close();

                  //if (defect1 == "")
                  //{
                  //    con.Close();
                  //    return ID;
                  //}
                  //else
                  //{
                  //    ID = 1;
                  //}


                  // nextDefectId = (int)cmdNewDefect.ExecuteScalar();



              }
              catch (TdException ex)
              {
                  throw ex;
                  // return ID;

              }
              finally
              {
                  //Close the Connection from the Database
                  con.Close();

              }
              return AdvancedDefectSearch;

          }
          public TdDataAdapter Usersearch(string Username,string password)
          {
              //Define the Command Object
              int ID = 0;
              string defect1 = "";
              //IDDefect = Convert.ToInt32(DefectID);
              TdConnection con = new TdConnection(strConnString);
              Teradata.Client.Provider.TdDataAdapter AdvancedDefectSearch =
                         new Teradata.Client.Provider.TdDataAdapter("Select * from  coebatch.tbl_Login where  Username = '" + Username + "' and Password1 = '" + password + "';", con);

              try
              {
                  //Open the Connection  to connect to the database
                  con.Open();
                  return AdvancedDefectSearch;
                  //Execute the Query
                  //AdvancedDefectSearch.ExecuteNonQuery();
                  //TdDataReader r = AdvancedDefectSearch.ExecuteReader();
                  //if (r.Read())
                  //{
                  //    defect1 = r["DefectID"].ToString();


                  //}
                  //r.Close();

                  //if (defect1 == "")
                  //{
                  //    con.Close();
                  //    return ID;
                  //}
                  //else
                  //{
                  //    ID = 1;
                  //}


                  // nextDefectId = (int)cmdNewDefect.ExecuteScalar();



              }
              catch (TdException ex)
              {

                  // return ID;

              }
              finally
              {
                  //Close the Connection from the Database
                 
                  con.Close();

              }
              return AdvancedDefectSearch;

          }

          public TdDataAdapter GetAttachments(int Defectid)
          {
              //Define the Command Object
              int ID = 0;
              string defect1 = "";
              //IDDefect = Convert.ToInt32(DefectID);
              TdConnection con = new TdConnection(strConnString);
              Teradata.Client.Provider.TdDataAdapter AdvancedDefectSearch =
                         new Teradata.Client.Provider.TdDataAdapter("Select Path from  coebatch.tbl_Attachments where  DefectID = " + Defectid + ";", con);

              try
              {
                  //Open the Connection  to connect to the database
                  con.Open();
                  return AdvancedDefectSearch;

                  //Execute the Query
                  //AdvancedDefectSearch.ExecuteNonQuery();
                  //TdDataReader r = AdvancedDefectSearch.ExecuteReader();
                  //if (r.Read())
                  //{
                  //    defect1 = r["DefectID"].ToString();


                  //}
                  //r.Close();

                  //if (defect1 == "")
                  //{
                  //    con.Close();
                  //    return ID;
                  //}
                  //else
                  //{
                  //    ID = 1;
                  //}


                  // nextDefectId = (int)cmdNewDefect.ExecuteScalar();



              }
              catch (TdException ex)
              {

                  // return ID;

              }
              finally
              {
                  //Close the Connection from the Database
                  con.Close();

              }
              return AdvancedDefectSearch;

          }
          public TdDataAdapter GetComments(int DefectID)
          {
              //Define the Command Object
              int ID = 0;
              string defect1 = "";
              //IDDefect = Convert.ToInt32(DefectID);
              TdConnection con = new TdConnection(strConnString);
              Teradata.Client.Provider.TdDataAdapter AdvancedDefectSearch =
                         new Teradata.Client.Provider.TdDataAdapter("Select Comments,Sdate as LastUpdatedDate,Loginuser from  coebatch.tbl_comments where  DefectID = " + DefectID + " order by sdate asc;", con);

              try
              {
                  //Open the Connection  to connect to the database
                  con.Open();

                  //Execute the Query
                  //AdvancedDefectSearch.ExecuteNonQuery();
                  //TdDataReader r = AdvancedDefectSearch.ExecuteReader();
                  //if (r.Read())
                  //{
                  //    defect1 = r["DefectID"].ToString();


                  //}
                  //r.Close();

                  //if (defect1 == "")
                  //{
                  //    con.Close();
                  //    return ID;
                  //}
                  //else
                  //{
                  //    ID = 1;
                  //}


                  // nextDefectId = (int)cmdNewDefect.ExecuteScalar();



              }
              catch (TdException ex)
              {

                  // return ID;

              }
              finally
              {
                  //Close the Connection from the Database
                  con.Close();

              }
              return AdvancedDefectSearch;

          }
        
        
       
          public int GetNextDefectID()
          {

              TdConnection con = new TdConnection(strConnString);

         Teradata.Client.Provider.TdCommand cmdNewDefect = new Teradata.Client.Provider.TdCommand("SELECT MAX(DefectId)+1 as test FROM coebatch.tbl_Defect", con);
            int nextDefectId = 0;
              string defectid ="";

           
            try
            {
                //Open the Connection  to connect to the database
                con.Open();
                //Execute the Query
                //nextDefectId = (int)cmdNewDefect.ExecuteScalar();
                TdDataReader r = cmdNewDefect.ExecuteReader();
                if (r.Read())
                {
                    defectid = r["test"].ToString();


                }
                r.Close();

               // nextDefectId = cmdNewDefect.ExecuteScalar();
                if (defectid == "")
                {
                    nextDefectId = 1;

                }
                else
                {
                    nextDefectId = Convert.ToInt32(defectid);

                }
                


            }
            catch (Teradata.Client.Provider.TdException ex)
            {
                //Throw the exception to calling environment
                throw ex;
            }
            finally
            {
                //Close the Connection from the Database
                con.Close();
            }
            return nextDefectId;
        }

          public void UpdateDefect(string Comments, string LoginUser, int DefectID, String DefectName, TdTimestamp Date, String Status, String Cycle, String Description, String Project, String Tester, String TestcasesAssociated, String Module, String Assignedto, TdTimestamp sysdate, String filenames, String filesize, Byte Attachments, int histid,String environment, String Severity,String Projectname,String Rootcause )
          {
              TdConnection con = new TdConnection(strConnString);

              Teradata.Client.Provider.TdCommand cmdUpdateDefect =
                       new Teradata.Client.Provider.TdCommand(@"Update coebatch.tbl_Defect set DefectName='" + DefectName + "' ,Status='" + Status + "',SCycle ='" + Cycle + "',Description='" + Description + "',Project='" + Project + "',Tester='" + Tester + "',TestcasesAssociated='" + TestcasesAssociated + "',Module='" + Module + "',AssignedTo='" + Assignedto + "',CloseDate='" + sysdate + "', Environment = '" + environment + "' , Severity = '" + Severity + "', Releases = '" + Projectname + "',Rootcause = '" + Rootcause + "' where DefectID= '" + DefectID + "'", con);
              Teradata.Client.Provider.TdCommand cmdInsertComments =
                        new Teradata.Client.Provider.TdCommand(@"Insert into  coebatch.tbl_Comments Values ('" + DefectID + "','" + Comments + "','" + sysdate + "', '" + LoginUser + "' )", con);
              DateTime Datetimestamp = DateTime.Now;
             
              Teradata.Client.Provider.TdCommand cmdUpdateDefectHistory =
                            new Teradata.Client.Provider.TdCommand(@"Insert into coebatch.tbl_Defect_History Values('" + DefectID + "','" + DefectName + "' ,'" + Date + "','" + Status + "','" + Cycle + "','" + Description + "','" + Project + "','" + Tester + "','" + TestcasesAssociated + "','" + Module + "','" + Assignedto + "','" + sysdate + "','" + histid + "','" + LoginUser + "', '" + environment + "' , '" + Severity + "','" + Projectname + "','" + Rootcause + "') ", con);


              try
              {
                  //Open the Connection  to connect to the database
                  con.Open();
                 
                  //Execute the Query
                  cmdUpdateDefect.ExecuteNonQuery();
                  cmdInsertComments.ExecuteNonQuery();
                  cmdUpdateDefectHistory.ExecuteNonQuery();



              }
              catch (TdException ex)
              {

                  throw ex;
              }
              finally
              {
                  //Close the Connection from the Database
                  con.Close();

              }




          }


    }

    }
