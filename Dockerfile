FROM jetty

ADD target/*.war /var/lib/jetty/webapps/
