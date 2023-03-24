# Docker container for running MetaboAnalyst

The Docker container defined in this repository contains all dependencies needed to run MetaboAnalyst locally.


## Installation and Initialization

* [Install Docker](https://docs.docker.com/get-docker/)

* Open a terminal window or the Windows PowerShell and navigate to the directory you would like to attach to your RStudio session.

* Start the container with the following command (it is highly recommended that you replace "password" with something more secure, e.g. you could use `-e PASSWORD=better-password!`):

> `docker run --rm -p 8888:8787 -e PASSWORD=pasword --volume $(path):/home/rstudio idssniaid/metaboanalyst`

* Open [https://localhost:8888](https://localhost:8888) in your browser and login in with the username, "rstudio", and the password specified above.

* This will start up an RStudio session with MetaboAnalystR and all dependencies installed.

* See [MetaboAnalystR documentation](https://www.metaboanalyst.ca/docs/RTutorial.xhtml) and [GitHub repository](https://github.com/xia-lab/MetaboAnalystR) for more information.
 
## Troubleshooting

* If `$(path)` is not resolving to the current working directory, you can enter the full path. Note that on Windows computers, you won't be able to use the native Windows path format. If your directory is on the C drive, it should look something like `//c/path/to/my/directry`.