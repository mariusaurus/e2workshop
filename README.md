## for the workshop, have at your desposal
- cds user ID and API key (create free account at [here](https://cds.climate.copernicus.eu/api-how-to))
- the data for the workshop. You should have received a link.
- a running instance of the workshop container. Link to the image is also provided through email.


## launching the container
- ssh to remote through port ID
- `bash envs/launch_container_e2mip.sh` (if required, change port ID)
- inside the container, go to `/e2ws`
- run `jupyter lab --ip 0.0.0.0 --port <pord ID> --allow-root`
- using a browser on local machine, got to `http://localhost:<port ID>`
-
- `jupyter lab --ip 0.0.0.0 --port 8526 --allow-root`
- [http://localhost:8526](http://localhost:8526)
