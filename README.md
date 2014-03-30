Microgen
========

This is a collection of very simple generators for Rails 3/4. So far, there are only generators for migrations - to create new tables and to change existing tables.

These generators don't load a Rails environment or attempt to boot Rails at all, they simply write a static file with a proper migration name and a lot of commented out example code to perform all the common operations. You can then uncomment and edit what you need and remove the rest.

I find this to be a faster and more useful approach than trying to define my migration on the command line and then having to edit it and look up references anyway.

I put these and other useful scripts in an 'aux' directory in my Rails projects, which I link to a dropbox folder and never commit. Then I can run them like so:

```
./aux/table_generator Person
```

The result:

```
Generated: db/migrate/20140331090600_create_people.rb
```

Then the migration will look something like this:

```ruby
class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      #t.references   :anything
      #t.belongs_to   :order,             index: true

      #t.datetime     :published_at
      #t.string       :source_reference,  length: 30
      #t.string       :state,             null: false
      #t.float        :pressure,          default: 0.0
      #t.string       :email,             unique: true

      t.timestamps
    end
  end
end
```
