defmodule River do
  def get_min(tot,caps,pegs) do
    curPos=0
    i=0
    value=loop(i,tuple_size(pegs),tot,caps,pegs,curPos)
    value
  end
  defp loop(iter,size,tot,caps,pegs,curPos) when (elem(pegs,iter)>curPos and (elem(pegs,iter)-curPos<=cap)) and (elem(pegs,iter)>=tot) do
		i+1
    end
  defp loop(iter,size,tot,caps,pegs,curPos) when (elem(pegs,iter)>curPos and (elem(pegs,iter)-curPos<=cap))
  	curPos1=moveIfPossible(elem(pegs,iter),pegs,iter,tot,cap)
      if(curPos1+cap>=tot) do
        iter+1
      else
      	loop(iter+1,size,tot,caps,pegs,curPos1)
      end
  end
  defp loop(iter,size,tot,caps,pegs,curPos) when iter==size do
    -1
  end
  defp moveIfPossible(pos,list,maxIndex,tot,cap) do

    n=maxIndex
    res=Dowhile(maxIndex,pos,cap,list,false,tot,n)
    #loop2(0,maxIndex,pos,cap,list,is_changed,tot)
    res
  end
  defp Dowhile(maxIndex,pos,cap,list,is_changed,tot,n) do

    value=loop2(iter,maxIndex,pos,cap,list,is_changed,tot)
    #case (elem(values,0) and elem(values,1)>=0)
    case (value>=0)
    	true -> Dowhile(maxIndex,pos,cap,list,true,tot,n-1)
          fasle -> pos
  end
     defp loop2(iter,maxIndex,pos,cap,list,is_changed,tot) when iter==maxIndex do
       pos
     end
   defp loop2(iter,maxIndex,pos,cap,list,is_changed,tot) when (elem(list,iter)>pos and (elem(list,iter)-pos <=cap))  do
     pos1=elem(list,iter)
     if(pos1+cap>=tot) do
       pos1
     else
       loop2(iter+1,maxIndex,pos1,cap,list,true,tot)

   end
end
tot=10
cap=4
pegs={2,4,1,9,7,5,8}

min_instance=River.get_min(tot,cap,pegs)
if min_instance<=0 do
  IO.puts "Cannot cross the river"
else IO.puts "You can cross the river in #{min_instance} seconds"
end
