# IncomeAndExpansesTracker
Helps you track and forecast your income and expenses. This project is currently under active development
and is not yet recommended for production deployment.

## Requirments
- Java
- MySQL
- JSP
- webserver, like tomcat

## Deployment
In order to deploy this project you will need to either open project in an IDE or use command line to generate a .war
file and deploy it to your chosen webserver. 

MySQL database and tables will be deployed by clicking a "Deploy database" link on index page. Database connection properties 
are stored in the "dbcon.properties" file, located in the web directory.

dbcon.properties should contain:
dbconnection = <connection_to_database>
dbuser = <database_user>
dbpass = <database_password>

## Feedback
Use github to leave your feedback.


