package com.servletdemo.webfrom;
import java.util.*;
public class elevators {

 public static void main(String args[]) {

	        Scanner s = new Scanner(System.in);
	        int count=s.nextInt();
	        int[] fc=new int[count];
	        int posA=0;
	        int posB=7;
	        int posC=10;


	        for(int i=0;i<count;i++){
	            fc[i]=s.nextInt();

	            if((fc[i]-posA)<(posB-fc[i]) ||(fc[i]-posA)<(posC-fc[i])){
	            	if((fc[i]-posA)<(posB-fc[i])) {
	                posA=fc[i];
	                System.out.println("A");
	                
	            	}else if((fc[i]-posA) ==(posC-fc[i])) {
	            		posC=fc[i];
		                System.out.println("C");
	            	}
	            }

	            if((fc[i]-posA)==(posB-fc[i])|| (fc[i]-posA)==(posC-fc[i])){
	            	if((fc[i]-posA)==(posB-fc[i])) {
	                if(posA<posB){
	                    posA=fc[i];
	                    System.out.println("A");
	                }
	                else if(posA>posB){
	                    posB=fc[i];
	                    System.out.println("B");
	                }
	            	}else if((fc[i]-posA)==(posC-fc[i])) {
	            		 if(posA<posC){
	 	                    posA=fc[i];
	 	                    System.out.println("A");
	 	                }
	 	                else if(posA>posC){
	 	                    posC=fc[i];
	 	                    System.out.println("C");
	 	                }
	            	}
	            }
	            else{
	                posB=fc[i];
	                System.out.println("B");
	            }            
	        }
}
}