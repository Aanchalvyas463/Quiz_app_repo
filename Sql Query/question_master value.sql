-- JavaScript
INSERT INTO question_master (skill_id, question_text, difficulty_level, standard_answer)
VALUES
  (1, 'What is the difference between var, let, and const in JavaScript?', 'Easy', 'var is function-scoped, let is block-scoped, const is also block-scoped but cannot be reassigned'),
  (1, 'How do you create a promise in JavaScript?', 'Easy', 'A promise is created using the Promise constructor like this: new Promise((resolve, reject) => { /* code */ })'),
  (1, 'What is the use of the "this" keyword in JavaScript?', 'Easy', 'The "this" keyword refers to the current execution context, often the object that called the function'),
  (1, 'What is event delegation in JavaScript?', 'Easy', 'Event delegation is a technique where you attach a single event listener to a parent element to manage events for child elements'),
  (1, 'What are closures in JavaScript?', 'Easy', 'Closures allow a function to access variables from its lexical scope, even after the function has finished executing'),
  (1, 'How do you handle errors in JavaScript?', 'Easy', 'You handle errors using try-catch blocks or by handling rejections with .catch() in promises'),
  (1, 'What are JavaScript data types?', 'Easy', 'The data types are Undefined, Null, Boolean, String, Symbol, Number, Object'),
  (1, 'What is hoisting in JavaScript?', 'Easy', 'Hoisting is JavaScript’s default behavior of moving variable and function declarations to the top of their containing scope during compilation'),
  (1, 'What is the purpose of the JavaScript "bind" method?', 'Easy', 'The "bind" method creates a new function that, when called, has its "this" value set to the provided value'),
  (1, 'What is the difference between == and === in JavaScript?', 'Easy', '== compares values with type coercion, while === compares both values and types without type coercion'),
  (1, 'Explain the concept of prototypal inheritance in JavaScript.', 'Medium', 'Prototypal inheritance allows objects to inherit properties and methods from other objects through the prototype chain'),
  (1, 'What is the difference between synchronous and asynchronous code in JavaScript?', 'Medium', 'Synchronous code runs in sequence, blocking further execution, while asynchronous code allows other operations to run while waiting for some task to finish'),
  (1, 'How does the JavaScript event loop work?', 'Medium', 'The event loop manages the execution of code, handling synchronous and asynchronous code by using the call stack and the message queue'),
  (1, 'What are promises, and how are they used in JavaScript?', 'Medium', 'Promises represent the eventual completion or failure of an asynchronous operation and can be handled with .then() and .catch()'),
  (1, 'How do you optimize performance in JavaScript?', 'Medium', 'By using techniques like debouncing, throttling, minimizing DOM manipulations, and using requestAnimationFrame for visual updates'),
  (1, 'What is the difference between a shallow copy and a deep copy in JavaScript?', 'Medium', 'A shallow copy copies the top-level properties, while a deep copy copies the entire object, including nested objects'),
  (1, 'Explain how closure works in JavaScript with an example.', 'Medium', 'A closure occurs when a function retains access to variables from its lexical scope even after the outer function has returned'),
  (1, 'What are higher-order functions in JavaScript?', 'Medium', 'Higher-order functions are functions that take other functions as arguments or return functions as their result'),
  (1, 'What is the purpose of the JavaScript "apply" and "call" methods?', 'Medium', 'Both apply and call are used to invoke a function with a specified "this" value and arguments, but apply takes an array of arguments, while call takes a comma-separated list'),
  (1, 'Explain the concept of "callback hell" in JavaScript and how to avoid it.', 'Medium', 'Callback hell refers to deeply nested callbacks, which can be avoided using Promises or async/await'),
  (1, 'What are generators in JavaScript and how do they work?', 'Hard', 'Generators are functions that can be paused and resumed, allowing asynchronous code to be written in a synchronous style using the yield keyword'),
  (1, 'Explain the concept of asynchronous iterators in JavaScript.', 'Hard', 'Asynchronous iterators allow iteration over asynchronous data sources like APIs and streams using the for-await-of syntax'),
  (1, 'What is the difference between a deep copy and shallow copy of an array in JavaScript?', 'Hard', 'A deep copy creates a new array and recursively copies all nested objects, while a shallow copy only copies the first level'),
  (1, 'How do you implement memoization in JavaScript?', 'Hard', 'Memoization is a technique to optimize performance by caching the results of expensive function calls and returning the cached result when the same inputs occur'),
  (1, 'What are Web Workers in JavaScript, and when would you use them?', 'Hard', 'Web Workers allow running JavaScript in the background without blocking the main thread, useful for computationally expensive tasks'),
  (1, 'What is the event delegation model in JavaScript?', 'Hard', 'Event delegation allows you to handle events for many child elements by attaching an event listener to a parent element and filtering the target element'),
  (1, 'What is the concept of "lazy loading" in JavaScript?', 'Hard', 'Lazy loading is a design pattern that defers the loading of resources or data until they are actually needed, improving performance'),
  (1, 'What is the purpose of Service Workers in JavaScript?', 'Hard', 'Service workers enable offline functionality and background synchronization by intercepting network requests and caching resources for offline use'),
  (1, 'How does JavaScript handle memory management and garbage collection?', 'Hard', 'JavaScript uses a garbage collector that automatically reclaims memory occupied by objects that are no longer referenced'),
  (1, 'What are weak maps and weak sets in JavaScript?', 'Hard', 'WeakMap and WeakSet are similar to Map and Set, but they hold references to objects in a way that does not prevent garbage collection when there are no other references to the object');