defmodule Area do
    def io do
      #name=IO.gets("what is your name? ")
      #IO.puts "hello #{name}"
      my_int=123
      IO.puts "is it Integer: #{is_integer(my_int)}"
      my_str="shoeb"
      IO.puts "is it String: #{String.length(my_str)}"
      IO.puts "String upcase: #{String.upcase(my_str)}"
      IO.puts "String downcase: #{String.downcase(my_str)}"
      add=fn a,b when a<b -> a+b #Ananymous functions
          a,b -> a*b end
      IO.puts add.(2,5)
      double=fn a ->add.(a,a) end
      IO.puts double.(2)
      longer_str="mohammed" <> " " <>  my_str
      IO.inspect String.split(longer_str," ")
      IO.puts String.reverse(longer_str)
      IO.puts "5+4=#{5+4}"
      IO.puts "5-4=#{5-4}"
      IO.puts "5/4=#{5/4}"
      IO.puts "5 div 4=#{div(5,4)}"
      IO.puts "5 rem 4=#{rem(5,4)}"
      age=14
      IO.puts "check age >=16 and <=18 #{age>=16 and age<=18}"
      IO.puts "check age >=16 or <=18 #{age>=16 or age<=18}"
      if age<=18, do: :youcantvote, else: :youcanvote
      unless age>=18 do
        IO.puts "you can't vote"
      else IO.puts "you can vote"
      end
      case age do
        16 ->IO.puts "found 16"
        14 ->IO.puts "found 14"
        18 -> IO.puts "found 18"
        _ -> IO.puts "default"
      end
      IO.puts "Ternary: #{if age>=18, do: "you can vote",else: "wait for your age" }"
      #tuples
      my_tuple={:shoeb,21,67}
      IO.puts "is it tuple: #{is_tuple(my_tuple)}"
      my_tuple2=put_elem(my_tuple,2,68)
      IO.puts "old percen #{elem(my_tuple,2)}"
      IO.puts "new percen #{elem(my_tuple2,2)}"
      my_tuple3 =Tuple.append(my_tuple2,"hyd")
      IO.puts "new entry : #{elem(my_tuple3,3)}"
      IO.puts "size of tuple2: #{tuple_size(my_tuple2)}"
      my_tuple4=Tuple.delete_at(my_tuple,0)
      IO.puts "new tuple after deleting name #{elem(my_tuple4,0)}"
      my_tuple5=Tuple.insert_at(my_tuple,0,:mohammed)
      IO.puts "new tuple with new name: #{elem(my_tuple5,0)}"
      {name,age1,percen}={:shoeb,21,68}
      IO.puts "name: #{name}"
    #list
      list1=[1,2,3]
      list2=[4,5,6]
      list3=list1 ++ list2
      IO.inspect list3
      list4=list3--list1
      IO.puts "is 6 in list4 #{6 in list4}"
      [head | tail]=list3
      IO.puts "Head: #{head}"
      IO.write "Tail: "#{to avoid new line we use IO.write}
      IO.inspect tail
      Enum.each tail,fn item->
        IO.puts item
      end
      words=["Random","words","in a","list"]
      Enum.each words,fn word->
        IO.puts word
      end
      #can also do this using recursion
      IO.puts List.first(words)
      IO.puts List.last(words)

      IO.puts "Using recursion"
      #display_words(List.delete(words,"Random"))
      display_words(List.delete_at(words,0))#to delete using index reference
      display_words(List.insert_at(words,4,"yeah"))
    end
    def display_words([head | tail]) do
      if tail==[] do
        IO.puts head
      else
         IO.puts head
         display_words(tail)
      end
    end
    def prac(status) when status=="first" do
      IO.puts "Hello world,This is my first"
      #can exucute the code in cmd elixir project directory
    end
    def prac(status) do
      IO.puts "Keep practicing"
  end
  def caseprac do
    case {1,2,3} do
      {4,5,6}->"This clause wont match"
      {1,x,3}->"This will match and bind x to 2 in this clause"
      _->"This clause would match any value"

    end

  end
  def data_structures do
    keyword_list=[{:a,1},{:b,2}]
    IO.inspect keyword_list
    new_kl=[a: 2]++keyword_list
    IO.inspect new_kl
    map1=%{:a => 1,:b => 2,3 => 3}
    IO.puts Map.get(map1,:b)
    #put can also be used with key and value pass as arguments.
    map2=Map.put(map1,:c,4)
    IO.puts Map.get(map2,:c)
    map3=%{map2 | :c=>"four"}
    IO.puts map3.c
  end
  def nested_data_structures do
    users=[john: %{name: "john",age: 27,lang: ["erlang","ruby","elixir"]},mary: %{name: "mary",age: 29,lang: ["elixir","f#","clojure"]}]
    users=put_in users[:john].age, 31
    #to add new value
    users1=Dict.put_new(users,:shoeb, ["c","java","elixir"])
    IO.inspect users1[:shoeb]
    IO.puts users[:john].age
    users=update_in users[:mary].lang, fn lang->List.delete(lang,"clojure") end
    IO.inspect users[:mary].lang
    [_,[_,a]]=[10,[20,30]]
    IO.puts "get num: #{a}"
  end
  def is_zero(x) when x==0 do
    true
  end
  def is_zero(x) do
    false
  end
  def def_arg(x \\"hello") do
    x #hello will be returned if no arg is passed, else the passed value is returned
  end
  def join(a,b \\nil,sep\\" ") when is_nil(b) do
    a
  end
  def join(a,b,sep) do
    a<>sep<> b
  end
end
#Area.io
#Area.prac("first")
#Area.caseprac
#Area.nested_data_structures
#IO.puts Area.is_zero(1)
#IO.puts Area.def_arg(4)
#IO.puts Area.join("Hello","world","_")
defmodule Advanced do
  def print_mul_times(msg,n) when n<=1 do
    IO.puts msg
  end
  def print_mul_times(msg,n) do
    IO.puts msg
    print_mul_times(msg,n-1)
  end
  #sum elems in list
  def sum_list([head | tail],value) do
    sum_list(tail,head+value)
  end
  def sum_list([],value) do
    value
  end
  #to double elems in list use:
  def double_list([head | tail]) do
    [head*2 |double_list(tail)]
  end
  def double_list([]) do
    []
  end
  def adv do
    Enum.each([1,2,3],fn(n)->IO.puts n end)
    IO.puts "Even list: #{Enum.any?([1,2,3],
     fn(n) -> rem(n,2)==0 end)}"
     dbl_list=for n <-[1,2,3], do: n*2
     IO.inspect dbl_list
     even_list=for n <-[1,2,3,4],rem(n,2)==0, do: n
     IO.inspect even_list
  end
end
#Advanced.print_mul_times("Hello",5)
#IO.puts "sum of elems in list: #{Advanced.sum_list([1,2,3],0)}"
#IO.inspect Advanced.double_list([1,2,3])
Advanced.adv
