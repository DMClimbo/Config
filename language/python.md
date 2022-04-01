# 函数

## 函数参数

- 默认参数：必须指向不变对象

- 可变参数：在参数前加*号，调动时可以传入任意个参数，包括0个，传入的参数在调用时自动组装为一个tuple

  ```
  def calc(*numbers):
      sum = 0
      for n in numbers:
          sum = sum + n * n
      return sum
  ```

  如果要传列表或tuple，在前面加一个*号，可以把list或tuple的元素变成可变参数传进去

  ```
  nums = [1,2,3]
  calc(*nums)
  ```

- 关键字参数：在参数前加**，传入0个或任意个含参数名的参数，在函数内自动组装为一个dict

  ```
  def person(name, age, **kw):
      print('name:', name, 'age:', age, 'other:', kw)
  person('Bob', 35, city='Beijing')
  ```

  和可变参数一样，可先组装一个dict，然后转换后传入

  ```
  extra = {'city': 'Beijing', 'job': 'Engineer'}
  person('Jack', 24, **extra)
  ```




## 函数和变量

- 函数可以赋值给变量

  ```
  f = abs
  f(10)
  ```

- 函数名也是变量，可以指向其他对象

  ```
  abs = 10
  abs(-10)   # 报错，此时 abs 指向整数10
  ```

  

  

## 高阶函数

一个函数就可以接收另一个函数作为参数，这种函数就称之为高阶函数。如：

```
def add(x, y, f):
    return f(x) + f(y)
```

- map / reduce

  `map()`函数接收两个参数，一个是函数，一个是`Iterable`，`map`将传入的函数依次作用到序列的每个元素，并把结果作为新的`Iterator`返回。

  ```
  >>> def f(x):
  ...     return x * x
  ...
  >>> r = map(f, [1, 2, 3, 4, 5, 6, 7, 8, 9])
  >>> list(r)
  [1, 4, 9, 16, 25, 36, 49, 64, 81]		
  ```

  `map()`作为高阶函数，事实上它把运算规则抽象了，因此，我们不但可以计算简单的f(x)=x2，还可以计算任意复杂的函数，比如，把这个list所有数字转为字符串：

  ```
  >>> list(map(str, [1, 2, 3, 4, 5, 6, 7, 8, 9]))
  ['1', '2', '3', '4', '5', '6', '7', '8', '9']
  ```

  `reduce`把一个函数作用在一个序列`[x1, x2, x3, ...]`上，这个函数必须接收两个参数，`reduce`把结果继续和序列的下一个元素做累积计算，其效果就是：

  ```
  reduce(f, [x1, x2, x3, x4]) = f(f(f(x1, x2), x3), x4)
  ```

  比方说对一个序列求和，就可以用`reduce`实现：

  ```
  >>> from functools import reduce
  >>> def add(x, y):
  ...     return x + y
  ...
  >>> reduce(add, [1, 3, 5, 7, 9])
  25
  ```

​    

- filter 

  Python内建的`filter()`函数用于过滤序列，`filter()`也接收一个函数和一个序列，传入的函数依次作用于每个元素，然后根据返回值是`True`还是`False`决定保留还是丢弃该元素。

  例如，在一个list中，删掉偶数，只保留奇数，可以这么写：

  ```
  def is_odd(n):
      return n % 2 == 1
  
  list(filter(is_odd, [1, 2, 4, 5, 6, 9, 10, 15]))
  # 结果: [1, 5, 9, 15]
  ```

  `filter()`函数返回的是一个`Iterator`，也就是一个惰性序列，所以要强迫`filter()`完成计算结果，需要用`list()`函数获得所有结果并返回list。

  用 `filter()`函数求素数：

  ```
  def _odd_iter():
      n = 1
      while True:
          n = n + 2
          yield n
          
  def _not_divisible(n):
      return lambda x: x % n > 0
      
  def primes():
      yield 2
      it = _odd_iter() # 初始序列
      while True:
          n = next(it) # 返回序列的第一个数
          yield n
          it = filter(_not_divisible(n), it) # 构造新序列
          
  # 打印1000以内的素数:
  for n in primes():
      if n < 1000:
          print(n)
      else:
          break
  ```



​     

- sorted

  `sorted()`函数也是一个高阶函数，它还可以接收一个`key`函数来实现自定义的排序，例如按绝对值大小排序：

  ```
  sorted([36, 5, -12, 9, -21], key=abs)
  ```

  按字母反向排序：

  ```
  sorted(['bob', 'about', 'Zoo', 'Credit'], key=str.lower, reverse=True)
  ```

  

## 返回函数

函数也可以作为结果值返回

  





# 特性

## 切片

​	`L[0:3]`表示，从索引`0`开始取，直到索引`3`为止，但不包括索引`3`。即索引`0`，`1`，`2`，正好是3个元素。如果第一个元素是0则可以忽略，即`L[:3]` 

​	同时支持倒数切片，如`L[-2:-1]`取倒数第二个元素

​	可以选择切片的间隔，如`L[:10:2]`表示前10个数，每两个取一个，`L[ : : 5]`所有数每5个取一个

​	

tuple也是一种list，唯一区别是tuple不可变。因此，tuple也可以用切片操作，只是操作的结果仍是tuple：

```
>>> (0, 1, 2, 3, 4, 5)[:3]
(0, 1, 2)
```

str同理



## 迭代

如果给定一个`list`或`tuple`，我们可以通过`for`循环来遍历这个`list`或`tuple`，这种遍历我们称为迭代（Iteration），对于dict对象默认迭代 key ，如`for key in dict:` ，如果要迭代value，可以用`for value in dict.values():`；如果要同时迭代 key 和value，可以用`for k, v in dict.items()`

- enumerate函数

  ` enumerate`可以把一个list变成索引-元素对，可以在 for 循环中同时迭代索引和元素本身

  ```
  for i, value in enumerate(['A', 'B', 'C']):
  	print(i, value)
  ```

  

## 列表生成式

```
>>> [x * x for x in range(1, 11)]
[1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
```

for循环后面还可以加上if判断，这样我们就可以筛选出仅偶数的平方：

```
>>> [x * x for x in range(1, 11) if x % 2 == 0]
[4, 16, 36, 64, 100]
```

还可以使用两层循环，可以生成全排列：

```
>>> [m + n for m in 'ABC' for n in 'XYZ']
['AX', 'AY', 'AZ', 'BX', 'BY', 'BZ', 'CX', 'CY', 'CZ']
```



## 生成器

在Python中，这种一边循环一边计算的机制，称为生成器：generator。

要创建一个generator，有很多种方法。第一种方法很简单，只要把一个列表生成式的`[]`改成`()`，就创建了一个generator：

```
g = (x * x for x in range(10))
```

使用`[]`创建的是列表，使用`()`创建的是generator，使用next()函数获得生成器的元素

如果在函数中包含`yeild`关键字，那么这个函数就不再是一个普通函数，而是一个generator函数，调用一个generator函数将返回一个generator：

```
def fib(max):
    n, a, b = 0, 0, 1
    while n < max:
        yield b
        a, b = b, a + b
        n = n + 1
    return 'done'
```

- 与普通函数的区别

  普通函数是顺序执行，遇到`return`语句或者最后一行函数语句就返回。而变成generator的函数，在每次调用`next()`的时候执行，遇到`yield`语句返回，再次执行时从上次返回的`yield`语句处继续执行。

​	

调用generator函数会创建一个generator对象，多次调用generator函数会创建多个相互独立的generator。正确的做法

```
f = fib()
next(fib())
next(fib())   # 每次都创建一个新的generator重头执行

next(f)
next(f)		  # 同一个对象顺序执行
```





## 迭代器

可以直接作用于`for`循环的对象统称为可迭代对象`Iterable`，包括集合数据类型如 list 、tuple、dict、set 和 str 等和 generator 包括 生成器和带 yield 的函数

可以使用`isinstance()`判断一个对象是否是`Iterable`对象:

```
from collections.abc import Iterable
isinstance([], Iterable)
True
```

也可以使用`isinstance()`判断一个对象是否是`Iterator`对象

```
>>> isinstance(iter([]), Iterator)
True
```

Python的`Iterator`对象表示的是一个数据流，Iterator对象可以被`next()`函数调用并不断返回下一个数据，直到没有数据时抛出`StopIteration`错误。可以把这个数据流看做是一个有序序列，但我们却不能提前知道序列的长度，只能不断通过`next()`函数实现按需计算下一个数据，所以`Iterator`的计算是惰性的，只有在需要返回下一个数据时它才会计算。