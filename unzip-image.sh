echo "Add the image you want to unzip (THE FILE NEEDS TO BE IN YOUR DESKTOP, DO NOT ADD ANY SPACES, IF YOUR FILE IS BIG THIS WILL TAKE A WHILE, WAIT UNTIL THE TERMINAL STOPS CREATING NEW DIOLOGUE, BE SURE TO ADD THE TYPE OF IMAGE IT IS IE .png, .jpeg, etc)"
read UnzipFile

cd Desktop
unzip $UnzipFile

echo "Process Complete, Exiting Terminal"
exit
