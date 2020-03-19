!#/bin/sh
# Install all plugins and the dependencies from a list file
for item in `cat $1`
do
    echo "------Install plugin: ${item}------"
    /usr/local/bin/install-plugins.sh ${item}
done
