* Download client: https://www.wireguard.com/install/

### Setup and run on Ubuntu

1. Install:
    ```
    $ sudo apt update
    $ sudo apt install wireguard
    ```


2. Create configuration file:
    ```
    $ sudo touch /etc/wireguard/wg0.conf
    ```


3. Add to `wg0.conf` following settings:
    ```
    [Interface]
    Address = 10.128.0.14/32
    DNS = 8.8.8.8
    PrivateKey = CLIENT_PRIVATE_KEY
    [Peer]
    PublicKey = I4dtr59w1lFSX2bRFv6l7+3tkCKg3eMfSEvjIO4w32s=
    AllowedIPs = 0.0.0.0/0
    Endpoint = 51.250.43.117:51820
    PersistentKeepalive = 21
    ```

    Replace `CLIENT_PRIVATE_KEY` with your private key.


4. Run
    ```
    sudo wg-quick up wg0
    ```

    You can check the connection with:
    ```
    sudo wg
    ```

    The output should be like:
    ```
    interface: wg0
    public key: Dfp9J8HpW3qSXQdywn7gBYyTMt4+FliO6NX/s2kA/Eo=
    private key: (hidden)
    listening port: 58878
    fwmark: 0xca6c

    peer: I4dtr59w1lFSX2bRFv6l7+3tkCKg3eMfSEvjIO4w32s=
    endpoint: 51.250.43.117:51820
    allowed ips: 0.0.0.0/0
    latest handshake: 1 minute, 32 seconds ago
    transfer: 5.03 MiB received, 3.42 MiB sent
    persistent keepalive: every 21 seconds
    ```

    Also you can ping the server with:
    ```
    ping 10.128.0.14
    ```

5. Start at Boot

    If you want to start your WireGuard after every system reboot just run:
    ```
    $ sudo systemctl enable wg-quick@wg0
    ```

    To remove this:
    ```
    $ sudo systemctl disable wg-quick@wg0
    ```