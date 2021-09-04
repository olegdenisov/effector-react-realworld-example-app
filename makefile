run: 
  docker run -d -p 3000:4100 --env-file ./.env --name real-world --rm real-world
stop:
  docker stop real-world