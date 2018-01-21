defmodule River do
  def get_min(tot,caps,pegs) do
    curPos=0
    i=0
    loop(i,tuple_size(pegs),tot,caps,pegs,curPos)

  end
  defp loop(iter,size,tot,caps,pegs,curPos) do
    if(elem(pegs,iter)>curPos and (elem(pegs,iter)-curPos<=cap)) do
      
    end
  end
end
tot=10
cap=4
pegs={2,4,1,9,7,5,8}

min_instance=River.get_min(tot,cap,pegs)
if min_instance<0 do
  IO.puts "Cannot cross the river"
else IO.puts "You can cross the river in #{min_instance} seconds"
end
