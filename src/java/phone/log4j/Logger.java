/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phone.log4j;

import java.io.InputStream;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.PropertyConfigurator;

/**
 *
 * @author User
 */
public class Logger implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        InputStream in = getClass().getResourceAsStream("/phone/log4j/log4j.properties");
        
        if (in != null){
            PropertyConfigurator.configure(in);
            System.out.println("Logger is configure with Custom Setting --->");
        }else{
            BasicConfigurator.configure();
            System.out.println("Logger is configure with Default Setting --->");
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        
    }
    
}
