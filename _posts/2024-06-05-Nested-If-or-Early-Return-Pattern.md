---
layout: post
title: Nested If or Early Return Pattern
description: Insights on when to use nested if or early return pattern in your code.
date: 2024-06-07 07:34 +0530
image: '/images/if-else.png'
tags: [Programming, Concept]
---
As we learn programming, we are introduced to the concept of `if-else` statements and how we can use them to write decision code. 
We are also taught about nested `if-else` and `else-if` ladder to write complex decision-making code. It's all fun and games until we start writing complex code which requires multiple nested `if-else` statements.

# The Problem
Let's look at a simple problem to overcome by if statements.
![If-Else-Problem](/images/post-assets/if-else-question.png)

The requirement of the problem is to process and validate a request then handle it. The diagram above shows the nesting of if of conditions to process the request.

### The Naive Approach
```java
public void processRequest(Request request) {
    if (request != null) {
        if (request.isValid()) {
            if (request.isAuthorized()) {
                if (request.isAllowed()) {
                    // Process the request
                } else {
                    System.out.println("Request not allowed");
                }
            } else {
                System.out.println("Request not authorized");
            }
        } else {
            System.out.println("Request is invalid");
        }
    } else {
        throw new IllegalArgumentException("Request cannot be null");
    }
}
```

This code is a classic example of nested if-else statements. What's wrong with this code?
* The nested if-else statements make the code hard to read and understand.
* The code is not easily maintainable. If we need to add more conditions, we will have to add more nested if-else statements.
* It's hard to keep track of the flow of `if` and `else` cases.
* This code also follow some anti patterns:
    * [Arrow Anti Pattern](https://wiki.c2.com/?ArrowAntiPattern): The code starts to look like an arrow towards the right due to multiple nesting and indentations.
    * [Else is considered smelly](https://wiki.c2.com/?ElseConsideredSmelly): "Smelly" is solely meant in the sense of program code that calls for improvement!

Let's try to refactor this code to make it more readable and maintainable.

# The Return Early Pattern
> The Return Early Pattern is a way of writing functions or methods so that the expected positive result is returned at the end of the function and the rest of the code terminates the execution (by returning or throwing an exception) when conditions are not met.

We implement this by negating the conditions and returning early with an appropriate clause statement if required.

### Refactoring approach
##### If-else ladder code
```java
if (something) {
    doThis();
} else {
    doThat();
}
```

##### Refactored code
```java
if (!something) {
    doThat();
    return;
}

doThis();
```
This seems an extra effort for a simple if-else statement. But when we have multiple nested if-else statements, this pattern helps a lot.

Let us now try to refactor the above code using the Return Early Pattern.
```java
public void processRequest(Request request) {
    if (request == null) {
        throw new IllegalArgumentException("Request cannot be null");
    }

    if (!request.isValid()) {
        System.out.println("Request is invalid");
        return;
    }

    if (!request.isAuthorized()) {
        System.out.println("Request not authorized");
        return;
    }

    if (!request.isAllowed()) {
        System.out.println("Request not allowed");
        return;
    }

    // Process the request
}
```

### What did we observe?
* The code has the same flow as the nested if-else statements but is not arrow shaped.
* We have negated all the conditions.
* If block now contains the `else` part of the nested if-else statements with a `return` statement.
* The code is sequential and adding more cases is easier than before.
* Reading and remembering the conditions is less confusing.
![If-Else-Refactored](/images/post-assets/if-happy-path.png)

# Advantages
> We should always try to implement this pattern for our conditional programming. Testing and debugging such code is easier.

There are some key design patterns rule that are followed with this mindset:
##### [Guard Clause](https://refactoring.guru/replace-nested-conditional-with-guard-clauses)
A guard clause is a conditional statement that is used to check for conditions that would prevent the code from running correctly. Guard clauses are used to check for invalid input, and if the input is invalid, the code will return early.

##### Fail Fast
This concept is the basis for the “return early” rule. While failing fast, the code is more robust because of the initial focus in finding the conditions where the code execution can terminate.

##### [Bouncer Pattern](https://wiki.c2.com/?BouncerPattern=)
The Bouncer Pattern is a method to validate certain conditions by throwing an exception. For example, nullability checks and range check.
```java
public void doSomething(String id, Object value, int index) {
    if (id == null) {
        throw new IllegalArgumentException("Id cannot be null");
    }

    if (value == null) {
        throw new IllegalArgumentException("Value cannot be null");
    }
    
    if (index < 0 || index > 10) {
        throw new IllegalArgumentException("Index should be between 0 and 10");
    }

    // Do something
}
```

# Disadvantages
Following design patterns require extra effort and time to implement. These are some predefined **convention** which developers found over time to ease the workflow.
However, we have keep them in the back of our head while approaching a problem.

### Writing style is subjective
Some developers might find it hard to read and understand the code written in this pattern. It's a matter of personal preference.
Let's take a look at the following code:
```java
public void useItem(Item item) {
    if (!item.isValid()) {
        return;
    }

    item.use();
}
```

```java
public void useItem(Item item) {
    if (item.isValid()) {
        item.use();
    }
}
```

Both the code snippets are doing the same thing. The first one is using the Return Early Pattern and the second one is the normal if-else statement.
The second code snippet seems short and concise. This is a matter of personal preference.

We should always try to follow some key principles:
* **DRY** (Don't Repeat Yourself): Avoid repeating the same code.
* **KISS** (Keep It Simple, Stupid): Keep the code simple and easy to understand.
* **YAGNI** (You Aren't Gonna Need It): Don't over-engineer the code.

# Conclusion
The Return Early Pattern is a good practice to follow when writing conditional code. It makes the code more readable, maintainable, and testable. 
It also helps in following some key design patterns like Guard Clause, Fail Fast, and Bouncer Pattern. However, this doesn't mean we should apply it every time.
We should always try to apply the best solution for the problem at hand.