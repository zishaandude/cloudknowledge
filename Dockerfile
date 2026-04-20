FROM centos:latest  
# Use latest CentOS base image

RUN yum install -y httpd zip unzip  
# Install Apache web server (httpd), zip, and unzip tools

ADD https://github.com/Md-Iqbal/Hotel-website.git /var/www/html/  
# Download website template ZIP file into web root directory

WORKDIR /var/www/html  
# Set working directory

RUN unzip kindle.zip  
# Extract the ZIP file

RUN cp -rvf Hotel-website.git/* .  
# Copy extracted website files into current directory

RUN rm -rf Hotel-website.git
# Remove unnecessary files and folders

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]  
# Start Apache server in foreground (required for Docker)

EXPOSE 80  
# Expose port 80 (HTTP)
