print("hello world")

-- read from "http://coolshell.cn/articles/10739.html"
-- 两个减号是行注释

--[[
-- 这是块注释
-- 这是块注释
--]]

-- Lua的数字只有double型 0x开头的16进制
num = 1024
num = 3.0
num = 3.1416
num = 314.16e-2
num = 0.31416E1
num = 0xff
num = 0x56

--字符串你可以用单引号，也可以用双引号，还支持C类型的转义
a = 'alo\n123"'
a = "alo\n123\""
a = '\97lo\10\04923"'
a = [[alo
123"]] --两个中括号可以用于定义有换行的字符串
print(a)

--空值用nil
print(c)

--布尔类型只有nil和false是 false，数字0啊，‘’空字符串（’\0’）都是true！
--lua中的变量如果没有特殊说明，全是全局变量，那怕是语句块或是函数里。变量前加local关键字的是局部变量
local a = "local variable"
print(a)

--Lua没有++或是+=这样的操作

--while
sum = 0
num = 1
while num <= 100 do
    sum = sum + num
    num = num + 1
end
print("sum =",sum)

-- if else
age = 30
if age == 40 and sex =="Male" then
    print("男人四十一枝花")
elseif age > 60 and sex ~="Female" then
    print("old man without country!")
elseif age < 20 then
    io.write("too young, too naive!\n")
else
    local age = io.read()
    print("Your age is "..age)
end
-- 1）"~="是不等于，而不是!=
-- 2）io库的分别从stdin和stdout读写的read和write函数
-- 3）字符串的拼接操作符".."
-- 4) 条件表达式中的与或非为分是：and, or, not关键字

-- for 循环
-- 从1加到100
sum = 0
for i = 1, 100 do
    sum = sum + i
end
--从1到100的奇数和
sum = 0
for i = 1, 100, 2 do
    sum = sum + i
end
-- 从100到1的偶数和
sum = 0
for i = 100, 1, -2 do
    sum = sum + i
end

-- until循环
sum = 2
repeat
   sum = sum ^ 2 --幂操作
   print(sum)
until sum >1000

-- 函数
-- Lua的函数和Javascript的很像

--递归
function fib(n)
  if n < 2 then return 1 end
  return fib(n - 2) + fib(n - 1)
end
--闭包

function newCounter()
    local i = 0
    return function()     -- anonymous function
       i = i + 1
       return i
    end
end
 
c1 = newCounter()
print(c1())  --> 1
print(c1())  --> 2

function myPower(x)
    return function(y) return y^x end
end
 
power2 = myPower(2)
power3 = myPower(3)
 
print(power2(4)) --4的2次方
print(power3(5)) --5的3次方

--赋值
name, age, bGay = "haoel", 37, false, "haoel@hotmail.com"

function getUserInfo(id)
    print(id)
    return "haoel", 37, "haoel@hotmail.com", "http://coolshell.cn"
end
 
name, age, email, website, bGay = getUserInfo()

--函数前面加上local就是局部函数
function foo(x) return x^2 end
foo = function(x) return x^2 end

--table
haoel = {name="test", age=37, handsome=True}
haoel.website="http://coolshell.cn/"
local age = haoel.age
haoel.handsome = false
haoel.name=nil

t = {[20]=100, ['name']="ChenHao", [3.14]="PI"}
t[20]=10

arr = {10,20,30,40,50}
--等价于 #Lua的下标不是从0开始的，是从1开始的#
arr = {[1]=10, [2]=20, [3]=30, [4]=40, [5]=50}
--其他定义
arr = {"string", 100, "haoel", function() print("coolshell.cn") end}

--遍历数据组 #arr的意思就是arr的长度
for i=1, #arr do
    print(arr[i])
end
--遍历table
for k, v in pairs(t) do
    print(k, v)
end

-- MetaTable 和 MetaMethod

--定义分数
fraction_a = {numerator=2, denominator=3}
fraction_b = {numerator=4, denominator=7}

--- MetaTable
fraction_op={}
function fraction_op.__add(f1, f2)
    ret = {}
    ret.numerator = f1.numerator * f2.denominator + f2.numerator * f1.denominator
    ret.denominator = f1.denominator * f2.denominator
    return ret
end

--定义的两个table设置MetaTable
setmetatable(fraction_a, fraction_op)

--分数加法
fraction_s = fraction_a + fraction_b
-- __add这是MetaMethod

-- 面向对象







