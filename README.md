# Strict TODO management

https://rubygems.org/gems/strict-todo

We leave a lot of irresponsible TODO inside the application.

It's too dirty and stupid.

And that TODO will eventually go bad.

To prevent this from happening, I wanted to set rules for TODO and operate it.

## Format Rule

As a rule, describe who will do what by when.

- Best Format

```
# TODO(Author:Deadline): description
```

```
○ Good
# TODO(tunagohan:2020/01/30): What to do...

× Bad
-- noooooooo!!
# TODO: What to do...
-- no deadline
# TODO(tunagohan): What to do...
-- no author
# TODO(2020/01/30): What to do...
-- no description
# TODO(tunagohan:2020/01/30):
```

## Installation

- Add this line to your application's Gemfile:

```
gem 'strict-todo'
```

- And then execute:

```
$ bundle install
```

- Or install it yourself as:

```
gem install strict-todo
```

## Setting

```
$ touch strict_config.yml
```

- example

```bash
common:
  exclude: # Specify directories and files you want to exclude
    - 'node_modules'
    - 'tmp'
    - 'vendor'
    - '.git'
    - 'Gemfile.lock'
    - 'lib'
    - 'db'
  extension: # Specify the extension you want to extract
    - '.rb'
    - '.erb'
    - '.vue'
    - '.css'
    - '.scss'
    - '' # It is a specification method without extension
```

## Usage

```
bundle exec strict_todo_check
```

## Result Sample

![image](https://user-images.githubusercontent.com/19791597/106251052-d929bc80-6257-11eb-9374-1eae5223af74.png)

## Contributing

Come on anything :)
