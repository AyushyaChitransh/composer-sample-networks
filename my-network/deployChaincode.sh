cd "$(dirname "$0")"
~/fabric-tools/stopFabric.sh
~/fabric-tools/startFabric.sh 
# ~/fabric-tools/createComposerProfile.sh
composer network deploy -a ./dist/my-network.bna -p hlfv1 -i PeerAdmin -s randomString
cd Angular_Composer
npm start
