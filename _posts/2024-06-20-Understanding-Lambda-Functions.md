---
layout: post
title: Understanding Lambda Functions
description: Insight on some core concepts of lambda functions in programming.
date: 2024-06-20 04:12 +0530
image: '/images/lambda.png'
tags: [Programming, Concept]
---
Functions, in general, are a set of instructions that are executed to perform a task with some input parameters. In programming, functions are used to organize the code into logical blocks and perform operations efficiently. 

# A Bit about Functions...
We often write functions to encapsulate a piece of code that does a specific task. We know that functions have a name (so that we can call them later), input parameters (to pass some data), and a return value (to get the result).
A function somewhat looks like this:
```text
function name_of_function(input_parameters): return_type {
    // code block
    return result;
}
```
If we dive deeper into compiler theory, we get to know that functions are often optimized by the compiler by **inlining** the encapsulated code block wherever the function is called.
When a program executes a function, it creates a **stack frame** in the memory to store the local variables and the return address. This stack frame is popped out of the memory once the function execution is completed.
So inline functions helps in reducing the overhead of creating and destroying the stack frame for the function.

Enough of the theory, let's talk about lambda functions now.

# What are Lambda Functions?
> Lambda functions are anonymous functions that only has a return type and parameters. They are also known as **function literals** or **closures**.

Different languages implement lambda functions in different ways. Some have a single expression syntax, while others have syntax that allows multiple expressions.
An example of a lambda function in Java to add two numbers:
```java
(a, b) -> {
    return a + b;
}
```
Shorthand syntax for single expression lambda function:
```java
(a, b) -> a + b
```

The usage of lambda functions and method references is a key concept of [**Functional Programming**](https://www.geeksforgeeks.org/functional-programming-paradigm/).

# Functional Programming
> Just like mathematics functions

Functional programming is an approach to software development that uses pure functions to create maintainable software. In other words, building programs by applying and composing functions. 
While functional programming, we can pass on higher order functions as arguments to other functions, return functions from other functions, and assign functions to variables.
The beauty of functional programming allows use to write more concise, readable, and maintainable code and also to achieve [**Function Purity**](https://www.geeksforgeeks.org/pure-functions/) with ease.

# Types of Lambda Functions
According to the number of parameters and the return type, lambda functions can be classified into different categories. Categorising lambda functions helps in understanding the use cases and the syntax of lambda functions,
and also to refer to them in a more structured way. Here are some types of lambda functions:
1. **Runnable**: Lambda functions which take no parameter and return no value.
    ```java
    () -> {
        System.out.println("Hello, World!");
    }
    ```
2. **Supplier**: Lambda functions which take no parameter and return a value.
    ```java
    () -> {
        return 10;
    }
    ```
3. **Consumer**: Lambda functions which take a parameter and return no value.
    ```java
    (a) -> {
        System.out.println(a);
    }
    ```
4. **Function**: Lambda functions which take a parameter and return a value.
    ```java
    (a) -> {
        return a * a;
    }
    ```
5. **Predicate**: Lambda functions which take a parameter and return a boolean value.
    ```java
    (a) -> {
        return a > 10;
    }
    ```
6. **BiFunction**: Lambda functions which take two parameters and return a value.
    ```java
    (a, b) -> {
        return a + b;
    }
    ```
7. **BiPredicate**: Lambda functions which take two parameters and return a boolean value.
    ```java
    (a, b) -> {
        return a > b;
    }
    ```
8. **BiConsumer**: Lambda functions which take two parameters and return no value.
    ```java
    (a, b) -> {
        System.out.println(a + b);
    }
    ```
9. **UnaryOperator**: Lambda functions which take a parameter and return a value of the same type.
    ```java
    (a) -> {
        return a * a;
    }
    ```
10. **BinaryOperator**: Lambda functions which take two parameters and return a value of the same type.
    ```java
    (a, b) -> {
        return a + b;
    }
    ```

A quick example for a lambda function in Java:
```java
import java.util.function.Runnable;

public class LambdaExample {
    public static void main(String[] args) {
        Runnable run = () -> {
            System.out.println("Hello, World!");
        };
        
        Thread[] threads = new Thread[10];
        for (int i = 0; i < 10; i++) {
            threads[i] = new Thread(run);
            threads[i].start();
        }
        
        for (int i = 0; i < 10; i++) {
            try {
                threads[i].join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
```
In the above example, we have created a lambda function of type `Runnable` and used it to create 10 threads that print "Hello, World!". 
See how the same function which is stored in a variable can be passed in multiple places. This is the power of lambda functions.

# Context Capturing
Lambda functions can capture the context in which they are defined. This means that they can access the variables from the enclosing scope.
The variables accessed by a lambda from the enclosing scope are directly passed to the lambda function and are called **captured variables**.
```java
public class LambdaExample {
    public static void main(String[] args) {
        int a = 10;
        Runnable run = () -> {
            System.out.println("Value of a: " + a); // Capturing the variable a from outside of the lambda variable scope
        };
        
        Thread thread = new Thread(run);
        thread.start();
        
        try {
            thread.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
```
In the above example, the lambda function captures the variable `a` from the enclosing scope and prints its value in a different thread context.
The only constraint is that the captured variables should be effectively final or final. This means that the value of the variable should not change after it is captured by the lambda function.
If the value of the variable changes after it is captured, it is effectively an error for the compiler as it may lead to data discrepancy.
