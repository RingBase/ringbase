## RingBase

### Status
[![Build Status](https://travis-ci.org/RingBase/ringbase.png?branch=master)](https://travis-ci.org/RingBase/ringbase)
[![Coverage Status](https://coveralls.io/repos/RingBase/ringbase/badge.png?branch=master)](https://coveralls.io/r/RingBase/ringbase?branch=master)

### Testing Rails using rspec

#### Manually
You can run the tests manually with the `rspec` command:

```
$ bundle exec rspec
```

You can also pass in specific test file or directory to run:

```
$ bundle exec rspec spec/models/user_spec.rb
```

#### Using Guard
Guard watches spec files and runs them when they change (i.e., it runs tests when you save a test file).
To use it, start up Guard:

```
$ bundle exec guard start

16:10:56 - INFO - Guard::RSpec is running
guard(main)>
```

You can run specs by pressing enter, or just modify a test file and it will run automatically.


### Testing AngularJS using Karma
1. Install Karma (node as well if you haven't already)
`npm install -g karma`

2. Run these scripts for e2e and unit testing:
`./scripts/test-e2e.sh`
`./scripts/test-unit.sh`
