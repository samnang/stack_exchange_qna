# Stack Exchange QnA

Stack Exchange Question and Answers API wrapper client. It helps you to simplify querying data from stack exchange sites(stackoverflow.com, superuser.com, etc.) via object oriented way.

``` ruby
questions = Question.where(:tagged => "Ruby")
                           .page(2)
                           .pagesize(42)
                           .includes(:answers)
```

## Early Development Stage

It is in early development stage. It probably wouldn't usable yet. Keep your eyes on it :)