local count2 = 0  
local function hello()  
   count2 = count2 + 1  
   ngx.say("count : ", count2)  
end  
  
local _M = {  
   hello = hello  
}  
  
return _M  
