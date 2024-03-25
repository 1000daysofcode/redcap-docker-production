# REDCap Docker Compose Environment

![Docker Compose][docker-compose-logo]
![REDCap][redcap-logo]

- [About](#about)
- [Quick-Start](#quick-start)
- [Full Documentation](#full-documentation)

Original Documentation:

[![documentation-button](rdc/documentation/button_documentation.png)](rdc/documentation/README.md)

## About
This is a [fork](https://github.com/123andy/redcap-docker-compose) of a REDCap instance intended for local development. 
There are three containers: one for the web application, one for cron jobs and another for the MySQL database. The original
repository includes both Mailhog and PhpMyAdmin, but these have both been removed. In case these are needed for development 
purposes, it is recommended to use the original Docker Compose environment.

The containers both use official images: the cron container uses Alpine, the web application container uses PHP's 
Apache-buster (Debian), and the MySQL container is just the MySQL image. Additionally, SSL/TLS support has been added, 
though certificate/ key files need to be linked to or added into the secrets folder. This should work with self-signed 
certificates as well as true certificates. 

## Quick-Start
 * [Install Docker Desktop](https://docs.docker.com/get-docker) 
 * Download/ clone this repository and unzip it to your computer
 * Copy/Rename `.env-example` to `.env` - it is located in the `rdc` folder (make changes as necessary).
 * Save the (TLS)/SSL certificate and key to the secrets directory with the names `cert.pem` and `cert-key.pem` 
 * See this [issue comment](https://github.com/123andy/redcap-docker-compose/issues/57#issuecomment-1041998401) from the 
 original repository if you need to create a self-signed certificate.
 * Upload the contents of a REDCap installation download to the `www` directory; keep `database.php` as is, but replace the rest
 * Once `.env` file settings are set, from the `rdc` folder type `docker compose up -d` (ensure your `SERVER_NAME` is in `hosts`)
 * Open your web browser and go to your host address; e.g. `http://localhost` (or, in some cases with macs `http://127.0.0.1`) 
 * Assuming the page loads without error, connect to your database with MySQL Workbench as root and run the installation script as below:
    * Generate the installation queries through REDCap's install.php pagecopy
    * Copy the entirety to the existing script `install_14.sql` 
    * Save the file and open in Workbench, then run all queries 
 * From here, you can log in to a REDCap instance, add OIDC supoport and import projects and/or data dictionaries.

## Upgrading The Framework
If you have an existing REDCap Docker Compose development setup and wish to swtich to the latest version, please review
the section in the [detailed documentation](rdc/documentation/README.md#how-do-i-upgrade-to-the-latest-version-of-redcap-docker-compose)

## Full Documentation
See the [detailed documentation](rdc/documentation/README.md) for more information!  Keep in mind this is a community
effort so feedback is appreciated.  Please create issues here with any suggestions or make a pull request with improvements.

[redcap-logo]: rdc/documentation/redcap-logo-large.png "REDCap"
[docker-compose-logo]: rdc/documentation/docker-compose.png "Docker Compose"
