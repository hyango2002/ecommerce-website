#!/bin/bash

# Update the system
sudo yum update -y

# Install Apache HTTP Server (httpd)
sudo yum install httpd -y

# Install Git
sudo yum install git -y

# Remove existing directory if needed
sudo rm -rf ecommerce-website  

# Clone the repository (assuming you want to overwrite existing)
git clone https://github.com/hyango2002/ecommerce-website.git

# Copy the files inside the cloned folder to the desired location
sudo cp -r ecommerce-website/server2/* /var/www/html/

# To get the current hostname address
echo "<center><p>Running the website from instance host: $(hostname -f)</p></center>" | sudo tee -a /var/www/html/index.html
# Start and enable the HTTP server
sudo systemctl start httpd
sudo systemctl enable httpd
