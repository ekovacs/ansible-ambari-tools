How To Use
----------

1. Build:

    A simple docker build in the root of the repository is sufficient.
    ```
    docker build -t ansible-ambari-tools-v1 -f docker/Dockerfile .

    ```

2. Execute
    
    Supply the environment variables: AMBARI_HOST, AMBARI_USER, AMBARI_PASSWORD directly, 
    ```
    docker run -it -e AMBARI_HOST=172.27.61.137 -e AMBARI_USER=admin -e AMBARI_PASSWORD=admin  ansible-ambari-tools-v1:latest playbook.yaml
    ```
    
    Or a `system_under_test.yaml` file.
    ```
    docker run -it  -v /path/to/sut.yaml:/shared-volume/system_under_test.yaml  ansible-ambari-tools-v1:latest playbook.yaml
    ```
