rails-starter-box
=================

It is based on Ubuntu 13.04

## USAGE:

Before you install the vagrant, you need to download and install [Vagrant](http://www.vagrantup.com/downloads.html) and [Virtualbox](https://www.virtualbox.org/wiki/Downloads).

*Warnning: Don't use `gem install vagrant`, this gem has been not updated.*

```
$ git clone git@github.com:gotealeaf/rails-dev-box.git
$ cd rails-dev-box
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

You can get more usage details for Vagrant [here](http://vagrantup.com/).

## Notice:

If you use this project, it does not provide a `Graphical User Interface` at this time. So when you are debugging feature specs, you need to do some extra steps.

There are two different choices for you.

#### One Choice: Use a Headless Browser

This is the method that we prefer.

* Install & Initialization

Before you can use a headless browser to debug, you need to install [PhantomJS](http://phantomjs.org). We have integrated it in this project, so you don't need to install it here, but you need to know what we use.

Now in your Rails app, you need to follow the steps below.

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

But, when you want to do something like `save_and_open_page` to see what the page looks like, you need to use `save_screenshot`.

For example:

```
scenario "with valid user info and valid card" do
  fill_in_valid_user_info
  fill_in_valid_card
  click_button "Sign Up"

  save_screenshot('tmp/file.png') # Add this.

  expect(page).to have_content("Thank you for registering with MyFlix. Please sign in now.")
end
```

When you run rspec, poltergeist will take a screenshot for you, and save it in `tmp/` folder called `file.png`

#### Another Choice: Install a GUI

After installing a GUI, you can install web browsers and then you can use `selenium` to debug feature specs.

* One choice: install XFCE.

After you run the `vagrant up` command, and enter the virtual box by typing `vagrant ssh`, you can install `xfce4` using:

```
sudo apt-get install xfce4
```

I recommend that you use [XFCE](http://xfce.org) instead of [Gnome](http://www.gnome.org), because XFCE is more lightweight.

* Another choice: install Gnome.

If you really want to install `Gnome`, follow the steps below.

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
