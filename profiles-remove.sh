cd /volumes
if ls [Macintosh HD]
  then 
  cd Macintosh\ HD
  cd var/db/configurationprofiles
  if pwd [var/db/configurationprofiles]
  then

  else 
  print ("deletion failed")
  exit
else
print ("deletion failed")
exit

