# CompoundInterest

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/compound_interest`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'compound_interest'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install compound_interest

## Usage

In order to calculate compound interest, add this lines to your project:
```ruby
require "compound_interest"

compound_interest = CompoundInterest::Calculation
compound_interest.calculate(params)
```
method .calculate accept Hash like this:
```ruby
params = {
  initial_payment: 100,
  # number of terms
  term: 2,
  # number of interest payments for the term
  capitalization_periodicity: 12,
  # ineterest rate per term
  interest_rate: 10.0,
  # (optional)
  payment: 100,
  # (optional) number of payments for the term
  payment_periodicity: 12
}
```
In this example initial payment is 100$ (:initial_payment) for 2 years (:term) deposit, with annual interest rate 10% (:interest_rate). Interest paid every month (capitalization_periodicity: 12, it can be 365 if interest paid every day or anything else). Optionally, you can specify payment (:payment) this is the amount with which you replenish the deposit and payment periodicity (:payment_periodicity) stands for the number of replenishments for the period.
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing
This is my first gem so go easy on me =)

Bug reports and pull requests are welcome on GitHub at https://github.com/VovaK0-23/compound_interest.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
