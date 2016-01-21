# Gmaps

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/gmaps`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails-gmaps', '~> 0.2.0', require: 'gmaps'
```

And then execute:

    $ bundle

## Usage

## Setting Up

	bundle
	rails g gmaps:install
	rails g gmaps MODEL
	rake db:migrate

## Usage

### Registry google map key and add google map key in your head tag in application.html.erb

```ruby
  <%= google_map_api_js("your google api key") %>
```

### Require locations.coffee.js into your application.js

```
  .....
  //= require locations
  .....
```

### Add code below into any where if you want to display the map :

```
  <%= show_map_helper your_model %>
```

Example:

```
  <%= show_map_helper user %>
```

### You can set options for view

#### You can set "width" , "height" for map view

```
	<%= show_map_helper user, {width: 400, height: 200} %>
```

#### You can set "searchbox_with" for search box

```
	<%= show_map_helper user, {searchbox_width: 300} %>
```

#### You can show or hide your search box

```
		<%= show_map_helper user, {searchbox: 'show', width: 400, height: 200, searchbox_width: 300} %>
```
	and when you want to hide the search box

```
		<%= show_map_helper user, {searchbox: 'none', width: 400, height: 200, searchbox_width: 300} %>
```

#### You can only set show or point to map using attribute "allow"

```
	<%= show_map_helper user, {allow: 'show', searchbox: 'none', width: 400, height: 200, searchbox_width: 300} %>
```

and when you want to point

	```
    <%= show_map_helper user, {allow: 'point', searchbox: 'none', width: 400, height: 200, searchbox_width: 300} %>
  ```

	Example:

	```
		<%= show_map_helper user, {width: 400, height: 200, searchbox_width: 300} %>
  ```

#### You can set latitude and longitude default for your place

```
  <%= show_map_helper user, {latitude: 1.3028, longitude: 103.35, allow: 'show', searchbox: 'none', width: 400, height: 200, searchbox_width: 300} %>
```

#### You can set zoom for map

```
  <%= show_map_helper user, {zoom: 10, latitude: 1.3028, longitude: 103.35, allow: 'show', searchbox: 'none', width: 400, height: 200, searchbox_width: 300} %>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/gmaps. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

