cd ..
cd ./gameplay_games-ms/
mvn clean install
docker build -t checkm8-gameplay_games .

cd ..
cd ./auth_users-ms/
mvn clean install
docker build -t checkm8-auth_users .

cd ..
cd ./analysis-ms/
mvn clean install
docker build -t checkm8-analysis .

cd ..
cd ./matchmaking-ms/
mvn clean install
docker build -t checkm8-matchmaking .
