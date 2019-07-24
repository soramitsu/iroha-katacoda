This Iroha is pre-configured with two users: `alice@test` and `bob@test`. 

![Alice and Bob](assets/alicebob.png)

They both have [all available permissions](https://github.com/hyperledger/iroha/blob/master/shared_model/schema/primitive.proto#L29) in the system. 
So both of them can perform any of the available actions in the system. 

There is also an asset -- `coin#test`:

![Coin](assets/coin.png)

Alice, Bob and the asset are parts of the same domain - `test`. 
There might be other ones in the system, representing different households, companies or institutions.

There is a [Python Iroha library](https://github.com/hyperledger/iroha-python/) installed in the system, so we can interact with Iroha from within a Python code

Please, wait for the system to initialize. You should see a command prompt (`$ `) after the configuration. This may take up to several minutes.

Check that Iroha is up and running:
`docker-compose -f /opt/sandbox/docker-compose.yml ps`{{execute}}

We run a [dockerized version of Iroha](https://hub.docker.com/r/hyperledger/iroha/). 
The container should show up as `UP` in the command output.

All set. We can proceed with the actual interaction with Iroha API

![Coin Issue](assets/1.jpg)
