
### Build and run
#### Build with python3
* `docker build -t webapp .`
* `docker run -d -p 0.0.0.0:80:80 djangoapp`

#### Build with python2
* `docker build -f Dockerfile-py2 -t djangoapp .`
* `docker run -d -p 80:80 webapp`

### How to insert your application

In /app is the root of your django project.

*怕麻烦一键运行则只需把你的django项目根目录下的文件全部复制到app目录下然后按照上面命令运行。
