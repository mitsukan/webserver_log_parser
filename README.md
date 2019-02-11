# webserver.log Parser

### How to run:

At the root of the repo, `ruby run_parser.rb webserver.log` will open the script and print out the results.

Test coverage: 100% excluding the script.... 25% if I include the script.

### Challenges

- I should have also taken a step back and realised that regex would have been overkill to extract the information.
- Switching languages and therefore testing framework proved to be much harder than expected.
- I spent a lot of time trying to test the `ARGV` to test the command line argument with no luck.
- I wasted a lot of time trying to figure out stubbing the `File.readlines`. I settled for creating small dummy log
files to carry out smaller incremental tests.
- Some of the logic behind each tests were quite involved. Would have been nice to break down the tests
further to make it easier to build up. 

