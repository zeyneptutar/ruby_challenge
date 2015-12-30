# ruby_challenge
A Sample UI Application For Manage Contacts with Ruby On Rails and 
Used [Rabl](https://github.com/nesquena/rabl) for creating Api Service

Access from,
```
https://challenge-ruby.herokuapp.com/api/v1/contacts
https://challenge-ruby.herokuapp.com/api/v1/contacts/:id/show
https://challenge-ruby.herokuapp.com/api/v1/contacts/:id/edit
https://challenge-ruby.herokuapp.com/api/v1/contacts/:id/delete
```
Installatiton steps:
Simply clone app to your locale,
```
git clone git@github.com:zeyneptutar/ruby_challenge.git
```
And migrate your database,

```
rake db:migrate
```
Finally start your server

```
rails s Puma
```
