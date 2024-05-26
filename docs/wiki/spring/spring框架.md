Spring只是一种轻量级的无侵入性的框架。说白了Spring的Ioc容器就是可以实例化BeanFactory或ApplicationContext（扩展了BeanFactory）的类。



## 两大特征：IOC和AOP

**1.控制反转即IoC (Inversion of Control)**

它把传统上由程序代码直接操控的对象的调用权交给外部容器，通过容器来实现对象组件的装配和管理。所谓的“控制反转”概念就是组件对象的控制权转移了，从程序代码本身转移到了外部容器，实现程序之间解耦。

举例：在类和类之间存在控制权，控制权指的是对象的创建和使用（由容器来控制程序中的各个类之间的关系）

比如有类A和类B，我们之前的做法是在A中调用B，那么控制权就在A中，这样做的耦合度较高，

如果修改了B，A也要做相应修改。引入Spring框架后，控制权由spring容器来负责。当A想使用B时，需要由Spirng容器通过 配置文件迚行注入。这种思想就是IoC（为了更好的理解，我们可以这样认为，对象创建和使用 

的控制权转移到了Spring容器，由Spring容器来控制）。

核心原理：就是配置文件+反射(工厂)+容器(map)

IoC还有另外一个名字——“依赖注入（Dependency Injection）”。DI从名字上理解，所谓依赖注入，即组件之间的依赖关系由容器在运行期决定，即由容器动态地将某种依赖关系注入到组件之中。

目的：依赖注入的目标并非为软件系统带来更多的功能，而是为了提升组件重用的概率，并为系统搭建一个灵活、可扩展的平台。

依赖注入的基本原则是：应用组件不应该负责查找资源或者其他依赖的协作对象。配置对象的工作应该由IoC容器负责，“查找资源”的逻辑应该从应用组件的代码中抽取出来，交给IoC容器负责。

构造子注入（ConstructorInjection），设值注入（SetterInjection）和接口注入（InterfaceInjection）三种方式。



**2、AOP为Aspect Oriented Programming的缩写，意为：面向切面编程（也叫面向方面）**

Struts2中的拦截器，就是使用AOP的思想。使用AOP来管理事务。



Spring实现AOP：JDK动态代理和CGLIB代理

JDK动态代理：其代理对象必须是某个接口的实现，它是通过在运行期间创建一个接口的实现类来完成对目标对象的代理；

其核心的两个类是InvocationHandler和Proxy。

CGLIB代理：实现原理类似于JDK动态代理，只是它在运行期间生成的代理对象是针对目标类扩展的子类。CGLIB是高效的代码生成包，底层是依靠ASM（开源的java字节码编辑类库）操作字节码实现的，性能比JDK强；需要引入包asm.jar和cglib.jar。



AOP使用场景：

Transactions 事务管理

Authentication 权限检查、判断

Caching 缓存

Context passing 内容传递

Error handling 错误处理

Lazy loading　延迟加载

Debugging　　调试

logging, tracing, profiling and monitoring　日志记录，跟踪，优化，校准

Performance optimization　性能优化，效率检查

Persistence　　持久化

Resource pooling　资源池

Synchronization　同步

另外Filter的实现和struts2的拦截器的实现都是AOP思想的体现。















