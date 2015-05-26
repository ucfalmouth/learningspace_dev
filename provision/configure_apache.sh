# replace apache_run_user/group with vagrant to allow allow writing of session variables
cp /var/www/provision/apache2.conf /etc/apache2
sudo /etc/init.d/apache2 restart
echo "learningspace_dev should be available at http://192.168.33.10/"
