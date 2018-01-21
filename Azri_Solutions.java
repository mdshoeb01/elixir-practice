package qa;
import java.util.Scanner;

//bootcamp question conducted by azri-solutions at their office near madhapur.
public class Azi_Solutions {
	
	
	    
	public static int moveIfPossible(int pos,int []A,int maxIndex,int tot,int cap){

	  boolean isChanged=false;
	      
	  int n=maxIndex;
	       
	  do{
	           
		for(int i=0;i<=maxIndex;i++){
	       
	         if(A[i]>pos && (A[i]-pos<=cap))
	             
	        	 pos=A[i];
	                 
	         isChanged=true;
	                 
	         if(pos+cap>=tot ) return pos;
	       
	     }
	            
	      n--;
	     
	   }while(isChanged && n>=0);
	    
	    return pos;
	    
	}
	    
	public static int getMin(int [] pegs,int tot,int cap){

	        int curPos=0;
	   
	     for(int i=0;i<pegs.length;i++){
	  
	          if(pegs[i]>curPos && (pegs[i]-curPos<=cap)){

	                curPos=pegs[i];
	   
	             if(curPos+cap>=tot) return i+1;
	   
	             curPos=moveIfPossible(curPos,pegs,i,tot,cap);
	            
	          }
	            if(curPos+cap>=tot) return i+1;
	            
	            //else if(i==pegs.length-1 && ((curPos+cap)<tot)) return -1;
	    
	    }
	    return -1;
	}

  public static void main(String args[]) {
	 
	Scanner s=new Scanner(System.in);
	   
	int tot=s.nextInt();
	     
	int cap=s.nextInt();
	    
	int pegs=s.nextInt();
	       
	int pegsArray[]=new int[pegs];
	      
	for(int i=0;i<pegs;i++){
	           
	 pegsArray[i]=s.nextInt();
	      
	}
	        
	int minInstance=getMin(pegsArray,tot,cap);
	  
	if(minInstance<0) System.out.println("Crossing the river is not possible");
	     
	else System.out.println("You can cross the river in "+minInstance+ " Seconds");
	       
	 
  }

}



