# My Commodity Trading network

Perform all the steps in a single terminal window

## To initialise fabric
These steps will download latest fabric docker images, initialize the fabric blockchain and create a composer profile on the fabric blockchain
```sh
export FABRIC_VERSION=hlfv1
cd ~/hyperledger/composer/fabric-tools
./downloadFabric.sh
./startFabric.sh
./createComposerProfile.sh
```

## Go to my-network
```sh
cd ~/hyperledger/composer/my-network
```

## Create Business Network Archive File
current directory `~/hyperledger/composer/my-network`
```sh
npm install
```

## Deploy the business network definition on the fabric blockchain
current directory `~/hyperledger/composer/my-network`
```sh
cd dist
composer network deploy -a my-network.bna -p hlfv1 -i PeerAdmin -s randomString
cd ..
```

To check whether the .bna is successfully deployed, run
`composer network ping -n my-network -p hlfv1 -i admin -s adminpw`
which should return
```
The connection to the network was successfully tested: my-network
    version: 0.10.0
    participant: <no participant found>

Command succeeded
```
## To generate Rest server
Current directory `~/hyperledger/composer/my-network` 

Run
```sh
composer-rest-server
```
Enter The following choices
>? Enter your Fabric Connection Profile Name: `hlfv1`

>? Enter your Business Network Identifier : `my-network`

>? Enter your Fabric username : `admin`

>? Enter your secret: `adminpw`

>? Specify if you want namespaces in the generated REST API: `never use namespaces`

>? Specify if you want the generated REST API to be secured: `No`

>? Specify if you want to enable event publication over WebSockets: `Yes`

>? Specify if you want to enable TLS security for the REST API: `No`


This will run the rest server which will listen on `localhost:3000`

The Api can be browsed on `localhost:3000/explorer`

Close the rest server with `Ctrl+C`

For running this step next time, we can use 

```
composer-rest-server -p hlfv1 -n my-network -i admin -s adminpw -N never -w true
```

## To start the Application

Current directory `~/hyperledger/composer/my-network`

```sh
cd my-app
npm start
```

This will execute the `composer-rest-server` to start API server on `localhost:3000` with explorer on`localhost:3000/explorer`.

The angular files are webserved on `localhost:4200`
