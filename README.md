# README

Testing Materialized views in a Rails app


Main DB diagram

https://i.imgur.com/Fa1AXuA.png

![ERD diagram](https://i.imgur.com/Fa1AXuA.png)


## Result

![Final Result](https://i.imgur.com/ZxFQzy3.png)


## To Refresh the Materialized view
```ruby
Scenic.database.refresh_materialized_view("book_stores", concurrently: false, cascade: false)
```
