Before the first pipeline run, perform the following-

1. Edit .gitlab-ci.yml file and modify the REPO_NAME variable:
REPO_NAME: gitlab.corp.local/<namespace>/<repository name> where items in <>
equal your namespace and repository name respectively, the gitlab URL for the 
repo will inform you.

2. Edit each *.go file and check the import statements at the top of the file.
Modify any import statement which has a path starting with
"gitlab.corp.local/root/lemonade"... to 
"gitlab.corp.local/<namespace>/<repository name>"...


To build the Docker image use the command below in the lemonade directory
docker build -t lemonade . 

To run the Docker image use the command
docker run --rm -it -p 8000:8000 lemonade 

Jon is here testing things...