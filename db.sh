# clean up oude DB
docker kill db
docker rm db

# Start nieuwe container
docker run -p 3306:3306 --name db -e MYSQL_ROOT_PASSWORD=conference -d mysql:5.7

echo 'wacht 15s'
sleep 20

# reload Database in container op basis van dump
cat ./database/user.sql | docker exec -i db /usr/bin/mysql -u root --password=conference
cat ./database/conference.sql | docker exec -i db /usr/bin/mysql -u root --password=conference
