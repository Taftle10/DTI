cd /volumes
if ls ("Macintosh HD")
  cd Macintosh\ HD
  cd var/db/configurationprofiles
  if pwd ("var/db/configurationprofiles")

  else 
  print ("deletion failed")
  exit
else
print ("deletion failed")
exit

