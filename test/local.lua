local data = 100;  
  
local function fun1()  
    print(data);  
    data = data+50;  
end  
  
data = 200;  
  
local data = 300; -- 重新定义一个局部变量  
  
local function fun2()  
    print(data);  
    data = data+50;  
end  
  
-- data = 400;  
  
--调用  
fun1(); -- 200  
fun2(); -- 400  
fun1(); -- 250  
fun2(); -- 450  
