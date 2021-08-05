# UCCSER Development Proxy

This proxy is used when working on the following UCCSER websites:

- [CS Unplugged](https://github.com/uccser/cs-unplugged)
- [CS Field Guide](https://github.com/uccser/cs-field-guide)
- [codeWOF](https://github.com/uccser/codewof)
- [DTHM for Kaiako](https://github.com/uccser/dthm4kaiako)

This proxy allows multiple systems to run on your development environment simultaneously.

# Setup

You will need to have the following tools installed to run this proxy:

- Docker
- Docker Compose
- [mkcert](https://github.com/FiloSottile/mkcert)

Once these tools have been installed, then run `./create-certs.sh`.
The script will create SSL certificates for all our websites.
The script will finish with telling you when the certificates expire, where you will be required to rerun this setup.

# Usage

To run the proxy, run `docker-compose up -d` in this project directory.
Docker will run the proxy in the background.

You can view the dashboard of the proxy by opening a browser and going to `proxy.localhost` in your preferred web browser.

To view logs of the proxy, run `docker-compose logs -f traefik`.

Do shutdown the proxy, run `docker-compose down`.
If you get a error when running this command, saying `ERROR: error while removing network: network uccser-development-proxy`, then one of our website systems is likely still running.
The proxy will be shutdown, but the network will remain active.
If you wish to remove the network, you will need to end all UCCSER website systems first.

# Notes

The proxy binds to ports 80 and 443.
If you are trying to run other systems that wish to bind to these ports, you will need to shutdown the proxy.
