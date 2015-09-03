# railstest
railstest

Setup:

1) Ruby version 2.0 ROR 4.2.4

2) install and run Mysql database , maybe you'll need need to create new database with privilegies such as:

DROP DATABASE IF EXISTS railstest_development;
CREATE DATABASE railstest_development CHARACTER SET utf8;
USE railstest_development;
set charset Utf8;

3) configure properties for your database in file: config/database.yml

4) go to folder: graph_form_sql
- build and install created gem file, using commands:
        gem build graph_form_sql.gemspec
        gem push graph_form_sql-0.0.1.gem

5) go to root dir, run 'bundle install'  to install all nesessary gems from Gemfile

6) run 'rake db:migrate' and 'rake db:seed' to init database and fill table's data

7) start ROR server using 'rails server' command

8) go to localhost:300 to show welcome page


What have been done:

1) Simple CRUD mechanism for filling data of Authors and books with paging
2) Seed mechanism to fill data automatically
3) Graph contloller to view graphic data via chartjs library using 3 methods, see: app\controllers\graph_controller.rb
4) Gem module : graph_form_sql to retrieve data from database and show it in the html page as chart diagram
