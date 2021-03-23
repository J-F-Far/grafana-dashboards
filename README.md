# Grafana-Dashboards

A tool to help create grafana dashboards using Grafonnet

## Usage

- Run ```docker-compose up``` to start the local grafana container
- Add some Grafonnet source .jsonnet files in the ./src directory
- Source the command_aliases file, and run ```generate-dashboards```
- The dashboards are generated inside a docker container and stored in a volume that is shared to the Grafana container in the provisioning directory. This is configured to generate Grafana's folder structure from the filesystem directory structure, and reloads dashboards if needed every 10s.

## Links

- [Grafonnet Docs](https://grafana.github.io/grafonnet-lib/)
- Related PromCon 2019 [Repo](https://github.com/adamwg/grafana-dashboards) and [Presentation](https://www.youtube.com/watch?v=kV3Ua6guynI)
