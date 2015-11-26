--添加如下内容  
count = count + 1  
ngx.say("global variable : ", count, "<br>")  
local shared_data = ngx.shared.shared_data  
ngx.say("shared memory : ", shared_data:get("count"), "<br>")  
shared_data:incr("count", 10)  
ngx.say("shared memory : ", shared_data:get("count"), "<br>")  
ngx.say("hello world")  
