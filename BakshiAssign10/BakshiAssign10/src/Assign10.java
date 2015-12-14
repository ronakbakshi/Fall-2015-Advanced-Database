
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
import javax.sql.DataSource;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Ronak Bakshi
 */
public class Assign10 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) 
    {       
        Connection conn = null;
        DataSource ds = null;        
        CallableStatement dbStatement = null;
        Statement state = null;
	ResultSet dbResultSet = null;
        
        //String query = "select ISBN,TITLE from tblBooks";
        
        Scanner reader = new Scanner(System.in);  // Reading from System.in
        System.out.print("Enter the database name (SID/Service): ");
        String dbName = reader.nextLine(); 
        System.out.print("Enter the user name: ");
        String username = reader.nextLine();
        System.out.print("Enter the passowrd: ");
        String password = reader.nextLine();
        String url ="jdbc:oracle:thin:@localhost:1521/"+dbName;
        
        try
        {            
            conn = DriverManager.getConnection(url, username, password);
            System.out.println("Connection successful");
            //ds = DataSourceCreator.getDataSource();
            //conn = ds.getConnection(username,password);
            //dbStatement = conn.createStatement(); 
        }
            catch(SQLException ex)
        {
               System.out.println("Connection is not set " + ex.getMessage());
        }
        
        try
        {
            dbStatement = conn.prepareCall("call ADDNEWBULDING('Shamrock Apartments','1644 N Grand Ave, Maryville',1)");
            System.out.println("CallableStatement created");
            //dbStatement.executeUpdate();            
        }
        catch(SQLException ex)
        {
            System.out.println(ex);
                
        }
        
        try
        {
            dbStatement = conn.prepareCall("call deleteLeaseHolder(9012)");
            System.out.println("CallableStatement created");
            dbStatement.executeUpdate();            
            dbStatement.close();
        }
        catch(SQLException ex)
        {
            System.out.println(ex);
                
        }
        
        try
        {
            String selectQuery = "select lease_holder_id, lease_holder_name, contact_number from lease_holder l, date_table d where d.date_id=l.date_id and to_date(d.start_date,'dd/mm/yy') > TO_DATE(TO_DATE('September 01, 2015', 'MONTH DD, YYYY'),'dd/mm/yy') order by lease_holder_id";
            state = conn.createStatement();
            dbResultSet = state.executeQuery(selectQuery);
            System.out.println("Statement created successfully.");
            displayResults(dbResultSet);  
            state.close();
            System.out.println("Statement closed.");            
            conn.close();
            System.out.println("Connection closed.");
        }
        catch(SQLException ex)
        {
            System.out.println(ex);
                
        }                    
        
    }
    
    private static void displayResults(ResultSet rs) throws SQLException 
    {
            //System.out.println("Connection Successful!");
                        
            String sqlResult = "";
            int count = 0;
            System.out.println("");
            System.out.printf("%-20s %-20s %-20s","Lease Holder Id","Lease Holder Name","Contact Number");
            System.out.println("");
            while (rs.next())
            {
               count++;
               System.out.printf("%-20s %-20s %-20s",rs.getString(1),rs.getString(2),rs.getString(3));
               System.out.println("");
            }                        
           
           System.out.println(sqlResult);
           System.out.println("Query executed correctly.");
           System.out.println("\n\n"+count+" records in result set");
    }
    
}
