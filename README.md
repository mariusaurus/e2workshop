# Nvidia Earth-2 workshop

Welcome to the workshop around Nvidia's AI platforms for atmospheric sciences. In this
workshop we will explore how these tools can be used to produce and analyse
atmospheric data.

## Requirements
The course consists of four Jupyter notebooks, basic Python knowledge is desired.
To set up the course, you please have the following items at your disposal:
- A running instance of the workshop container with access to a GPU with >=25GB memory.
The download link to the image is provided via email.
- the data package for the workshop (14GB). A single instance of the package which can
be accessed by all participants is sufficient. The download link will be provided in an email.
- the course content provided in this git repo.
- cds user ID and API key (create free account
[here](https://cds.climate.copernicus.eu/api-how-to))



## Launching the Environment
The description below assumes access to a system which can be reached through ssh
and has docker installed. For other container systems, you might need to adapt
`envs/launch_container.sh`. Execute the following steps to launch the environment:
- choose a port ID which will be different from the ID your colleagues choose.
- set up the ssh connection to the server through that port, either by adding the
`-p {port_ID}` flag to the command or by adding `Port {port_ID}` to the block in
`.ssh/config`
- if not done yet, pull the container onto the system: `docker pull {image_link:tag}`,
clone the content repo: `git clone {content_repo_link}` and download and unzip the
data package.
- In `envs/launch_container.sh`, fill in the first two lines providing absolute paths
to the content repo and to the data package.
- if using a different container engine different from docker, edit the container launch
command accordingly.
- launch the container by running `bash ./envs/launch_container.sh`
- set the port ID in `./envs/jupyter_server.sh` and execute the script, calling it from
`/e2ws`: `bash envs/jupyter_server.sh`
- copy the provided link to the server, paste it into a browser on your local machine,
edit and change `hostname` to `localhost` and paste the correct port ID
- go to `exercises/` and start exploring the notebooks, enjoy!

