# Remote Capybara/RSpec using PhantomJS without Rails #

This is an project to perform remote integration testing using RSpec, [Capybara](https://github.com/jnicklas/capybara), and [Poltergeist](https://github.com/jonleighton/poltergeist)/[PhantomJS](http://www.phantomjs.org/). The tests being run in spec/requests/ require variables not presented in this repository so you will want to modify these to fit your own tests.

## Prerequisites ##

### PhantomJS ###

You will want to [Install PhantomJS](http://phantomjs.org/download.html). It is a headless WebKit scriptable with a JavaScript API.

### Poltergeist  ###

You will need to install [Poltergeist](https://github.com/jonleighton/poltergeist). This is the driver for Capybara. Poltergeist allows for you to run your Capybara tests on a headless [WebKit](http://webkit.org) browser, provided by PhantomJS.

You need at least PhantomJS 1.8.1.  There are *no other external
dependencies* (you don't need Qt, or a running X server, etc.)

## Getting started  ##

You will want to run the following commands to setup the project locally:

``` ruby
git clone git@github.com:gmckeever/ihf-testing.git
cd ihf-testing
bundle install
```

You will also need to install the gems located in the Gemfile.

``` ruby
gem install capybara
gem install poltergeist
gem install rspec
```

### Running the tests ###

To run the tests, you could run `./bin/run-tests` .

Alternatively, you could execute rspec with `bundle exec rspec` .

### Adding Tests ###

You can add more tests by placing a file into the request folder with the name ending in spec. ex:`spec/requests/filename_spec.rb`.

## Notes ##

This is being designed for [Jenkins CI](http://jenkins-ci.org/), as it supports the headless WebKit testing of PhantomJS. More details for this coming soon.

If running locally, you may want to add [Launchy](https://github.com/copiousfreetime/launchy) to the project and create a debug method to open a browser window where the test fails.