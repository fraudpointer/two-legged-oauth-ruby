# Two Legged OAuth

* https://github.com/fraudpointer/two-legged-oauth-ruby

## Description

The purpose of this gem is to make the [oauth gem](https://github.com/oauth/oauth-ruby) play nice
with Google's custom 2 legged OAuth (2LO), used specifically for [Google Apps APIs](http://code.google.com/googleapps/) accessed from [Google Apps Marketplace applications](http://code.google.com/googleapps/marketplace/).

For more info on the 2 legged OAuth see these :

* [Google Apps OAuth](http://code.google.com/apis/accounts/docs/OAuth.html#GoogleAppsOAuth)
* [2 Legged OAuth in PHP](http://gdatatips.blogspot.com/2008/11/2-legged-oauth-in-php.html)
* [Google Apps Marketplace Authentication Best Practices](http://code.google.com/googleapps/marketplace/best_practices.html)
* [Google Data APIs 2 Legged OAuth](http://code.google.com/apis/gdata/docs/auth/oauth.html#2LeggedOAuth)

This gem has been tested with the following libraries so far and seems to be working ok :

* [GoogleContactsApi](https://github.com/aliang/google_contacts_api)
* [GoogleSpreadsheet](https://github.com/gimite/google-spreadsheet-ruby) (with some [custom fixes](https://github.com/fraudpointer/google-spreadsheet-ruby/tree/two_legged_oauth) that hopefully will get integrated to the official gem)
* [Google Apps Marketplace Ruby tutorial](http://code.google.com/googleapps/marketplace/tutorial_ruby.html)

## Installation

### Bundler

Add on your Gemfile :

    gem 'two-legged-oauth'

### By hand

On the console :

    gem install two-legged-oauth

On your code :

    require 'two-legged-oauth'

## Usage

Create a normal consumer instance :

    consumer = OAuth::Consumer.new("key", "secret")

Initialize a TwoLeggedAccessToken specifying the xoauth_requestor_id :

    access_token = OAuth::TwoLeggedAccessToken.new(oauth_consumer, "user@domain.com")

Pass that access token to Google Data libraries (or your custom scripts) :

    g = GoogleSpreadsheet.login_with_oauth(access_token)

## Internals

This thing works by rewriting the requested URL on-the-fly and appends the xoauth_requestor_id param appropriately. This may be dangerous at times so be aware that some well hidden bugs may come up...

## Bugs/fixes

...

## Contributing

Tested contributions are always welcome! Here's what you should do:

1. Clone the repo
2. Run the tests
3. Write some test-driven code
4. Create a pull request

# License

two-legged-oauth is copyright 2011 by [Fraudpointer](http://www.fraudpointer.com), released under the MIT License (see LICENSE for details).
