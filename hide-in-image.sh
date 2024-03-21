echo "DO NOT ADD ANY SPACES TO YOUR FILES WHEN CREATING THEM"

echo "What is the name of your photo image (add .png or .jpeg or whatever photo type your image is)?"
read PhotoImage

echo "What is the name of your zip file (you can try to use other files, do the file type at the end. IE .zip)?"
read ZipFile

echo "What do you want your new file to be called (add .png or .jped or whatever you want)?"
read NewFile

cd Desktop
cat $PhotoImage $ZipFile > $NewFile
