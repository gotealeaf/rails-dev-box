rails-starter-box
=================

It is based on Ubuntu 13.04

## USAGE:

```
$ git clone git@github.com:gotealeaf/rails-dev-box.git
$ cd chef-rails-dev-box
$ bundle install
$ cd chef
$ bundle exec librarian-chef install
$ cd ../
$ vagrant up
$ vagrant ssh # Then you can enter the virtual box.
```

The user's name and password:

```
user name: vagrant
password: password
```

You can get more usage of Vagrant in [here](http://vagrantup.com/).

## Notice:

If you use this project, it does not provide `Graphical User Interface` at this time. So debugging feature specs, you need to do some extra steps.

There are two different chooses for you.

#### One Choose: Using Headless Browser

This is the common way that how we run test suite.

* Install & Initialization

Using headless browser to debug, first you need to install [PhantomJS](http://phantomjs.org). We have integrated it in this project, so you don't need to install it here, but you need to know what we use.

Now in your Rails app, you need follow the steps below.

First, edit your `Gemfile`

```
# Add
group :test do
  gem 'poltergeist'
end
```

And then in your `spec/spec_helper.rb` file.

```
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

```

* Usage

It will not change the way that you run `rspec`, the command is still `rspec spec/feature/user_register_spec.rb`

But, when you want to do something like `save_and_open_page` to see what the page looks like, you need to use `save_screenshot`

For example:

```
scenario "with valid user info and valid card" do
  fill_in_valid_user_info
  fill_in_valid_card
  click_button "Sign Up"

  save_screenshot('tmp/file.png') # add it.

  expect(page).to have_content("Thank you for registering with MyFlix. Please sign in now.")
end
```

When you run rspec, poltergeist will take a screenshot for you, and save it in `tmp/` folder called `file.png`

#### Another Choose: Install GUI

This way could provide you GUI, so you can install web browsers and then you can use `selenium` to debug feature specs.

* One choose: install XFCE.

After you run the `vagrant up`, and enter the virtual box by `vagrant ssh`, you can install `xfce4` by using:

```
sudo apt-get install xfce4
```

I recommand you to use [XFCE](http://xfce.org) instand of [Gnome](http://www.gnome.org), because XFCE is more lightweight.

* Another choose: install Gnome.

But if you really want to install `Gnome`, follow the steps below.

```
sudo add-apt-repository ppa:gnome3-team/gnome3
sudo apt-get update
sudo apt-get install gnome-shell
sudo apt-get install ubuntu-desktop
```

After installing the desktop, you'll also want to install GDM which will let you boot directly into a graphical environment. (or lightDM)

```
sudo apt-get install gdm
```

Once done, you need to configure it.

```
sudo dpkg-reconfigure gdm
```
