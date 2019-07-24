import client

@client.trace
def send():  
  commands = [    
    client.iroha.command('AddAssetQuantity', asset_id='coin#test', amount='50000.00')
  ]
  tx = client.iroha.transaction(commands, quorum=1)
  client.IrohaCrypto.sign_transaction(tx, client.alice_private_key)
  client.send_transaction_and_print_status(tx)

send()
