defmodule River do
  def get_min(tot,cap,pegs) do
    value=loop(0,tuple_size(pegs),tot,cap,pegs,0)
    value
  end
  defp loop(iter,size,tot,cap,pegs,curPos) when (elem(pegs,iter)>curPos and (elem(pegs,iter)-curPos<=cap)) and (elem(pegs,iter)+cap>=tot) do
 		iter+1
     end

   defp loop(iter,size,tot,cap,pegs,curPos) when (elem(pegs,iter)>curPos and (elem(pegs,iter)-curPos<=cap)) do
   	curPos1=moveIfPossible(elem(pegs,iter),pegs,iter,tot,cap)
      if((curPos1+cap)>=tot) do
         iter+1
       else
       	loop(iter+1,size,tot,cap,pegs,curPos1)
       end
   end
   defp loop(iter,size,tot,cap,pegs,curPos) when iter==size do
     -1
   end
   defp loop(iter,size,tot,cap,pegs,curPos) do
     loop(iter+1,size,tot,cap,pegs,curPos)
   end
   def moveIfPossible(pos,list,maxIndex,tot,cap) do
     n=maxIndex
     new_pos=do_while(pos,list,maxIndex,tot,cap,n)
   end
   def do_while(pos,list,maxIndex,tot,cap,n) when n<0 do
     pos
   end
   def do_while(pos,list,maxIndex,tot,cap,n) when (pos+cap)>=tot do
     pos
   end
   def do_while(pos,list,maxIndex,tot,cap,n) do
     new_pos=loop2(0,maxIndex,pos,list,tot,cap)
     do_while(new_pos,list,maxIndex,tot,cap,n-1)
   end
   def loop2(iter,size,pos,list,tot,cap) when iter===size do
     pos
   end
   def loop2(iter,size,pos,list,tot,cap) when (elem(list,iter)>pos and (elem(list,iter)-pos<=cap)) do
     new_pos=elem(list,iter)
     if((new_pos+cap)>=tot) do
       new_pos
     else
       loop2(iter+1,size,new_pos,list,tot,cap)
     end

   end
   def loop2(iter,size,pos,list,tot,cap) do
     loop2(iter+1,size,pos,list,tot,cap)
   end
end
tot=150
cap=25
pegs={25,140,100,125,50,75,90,80}

min_instance=River.get_min(tot,cap,pegs)
if min_instance<0 do
  IO.puts "Cannot cross the river"
else IO.puts "You can cross the river in #{min_instance} seconds"
end
