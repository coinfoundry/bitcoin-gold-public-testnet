Groestlcoin two nodes network on testnet3
-----------------------------------------

- Node Pool
  - RPC Port 15001, Username: user, Password: pass
- Node Bob
  - RPC Port 15002, Username: user, Password: pass

To run this image with internal ports exposed at host:

```bash
docker run -it -d -p 15001:15001 -p 15002:15002 oweichhold/groestlcoin-public-testnet
```

Example RPC against Node-Pool:

```bash
curl --user user:pass --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getinfo", "params": [] }' -H 'content-type: application/json;' http://127.0.0.1:15001/
```
