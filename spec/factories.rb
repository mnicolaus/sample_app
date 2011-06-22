# By using the symbol ':user', we get Factory Girl to simulate the User model.

Factory.define :user do |user|
  user.name                 "Michael Nicolaus"
  user.email                "Michael.Nicolaus@t-online.de"
  user.password             "foobar"
  user.password_confirmation "foobar"  
end
  