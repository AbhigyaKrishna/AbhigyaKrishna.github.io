---
layout: post
title: What is a core programming language? And why should you master one?
description: A core language is primitive in nature. It is the foundation of a language ecosystem. In this post, we will discuss what a core language is and why you should master one.
date: 2024-05-30 03:37:00 +0530
image: '/images/prog-languages.png'
tags: [Programming, Language, Core]
---
# Introduction
A core language is a language that is most primitive in nature. It neither very simple nor very complex. It mostly consists of basic constructs like variables, loops, and functions. For example, C, CPP (C++) and Java. 
These languages do not contain too many helper functions/classes in their standard library. They are designed to be simple, robust and fast. They are the foundation of a language ecosystem.
Libraries of these languages consist of basic constructs like file handling, networking, and data structures but enough to build an application with ease.

Before we dive into the details, let's understand so key concepts about languages.

# Compiled language vs Interpreted language
A compiled languages is a language that is converted into machine code before execution. Let's take an example of Java. Java is a high level compiled language which means it is first compiled into machine code known as java bytecode.
Then we use the compiled code saved in the output file to run the program. For compiling the code, we use a program called compiler. In this case, we use `javac` (Java Compiler) to compile our code. Some of the examples for compiled languages are
C, C++, Java, Rust, etc.\
For reference here is a java code snippet:
```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World");
    }
}
```

The equivalent java bytecode for the main function will somewhat look like this:
```
DEFINE PUBLIC STATIC main([Ljava/lang/String; 0)V
A:
LINE A 3
GETSTATIC java/lang/System.out Ljava/io/PrintStream;
LDC "Hello World"
INVOKEVIRTUAL java/io/PrintStream.println(Ljava/lang/String;)V
B:
LINE B 4
RETURN
```
The english keywords in compiled code like `DEFINE`, `STATIC`, `LINE` and `GETSTATIC` are also encoded with special ascii tags and are not readable in our general UTF-8 english notion. I have used an equivalent english keyword for better understanding.
This code is then interpreted line by line, by the language interpreter at runtime.

On the other hand, interpreted languages are read as is written by the programmer, at runtime. Most of the interpreted language has a **JIT (Just In Time) compiler** which compiles the code at runtime. Some of the examples of interpreted languages are Python, Ruby, JavaScript, etc.

### What is a JIT compiler?
A JIT compiler runs after the program has started and compiles the code (usually bytecode or some kind of VM instructions) on the fly (or just-in-time, as it's called) into a form that's usually faster, typically the host CPU's native instruction set. 
A JIT has access to dynamic runtime information whereas a standard compiler doesn't and can make better optimizations like inlining functions that are used frequently. Java also uses JIT compiler to compile the bytecode into machine code.

### Pros and Cons of Compiled and Interpreted languages
Compiled languages are generally faster than interpreted languages because they are precompiled into machine code. But the compiled code is platform dependent. For example, a compiled code of C++ for windows will not run on Linux. The Java bytecode is platform independent, but it needs a JVM (Java Virtual Machine) to run the code.\
Interpreted languages are slower than compiled languages because they are compiled at runtime. But they are platform independent and easier to use. For example, a python code written on windows will run on Linux without any changes.

# Statically Typed vs Dynamically Typed Languages
Statically Typed languages are languages in which the type of variable is known at compile time. When we declare a variable, we have to specify the type of the variable. The variables of a specific type can only store values of that type. For example, C, C++, Java, Rust, etc.

Dynamically Typed languages are languages in which the type of variable is inferred at runtime. The variables can store values of any type. The functions which gets called on these variables are also inferred at runtime. Some of the dynamically typed languages are Python, JavaScript and Ruby.
Most of the interpreted languages are dynamically typed languages as we do not have to care about performance and memory management. The memory and performance overhead of these languages are significant at the cost of ease of use.

# Why should you master a core language?
If we talk about mastering a language, you should always start with a core language. By mastering a language, I mean to say that you should be familiar not only with the basics but every nooks and crannies of the languages.
Here are some of the reasons why you should start with a core language:
1. **Understanding of language ecosystem**: A core language is the foundation of a language ecosystem. If you master a core language, you will be able to understand the language ecosystem better. You will be able to understand the libraries, frameworks, and tools built around the language.
2. **Beauty of not abstracting away major code concepts**: A core language has minimal abstraction and helper functions in its core library. On the other hand, other languages tends to abstract away code concepts for the purpose of ease of use. Let's use and example to understand it better.\
Let's look at a very simple concept of reading a file.\
For Python, it's a straight forward code:
    ```py
    with open('file.txt', 'r') as file:
        data = file.read()
        print(data)
    ```
    We just called a `open` function with `r` flag and read all the data. But how exactly are we reading the file? What is happening behind the scenes?\
    For Java, it's a bit more complex:
    ```java
    try {
        BufferedReader reader = new BufferedReader(new FileReader("file.txt"));
        String line = reader.readLine();
        while (line != null) {
            System.out.println(line);
            line = reader.readLine();
        }
        reader.close();
    } catch (IOException e) {
        e.printStackTrace();
    }
    ```
    It is not as straight forward as Python. But it gives you a better understanding of what is happening behind the scenes. Most of the code is still abstracted away from us for the sake of usage, but we can obviously dive even deeper.
    We are creating a `BufferedReader` object which is reading the file line by line. We are then printing the line and then reading the next line. We are also handling the exception if the file is not found.

3. **Better understanding of memory management**: A core language gives you a better understanding of memory management. You will be able to understand how memory is allocated and deallocated in a language, how the garbage collector works and working of stack and heap memory.
4. **Refining your problem-solving skills**: It will help you refine your problem-solving skills and to optimize your code for better performance.
5. **Refining concepts**: It will help you build up many concepts which gets abstracted away in other languages. For example, OOPS concepts, sequence pattern, reactive programming, etc. By excessive usage of helper functions from the standard library, we tend to rely on them and never try to venture under the hood.
6. **Ease of learning other languages**: Once you have mastered a core language, learning other languages becomes easier. You will be able to understand the syntax and semantics of other languages better. Breaking into a new language seems familiar and easier as we already know the underlying technologies and concepts.

### Now the question arises, which core language should I pick?
The answer to this is not simple. If you are interested in working with low-level bare bone language, you should prefer C or C++ accordingly. My personal choice was Java as it is a high-level language, and I was interested in building applications.
It turned out to be a good choice as I get to learn many paradigms and design patterns which aren't possible on C++ or C. Java for the most part was versatile as I could implement anything due to it being a high-level language. It had helper functions when needed but not too much of them.

Rust is also a good choice but shouldn't be considered by beginners as it is a very complex language. It is a low-level language with high-level abstractions. It is a very powerful language but has a steep learning curve. Rust has one of the best programming paradigm and code structure.

For choosing a language to master, it should be more about what and how much I want to learn rather than what is the best language to learn. Every language has its own pros and cons. Switching to a new language is not a bug deal if you have mastered one. The basics for the most part are same but what really matters is the programming patterns and paradigms.