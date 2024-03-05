## launching the container
- ssh to remote through port ID
- `bash envs/launch_container_e2mip.sh` (if required, change port ID)
- inside the container, go to `/e2ws`
- run `jupyter lab --ip 0.0.0.0 --port <pord ID> --allow-root`
- using a browser on local machine, got to `http://localhost:<port ID>`
-
- `jupyter lab --ip 0.0.0.0 --port 8526 --allow-root`
- [http://localhost:8526](http://localhost:8526)