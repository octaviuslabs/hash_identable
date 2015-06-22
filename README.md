# HashIdentable

Why expose your public ID's if you don't need to? Hang hash_identable on your rails models and use the #uuid method to get a unique id of any item.

## Credits

This gem wraps the hashids.org ruby gem: http://hashids.org/ruby/

## Installation

Add this line to your application's Gemfile:

    gem 'hash_identable', :git => 'https://github.com/octaviuslabs/hash_identable.git'

And then execute:

    $ bundle

## Usage

Assuming your model
```
  class MyModel
    attr_reader :id #HashIdentable depends on the presence of an ID
    # Other code
  end

```
Configure the gem

```
  HashIdentable.config do |c|
    c.set_salt "My Salt"  #THIS VALUE SHOULD NEVER CHANGE FOR THE APPLICATION
    c.set_length 36
    c.add_object MyModel, 3
  end
```

When you want the hashid:
```
  obj = MyModel.new(id: 12)
  obj.uuid
```
Or:

```
  obj = MyModel.new(id: 12)
  obj.identity.to_s
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/hash_identable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
