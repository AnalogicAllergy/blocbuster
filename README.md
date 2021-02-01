# blocbuster

A movie app built with BloC and Clean Architecture

## Clean Architecture

![](https://cdn-media-1.freecodecamp.org/images/oVVbTLR5gXHgP8Ehlz1qzRm5LLjX9kv2Zri6)

> Independent of Frameworks. The architecture does not depend on the existence of some library of feature laden software. This allows you to use such frameworks as tools, rather than having to cram your system into their limited constraints.

> Testable. The business rules can be tested without the UI, Database, Web Server, or any other external element.

> Independent of UI. The UI can change easily, without changing the rest of the system. A Web UI could be replaced with a console UI, for example, without changing the business rules.

> Independent of Database. You can swap out Oracle or SQL Server, for Mongo, BigTable, CouchDB, or something else. Your business rules are not bound to the database.

> Independent of any external agency. In fact your business rules simply don’t know anything at all about the outside world.

## Core Concepts
    - Dependency injection
        > dependency injection is a technique in which an object receives other objects that it depends on. These other objects are called dependencies. In the typical "using" relationship the receiving object is called a client and the passed (that is, "injected") object is called a service.
    ![](https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freecodecamp.org%2Fnews%2Fa-quick-intro-to-dependency-injection-what-it-is-and-when-to-use-it-7578c84fa88f%2F&psig=AOvVaw2vgjvg0FmajjfpiCTuqSY7&ust=1612286586571000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCOjG8tuZye4CFQAAAAAdAAAAABAD)

## Folder Structure

- data
  - core
  - data_sources
  - models
  - repositories
  - tables
- di
- domain
  - entities
  - repositories
  - usecases
- presentation
  - blocs
  - journeys
  - themes
  - widgets
