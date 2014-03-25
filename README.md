SpreeFavorites
==============

[![Code Climate](https://codeclimate.com/github/JDutil/spree_favorites.png)](https://codeclimate.com/github/JDutil/spree_favorites) [![Build Status](https://travis-ci.org/JDutil/spree_favorites.png?branch=master)](https://travis-ci.org/JDutil/spree_favorites)

This extension adds the ability to favorite products, and can be entended to favorite anything you would like with the Spree::Favorite's favorable polymorphic extension.

Installation
------------

Add spree_favorites to your Gemfile:

```ruby
gem 'spree_favorites', github: 'JDutil/spree_favorites'
```

For older versions of spree.

```ruby
# Spree 2.2.x
gem 'spree_favorites', github: 'JDutil/spree_favorites', branch: '2-2-stable'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_favorites:install
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_favorites/factories'
```

Credits
-------

Inspired by [https://github.com/vinsol/spree_favorite_products](https://github.com/vinsol/spree_favorite_products)

Copyright (c) 2014 [Jeff Dutil](https://github.com/JDutil), released under the [New BSD License](https://github.com/JDutil/spree_favorites/blob/master/LICENSE)
