# to be able to run the full image (including pulling from transifex)
# you need a valid .transifexrc file with your credentials in your home dir
# this one is temporarily copied to the project dir
# and removed after build
# maybe better to create a qgisdocker transifex user?

cp ~/.transifexrc .
pwd=$(pwd)
docker run -v $pwd:/build -w="/build" --rm=true --name="qgis_docs_218_build" qgis/sphinx_pdf make $@
rm -rf .transifexrc
