
package com.ieseljust.ad.cepa3_exercice_frankcarreres;

import com.ieseljust.ad.cepa3_exercice_frankcarreres.Model.Persona;
import com.ieseljust.ad.cepa3_exercice_frankcarreres.ORM.HibernateUtil;
import java.util.List;
import java.util.Scanner;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author frank
 */

public class CEPA3_Exercice_FrankCarreres {

    private static final int totalRecordsPage = 12;
    
    private static int getTotalRecords(Session laSession) {
        
        Query<Long> q = laSession.createQuery("SELECT COUNT(p) FROM Persona p", Long.class);
        return Math.toIntExact(q.uniqueResult());
    }

    private static void recordPageChange(Session laSession, int currentPage) {
        
        Query<Persona> q = laSession.createQuery("FROM Persona", Persona.class).setFirstResult((currentPage - 1) * totalRecordsPage).setMaxResults(totalRecordsPage);
        List<Persona> persons = q.list();
        
        System.out.println("");
        System.out.println("--> TABLE OF RECORDS OF PERSONS");
        
        for (Persona person : persons) {
            System.out.println(person.toString());
        }
        System.out.println("");
    }

    public static void main(String[] args) {
        
        Session laSession = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = laSession.beginTransaction();
        Scanner s = new Scanner(System.in);
        boolean running = true;

        int mainPage = 1;
        int records = getTotalRecords(laSession);
        int totalPages = (int) Math.ceil((double) records / totalRecordsPage);

        recordPageChange(laSession, mainPage);

        while (running) {
            
            System.out.printf("<Page %d of %d>%n", mainPage, totalPages);
            System.out.println("Options --> <S> NEXT, <A> PREVIOUS, <G> GO TO X, <Q> QUIT");
            System.out.println("");
            System.out.print("> Enter the option: ");
            
            char option = s.next().toUpperCase().charAt(0);

            switch (option) {
                
                case 's':
                case 'S':
                    if (mainPage < totalPages) {
                        mainPage++;
                        recordPageChange(laSession, mainPage);
                    } 
                    else {
                        System.out.println("> There are no more pages left.");
                    }
                    break;
                
                case 'a':
                case 'A':
                    
                    if (mainPage > 1) {
                        mainPage--;
                        recordPageChange(laSession, mainPage);
                    } 
                    else {
                        System.out.println("> You are on the first page...");
                    }
                    break;
                
                case 'g':
                case 'G':
                    System.out.print("> Enter the page number: ");
                    
                    int goToPage = s.nextInt();
                    
                    if (goToPage >= 1 && goToPage <= totalPages) {
                        mainPage = goToPage;
                        recordPageChange(laSession, mainPage);
                    } 
                    else {
                        System.out.println("> The number you have entered is not valid.");
                    }
                    break;
                
                case 'q':
                case 'Q':
                    running = false;
                    break;
                    
                default:          
                    System.out.println("This option does not exist, please check the options again.");
            }
        }

        transaction.commit();
    }
}
