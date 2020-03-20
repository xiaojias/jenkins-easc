# Install all plugins and the dependencies from a list file
for item in `cat $1 | grep -v "^#"`
do
    echo "------Install plugin: ${item}------"
    /usr/local/bin/install-plugins.sh ${item}
done
