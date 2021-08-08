DEMO_NAME="local_coffeeshop"

echo "Running coffeedust.io demo install script for"
echo $DEMO_NAME
echo "----------------------"

if [ ! -d "../$DEMO_NAME" ];
then
  echo "ERROR: You are not in the correct directory"
else
  bundler install
  rake db:migrate SINATRA_ENV=test
  
echo "$DEMO_NAME installed!"
fi