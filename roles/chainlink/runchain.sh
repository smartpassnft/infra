docker run -it -p 6688:6688 --network host \
   -v /home/chainlink:/chainlink \
   --env-file=env \
   smartcontract/chainlink:0.10.12 \
   local n -p /chainlink/.password -a /chainlink/.api

