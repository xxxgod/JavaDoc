Spring只是一种轻量级的无侵入性的框架。说白了Spring的Ioc容器就是可以实例化BeanFactory或ApplicationContext（扩展了BeanFactory）的类。



## 两大特征：IOC和AOP

### 1. IOC控制反转

 IoC(Inversion of Control)

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



### **2. AOP**面向切面

**为Aspect Oriented Programming的缩写，意为：面向切面编程（也叫面向方面）**

Struts2中的拦截器，就是使用AOP的思想。使用AOP来管理事务。



Spring实现AOP：JDK动态代理和CGLIB代理

JDK动态代理：其代理对象必须是某个接口的实现，它是通过在运行期间创建一个接口的实现类来完成对目标对象的代理；

其核心的两个类是InvocationHandler和Proxy。

CGLIB代理：实现原理类似于JDK动态代理，只是它在运行期间生成的代理对象是针对目标类扩展的子类。CGLIB是高效的代码生成包，底层是依靠ASM（开源的java字节码编辑类库）操作字节码实现的，性能比JDK强；需要引入包asm.jar和cglib.jar。



### Spring中的AOP

AOP（面向切面编程）是 Spring 框架的核心特性之一，它允许开发者在不修改原有业务逻辑的基础上，对程序进行增强，实现诸如日志记录、事务管理等功能。以下是 AOP 在 Spring 框架中的常见应用：

##### 日志记录

- **功能说明**：在企业级应用中，日志记录是监控系统运行状态、排查问题的重要手段。使用 AOP 可以将日志记录逻辑集中处理，避免在每个业务方法中重复编写日志代码。
- **实现方式**：通过创建切面类，在切入点（如方法执行前后）添加日志记录的增强逻辑。
- **示例代码**：



java

```java
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAspect {

    @Before("execution(* com.example.service.*.*(..))")
    public void beforeMethod(JoinPoint joinPoint) {
        System.out.println("Before method: " + joinPoint.getSignature().getName());
    }

    @After("execution(* com.example.service.*.*(..))")
    public void afterMethod(JoinPoint joinPoint) {
        System.out.println("After method: " + joinPoint.getSignature().getName());
    }
}
```



在上述代码中，`@Before` 和 `@After` 注解分别表示在目标方法执行前后执行相应的增强逻辑。

##### 事务管理

- **功能说明**：事务管理是保证数据一致性和完整性的关键。Spring 的声明式事务管理基于 AOP 实现，开发者可以通过简单的注解或配置来管理事务，无需在业务代码中编写复杂的事务处理逻辑。
- **实现方式**：使用 `@Transactional` 注解标记需要进行事务管理的方法，Spring 会在方法执行前后自动开启、提交或回滚事务。
- **示例代码**：



java

```java
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {

    @Transactional
    public void transferMoney() {
        // 业务逻辑
    }
}
```

##### 权限验证

- **功能说明**：在许多应用中，需要对用户的操作进行权限验证，确保只有具有相应权限的用户才能执行某些操作。AOP 可以将权限验证逻辑从业务逻辑中分离出来，提高代码的可维护性和安全性。
- **实现方式**：创建切面类，在切入点（如需要进行权限验证的方法执行前）添加权限验证的增强逻辑。
- **示例代码**：



java

```java
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class PermissionAspect {

    @Before("execution(* com.example.controller.*.*(..))")
    public void checkPermission(JoinPoint joinPoint) {
        // 权限验证逻辑
        System.out.println("Checking permission...");
    }
}
```

##### 性能监控

- **功能说明**：性能监控有助于开发者了解系统中各个方法的执行时间，找出性能瓶颈，进行优化。AOP 可以在方法执行前后记录时间，计算方法的执行时长。
- **实现方式**：创建切面类，使用 `@Around` 注解在切入点（如所有业务方法的执行前后）添加性能监控的增强逻辑。
- **示例代码**：



java

```java
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class PerformanceAspect {

    @Around("execution(* com.example.service.*.*(..))")
    public Object monitorPerformance(ProceedingJoinPoint joinPoint) throws Throwable {
        long startTime = System.currentTimeMillis();
        Object result = joinPoint.proceed();
        long endTime = System.currentTimeMillis();
        System.out.println("Method " + joinPoint.getSignature().getName() + " executed in " + (endTime - startTime) + " ms");
        return result;
    }
}
```

##### 缓存处理

- **功能说明**：缓存可以减少对数据库或其他数据源的访问，提高系统的响应速度。AOP 可以在方法执行前检查缓存中是否存在所需的数据，如果存在则直接返回缓存数据，否则执行方法并将结果存入缓存。
- **实现方式**：创建切面类，在切入点（如需要进行缓存处理的方法执行前后）添加缓存处理的增强逻辑。
- **示例代码**：



java

```java
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class CacheAspect {

    @Around("execution(* com.example.service.*.*(..))")
    public Object cacheAround(ProceedingJoinPoint joinPoint) throws Throwable {
        // 检查缓存
        Object cacheResult = getFromCache(joinPoint.getSignature().getName());
        if (cacheResult != null) {
            return cacheResult;
        }
        // 执行方法
        Object result = joinPoint.proceed();
        // 将结果存入缓存
        putToCache(joinPoint.getSignature().getName(), result);
        return result;
    }

    private Object getFromCache(String key) {
        // 从缓存中获取数据的逻辑
        return null;
    }

    private void putToCache(String key, Object value) {
        // 将数据存入缓存的逻辑
    }
}
```



通过以上应用场景可以看出，AOP 在 Spring 框架中能够提高代码的可维护性、可扩展性和安全性，使开发者可以更专注于业务逻辑的实现。

### 使用场景

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















