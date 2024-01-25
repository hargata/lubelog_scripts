x=$(curl -n -u "rootUser:rootPassword" --location "https://lubelogger.mydomain.com/api/makebackup")

z="https://lubelogger.mydomain.com${x}"

y=`tr -d "\"" <<< $z`

curl -n -u "rootUser:rootPassword" --location "${y}" -o "backup.zip"