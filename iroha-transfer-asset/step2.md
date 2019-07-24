The code snippet below:
* creates a connection object
* configures private key of user Alice, so Alice could sign transactions
* sets up helper methods to allow tracing of each stage the transaction passes in Iroha - that way you will see the logs of what is going on in the system. 

You can directly copy the snippet into a text editor right next to it or modify it if you feel like it. 
It is automatically saved.

<pre class="file" data-filename="client.py" data-target="replace">
#!/usr/bin/env python3.7

import iroha, binascii
from iroha import Iroha, IrohaGrpc, IrohaCrypto
from iroha.primitive_pb2 import *

iroha = Iroha('alice@test')
net = IrohaGrpc()
alice_private_key = '2d8cd91d3939420e7be09a54fb24d592b28c94de712cc7b2344d14b5471d889a'

def trace(func):
  """
  A decorator for tracing methods' begin/end execution points
  """
  def tracer(*args, **kwargs):
    name = func.__name__
    print('\tEntering "{}"'.format(name))
    result = func(*args, **kwargs)
    print('\tLeaving "{}"'.format(name))
    return result
  return tracer

@trace
def send_transaction_and_print_status(transaction):
  hex_hash = binascii.hexlify(IrohaCrypto.hash(transaction))
  print('Transaction hash = {}, creator = {}'.format(
      hex_hash, transaction.payload.reduced_payload.creator_account_id))
  net.send_tx(transaction)
  for status in net.tx_status_stream(transaction):
    print(status)
</pre>
