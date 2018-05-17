# Introduction

This was my solution to an exercise: make a simple command-line calculator. See the unit test file for the features.

I chose a classic parser structure with mutual recursion between functions, where each function describes one kind of expression. This was cleaner than some sort of giant loop and switch statement, and also simpler than configuring some kind of general parsing library. I chose Ruby as reasonably fast and concise without being cryptic (and also just a favorite language of mine). I used TDD because code quality was important.

# Usage

Make sure Ruby (around 2.4.0) is installed.

For example:
```
ruby calc_driver.rb
>
1+1
2.0
>
1*2-3/4
1.25
```

To run the unit tests:
```
ruby test_calc.rb
```
