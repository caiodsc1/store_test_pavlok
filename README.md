## Shopping Cart App

[https:/store-test1.herokuapp.com](https://store-test1.herokuapp.com)

## Installation

**Dependencies**: Before installation make sure you have PostgreSQL (tested with 9.5 and 11.5), Ruby (2.5.1) and Rails (5.2.3) installed. 

1. Clone the Project

	~~~ sh
	git clone https://github.com/caiodsc1/wish_lists.git
	~~~

2. Bundle

	~~~ sh
	bundle install
	~~~

3. Create and Migrate Database

	~~~ sh
	rails db:create db:migrate
	~~~

4. Fill the .env with your credentials

5. Start the Application

	~~~ sh
	rails s
	~~~


## Testing with RSpec

1. Run tests

    ~~~ sh
    rspec
    ~~~
    
    