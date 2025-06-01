# UCCSER Development Stack

*Version 3.0*

This stack is required when working on the following UCCSER projects:

- [CS Unplugged](https://github.com/uccser/cs-unplugged)
- [CS Unplugged Classic](https://github.com/uccser/cs-unplugged-classic)
- [CS Field Guide](https://github.com/uccser/cs-field-guide)
- [codeWOF](https://github.com/uccser/codewof)
- [DTHM for Kaiako](https://github.com/uccser/dthm4kaiako)

A proxy is used to mimic our production environment on your local  machine, for consistency when developing.
This proxy also allows multiple of our projects to run on your development environment simultaneously.

The stack also includes a tool for catching emails sent by our UCCSER projects.

# Installation

These steps are suitable for installing within the recommended Linux environment, either straight Linux or Linux within a WSL2 distro, as defined in our [UCCSER development guide](https://github.com/uccser/uccser-development-guide).
If you have used this development guide, the first two steps of these installation steps are already completed.

1. Install [Docker](https://docs.docker.com/engine/).
2. Install [Docker Compose](https://docs.docker.com/compose/install/) (the v2 plugin, not the older v1 `docker-compose`).
3. Install [mkcert](https://github.com/FiloSottile/mkcert).
4. Run `./create-certs.sh` to install the certificate authority and create the required certificates.

The `create-certs.sh` script will create SSL certificates for our UCCSER projects.
The script will also tell you when the certificates expire, when you will be required to rerun this setup to regenerate the certificates.

If you are using WSL2 to run Docker on Windows, there are a few extra steps to get the stack installed correctly:

6. Install [mkcert](https://github.com/FiloSottile/mkcert) on both the Windows host machine and within WSL.
7. Open a Windows Powershell terminal and run `mkcert -install` to install the certificate authority on Windows.
8. Run `mkcert -CAROOT` to find the location of the CA files in Windows.
9. Open this location in Windows Explorer and copy the two files within the directory.
10. Open a terminal in WSL and run `mkcert -install` to install the certificate authority within WSL.
11. Open a terminal within the Linux environment and run `mkcert -CAROOT` to find the location of the CA files in Linux (you may need to create this ).
12. Open this location in Windows Explorer and paste the two Windows files into this location, replacing the existing files.
    - The Linux disk drives can be found with <kbd>Win</kbd> + <kbd>R</kbd> (opens the Run prompt) and entering `\\wsl$`
    - You may need to delete the Linux files, to place the Windows files.
13. Open a terminal within the Linux environment and run `./create-certs.sh` to recreate the required certificates.

# Usage

To run the development stack, run `docker compose up -d` in this project directory. Alternatively, run `./dev start`.
Docker will run the stack in the background.
The development stack opens ports 80 and 443 on the host machine, therefore any existing services using one of these ports will need to be stopped before starting the development stack.

Once the development stack is running, the following features are available:

- **Proxy dashboard:** Open https://proxy.localhost.
- **Email system:** Open https://email.localhost.

> We recommend adding an alias to your terminal to start the development stack from anywhere.
> The following command will add the alias `uc-dev` to the Bash terminal configuration file `.bashrc`.
> You will need to modify the path to the docker compose file for your specific system.
>
> ```
> `echo 'alias uc-dev="docker compose -f ~/uccser-development-stack/docker-compose.yml up -d"' >> ~/.bashrc`
> ```

To view logs of the proxy, run `docker compose logs -f traefik`. Alternatively, run `./dev logs traefik`.

To shutdown the development stack, run `docker compose down` or `./dev end`.
If you get a error when running this command, saying `ERROR: error while removing network: network uccser-development-stack`, then one of our website systems is likely still running.
The stack will be shutdown, but the network will remain active.
If you wish to remove the network, you will need to end all UCCSER website systems first then rerun the shutdown command.

# Notes

The proxy binds to ports 80 and 443.
If you are trying to run other systems that wish to bind to these ports, you will need to shutdown the stack.

# Changelog

## 3.0

- Changed name of repository from `uccser-development-proxy` to `uccser-development-stack` to better reflect the contents and purpose of these tools.
- Renamed the Docker network to match the new repository name.
- Update to Docker Compose v2 commands.
- Add instructions for running within a WSL2 environment.

## 2.0

- Add Mailhog for email capturing during local development.

## 1.0

- Initial release of Traefik proxy with HTTPS certificate generation.
