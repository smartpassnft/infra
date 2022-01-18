 docker exec chainlink-test bash -c "chainlink admin login -f /chainlink/.api ; chainlink keys eth list | grep 'Address'" | awk '{print $2}'
