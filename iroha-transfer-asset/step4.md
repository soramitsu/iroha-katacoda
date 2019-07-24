Now our script is ready and can be executed:

`python3.7 add-asset-quantity.py`{{execute}}

You should see several statuses returned during the script execution followed by terminal status `COMMITTED` - it means that the transaction was accepted by the blockchain and written down to the block store. 
You can check that by looking up block store's contents:

`docker exec iroha cat /tmp/block_store/0000000000000002 | python3 -m json.tool`{{execute}}

So now we have 50000 coins!