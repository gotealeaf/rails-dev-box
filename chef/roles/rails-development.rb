name "rails-development"
description "setup for ruby on rails development environment for Tealeaf Academy"
run_list(
  "recipe[apt]",
  "recipe[preinstall]",
  "recipe[git]",
  "recipe[sqlite]",
  "recipe[redis]",
  "recipe[nodejs::install_from_binary]",
  "recipe[memcached]",
  "recipe[ruby_build]",
  "recipe[rbenv::system]",
  "recipe[rbenv::vagrant]",
  "recipe[postinstall]"
)
