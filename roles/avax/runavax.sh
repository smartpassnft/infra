docker run -d -u avax  -p 9650:9650 -p 9651:9651 --name avaxnode \
   --mount type=bind,source=/var/lib/avax,target=/home/avax/.avalanchego,bind-propagation=shared \
   avaxnode:v1.5.1 --network-id=fuji --http-host 0.0.0.0 --api-ipcs-enabled --api-admin-enabled 
